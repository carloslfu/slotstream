---
type: run
id: 01m1vx4z109c18w5e322kdm161
created: 2026-09-06T17:44:38.176977+00:00
updated: 2026-09-06T17:44:38.336991+00:00
summary: First 64-row projection-shape witness passes unchanged C07 criteria
binary: 06fe3602f61b5bddccb01f460cf416b33781184e4f60853dc1aa75845ad43f6a
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: First 64-row projection-shape witness passes unchanged C07 criteria
tool: Native Swift diagnostics and Python CLI gates
---
# First passing small-pass numerical witness

Build 12's `context-small-projections-64` passes all 1605 assertions under the
unchanged C07 criteria. Every recorded candidate tensor/logit/routing drift
against the 256-row reference is exactly zero. The fixed 515-token witness
retains its 512-row rechunk control, repeated 64-row candidate, teacher-forced
continuations and speculative rollback checks. No tolerance or expected token
changed. This closes the nine failures preserved in the preceding key-domain
counterexample for this exact witness.

The candidate pads token-wise resident linear projections to their canonical
reference row count, then crops before sequence/state operations. It combines
the existing grouped-expert, router-row and masked-key-domain candidates. No
recurrent update or logical attention query row is padded. Added projection
workspace is explicitly priced. These switches are diagnostic-only in this
build, and ordinary generation does not activate the candidate family.

This is one bounded numerical witness, not completion of P4: 128-row, partial
terminal, reused-prefix, very-short-tail and sparse-indexer cases remain open.
Actual MTP-head, long-window capacity, retained-state and release/client gates
also remain open. Subsequent floor-preservation, terminal-router and reference
boundary edits are unbuilt at this capture and do not inherit this result.

Command: `slotstream optimization-state-check --variant context-small-projections-64 --json`.
The run overlapped a separately coordinated anonymous model download. All
timing and capacity interpretations are excluded. The public cap remains
65536, no capacity ladder has started, and the feature is unreleased.

## Frozen build identity

```json
{
  "binary_sha256": "06fe3602f61b5bddccb01f460cf416b33781184e4f60853dc1aa75845ad43f6a",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "4d793375b9a4a5f67c10ef6f70eb06d29e73ef27444cc32eb14a38dcc2c41476"
}
```

## small64-projections-12/stdout.txt

SHA-256 `a9942ad4bbebdebc7804e0a8812b2b99efeaf6fcc0fbebf1c801e7972b5c747e`; 225934 bytes.

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
      "name" : "prefill: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.34",
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
      "name" : "prefill: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.27",
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
      "name" : "prefill: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.19",
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
      "name" : "prefill: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.17",
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
      "name" : "prefill: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.23",
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
      "name" : "prefill: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.12",
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
      "name" : "prefill: deterministic repeated index.39",
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
      "name" : "prefill: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.25",
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
      "name" : "prefill: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.28",
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
      "name" : "continued-907: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.18",
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
      "name" : "continued-907: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.35",
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
      "name" : "continued-907: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.11",
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
      "name" : "continued-907: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.41",
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
      "name" : "continued-907: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.15",
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
      "name" : "continued-907: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.1",
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
      "name" : "continued-907: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.21",
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
      "name" : "continued-907: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.37",
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
      "name" : "continued-1337: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.34",
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
      "name" : "continued-1337: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.27",
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
      "name" : "continued-1337: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.19",
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
      "name" : "continued-1337: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.17",
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
      "name" : "continued-1337: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.23",
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
      "name" : "continued-1337: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.12",
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
      "name" : "continued-1337: deterministic repeated index.39",
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
      "name" : "continued-1337: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.25",
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
      "name" : "continued-1337: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.28",
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
      "name" : "continued-2103: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.18",
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
      "name" : "continued-2103: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.35",
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
      "name" : "continued-2103: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.11",
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
      "name" : "continued-2103: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.41",
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
      "name" : "continued-2103: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.15",
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
      "name" : "continued-2103: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.1",
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
      "name" : "continued-2103: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.21",
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
      "name" : "continued-2103: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.37",
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
      "name" : "rollback-1: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.34",
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
      "name" : "rollback-1: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.27",
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
      "name" : "rollback-1: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.19",
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
      "name" : "rollback-1: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.17",
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
      "name" : "rollback-1: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.23",
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
      "name" : "rollback-1: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.12",
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
      "name" : "rollback-1: deterministic repeated index.39",
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
      "name" : "rollback-1: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.25",
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
      "name" : "rollback-1: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.28",
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
      "name" : "rollback-2: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.18",
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
      "name" : "rollback-2: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.35",
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
      "name" : "rollback-2: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.11",
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
      "name" : "rollback-2: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.41",
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
      "name" : "rollback-2: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.15",
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
      "name" : "rollback-2: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.1",
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
      "name" : "rollback-2: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.21",
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
      "name" : "rollback-2: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.37",
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
      "name" : "rollback-3: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.34",
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
      "name" : "rollback-3: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.27",
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
      "name" : "rollback-3: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.19",
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
      "name" : "rollback-3: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.17",
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
      "name" : "rollback-3: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.23",
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
      "name" : "rollback-3: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.12",
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
      "name" : "rollback-3: deterministic repeated index.39",
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
      "name" : "rollback-3: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.25",
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
      "name" : "rollback-3: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.28",
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
    "arm0.read_records" : 17679,
    "arm0.seconds" : 5.30177375,
    "arm0.workspace_piece_writes" : 0,
    "arm1.allocated_bytes" : 28311552,
    "arm1.chunk" : 512,
    "arm1.read_records" : 10438,
    "arm1.seconds" : 3.141547708,
    "arm1.workspace_piece_writes" : 0,
    "arm2.allocated_bytes" : 28311552,
    "arm2.chunk" : 64,
    "arm2.read_records" : 36244,
    "arm2.seconds" : 11.468170792,
    "arm2.workspace_piece_writes" : 0,
    "arm3.allocated_bytes" : 28311552,
    "arm3.chunk" : 64,
    "arm3.read_records" : 36246,
    "arm3.seconds" : 11.168960666,
    "arm3.workspace_piece_writes" : 0,
    "compact_scope_frontier" : 0,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0,
    "continued-1337.conv.1.control" : 0,
    "continued-1337.conv.10.candidate" : 0,
    "continued-1337.conv.10.control" : 0,
    "continued-1337.conv.12.candidate" : 0,
    "continued-1337.conv.12.control" : 0,
    "continued-1337.conv.13.candidate" : 0,
    "continued-1337.conv.13.control" : 0,
    "continued-1337.conv.14.candidate" : 0,
    "continued-1337.conv.14.control" : 0.005625000223517418,
    "continued-1337.conv.16.candidate" : 0,
    "continued-1337.conv.16.control" : 0.01681804098188877,
    "continued-1337.conv.17.candidate" : 0,
    "continued-1337.conv.17.control" : 0.011574073694646358,
    "continued-1337.conv.18.candidate" : 0,
    "continued-1337.conv.18.control" : 0.009009009227156639,
    "continued-1337.conv.2.candidate" : 0,
    "continued-1337.conv.2.control" : 0,
    "continued-1337.conv.20.candidate" : 0,
    "continued-1337.conv.20.control" : 0.025641025975346565,
    "continued-1337.conv.21.candidate" : 0,
    "continued-1337.conv.21.control" : 0.014018691144883633,
    "continued-1337.conv.22.candidate" : 0,
    "continued-1337.conv.22.control" : 0.010714286006987095,
    "continued-1337.conv.24.candidate" : 0,
    "continued-1337.conv.24.control" : 0.03365384787321091,
    "continued-1337.conv.25.candidate" : 0,
    "continued-1337.conv.25.control" : 0.028682511299848557,
    "continued-1337.conv.26.candidate" : 0,
    "continued-1337.conv.26.control" : 0.04904306307435036,
    "continued-1337.conv.28.candidate" : 0,
    "continued-1337.conv.28.control" : 0.03684701398015022,
    "continued-1337.conv.29.candidate" : 0,
    "continued-1337.conv.29.control" : 0.05847953259944916,
    "continued-1337.conv.30.candidate" : 0,
    "continued-1337.conv.30.control" : 0.07780612260103226,
    "continued-1337.conv.32.candidate" : 0,
    "continued-1337.conv.32.control" : 0.08127802610397339,
    "continued-1337.conv.33.candidate" : 0,
    "continued-1337.conv.33.control" : 0.0654296875,
    "continued-1337.conv.34.candidate" : 0,
    "continued-1337.conv.34.control" : 0.07489451766014099,
    "continued-1337.conv.36.candidate" : 0,
    "continued-1337.conv.36.control" : 0.09852216392755508,
    "continued-1337.conv.37.candidate" : 0,
    "continued-1337.conv.37.control" : 0.05067567527294159,
    "continued-1337.conv.38.candidate" : 0,
    "continued-1337.conv.38.control" : 0.04117647185921669,
    "continued-1337.conv.4.candidate" : 0,
    "continued-1337.conv.4.control" : 0,
    "continued-1337.conv.40.candidate" : 0,
    "continued-1337.conv.40.control" : 0.0714285746216774,
    "continued-1337.conv.41.candidate" : 0,
    "continued-1337.conv.41.control" : 0.05059814453125,
    "continued-1337.conv.42.candidate" : 0,
    "continued-1337.conv.42.control" : 0.05782312899827957,
    "continued-1337.conv.44.candidate" : 0,
    "continued-1337.conv.44.control" : 0.10220994800329208,
    "continued-1337.conv.45.candidate" : 0,
    "continued-1337.conv.45.control" : 0.051309119910001755,
    "continued-1337.conv.46.candidate" : 0,
    "continued-1337.conv.46.control" : 0.1116071417927742,
    "continued-1337.conv.5.candidate" : 0,
    "continued-1337.conv.5.control" : 0,
    "continued-1337.conv.6.candidate" : 0,
    "continued-1337.conv.6.control" : 0,
    "continued-1337.conv.8.candidate" : 0,
    "continued-1337.conv.8.control" : 0,
    "continued-1337.conv.9.candidate" : 0,
    "continued-1337.conv.9.control" : 0,
    "continued-1337.index.11.candidate" : 0,
    "continued-1337.index.11.control" : 0,
    "continued-1337.index.15.candidate" : 0,
    "continued-1337.index.15.control" : 0.01755617931485176,
    "continued-1337.index.19.candidate" : 0,
    "continued-1337.index.19.control" : 0.027397260069847107,
    "continued-1337.index.23.candidate" : 0,
    "continued-1337.index.23.control" : 0.02276785671710968,
    "continued-1337.index.27.candidate" : 0,
    "continued-1337.index.27.control" : 0.037128712981939316,
    "continued-1337.index.3.candidate" : 0,
    "continued-1337.index.3.control" : 0,
    "continued-1337.index.31.candidate" : 0,
    "continued-1337.index.31.control" : 0.19605809450149536,
    "continued-1337.index.35.candidate" : 0,
    "continued-1337.index.35.control" : 0.11423841118812561,
    "continued-1337.index.39.candidate" : 0,
    "continued-1337.index.39.control" : 0.04628164693713188,
    "continued-1337.index.43.candidate" : 0,
    "continued-1337.index.43.control" : 0.04707031324505806,
    "continued-1337.index.47.candidate" : 0,
    "continued-1337.index.47.control" : 0.10187499970197678,
    "continued-1337.index.7.candidate" : 0,
    "continued-1337.index.7.control" : 0,
    "continued-1337.key.11.candidate" : 0,
    "continued-1337.key.11.control" : 0,
    "continued-1337.key.15.candidate" : 0,
    "continued-1337.key.15.control" : 0.031934306025505066,
    "continued-1337.key.19.candidate" : 0,
    "continued-1337.key.19.control" : 0.05613425746560097,
    "continued-1337.key.23.candidate" : 0,
    "continued-1337.key.23.control" : 0.06541666388511658,
    "continued-1337.key.27.candidate" : 0,
    "continued-1337.key.27.control" : 0.10896381735801697,
    "continued-1337.key.3.candidate" : 0,
    "continued-1337.key.3.control" : 0,
    "continued-1337.key.31.candidate" : 0,
    "continued-1337.key.31.control" : 0.14901426434516907,
    "continued-1337.key.35.candidate" : 0,
    "continued-1337.key.35.control" : 0.16338582336902618,
    "continued-1337.key.39.candidate" : 0,
    "continued-1337.key.39.control" : 0.08671875298023224,
    "continued-1337.key.43.candidate" : 0,
    "continued-1337.key.43.control" : 0.07823128998279572,
    "continued-1337.key.47.candidate" : 0,
    "continued-1337.key.47.control" : 0.09786522388458252,
    "continued-1337.key.7.candidate" : 0,
    "continued-1337.key.7.control" : 0,
    "continued-1337.logits.candidate" : 0,
    "continued-1337.logits.control" : 0.10532407462596893,
    "continued-1337.ple.1.candidate" : 0,
    "continued-1337.ple.1.control" : 0,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0,
    "continued-1337.ssm.1.control" : 0,
    "continued-1337.ssm.10.candidate" : 0,
    "continued-1337.ssm.10.control" : 0,
    "continued-1337.ssm.12.candidate" : 0,
    "continued-1337.ssm.12.control" : 0,
    "continued-1337.ssm.13.candidate" : 0,
    "continued-1337.ssm.13.control" : 0.00026312010595574975,
    "continued-1337.ssm.14.candidate" : 0,
    "continued-1337.ssm.14.control" : 0.0042149461805820465,
    "continued-1337.ssm.16.candidate" : 0,
    "continued-1337.ssm.16.control" : 0.013277687132358551,
    "continued-1337.ssm.17.candidate" : 0,
    "continued-1337.ssm.17.control" : 0.012733696959912777,
    "continued-1337.ssm.18.candidate" : 0,
    "continued-1337.ssm.18.control" : 0.014517116360366344,
    "continued-1337.ssm.2.candidate" : 0,
    "continued-1337.ssm.2.control" : 0,
    "continued-1337.ssm.20.candidate" : 0,
    "continued-1337.ssm.20.control" : 0.008949542418122292,
    "continued-1337.ssm.21.candidate" : 0,
    "continued-1337.ssm.21.control" : 0.008825146593153477,
    "continued-1337.ssm.22.candidate" : 0,
    "continued-1337.ssm.22.control" : 0.005606972612440586,
    "continued-1337.ssm.24.candidate" : 0,
    "continued-1337.ssm.24.control" : 0.030068622902035713,
    "continued-1337.ssm.25.candidate" : 0,
    "continued-1337.ssm.25.control" : 0.03369494900107384,
    "continued-1337.ssm.26.candidate" : 0,
    "continued-1337.ssm.26.control" : 0.16198740899562836,
    "continued-1337.ssm.28.candidate" : 0,
    "continued-1337.ssm.28.control" : 0.004970375914126635,
    "continued-1337.ssm.29.candidate" : 0,
    "continued-1337.ssm.29.control" : 0.04375261068344116,
    "continued-1337.ssm.30.candidate" : 0,
    "continued-1337.ssm.30.control" : 0.09145420044660568,
    "continued-1337.ssm.32.candidate" : 0,
    "continued-1337.ssm.32.control" : 0.0503963828086853,
    "continued-1337.ssm.33.candidate" : 0,
    "continued-1337.ssm.33.control" : 0.1020117849111557,
    "continued-1337.ssm.34.candidate" : 0,
    "continued-1337.ssm.34.control" : 0.06148255616426468,
    "continued-1337.ssm.36.candidate" : 0,
    "continued-1337.ssm.36.control" : 0.0531274639070034,
    "continued-1337.ssm.37.candidate" : 0,
    "continued-1337.ssm.37.control" : 0.04999849572777748,
    "continued-1337.ssm.38.candidate" : 0,
    "continued-1337.ssm.38.control" : 0.014088941738009453,
    "continued-1337.ssm.4.candidate" : 0,
    "continued-1337.ssm.4.control" : 0,
    "continued-1337.ssm.40.candidate" : 0,
    "continued-1337.ssm.40.control" : 0.015454727225005627,
    "continued-1337.ssm.41.candidate" : 0,
    "continued-1337.ssm.41.control" : 0.016492173075675964,
    "continued-1337.ssm.42.candidate" : 0,
    "continued-1337.ssm.42.control" : 0.02904917486011982,
    "continued-1337.ssm.44.candidate" : 0,
    "continued-1337.ssm.44.control" : 0.022203821688890457,
    "continued-1337.ssm.45.candidate" : 0,
    "continued-1337.ssm.45.control" : 0.16785705089569092,
    "continued-1337.ssm.46.candidate" : 0,
    "continued-1337.ssm.46.control" : 0.22480647265911102,
    "continued-1337.ssm.5.candidate" : 0,
    "continued-1337.ssm.5.control" : 0,
    "continued-1337.ssm.6.candidate" : 0,
    "continued-1337.ssm.6.control" : 0,
    "continued-1337.ssm.8.candidate" : 0,
    "continued-1337.ssm.8.control" : 0,
    "continued-1337.ssm.9.candidate" : 0,
    "continued-1337.ssm.9.control" : 0,
    "continued-1337.value.11.candidate" : 0,
    "continued-1337.value.11.control" : 0,
    "continued-1337.value.15.candidate" : 0,
    "continued-1337.value.15.control" : 0.009213147684931755,
    "continued-1337.value.19.candidate" : 0,
    "continued-1337.value.19.control" : 0.012519929558038712,
    "continued-1337.value.23.candidate" : 0,
    "continued-1337.value.23.control" : 0.0417151153087616,
    "continued-1337.value.27.candidate" : 0,
    "continued-1337.value.27.control" : 0.014546001330018044,
    "continued-1337.value.3.candidate" : 0,
    "continued-1337.value.3.control" : 0,
    "continued-1337.value.31.candidate" : 0,
    "continued-1337.value.31.control" : 0.072826087474823,
    "continued-1337.value.35.candidate" : 0,
    "continued-1337.value.35.control" : 0.06159420311450958,
    "continued-1337.value.39.candidate" : 0,
    "continued-1337.value.39.control" : 0.0494791679084301,
    "continued-1337.value.43.candidate" : 0,
    "continued-1337.value.43.control" : 0.04088050499558449,
    "continued-1337.value.47.candidate" : 0,
    "continued-1337.value.47.control" : 0.20636433362960815,
    "continued-1337.value.7.candidate" : 0,
    "continued-1337.value.7.control" : 0,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0,
    "continued-2103.conv.1.control" : 0,
    "continued-2103.conv.10.candidate" : 0,
    "continued-2103.conv.10.control" : 0,
    "continued-2103.conv.12.candidate" : 0,
    "continued-2103.conv.12.control" : 0,
    "continued-2103.conv.13.candidate" : 0,
    "continued-2103.conv.13.control" : 0,
    "continued-2103.conv.14.candidate" : 0,
    "continued-2103.conv.14.control" : 0.004999999888241291,
    "continued-2103.conv.16.candidate" : 0,
    "continued-2103.conv.16.control" : 0.01681804098188877,
    "continued-2103.conv.17.candidate" : 0,
    "continued-2103.conv.17.control" : 0.012019230984151363,
    "continued-2103.conv.18.candidate" : 0,
    "continued-2103.conv.18.control" : 0.015343468636274338,
    "continued-2103.conv.2.candidate" : 0,
    "continued-2103.conv.2.control" : 0,
    "continued-2103.conv.20.candidate" : 0,
    "continued-2103.conv.20.control" : 0.015075377188622952,
    "continued-2103.conv.21.candidate" : 0,
    "continued-2103.conv.21.control" : 0.014018691144883633,
    "continued-2103.conv.22.candidate" : 0,
    "continued-2103.conv.22.control" : 0.011003521271049976,
    "continued-2103.conv.24.candidate" : 0,
    "continued-2103.conv.24.control" : 0.03328804299235344,
    "continued-2103.conv.25.candidate" : 0,
    "continued-2103.conv.25.control" : 0.029801828786730766,
    "continued-2103.conv.26.candidate" : 0,
    "continued-2103.conv.26.control" : 0.04535398259758949,
    "continued-2103.conv.28.candidate" : 0,
    "continued-2103.conv.28.control" : 0.03684701398015022,
    "continued-2103.conv.29.candidate" : 0,
    "continued-2103.conv.29.control" : 0.0520833320915699,
    "continued-2103.conv.30.candidate" : 0,
    "continued-2103.conv.30.control" : 0.07397959381341934,
    "continued-2103.conv.32.candidate" : 0,
    "continued-2103.conv.32.control" : 0.056334082037210464,
    "continued-2103.conv.33.candidate" : 0,
    "continued-2103.conv.33.control" : 0.05731201171875,
    "continued-2103.conv.34.candidate" : 0,
    "continued-2103.conv.34.control" : 0.07751091569662094,
    "continued-2103.conv.36.candidate" : 0,
    "continued-2103.conv.36.control" : 0.09852216392755508,
    "continued-2103.conv.37.candidate" : 0,
    "continued-2103.conv.37.control" : 0.05232558026909828,
    "continued-2103.conv.38.candidate" : 0,
    "continued-2103.conv.38.control" : 0.04216867312788963,
    "continued-2103.conv.4.candidate" : 0,
    "continued-2103.conv.4.control" : 0,
    "continued-2103.conv.40.candidate" : 0,
    "continued-2103.conv.40.control" : 0.0699300691485405,
    "continued-2103.conv.41.candidate" : 0,
    "continued-2103.conv.41.control" : 0.05059814453125,
    "continued-2103.conv.42.candidate" : 0,
    "continued-2103.conv.42.control" : 0.05666666850447655,
    "continued-2103.conv.44.candidate" : 0,
    "continued-2103.conv.44.control" : 0.10451977699995041,
    "continued-2103.conv.45.candidate" : 0,
    "continued-2103.conv.45.control" : 0.051309119910001755,
    "continued-2103.conv.46.candidate" : 0,
    "continued-2103.conv.46.control" : 0.10775861889123917,
    "continued-2103.conv.5.candidate" : 0,
    "continued-2103.conv.5.control" : 0,
    "continued-2103.conv.6.candidate" : 0,
    "continued-2103.conv.6.control" : 0,
    "continued-2103.conv.8.candidate" : 0,
    "continued-2103.conv.8.control" : 0,
    "continued-2103.conv.9.candidate" : 0,
    "continued-2103.conv.9.control" : 0,
    "continued-2103.index.11.candidate" : 0,
    "continued-2103.index.11.control" : 0,
    "continued-2103.index.15.candidate" : 0,
    "continued-2103.index.15.control" : 0.01755617931485176,
    "continued-2103.index.19.candidate" : 0,
    "continued-2103.index.19.control" : 0.027397260069847107,
    "continued-2103.index.23.candidate" : 0,
    "continued-2103.index.23.control" : 0.02276785671710968,
    "continued-2103.index.27.candidate" : 0,
    "continued-2103.index.27.control" : 0.037128712981939316,
    "continued-2103.index.3.candidate" : 0,
    "continued-2103.index.3.control" : 0,
    "continued-2103.index.31.candidate" : 0,
    "continued-2103.index.31.control" : 0.19605809450149536,
    "continued-2103.index.35.candidate" : 0,
    "continued-2103.index.35.control" : 0.11423841118812561,
    "continued-2103.index.39.candidate" : 0,
    "continued-2103.index.39.control" : 0.04628164693713188,
    "continued-2103.index.43.candidate" : 0,
    "continued-2103.index.43.control" : 0.04707031324505806,
    "continued-2103.index.47.candidate" : 0,
    "continued-2103.index.47.control" : 0.10187499970197678,
    "continued-2103.index.7.candidate" : 0,
    "continued-2103.index.7.control" : 0,
    "continued-2103.key.11.candidate" : 0,
    "continued-2103.key.11.control" : 0,
    "continued-2103.key.15.candidate" : 0,
    "continued-2103.key.15.control" : 0.031934306025505066,
    "continued-2103.key.19.candidate" : 0,
    "continued-2103.key.19.control" : 0.05613425746560097,
    "continued-2103.key.23.candidate" : 0,
    "continued-2103.key.23.control" : 0.06541666388511658,
    "continued-2103.key.27.candidate" : 0,
    "continued-2103.key.27.control" : 0.10896381735801697,
    "continued-2103.key.3.candidate" : 0,
    "continued-2103.key.3.control" : 0,
    "continued-2103.key.31.candidate" : 0,
    "continued-2103.key.31.control" : 0.14901426434516907,
    "continued-2103.key.35.candidate" : 0,
    "continued-2103.key.35.control" : 0.16338582336902618,
    "continued-2103.key.39.candidate" : 0,
    "continued-2103.key.39.control" : 0.08671875298023224,
    "continued-2103.key.43.candidate" : 0,
    "continued-2103.key.43.control" : 0.07823128998279572,
    "continued-2103.key.47.candidate" : 0,
    "continued-2103.key.47.control" : 0.09786522388458252,
    "continued-2103.key.7.candidate" : 0,
    "continued-2103.key.7.control" : 0,
    "continued-2103.logits.candidate" : 0,
    "continued-2103.logits.control" : 0.09433962404727936,
    "continued-2103.ple.1.candidate" : 0,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0,
    "continued-2103.ssm.1.control" : 0,
    "continued-2103.ssm.10.candidate" : 0,
    "continued-2103.ssm.10.control" : 0,
    "continued-2103.ssm.12.candidate" : 0,
    "continued-2103.ssm.12.control" : 0,
    "continued-2103.ssm.13.candidate" : 0,
    "continued-2103.ssm.13.control" : 0.00027723138919100165,
    "continued-2103.ssm.14.candidate" : 0,
    "continued-2103.ssm.14.control" : 0.002875519683584571,
    "continued-2103.ssm.16.candidate" : 0,
    "continued-2103.ssm.16.control" : 0.01306831929832697,
    "continued-2103.ssm.17.candidate" : 0,
    "continued-2103.ssm.17.control" : 0.012333724647760391,
    "continued-2103.ssm.18.candidate" : 0,
    "continued-2103.ssm.18.control" : 0.026666244491934776,
    "continued-2103.ssm.2.candidate" : 0,
    "continued-2103.ssm.2.control" : 0,
    "continued-2103.ssm.20.candidate" : 0,
    "continued-2103.ssm.20.control" : 0.010438838973641396,
    "continued-2103.ssm.21.candidate" : 0,
    "continued-2103.ssm.21.control" : 0.005878801923245192,
    "continued-2103.ssm.22.candidate" : 0,
    "continued-2103.ssm.22.control" : 0.005343249067664146,
    "continued-2103.ssm.24.candidate" : 0,
    "continued-2103.ssm.24.control" : 0.02550414949655533,
    "continued-2103.ssm.25.candidate" : 0,
    "continued-2103.ssm.25.control" : 0.042839165776968,
    "continued-2103.ssm.26.candidate" : 0,
    "continued-2103.ssm.26.control" : 0.07313300669193268,
    "continued-2103.ssm.28.candidate" : 0,
    "continued-2103.ssm.28.control" : 0.005258497782051563,
    "continued-2103.ssm.29.candidate" : 0,
    "continued-2103.ssm.29.control" : 0.04497474431991577,
    "continued-2103.ssm.30.candidate" : 0,
    "continued-2103.ssm.30.control" : 0.032806556671857834,
    "continued-2103.ssm.32.candidate" : 0,
    "continued-2103.ssm.32.control" : 0.09136993438005447,
    "continued-2103.ssm.33.candidate" : 0,
    "continued-2103.ssm.33.control" : 0.06761748343706131,
    "continued-2103.ssm.34.candidate" : 0,
    "continued-2103.ssm.34.control" : 0.07938974350690842,
    "continued-2103.ssm.36.candidate" : 0,
    "continued-2103.ssm.36.control" : 0.04179370030760765,
    "continued-2103.ssm.37.candidate" : 0,
    "continued-2103.ssm.37.control" : 0.04076423868536949,
    "continued-2103.ssm.38.candidate" : 0,
    "continued-2103.ssm.38.control" : 0.016576921567320824,
    "continued-2103.ssm.4.candidate" : 0,
    "continued-2103.ssm.4.control" : 0,
    "continued-2103.ssm.40.candidate" : 0,
    "continued-2103.ssm.40.control" : 0.016824448481202126,
    "continued-2103.ssm.41.candidate" : 0,
    "continued-2103.ssm.41.control" : 0.018600014969706535,
    "continued-2103.ssm.42.candidate" : 0,
    "continued-2103.ssm.42.control" : 0.06506846845149994,
    "continued-2103.ssm.44.candidate" : 0,
    "continued-2103.ssm.44.control" : 0.014560380950570107,
    "continued-2103.ssm.45.candidate" : 0,
    "continued-2103.ssm.45.control" : 0.0805421993136406,
    "continued-2103.ssm.46.candidate" : 0,
    "continued-2103.ssm.46.control" : 0.17004629969596863,
    "continued-2103.ssm.5.candidate" : 0,
    "continued-2103.ssm.5.control" : 0,
    "continued-2103.ssm.6.candidate" : 0,
    "continued-2103.ssm.6.control" : 0,
    "continued-2103.ssm.8.candidate" : 0,
    "continued-2103.ssm.8.control" : 0,
    "continued-2103.ssm.9.candidate" : 0,
    "continued-2103.ssm.9.control" : 0,
    "continued-2103.value.11.candidate" : 0,
    "continued-2103.value.11.control" : 0,
    "continued-2103.value.15.candidate" : 0,
    "continued-2103.value.15.control" : 0.009213147684931755,
    "continued-2103.value.19.candidate" : 0,
    "continued-2103.value.19.control" : 0.012519929558038712,
    "continued-2103.value.23.candidate" : 0,
    "continued-2103.value.23.control" : 0.0417151153087616,
    "continued-2103.value.27.candidate" : 0,
    "continued-2103.value.27.control" : 0.014546001330018044,
    "continued-2103.value.3.candidate" : 0,
    "continued-2103.value.3.control" : 0,
    "continued-2103.value.31.candidate" : 0,
    "continued-2103.value.31.control" : 0.072826087474823,
    "continued-2103.value.35.candidate" : 0,
    "continued-2103.value.35.control" : 0.06159420311450958,
    "continued-2103.value.39.candidate" : 0,
    "continued-2103.value.39.control" : 0.0494791679084301,
    "continued-2103.value.43.candidate" : 0,
    "continued-2103.value.43.control" : 0.04088050499558449,
    "continued-2103.value.47.candidate" : 0,
    "continued-2103.value.47.control" : 0.20636433362960815,
    "continued-2103.value.7.candidate" : 0,
    "continued-2103.value.7.control" : 0,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0,
    "continued-907.conv.1.control" : 0,
    "continued-907.conv.10.candidate" : 0,
    "continued-907.conv.10.control" : 0,
    "continued-907.conv.12.candidate" : 0,
    "continued-907.conv.12.control" : 0,
    "continued-907.conv.13.candidate" : 0,
    "continued-907.conv.13.control" : 0,
    "continued-907.conv.14.candidate" : 0,
    "continued-907.conv.14.control" : 0.006613756529986858,
    "continued-907.conv.16.candidate" : 0,
    "continued-907.conv.16.control" : 0.015064102597534657,
    "continued-907.conv.17.candidate" : 0,
    "continued-907.conv.17.control" : 0.016782406717538834,
    "continued-907.conv.18.candidate" : 0,
    "continued-907.conv.18.control" : 0.009049774147570133,
    "continued-907.conv.2.candidate" : 0,
    "continued-907.conv.2.control" : 0,
    "continued-907.conv.20.candidate" : 0,
    "continued-907.conv.20.control" : 0.025510204955935478,
    "continued-907.conv.21.candidate" : 0,
    "continued-907.conv.21.control" : 0.014018691144883633,
    "continued-907.conv.22.candidate" : 0,
    "continued-907.conv.22.control" : 0.010714286006987095,
    "continued-907.conv.24.candidate" : 0,
    "continued-907.conv.24.control" : 0.024038461968302727,
    "continued-907.conv.25.candidate" : 0,
    "continued-907.conv.25.control" : 0.019366197288036346,
    "continued-907.conv.26.candidate" : 0,
    "continued-907.conv.26.control" : 0.030805686488747597,
    "continued-907.conv.28.candidate" : 0,
    "continued-907.conv.28.control" : 0.04838709533214569,
    "continued-907.conv.29.candidate" : 0,
    "continued-907.conv.29.control" : 0.0625,
    "continued-907.conv.30.candidate" : 0,
    "continued-907.conv.30.control" : 0.0794270858168602,
    "continued-907.conv.32.candidate" : 0,
    "continued-907.conv.32.control" : 0.08164414763450623,
    "continued-907.conv.33.candidate" : 0,
    "continued-907.conv.33.control" : 0.0654296875,
    "continued-907.conv.34.candidate" : 0,
    "continued-907.conv.34.control" : 0.10126582533121109,
    "continued-907.conv.36.candidate" : 0,
    "continued-907.conv.36.control" : 0.09803921729326248,
    "continued-907.conv.37.candidate" : 0,
    "continued-907.conv.37.control" : 0.04954954981803894,
    "continued-907.conv.38.candidate" : 0,
    "continued-907.conv.38.control" : 0.04117647185921669,
    "continued-907.conv.4.candidate" : 0,
    "continued-907.conv.4.control" : 0,
    "continued-907.conv.40.candidate" : 0,
    "continued-907.conv.40.control" : 0.07994434982538223,
    "continued-907.conv.41.candidate" : 0,
    "continued-907.conv.41.control" : 0.06422244012355804,
    "continued-907.conv.42.candidate" : 0,
    "continued-907.conv.42.control" : 0.060283686965703964,
    "continued-907.conv.44.candidate" : 0,
    "continued-907.conv.44.control" : 0.11049723625183105,
    "continued-907.conv.45.candidate" : 0,
    "continued-907.conv.45.control" : 0.051309119910001755,
    "continued-907.conv.46.candidate" : 0,
    "continued-907.conv.46.control" : 0.061011902987957,
    "continued-907.conv.5.candidate" : 0,
    "continued-907.conv.5.control" : 0,
    "continued-907.conv.6.candidate" : 0,
    "continued-907.conv.6.control" : 0,
    "continued-907.conv.8.candidate" : 0,
    "continued-907.conv.8.control" : 0,
    "continued-907.conv.9.candidate" : 0,
    "continued-907.conv.9.control" : 0,
    "continued-907.index.11.candidate" : 0,
    "continued-907.index.11.control" : 0,
    "continued-907.index.15.candidate" : 0,
    "continued-907.index.15.control" : 0.01755617931485176,
    "continued-907.index.19.candidate" : 0,
    "continued-907.index.19.control" : 0.027397260069847107,
    "continued-907.index.23.candidate" : 0,
    "continued-907.index.23.control" : 0.02276785671710968,
    "continued-907.index.27.candidate" : 0,
    "continued-907.index.27.control" : 0.037128712981939316,
    "continued-907.index.3.candidate" : 0,
    "continued-907.index.3.control" : 0,
    "continued-907.index.31.candidate" : 0,
    "continued-907.index.31.control" : 0.19605809450149536,
    "continued-907.index.35.candidate" : 0,
    "continued-907.index.35.control" : 0.11423841118812561,
    "continued-907.index.39.candidate" : 0,
    "continued-907.index.39.control" : 0.04628164693713188,
    "continued-907.index.43.candidate" : 0,
    "continued-907.index.43.control" : 0.04707031324505806,
    "continued-907.index.47.candidate" : 0,
    "continued-907.index.47.control" : 0.10187499970197678,
    "continued-907.index.7.candidate" : 0,
    "continued-907.index.7.control" : 0,
    "continued-907.key.11.candidate" : 0,
    "continued-907.key.11.control" : 0,
    "continued-907.key.15.candidate" : 0,
    "continued-907.key.15.control" : 0.031934306025505066,
    "continued-907.key.19.candidate" : 0,
    "continued-907.key.19.control" : 0.05613425746560097,
    "continued-907.key.23.candidate" : 0,
    "continued-907.key.23.control" : 0.06541666388511658,
    "continued-907.key.27.candidate" : 0,
    "continued-907.key.27.control" : 0.10896381735801697,
    "continued-907.key.3.candidate" : 0,
    "continued-907.key.3.control" : 0,
    "continued-907.key.31.candidate" : 0,
    "continued-907.key.31.control" : 0.14901426434516907,
    "continued-907.key.35.candidate" : 0,
    "continued-907.key.35.control" : 0.16338582336902618,
    "continued-907.key.39.candidate" : 0,
    "continued-907.key.39.control" : 0.08671875298023224,
    "continued-907.key.43.candidate" : 0,
    "continued-907.key.43.control" : 0.07823128998279572,
    "continued-907.key.47.candidate" : 0,
    "continued-907.key.47.control" : 0.09786522388458252,
    "continued-907.key.7.candidate" : 0,
    "continued-907.key.7.control" : 0,
    "continued-907.logits.candidate" : 0,
    "continued-907.logits.control" : 0.11133121699094772,
    "continued-907.ple.1.candidate" : 0,
    "continued-907.ple.1.control" : 0,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0,
    "continued-907.ssm.1.control" : 0,
    "continued-907.ssm.10.candidate" : 0,
    "continued-907.ssm.10.control" : 0,
    "continued-907.ssm.12.candidate" : 0,
    "continued-907.ssm.12.control" : 0,
    "continued-907.ssm.13.candidate" : 0,
    "continued-907.ssm.13.control" : 0.0002817342756316066,
    "continued-907.ssm.14.candidate" : 0,
    "continued-907.ssm.14.control" : 0.0037336547393351793,
    "continued-907.ssm.16.candidate" : 0,
    "continued-907.ssm.16.control" : 0.00977743323892355,
    "continued-907.ssm.17.candidate" : 0,
    "continued-907.ssm.17.control" : 0.01111855823546648,
    "continued-907.ssm.18.candidate" : 0,
    "continued-907.ssm.18.control" : 0.014318006113171577,
    "continued-907.ssm.2.candidate" : 0,
    "continued-907.ssm.2.control" : 0,
    "continued-907.ssm.20.candidate" : 0,
    "continued-907.ssm.20.control" : 0.011634263209998608,
    "continued-907.ssm.21.candidate" : 0,
    "continued-907.ssm.21.control" : 0.012398164719343185,
    "continued-907.ssm.22.candidate" : 0,
    "continued-907.ssm.22.control" : 0.005773540586233139,
    "continued-907.ssm.24.candidate" : 0,
    "continued-907.ssm.24.control" : 0.018454771488904953,
    "continued-907.ssm.25.candidate" : 0,
    "continued-907.ssm.25.control" : 0.033577900379896164,
    "continued-907.ssm.26.candidate" : 0,
    "continued-907.ssm.26.control" : 0.06735121458768845,
    "continued-907.ssm.28.candidate" : 0,
    "continued-907.ssm.28.control" : 0.0040559470653533936,
    "continued-907.ssm.29.candidate" : 0,
    "continued-907.ssm.29.control" : 0.05295253545045853,
    "continued-907.ssm.30.candidate" : 0,
    "continued-907.ssm.30.control" : 0.0886233001947403,
    "continued-907.ssm.32.candidate" : 0,
    "continued-907.ssm.32.control" : 0.10987891256809235,
    "continued-907.ssm.33.candidate" : 0,
    "continued-907.ssm.33.control" : 0.08728557825088501,
    "continued-907.ssm.34.candidate" : 0,
    "continued-907.ssm.34.control" : 0.08165968954563141,
    "continued-907.ssm.36.candidate" : 0,
    "continued-907.ssm.36.control" : 0.0977427288889885,
    "continued-907.ssm.37.candidate" : 0,
    "continued-907.ssm.37.control" : 0.056762851774692535,
    "continued-907.ssm.38.candidate" : 0,
    "continued-907.ssm.38.control" : 0.016137052327394485,
    "continued-907.ssm.4.candidate" : 0,
    "continued-907.ssm.4.control" : 0,
    "continued-907.ssm.40.candidate" : 0,
    "continued-907.ssm.40.control" : 0.014509430155158043,
    "continued-907.ssm.41.candidate" : 0,
    "continued-907.ssm.41.control" : 0.01707575097680092,
    "continued-907.ssm.42.candidate" : 0,
    "continued-907.ssm.42.control" : 0.03383483365178108,
    "continued-907.ssm.44.candidate" : 0,
    "continued-907.ssm.44.control" : 0.013975723646581173,
    "continued-907.ssm.45.candidate" : 0,
    "continued-907.ssm.45.control" : 0.0766148567199707,
    "continued-907.ssm.46.candidate" : 0,
    "continued-907.ssm.46.control" : 0.1926262527704239,
    "continued-907.ssm.5.candidate" : 0,
    "continued-907.ssm.5.control" : 0,
    "continued-907.ssm.6.candidate" : 0,
    "continued-907.ssm.6.control" : 0,
    "continued-907.ssm.8.candidate" : 0,
    "continued-907.ssm.8.control" : 0,
    "continued-907.ssm.9.candidate" : 0,
    "continued-907.ssm.9.control" : 0,
    "continued-907.value.11.candidate" : 0,
    "continued-907.value.11.control" : 0,
    "continued-907.value.15.candidate" : 0,
    "continued-907.value.15.control" : 0.009213147684931755,
    "continued-907.value.19.candidate" : 0,
    "continued-907.value.19.control" : 0.012519929558038712,
    "continued-907.value.23.candidate" : 0,
    "continued-907.value.23.control" : 0.0417151153087616,
    "continued-907.value.27.candidate" : 0,
    "continued-907.value.27.control" : 0.014546001330018044,
    "continued-907.value.3.candidate" : 0,
    "continued-907.value.3.control" : 0,
    "continued-907.value.31.candidate" : 0,
    "continued-907.value.31.control" : 0.072826087474823,
    "continued-907.value.35.candidate" : 0,
    "continued-907.value.35.control" : 0.06159420311450958,
    "continued-907.value.39.candidate" : 0,
    "continued-907.value.39.control" : 0.0494791679084301,
    "continued-907.value.43.candidate" : 0,
    "continued-907.value.43.control" : 0.04088050499558449,
    "continued-907.value.47.candidate" : 0,
    "continued-907.value.47.control" : 0.20636433362960815,
    "continued-907.value.7.candidate" : 0,
    "continued-907.value.7.control" : 0,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0,
    "prefill.conv.1.control" : 0,
    "prefill.conv.10.candidate" : 0,
    "prefill.conv.10.control" : 0,
    "prefill.conv.12.candidate" : 0,
    "prefill.conv.12.control" : 0,
    "prefill.conv.13.candidate" : 0,
    "prefill.conv.13.control" : 0,
    "prefill.conv.14.candidate" : 0,
    "prefill.conv.14.control" : 0.007894736714661121,
    "prefill.conv.16.candidate" : 0,
    "prefill.conv.16.control" : 0.02580128237605095,
    "prefill.conv.17.candidate" : 0,
    "prefill.conv.17.control" : 0.017433449625968933,
    "prefill.conv.18.candidate" : 0,
    "prefill.conv.18.control" : 0.020644797012209892,
    "prefill.conv.2.candidate" : 0,
    "prefill.conv.2.control" : 0,
    "prefill.conv.20.candidate" : 0,
    "prefill.conv.20.control" : 0.025510204955935478,
    "prefill.conv.21.candidate" : 0,
    "prefill.conv.21.control" : 0.024390242993831635,
    "prefill.conv.22.candidate" : 0,
    "prefill.conv.22.control" : 0.010714286006987095,
    "prefill.conv.24.candidate" : 0,
    "prefill.conv.24.control" : 0.037602849304676056,
    "prefill.conv.25.candidate" : 0,
    "prefill.conv.25.control" : 0.030516432598233223,
    "prefill.conv.26.candidate" : 0,
    "prefill.conv.26.control" : 0.042061612010002136,
    "prefill.conv.28.candidate" : 0,
    "prefill.conv.28.control" : 0.04838709533214569,
    "prefill.conv.29.candidate" : 0,
    "prefill.conv.29.control" : 0.0625,
    "prefill.conv.30.candidate" : 0,
    "prefill.conv.30.control" : 0.07901554554700851,
    "prefill.conv.32.candidate" : 0,
    "prefill.conv.32.control" : 0.0849883183836937,
    "prefill.conv.33.candidate" : 0,
    "prefill.conv.33.control" : 0.08235294371843338,
    "prefill.conv.34.candidate" : 0,
    "prefill.conv.34.control" : 0.10126582533121109,
    "prefill.conv.36.candidate" : 0,
    "prefill.conv.36.control" : 0.0784313753247261,
    "prefill.conv.37.candidate" : 0,
    "prefill.conv.37.control" : 0.04954954981803894,
    "prefill.conv.38.candidate" : 0,
    "prefill.conv.38.control" : 0.04117647185921669,
    "prefill.conv.4.candidate" : 0,
    "prefill.conv.4.control" : 0,
    "prefill.conv.40.candidate" : 0,
    "prefill.conv.40.control" : 0.07994434982538223,
    "prefill.conv.41.candidate" : 0,
    "prefill.conv.41.control" : 0.06422244012355804,
    "prefill.conv.42.candidate" : 0,
    "prefill.conv.42.control" : 0.05673758685588837,
    "prefill.conv.44.candidate" : 0,
    "prefill.conv.44.control" : 0.10526315867900848,
    "prefill.conv.45.candidate" : 0,
    "prefill.conv.45.control" : 0.043795619159936905,
    "prefill.conv.46.candidate" : 0,
    "prefill.conv.46.control" : 0.06018518656492233,
    "prefill.conv.5.candidate" : 0,
    "prefill.conv.5.control" : 0,
    "prefill.conv.6.candidate" : 0,
    "prefill.conv.6.control" : 0,
    "prefill.conv.8.candidate" : 0,
    "prefill.conv.8.control" : 0,
    "prefill.conv.9.candidate" : 0,
    "prefill.conv.9.control" : 0,
    "prefill.index.11.candidate" : 0,
    "prefill.index.11.control" : 0,
    "prefill.index.15.candidate" : 0,
    "prefill.index.15.control" : 0.01755617931485176,
    "prefill.index.19.candidate" : 0,
    "prefill.index.19.control" : 0.027397260069847107,
    "prefill.index.23.candidate" : 0,
    "prefill.index.23.control" : 0.02276785671710968,
    "prefill.index.27.candidate" : 0,
    "prefill.index.27.control" : 0.037128712981939316,
    "prefill.index.3.candidate" : 0,
    "prefill.index.3.control" : 0,
    "prefill.index.31.candidate" : 0,
    "prefill.index.31.control" : 0.19605809450149536,
    "prefill.index.35.candidate" : 0,
    "prefill.index.35.control" : 0.11423841118812561,
    "prefill.index.39.candidate" : 0,
    "prefill.index.39.control" : 0.04628164693713188,
    "prefill.index.43.candidate" : 0,
    "prefill.index.43.control" : 0.04707031324505806,
    "prefill.index.47.candidate" : 0,
    "prefill.index.47.control" : 0.10187499970197678,
    "prefill.index.7.candidate" : 0,
    "prefill.index.7.control" : 0,
    "prefill.key.11.candidate" : 0,
    "prefill.key.11.control" : 0,
    "prefill.key.15.candidate" : 0,
    "prefill.key.15.control" : 0.031934306025505066,
    "prefill.key.19.candidate" : 0,
    "prefill.key.19.control" : 0.05613425746560097,
    "prefill.key.23.candidate" : 0,
    "prefill.key.23.control" : 0.06541666388511658,
    "prefill.key.27.candidate" : 0,
    "prefill.key.27.control" : 0.10896381735801697,
    "prefill.key.3.candidate" : 0,
    "prefill.key.3.control" : 0,
    "prefill.key.31.candidate" : 0,
    "prefill.key.31.control" : 0.14901426434516907,
    "prefill.key.35.candidate" : 0,
    "prefill.key.35.control" : 0.16338582336902618,
    "prefill.key.39.candidate" : 0,
    "prefill.key.39.control" : 0.08671875298023224,
    "prefill.key.43.candidate" : 0,
    "prefill.key.43.control" : 0.07823128998279572,
    "prefill.key.47.candidate" : 0,
    "prefill.key.47.control" : 0.09786522388458252,
    "prefill.key.7.candidate" : 0,
    "prefill.key.7.control" : 0,
    "prefill.logits.candidate" : 0,
    "prefill.logits.control" : 0.06354748457670212,
    "prefill.ple.1.candidate" : 0,
    "prefill.ple.1.control" : 0,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0,
    "prefill.ssm.1.control" : 0,
    "prefill.ssm.10.candidate" : 0,
    "prefill.ssm.10.control" : 0,
    "prefill.ssm.12.candidate" : 0,
    "prefill.ssm.12.control" : 0,
    "prefill.ssm.13.candidate" : 0,
    "prefill.ssm.13.control" : 0.0002766742545645684,
    "prefill.ssm.14.candidate" : 0,
    "prefill.ssm.14.control" : 0.0031120148487389088,
    "prefill.ssm.16.candidate" : 0,
    "prefill.ssm.16.control" : 0.01928410865366459,
    "prefill.ssm.17.candidate" : 0,
    "prefill.ssm.17.control" : 0.015351982787251472,
    "prefill.ssm.18.candidate" : 0,
    "prefill.ssm.18.control" : 0.01835530996322632,
    "prefill.ssm.2.candidate" : 0,
    "prefill.ssm.2.control" : 0,
    "prefill.ssm.20.candidate" : 0,
    "prefill.ssm.20.control" : 0.010046429932117462,
    "prefill.ssm.21.candidate" : 0,
    "prefill.ssm.21.control" : 0.010658453218638897,
    "prefill.ssm.22.candidate" : 0,
    "prefill.ssm.22.control" : 0.005643798969686031,
    "prefill.ssm.24.candidate" : 0,
    "prefill.ssm.24.control" : 0.02616826258599758,
    "prefill.ssm.25.candidate" : 0,
    "prefill.ssm.25.control" : 0.05810854583978653,
    "prefill.ssm.26.candidate" : 0,
    "prefill.ssm.26.control" : 0.034994207322597504,
    "prefill.ssm.28.candidate" : 0,
    "prefill.ssm.28.control" : 0.004434869159013033,
    "prefill.ssm.29.candidate" : 0,
    "prefill.ssm.29.control" : 0.057749681174755096,
    "prefill.ssm.30.candidate" : 0,
    "prefill.ssm.30.control" : 0.03673890605568886,
    "prefill.ssm.32.candidate" : 0,
    "prefill.ssm.32.control" : 0.15956521034240723,
    "prefill.ssm.33.candidate" : 0,
    "prefill.ssm.33.control" : 0.13404248654842377,
    "prefill.ssm.34.candidate" : 0,
    "prefill.ssm.34.control" : 0.09960776567459106,
    "prefill.ssm.36.candidate" : 0,
    "prefill.ssm.36.control" : 0.07311578094959259,
    "prefill.ssm.37.candidate" : 0,
    "prefill.ssm.37.control" : 0.1196533739566803,
    "prefill.ssm.38.candidate" : 0,
    "prefill.ssm.38.control" : 0.022961735725402832,
    "prefill.ssm.4.candidate" : 0,
    "prefill.ssm.4.control" : 0,
    "prefill.ssm.40.candidate" : 0,
    "prefill.ssm.40.control" : 0.014941614121198654,
    "prefill.ssm.41.candidate" : 0,
    "prefill.ssm.41.control" : 0.01651778258383274,
    "prefill.ssm.42.candidate" : 0,
    "prefill.ssm.42.control" : 0.041674401611089706,
    "prefill.ssm.44.candidate" : 0,
    "prefill.ssm.44.control" : 0.014857178553938866,
    "prefill.ssm.45.candidate" : 0,
    "prefill.ssm.45.control" : 0.09404612332582474,
    "prefill.ssm.46.candidate" : 0,
    "prefill.ssm.46.control" : 0.17168006300926208,
    "prefill.ssm.5.candidate" : 0,
    "prefill.ssm.5.control" : 0,
    "prefill.ssm.6.candidate" : 0,
    "prefill.ssm.6.control" : 0,
    "prefill.ssm.8.candidate" : 0,
    "prefill.ssm.8.control" : 0,
    "prefill.ssm.9.candidate" : 0,
    "prefill.ssm.9.control" : 0,
    "prefill.value.11.candidate" : 0,
    "prefill.value.11.control" : 0,
    "prefill.value.15.candidate" : 0,
    "prefill.value.15.control" : 0.009213147684931755,
    "prefill.value.19.candidate" : 0,
    "prefill.value.19.control" : 0.012519929558038712,
    "prefill.value.23.candidate" : 0,
    "prefill.value.23.control" : 0.0417151153087616,
    "prefill.value.27.candidate" : 0,
    "prefill.value.27.control" : 0.014546001330018044,
    "prefill.value.3.candidate" : 0,
    "prefill.value.3.control" : 0,
    "prefill.value.31.candidate" : 0,
    "prefill.value.31.control" : 0.072826087474823,
    "prefill.value.35.candidate" : 0,
    "prefill.value.35.control" : 0.06159420311450958,
    "prefill.value.39.candidate" : 0,
    "prefill.value.39.control" : 0.0494791679084301,
    "prefill.value.43.candidate" : 0,
    "prefill.value.43.control" : 0.04088050499558449,
    "prefill.value.47.candidate" : 0,
    "prefill.value.47.control" : 0.20636433362960815,
    "prefill.value.7.candidate" : 0,
    "prefill.value.7.control" : 0,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0,
    "rollback-1.conv.1.control" : 0,
    "rollback-1.conv.10.candidate" : 0,
    "rollback-1.conv.10.control" : 0,
    "rollback-1.conv.12.candidate" : 0,
    "rollback-1.conv.12.control" : 0,
    "rollback-1.conv.13.candidate" : 0,
    "rollback-1.conv.13.control" : 0,
    "rollback-1.conv.14.candidate" : 0,
    "rollback-1.conv.14.control" : 0.0052083334885537624,
    "rollback-1.conv.16.candidate" : 0,
    "rollback-1.conv.16.control" : 0.013392857275903225,
    "rollback-1.conv.17.candidate" : 0,
    "rollback-1.conv.17.control" : 0.01663176529109478,
    "rollback-1.conv.18.candidate" : 0,
    "rollback-1.conv.18.control" : 0.01569700427353382,
    "rollback-1.conv.2.candidate" : 0,
    "rollback-1.conv.2.control" : 0,
    "rollback-1.conv.20.candidate" : 0,
    "rollback-1.conv.20.control" : 0.02010050229728222,
    "rollback-1.conv.21.candidate" : 0,
    "rollback-1.conv.21.control" : 0.013988095335662365,
    "rollback-1.conv.22.candidate" : 0,
    "rollback-1.conv.22.control" : 0.011003521271049976,
    "rollback-1.conv.24.candidate" : 0,
    "rollback-1.conv.24.control" : 0.02038043551146984,
    "rollback-1.conv.25.candidate" : 0,
    "rollback-1.conv.25.control" : 0.02769549749791622,
    "rollback-1.conv.26.candidate" : 0,
    "rollback-1.conv.26.control" : 0.04203539714217186,
    "rollback-1.conv.28.candidate" : 0,
    "rollback-1.conv.28.control" : 0.048553720116615295,
    "rollback-1.conv.29.candidate" : 0,
    "rollback-1.conv.29.control" : 0.0520833320915699,
    "rollback-1.conv.30.candidate" : 0,
    "rollback-1.conv.30.control" : 0.05541237071156502,
    "rollback-1.conv.32.candidate" : 0,
    "rollback-1.conv.32.control" : 0.07456140220165253,
    "rollback-1.conv.33.candidate" : 0,
    "rollback-1.conv.33.control" : 0.05978260934352875,
    "rollback-1.conv.34.candidate" : 0,
    "rollback-1.conv.34.control" : 0.06195175275206566,
    "rollback-1.conv.36.candidate" : 0,
    "rollback-1.conv.36.control" : 0.0833333358168602,
    "rollback-1.conv.37.candidate" : 0,
    "rollback-1.conv.37.control" : 0.05714285746216774,
    "rollback-1.conv.38.candidate" : 0,
    "rollback-1.conv.38.control" : 0.05120481923222542,
    "rollback-1.conv.4.candidate" : 0,
    "rollback-1.conv.4.control" : 0,
    "rollback-1.conv.40.candidate" : 0,
    "rollback-1.conv.40.control" : 0.09134615212678909,
    "rollback-1.conv.41.candidate" : 0,
    "rollback-1.conv.41.control" : 0.0698084682226181,
    "rollback-1.conv.42.candidate" : 0,
    "rollback-1.conv.42.control" : 0.07140625268220901,
    "rollback-1.conv.44.candidate" : 0,
    "rollback-1.conv.44.control" : 0.0659722238779068,
    "rollback-1.conv.45.candidate" : 0,
    "rollback-1.conv.45.control" : 0.07525510340929031,
    "rollback-1.conv.46.candidate" : 0,
    "rollback-1.conv.46.control" : 0.07676630467176437,
    "rollback-1.conv.5.candidate" : 0,
    "rollback-1.conv.5.control" : 0,
    "rollback-1.conv.6.candidate" : 0,
    "rollback-1.conv.6.control" : 0,
    "rollback-1.conv.8.candidate" : 0,
    "rollback-1.conv.8.control" : 0,
    "rollback-1.conv.9.candidate" : 0,
    "rollback-1.conv.9.control" : 0,
    "rollback-1.index.11.candidate" : 0,
    "rollback-1.index.11.control" : 0,
    "rollback-1.index.15.candidate" : 0,
    "rollback-1.index.15.control" : 0.01755617931485176,
    "rollback-1.index.19.candidate" : 0,
    "rollback-1.index.19.control" : 0.027397260069847107,
    "rollback-1.index.23.candidate" : 0,
    "rollback-1.index.23.control" : 0.02276785671710968,
    "rollback-1.index.27.candidate" : 0,
    "rollback-1.index.27.control" : 0.037128712981939316,
    "rollback-1.index.3.candidate" : 0,
    "rollback-1.index.3.control" : 0,
    "rollback-1.index.31.candidate" : 0,
    "rollback-1.index.31.control" : 0.19605809450149536,
    "rollback-1.index.35.candidate" : 0,
    "rollback-1.index.35.control" : 0.11423841118812561,
    "rollback-1.index.39.candidate" : 0,
    "rollback-1.index.39.control" : 0.04628164693713188,
    "rollback-1.index.43.candidate" : 0,
    "rollback-1.index.43.control" : 0.04707031324505806,
    "rollback-1.index.47.candidate" : 0,
    "rollback-1.index.47.control" : 0.10187499970197678,
    "rollback-1.index.7.candidate" : 0,
    "rollback-1.index.7.control" : 0,
    "rollback-1.key.11.candidate" : 0,
    "rollback-1.key.11.control" : 0,
    "rollback-1.key.15.candidate" : 0,
    "rollback-1.key.15.control" : 0.031934306025505066,
    "rollback-1.key.19.candidate" : 0,
    "rollback-1.key.19.control" : 0.05613425746560097,
    "rollback-1.key.23.candidate" : 0,
    "rollback-1.key.23.control" : 0.06541666388511658,
    "rollback-1.key.27.candidate" : 0,
    "rollback-1.key.27.control" : 0.10896381735801697,
    "rollback-1.key.3.candidate" : 0,
    "rollback-1.key.3.control" : 0,
    "rollback-1.key.31.candidate" : 0,
    "rollback-1.key.31.control" : 0.14901426434516907,
    "rollback-1.key.35.candidate" : 0,
    "rollback-1.key.35.control" : 0.16338582336902618,
    "rollback-1.key.39.candidate" : 0,
    "rollback-1.key.39.control" : 0.08671875298023224,
    "rollback-1.key.43.candidate" : 0,
    "rollback-1.key.43.control" : 0.08843537420034409,
    "rollback-1.key.47.candidate" : 0,
    "rollback-1.key.47.control" : 0.09786522388458252,
    "rollback-1.key.7.candidate" : 0,
    "rollback-1.key.7.control" : 0,
    "rollback-1.logits.candidate" : 0,
    "rollback-1.logits.control" : 0.12570355832576752,
    "rollback-1.ple.1.candidate" : 0,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0,
    "rollback-1.ssm.1.control" : 0,
    "rollback-1.ssm.10.candidate" : 0,
    "rollback-1.ssm.10.control" : 0,
    "rollback-1.ssm.12.candidate" : 0,
    "rollback-1.ssm.12.control" : 0,
    "rollback-1.ssm.13.candidate" : 0,
    "rollback-1.ssm.13.control" : 0.0002743733348324895,
    "rollback-1.ssm.14.candidate" : 0,
    "rollback-1.ssm.14.control" : 0.002468931255862117,
    "rollback-1.ssm.16.candidate" : 0,
    "rollback-1.ssm.16.control" : 0.013193454593420029,
    "rollback-1.ssm.17.candidate" : 0,
    "rollback-1.ssm.17.control" : 0.013512276113033295,
    "rollback-1.ssm.18.candidate" : 0,
    "rollback-1.ssm.18.control" : 0.019590312615036964,
    "rollback-1.ssm.2.candidate" : 0,
    "rollback-1.ssm.2.control" : 0,
    "rollback-1.ssm.20.candidate" : 0,
    "rollback-1.ssm.20.control" : 0.009005283936858177,
    "rollback-1.ssm.21.candidate" : 0,
    "rollback-1.ssm.21.control" : 0.011700308881700039,
    "rollback-1.ssm.22.candidate" : 0,
    "rollback-1.ssm.22.control" : 0.004206422250717878,
    "rollback-1.ssm.24.candidate" : 0,
    "rollback-1.ssm.24.control" : 0.017506999894976616,
    "rollback-1.ssm.25.candidate" : 0,
    "rollback-1.ssm.25.control" : 0.06453016400337219,
    "rollback-1.ssm.26.candidate" : 0,
    "rollback-1.ssm.26.control" : 0.07511690258979797,
    "rollback-1.ssm.28.candidate" : 0,
    "rollback-1.ssm.28.control" : 0.003858801908791065,
    "rollback-1.ssm.29.candidate" : 0,
    "rollback-1.ssm.29.control" : 0.04648992046713829,
    "rollback-1.ssm.30.candidate" : 0,
    "rollback-1.ssm.30.control" : 0.051631566137075424,
    "rollback-1.ssm.32.candidate" : 0,
    "rollback-1.ssm.32.control" : 0.08469836413860321,
    "rollback-1.ssm.33.candidate" : 0,
    "rollback-1.ssm.33.control" : 0.163725346326828,
    "rollback-1.ssm.34.candidate" : 0,
    "rollback-1.ssm.34.control" : 0.12615029513835907,
    "rollback-1.ssm.36.candidate" : 0,
    "rollback-1.ssm.36.control" : 0.05243952199816704,
    "rollback-1.ssm.37.candidate" : 0,
    "rollback-1.ssm.37.control" : 0.03943127393722534,
    "rollback-1.ssm.38.candidate" : 0,
    "rollback-1.ssm.38.control" : 0.015095353126525879,
    "rollback-1.ssm.4.candidate" : 0,
    "rollback-1.ssm.4.control" : 0,
    "rollback-1.ssm.40.candidate" : 0,
    "rollback-1.ssm.40.control" : 0.01798965595662594,
    "rollback-1.ssm.41.candidate" : 0,
    "rollback-1.ssm.41.control" : 0.022502552717924118,
    "rollback-1.ssm.42.candidate" : 0,
    "rollback-1.ssm.42.control" : 0.0503694973886013,
    "rollback-1.ssm.44.candidate" : 0,
    "rollback-1.ssm.44.control" : 0.015842685475945473,
    "rollback-1.ssm.45.candidate" : 0,
    "rollback-1.ssm.45.control" : 0.12245684117078781,
    "rollback-1.ssm.46.candidate" : 0,
    "rollback-1.ssm.46.control" : 0.128029465675354,
    "rollback-1.ssm.5.candidate" : 0,
    "rollback-1.ssm.5.control" : 0,
    "rollback-1.ssm.6.candidate" : 0,
    "rollback-1.ssm.6.control" : 0,
    "rollback-1.ssm.8.candidate" : 0,
    "rollback-1.ssm.8.control" : 0,
    "rollback-1.ssm.9.candidate" : 0,
    "rollback-1.ssm.9.control" : 0,
    "rollback-1.value.11.candidate" : 0,
    "rollback-1.value.11.control" : 0,
    "rollback-1.value.15.candidate" : 0,
    "rollback-1.value.15.control" : 0.009213147684931755,
    "rollback-1.value.19.candidate" : 0,
    "rollback-1.value.19.control" : 0.012519929558038712,
    "rollback-1.value.23.candidate" : 0,
    "rollback-1.value.23.control" : 0.0417151153087616,
    "rollback-1.value.27.candidate" : 0,
    "rollback-1.value.27.control" : 0.014546001330018044,
    "rollback-1.value.3.candidate" : 0,
    "rollback-1.value.3.control" : 0,
    "rollback-1.value.31.candidate" : 0,
    "rollback-1.value.31.control" : 0.072826087474823,
    "rollback-1.value.35.candidate" : 0,
    "rollback-1.value.35.control" : 0.06159420311450958,
    "rollback-1.value.39.candidate" : 0,
    "rollback-1.value.39.control" : 0.0494791679084301,
    "rollback-1.value.43.candidate" : 0,
    "rollback-1.value.43.control" : 0.04088050499558449,
    "rollback-1.value.47.candidate" : 0,
    "rollback-1.value.47.control" : 0.20636433362960815,
    "rollback-1.value.7.candidate" : 0,
    "rollback-1.value.7.control" : 0,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0,
    "rollback-2.conv.10.control" : 0,
    "rollback-2.conv.12.candidate" : 0,
    "rollback-2.conv.12.control" : 0,
    "rollback-2.conv.13.candidate" : 0,
    "rollback-2.conv.13.control" : 0,
    "rollback-2.conv.14.candidate" : 0,
    "rollback-2.conv.14.control" : 0.010256410576403141,
    "rollback-2.conv.16.candidate" : 0,
    "rollback-2.conv.16.control" : 0.012995049357414246,
    "rollback-2.conv.17.candidate" : 0,
    "rollback-2.conv.17.control" : 0.01663176529109478,
    "rollback-2.conv.18.candidate" : 0,
    "rollback-2.conv.18.control" : 0.01198630128055811,
    "rollback-2.conv.2.candidate" : 0,
    "rollback-2.conv.2.control" : 0,
    "rollback-2.conv.20.candidate" : 0,
    "rollback-2.conv.20.control" : 0.019900497049093246,
    "rollback-2.conv.21.candidate" : 0,
    "rollback-2.conv.21.control" : 0.01904761977493763,
    "rollback-2.conv.22.candidate" : 0,
    "rollback-2.conv.22.control" : 0.009807180613279343,
    "rollback-2.conv.24.candidate" : 0,
    "rollback-2.conv.24.control" : 0.019946807995438576,
    "rollback-2.conv.25.candidate" : 0,
    "rollback-2.conv.25.control" : 0.02769549749791622,
    "rollback-2.conv.26.candidate" : 0,
    "rollback-2.conv.26.control" : 0.017688678577542305,
    "rollback-2.conv.28.candidate" : 0,
    "rollback-2.conv.28.control" : 0.03959163278341293,
    "rollback-2.conv.29.candidate" : 0,
    "rollback-2.conv.29.control" : 0.05319149047136307,
    "rollback-2.conv.30.candidate" : 0,
    "rollback-2.conv.30.control" : 0.05484693869948387,
    "rollback-2.conv.32.candidate" : 0,
    "rollback-2.conv.32.control" : 0.08133970946073532,
    "rollback-2.conv.33.candidate" : 0,
    "rollback-2.conv.33.control" : 0.05978260934352875,
    "rollback-2.conv.34.candidate" : 0,
    "rollback-2.conv.34.control" : 0.0589519664645195,
    "rollback-2.conv.36.candidate" : 0,
    "rollback-2.conv.36.control" : 0.1024390235543251,
    "rollback-2.conv.37.candidate" : 0,
    "rollback-2.conv.37.control" : 0.048277243971824646,
    "rollback-2.conv.38.candidate" : 0,
    "rollback-2.conv.38.control" : 0.04308712109923363,
    "rollback-2.conv.4.candidate" : 0,
    "rollback-2.conv.4.control" : 0,
    "rollback-2.conv.40.candidate" : 0,
    "rollback-2.conv.40.control" : 0.0535714291036129,
    "rollback-2.conv.41.candidate" : 0,
    "rollback-2.conv.41.control" : 0.057692307978868484,
    "rollback-2.conv.42.candidate" : 0,
    "rollback-2.conv.42.control" : 0.04739932715892792,
    "rollback-2.conv.44.candidate" : 0,
    "rollback-2.conv.44.control" : 0.1358024626970291,
    "rollback-2.conv.45.candidate" : 0,
    "rollback-2.conv.45.control" : 0.06568877398967743,
    "rollback-2.conv.46.candidate" : 0,
    "rollback-2.conv.46.control" : 0.054973822087049484,
    "rollback-2.conv.5.candidate" : 0,
    "rollback-2.conv.5.control" : 0,
    "rollback-2.conv.6.candidate" : 0,
    "rollback-2.conv.6.control" : 0,
    "rollback-2.conv.8.candidate" : 0,
    "rollback-2.conv.8.control" : 0,
    "rollback-2.conv.9.candidate" : 0,
    "rollback-2.conv.9.control" : 0,
    "rollback-2.index.11.candidate" : 0,
    "rollback-2.index.11.control" : 0,
    "rollback-2.index.15.candidate" : 0,
    "rollback-2.index.15.control" : 0.01755617931485176,
    "rollback-2.index.19.candidate" : 0,
    "rollback-2.index.19.control" : 0.027397260069847107,
    "rollback-2.index.23.candidate" : 0,
    "rollback-2.index.23.control" : 0.02276785671710968,
    "rollback-2.index.27.candidate" : 0,
    "rollback-2.index.27.control" : 0.037128712981939316,
    "rollback-2.index.3.candidate" : 0,
    "rollback-2.index.3.control" : 0,
    "rollback-2.index.31.candidate" : 0,
    "rollback-2.index.31.control" : 0.19605809450149536,
    "rollback-2.index.35.candidate" : 0,
    "rollback-2.index.35.control" : 0.11423841118812561,
    "rollback-2.index.39.candidate" : 0,
    "rollback-2.index.39.control" : 0.04628164693713188,
    "rollback-2.index.43.candidate" : 0,
    "rollback-2.index.43.control" : 0.04707031324505806,
    "rollback-2.index.47.candidate" : 0,
    "rollback-2.index.47.control" : 0.10187499970197678,
    "rollback-2.index.7.candidate" : 0,
    "rollback-2.index.7.control" : 0,
    "rollback-2.key.11.candidate" : 0,
    "rollback-2.key.11.control" : 0,
    "rollback-2.key.15.candidate" : 0,
    "rollback-2.key.15.control" : 0.031934306025505066,
    "rollback-2.key.19.candidate" : 0,
    "rollback-2.key.19.control" : 0.05613425746560097,
    "rollback-2.key.23.candidate" : 0,
    "rollback-2.key.23.control" : 0.06541666388511658,
    "rollback-2.key.27.candidate" : 0,
    "rollback-2.key.27.control" : 0.10896381735801697,
    "rollback-2.key.3.candidate" : 0,
    "rollback-2.key.3.control" : 0,
    "rollback-2.key.31.candidate" : 0,
    "rollback-2.key.31.control" : 0.14901426434516907,
    "rollback-2.key.35.candidate" : 0,
    "rollback-2.key.35.control" : 0.16338582336902618,
    "rollback-2.key.39.candidate" : 0,
    "rollback-2.key.39.control" : 0.08671875298023224,
    "rollback-2.key.43.candidate" : 0,
    "rollback-2.key.43.control" : 0.07823128998279572,
    "rollback-2.key.47.candidate" : 0,
    "rollback-2.key.47.control" : 0.09786522388458252,
    "rollback-2.key.7.candidate" : 0,
    "rollback-2.key.7.control" : 0,
    "rollback-2.logits.candidate" : 0,
    "rollback-2.logits.control" : 0.05688336491584778,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0,
    "rollback-2.ssm.1.control" : 0,
    "rollback-2.ssm.10.candidate" : 0,
    "rollback-2.ssm.10.control" : 0,
    "rollback-2.ssm.12.candidate" : 0,
    "rollback-2.ssm.12.control" : 0,
    "rollback-2.ssm.13.candidate" : 0,
    "rollback-2.ssm.13.control" : 0.0002791119331959635,
    "rollback-2.ssm.14.candidate" : 0,
    "rollback-2.ssm.14.control" : 0.0048773935995996,
    "rollback-2.ssm.16.candidate" : 0,
    "rollback-2.ssm.16.control" : 0.010922309011220932,
    "rollback-2.ssm.17.candidate" : 0,
    "rollback-2.ssm.17.control" : 0.013563264161348343,
    "rollback-2.ssm.18.candidate" : 0,
    "rollback-2.ssm.18.control" : 0.013371502049267292,
    "rollback-2.ssm.2.candidate" : 0,
    "rollback-2.ssm.2.control" : 0,
    "rollback-2.ssm.20.candidate" : 0,
    "rollback-2.ssm.20.control" : 0.00973447598516941,
    "rollback-2.ssm.21.candidate" : 0,
    "rollback-2.ssm.21.control" : 0.012765606865286827,
    "rollback-2.ssm.22.candidate" : 0,
    "rollback-2.ssm.22.control" : 0.0044365995563566685,
    "rollback-2.ssm.24.candidate" : 0,
    "rollback-2.ssm.24.control" : 0.014221612364053726,
    "rollback-2.ssm.25.candidate" : 0,
    "rollback-2.ssm.25.control" : 0.03429656848311424,
    "rollback-2.ssm.26.candidate" : 0,
    "rollback-2.ssm.26.control" : 0.05921730399131775,
    "rollback-2.ssm.28.candidate" : 0,
    "rollback-2.ssm.28.control" : 0.0024056602269411087,
    "rollback-2.ssm.29.candidate" : 0,
    "rollback-2.ssm.29.control" : 0.04527357220649719,
    "rollback-2.ssm.30.candidate" : 0,
    "rollback-2.ssm.30.control" : 0.037865109741687775,
    "rollback-2.ssm.32.candidate" : 0,
    "rollback-2.ssm.32.control" : 0.05244925990700722,
    "rollback-2.ssm.33.candidate" : 0,
    "rollback-2.ssm.33.control" : 0.09059132635593414,
    "rollback-2.ssm.34.candidate" : 0,
    "rollback-2.ssm.34.control" : 0.07004349678754807,
    "rollback-2.ssm.36.candidate" : 0,
    "rollback-2.ssm.36.control" : 0.03718012571334839,
    "rollback-2.ssm.37.candidate" : 0,
    "rollback-2.ssm.37.control" : 0.0559813566505909,
    "rollback-2.ssm.38.candidate" : 0,
    "rollback-2.ssm.38.control" : 0.01301589421927929,
    "rollback-2.ssm.4.candidate" : 0,
    "rollback-2.ssm.4.control" : 0,
    "rollback-2.ssm.40.candidate" : 0,
    "rollback-2.ssm.40.control" : 0.019173989072442055,
    "rollback-2.ssm.41.candidate" : 0,
    "rollback-2.ssm.41.control" : 0.021716510877013206,
    "rollback-2.ssm.42.candidate" : 0,
    "rollback-2.ssm.42.control" : 0.029392121359705925,
    "rollback-2.ssm.44.candidate" : 0,
    "rollback-2.ssm.44.control" : 0.015560891479253769,
    "rollback-2.ssm.45.candidate" : 0,
    "rollback-2.ssm.45.control" : 0.06941861659288406,
    "rollback-2.ssm.46.candidate" : 0,
    "rollback-2.ssm.46.control" : 0.13302038609981537,
    "rollback-2.ssm.5.candidate" : 0,
    "rollback-2.ssm.5.control" : 0,
    "rollback-2.ssm.6.candidate" : 0,
    "rollback-2.ssm.6.control" : 0,
    "rollback-2.ssm.8.candidate" : 0,
    "rollback-2.ssm.8.control" : 0,
    "rollback-2.ssm.9.candidate" : 0,
    "rollback-2.ssm.9.control" : 0,
    "rollback-2.value.11.candidate" : 0,
    "rollback-2.value.11.control" : 0,
    "rollback-2.value.15.candidate" : 0,
    "rollback-2.value.15.control" : 0.009213147684931755,
    "rollback-2.value.19.candidate" : 0,
    "rollback-2.value.19.control" : 0.012519929558038712,
    "rollback-2.value.23.candidate" : 0,
    "rollback-2.value.23.control" : 0.0417151153087616,
    "rollback-2.value.27.candidate" : 0,
    "rollback-2.value.27.control" : 0.014546001330018044,
    "rollback-2.value.3.candidate" : 0,
    "rollback-2.value.3.control" : 0,
    "rollback-2.value.31.candidate" : 0,
    "rollback-2.value.31.control" : 0.072826087474823,
    "rollback-2.value.35.candidate" : 0,
    "rollback-2.value.35.control" : 0.06159420311450958,
    "rollback-2.value.39.candidate" : 0,
    "rollback-2.value.39.control" : 0.0494791679084301,
    "rollback-2.value.43.candidate" : 0,
    "rollback-2.value.43.control" : 0.04088050499558449,
    "rollback-2.value.47.candidate" : 0,
    "rollback-2.value.47.control" : 0.20636433362960815,
    "rollback-2.value.7.candidate" : 0,
    "rollback-2.value.7.control" : 0,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0,
    "rollback-3.conv.10.control" : 0,
    "rollback-3.conv.12.candidate" : 0,
    "rollback-3.conv.12.control" : 0,
    "rollback-3.conv.13.candidate" : 0,
    "rollback-3.conv.13.control" : 0,
    "rollback-3.conv.14.candidate" : 0,
    "rollback-3.conv.14.control" : 0.010256410576403141,
    "rollback-3.conv.16.candidate" : 0,
    "rollback-3.conv.16.control" : 0.015470297075808048,
    "rollback-3.conv.17.candidate" : 0,
    "rollback-3.conv.17.control" : 0.01683937758207321,
    "rollback-3.conv.18.candidate" : 0,
    "rollback-3.conv.18.control" : 0.021029537543654442,
    "rollback-3.conv.2.candidate" : 0,
    "rollback-3.conv.2.control" : 0,
    "rollback-3.conv.20.candidate" : 0,
    "rollback-3.conv.20.control" : 0.04042288661003113,
    "rollback-3.conv.21.candidate" : 0,
    "rollback-3.conv.21.control" : 0.025119617581367493,
    "rollback-3.conv.22.candidate" : 0,
    "rollback-3.conv.22.control" : 0.016400709748268127,
    "rollback-3.conv.24.candidate" : 0,
    "rollback-3.conv.24.control" : 0.03072625771164894,
    "rollback-3.conv.25.candidate" : 0,
    "rollback-3.conv.25.control" : 0.03928571566939354,
    "rollback-3.conv.26.candidate" : 0,
    "rollback-3.conv.26.control" : 0.041347287595272064,
    "rollback-3.conv.28.candidate" : 0,
    "rollback-3.conv.28.control" : 0.03187251091003418,
    "rollback-3.conv.29.candidate" : 0,
    "rollback-3.conv.29.control" : 0.048497267067432404,
    "rollback-3.conv.30.candidate" : 0,
    "rollback-3.conv.30.control" : 0.04950574040412903,
    "rollback-3.conv.32.candidate" : 0,
    "rollback-3.conv.32.control" : 0.0758293867111206,
    "rollback-3.conv.33.candidate" : 0,
    "rollback-3.conv.33.control" : 0.07890625298023224,
    "rollback-3.conv.34.candidate" : 0,
    "rollback-3.conv.34.control" : 0.05567226931452751,
    "rollback-3.conv.36.candidate" : 0,
    "rollback-3.conv.36.control" : 0.10096153616905212,
    "rollback-3.conv.37.candidate" : 0,
    "rollback-3.conv.37.control" : 0.09401709586381912,
    "rollback-3.conv.38.candidate" : 0,
    "rollback-3.conv.38.control" : 0.035606060177087784,
    "rollback-3.conv.4.candidate" : 0,
    "rollback-3.conv.4.control" : 0,
    "rollback-3.conv.40.candidate" : 0,
    "rollback-3.conv.40.control" : 0.07500000298023224,
    "rollback-3.conv.41.candidate" : 0,
    "rollback-3.conv.41.control" : 0.05057251825928688,
    "rollback-3.conv.42.candidate" : 0,
    "rollback-3.conv.42.control" : 0.05180368945002556,
    "rollback-3.conv.44.candidate" : 0,
    "rollback-3.conv.44.control" : 0.1358024626970291,
    "rollback-3.conv.45.candidate" : 0,
    "rollback-3.conv.45.control" : 0.03496503457427025,
    "rollback-3.conv.46.candidate" : 0,
    "rollback-3.conv.46.control" : 0.0445026196539402,
    "rollback-3.conv.5.candidate" : 0,
    "rollback-3.conv.5.control" : 0,
    "rollback-3.conv.6.candidate" : 0,
    "rollback-3.conv.6.control" : 0,
    "rollback-3.conv.8.candidate" : 0,
    "rollback-3.conv.8.control" : 0,
    "rollback-3.conv.9.candidate" : 0,
    "rollback-3.conv.9.control" : 0,
    "rollback-3.index.11.candidate" : 0,
    "rollback-3.index.11.control" : 0,
    "rollback-3.index.15.candidate" : 0,
    "rollback-3.index.15.control" : 0.01755617931485176,
    "rollback-3.index.19.candidate" : 0,
    "rollback-3.index.19.control" : 0.027397260069847107,
    "rollback-3.index.23.candidate" : 0,
    "rollback-3.index.23.control" : 0.02276785671710968,
    "rollback-3.index.27.candidate" : 0,
    "rollback-3.index.27.control" : 0.037128712981939316,
    "rollback-3.index.3.candidate" : 0,
    "rollback-3.index.3.control" : 0,
    "rollback-3.index.31.candidate" : 0,
    "rollback-3.index.31.control" : 0.19605809450149536,
    "rollback-3.index.35.candidate" : 0,
    "rollback-3.index.35.control" : 0.11423841118812561,
    "rollback-3.index.39.candidate" : 0,
    "rollback-3.index.39.control" : 0.04628164693713188,
    "rollback-3.index.43.candidate" : 0,
    "rollback-3.index.43.control" : 0.04707031324505806,
    "rollback-3.index.47.candidate" : 0,
    "rollback-3.index.47.control" : 0.10187499970197678,
    "rollback-3.index.7.candidate" : 0,
    "rollback-3.index.7.control" : 0,
    "rollback-3.key.11.candidate" : 0,
    "rollback-3.key.11.control" : 0,
    "rollback-3.key.15.candidate" : 0,
    "rollback-3.key.15.control" : 0.031934306025505066,
    "rollback-3.key.19.candidate" : 0,
    "rollback-3.key.19.control" : 0.05613425746560097,
    "rollback-3.key.23.candidate" : 0,
    "rollback-3.key.23.control" : 0.06541666388511658,
    "rollback-3.key.27.candidate" : 0,
    "rollback-3.key.27.control" : 0.10896381735801697,
    "rollback-3.key.3.candidate" : 0,
    "rollback-3.key.3.control" : 0,
    "rollback-3.key.31.candidate" : 0,
    "rollback-3.key.31.control" : 0.14901426434516907,
    "rollback-3.key.35.candidate" : 0,
    "rollback-3.key.35.control" : 0.16338582336902618,
    "rollback-3.key.39.candidate" : 0,
    "rollback-3.key.39.control" : 0.08671875298023224,
    "rollback-3.key.43.candidate" : 0,
    "rollback-3.key.43.control" : 0.07823128998279572,
    "rollback-3.key.47.candidate" : 0,
    "rollback-3.key.47.control" : 0.09786522388458252,
    "rollback-3.key.7.candidate" : 0,
    "rollback-3.key.7.control" : 0,
    "rollback-3.logits.candidate" : 0,
    "rollback-3.logits.control" : 0.06941650062799454,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0,
    "rollback-3.ssm.1.control" : 0,
    "rollback-3.ssm.10.candidate" : 0,
    "rollback-3.ssm.10.control" : 0,
    "rollback-3.ssm.12.candidate" : 0,
    "rollback-3.ssm.12.control" : 0,
    "rollback-3.ssm.13.candidate" : 0,
    "rollback-3.ssm.13.control" : 0.0002753961889538914,
    "rollback-3.ssm.14.candidate" : 0,
    "rollback-3.ssm.14.control" : 0.007244178093969822,
    "rollback-3.ssm.16.candidate" : 0,
    "rollback-3.ssm.16.control" : 0.013954143971204758,
    "rollback-3.ssm.17.candidate" : 0,
    "rollback-3.ssm.17.control" : 0.02861716039478779,
    "rollback-3.ssm.18.candidate" : 0,
    "rollback-3.ssm.18.control" : 0.04236041009426117,
    "rollback-3.ssm.2.candidate" : 0,
    "rollback-3.ssm.2.control" : 0,
    "rollback-3.ssm.20.candidate" : 0,
    "rollback-3.ssm.20.control" : 0.021035408601164818,
    "rollback-3.ssm.21.candidate" : 0,
    "rollback-3.ssm.21.control" : 0.012942383997142315,
    "rollback-3.ssm.22.candidate" : 0,
    "rollback-3.ssm.22.control" : 0.004294726997613907,
    "rollback-3.ssm.24.candidate" : 0,
    "rollback-3.ssm.24.control" : 0.014817526564002037,
    "rollback-3.ssm.25.candidate" : 0,
    "rollback-3.ssm.25.control" : 0.06067748740315437,
    "rollback-3.ssm.26.candidate" : 0,
    "rollback-3.ssm.26.control" : 0.09641925990581512,
    "rollback-3.ssm.28.candidate" : 0,
    "rollback-3.ssm.28.control" : 0.003989783581346273,
    "rollback-3.ssm.29.candidate" : 0,
    "rollback-3.ssm.29.control" : 0.061760202050209045,
    "rollback-3.ssm.30.candidate" : 0,
    "rollback-3.ssm.30.control" : 0.04147869721055031,
    "rollback-3.ssm.32.candidate" : 0,
    "rollback-3.ssm.32.control" : 0.07607626914978027,
    "rollback-3.ssm.33.candidate" : 0,
    "rollback-3.ssm.33.control" : 0.15820598602294922,
    "rollback-3.ssm.34.candidate" : 0,
    "rollback-3.ssm.34.control" : 0.13165420293807983,
    "rollback-3.ssm.36.candidate" : 0,
    "rollback-3.ssm.36.control" : 0.08035723119974136,
    "rollback-3.ssm.37.candidate" : 0,
    "rollback-3.ssm.37.control" : 0.07587326318025589,
    "rollback-3.ssm.38.candidate" : 0,
    "rollback-3.ssm.38.control" : 0.0154428631067276,
    "rollback-3.ssm.4.candidate" : 0,
    "rollback-3.ssm.4.control" : 0,
    "rollback-3.ssm.40.candidate" : 0,
    "rollback-3.ssm.40.control" : 0.025110634043812752,
    "rollback-3.ssm.41.candidate" : 0,
    "rollback-3.ssm.41.control" : 0.02152792364358902,
    "rollback-3.ssm.42.candidate" : 0,
    "rollback-3.ssm.42.control" : 0.034233737736940384,
    "rollback-3.ssm.44.candidate" : 0,
    "rollback-3.ssm.44.control" : 0.015147016383707523,
    "rollback-3.ssm.45.candidate" : 0,
    "rollback-3.ssm.45.control" : 0.092524953186512,
    "rollback-3.ssm.46.candidate" : 0,
    "rollback-3.ssm.46.control" : 0.13415981829166412,
    "rollback-3.ssm.5.candidate" : 0,
    "rollback-3.ssm.5.control" : 0,
    "rollback-3.ssm.6.candidate" : 0,
    "rollback-3.ssm.6.control" : 0,
    "rollback-3.ssm.8.candidate" : 0,
    "rollback-3.ssm.8.control" : 0,
    "rollback-3.ssm.9.candidate" : 0,
    "rollback-3.ssm.9.control" : 0,
    "rollback-3.value.11.candidate" : 0,
    "rollback-3.value.11.control" : 0,
    "rollback-3.value.15.candidate" : 0,
    "rollback-3.value.15.control" : 0.009213147684931755,
    "rollback-3.value.19.candidate" : 0,
    "rollback-3.value.19.control" : 0.012519929558038712,
    "rollback-3.value.23.candidate" : 0,
    "rollback-3.value.23.control" : 0.0417151153087616,
    "rollback-3.value.27.candidate" : 0,
    "rollback-3.value.27.control" : 0.014546001330018044,
    "rollback-3.value.3.candidate" : 0,
    "rollback-3.value.3.control" : 0,
    "rollback-3.value.31.candidate" : 0,
    "rollback-3.value.31.control" : 0.072826087474823,
    "rollback-3.value.35.candidate" : 0,
    "rollback-3.value.35.control" : 0.06159420311450958,
    "rollback-3.value.39.candidate" : 0,
    "rollback-3.value.39.control" : 0.0494791679084301,
    "rollback-3.value.43.candidate" : 0,
    "rollback-3.value.43.control" : 0.04088050499558449,
    "rollback-3.value.47.candidate" : 0,
    "rollback-3.value.47.control" : 0.20636433362960815,
    "rollback-3.value.7.candidate" : 0,
    "rollback-3.value.7.control" : 0,
    "routing.candidate" : 0,
    "routing.control" : 0.022079288025889966,
    "workspace_token_tile" : 256
  },
  "name" : "context-small-pass-64-swept-router-padded-attention-aligned-projections-aligned\/tokens=515\/prefix=0",
  "passed" : true
}

````

## small64-projections-12/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````
