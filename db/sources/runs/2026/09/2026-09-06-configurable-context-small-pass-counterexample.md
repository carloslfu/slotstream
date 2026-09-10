---
type: run
id: 01m1vkqe5eg9yb867sg32afj3t
created: 2026-09-06T14:59:57.742650+00:00
updated: 2026-09-06T15:08:24.146542+00:00
summary: Sub-256 context path fails frozen state and rollback numerical gates
binary: d6234e81745297bf91977addc77266c865cd3d4ebe606463fe6c763b9f1f2444
captured_at: 2026-09-06
command: Exact commands and source/binary identities retained below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Correctness assertions retained; system-wide swap-ins exclude timing and memory-capacity claims. See configurable-context-observations.
title: Sub-256 context path fails frozen state and rollback numerical gates
tool: Native Swift diagnostics and Python context gates
---
# The original sub-256 path fails the frozen context gate

This counterexample is preserved without changing its tolerances or rerunning
its identity. C07 used 515 deterministic token IDs (`1000 + (i * 7919) %
200000`) with four schedules: 256 reference, 512 rechunking control, 64
candidate and an identical 64 repeat. It then continued with 907, 1337 and
2103, and tested every keep count of the verify sequence [1137, 732, 2091].
The prospective band is `max(3 * control relative drift, 0.01)` per tensor;
logits use their spread, state uses maximum absolute value. Greedy output,
exact integer state, complete offsets and repeated routing/state are separate
gates. Public default optimization controls were used with one 640-slot pool.

347 of 1600 assertions fail. Repeatability passes, but early state drift
exceeds its frozen band and two post-rollback greedy tokens differ. Overall
logit and router drift remain inside the control-relative band; that does not
override the failed state and continuation requirements. P4/P5 stay open and
no capacity ladder has been started. This synthetic diagnostic is not an
answer-quality experiment or an estimate of general model reliability.

Source inspection identifies a concrete candidate mechanism: 64-token passes
use the pooled expert QMV path whereas 256/512 use the staged grouped QMM
path. A successor may use the same bounded grouped arithmetic for small
prefill, with all original acceptance criteria unchanged. The reference result
below is not replaced or relabeled by that successor.

Command: `slotstream optimization-state-check --variant context-small-64 --json`.
Verified build identities (SHA-256):

```json
{
  "binary_sha256": "d6234e81745297bf91977addc77266c865cd3d4ebe606463fe6c763b9f1f2444",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "ceaf46a4d2aea8f6c6e729302450695fd2ab242f2a0886faedd5dbeef22ccd54"
}
```

## small64-6/stdout.txt

SHA-256 `192601b29569b504cc249862c9fbd2a19b0c9e74cece30ddef5f2e519b4b6ca4`; 239232 bytes.

````text
{
  "items" : [
    {
      "name" : "arm0: correct absolute token count",
      "passed" : true
    },
    {
      "name" : "arm0: no pins survive dispatch",
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
      "name" : "arm2: correct absolute token count",
      "passed" : true
    },
    {
      "name" : "arm2: no pins survive dispatch",
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
      "name" : "prefill: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.14",
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
      "name" : "prefill: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.31",
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
      "name" : "prefill: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.8",
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
      "name" : "prefill: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.12",
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
      "name" : "prefill: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.6",
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
      "passed" : false
    },
    {
      "name" : "prefill.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.2: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "prefill.key.19: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "prefill.key.47: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "prefill.ssm.16: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.18: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.2: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.20: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.22: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "name" : "continued-907: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.14",
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
      "name" : "continued-907: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.20",
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
      "name" : "continued-907: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.31",
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
      "name" : "continued-907: deterministic repeated ssm.8",
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
      "name" : "continued-907: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.12",
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
      "name" : "continued-907: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.27",
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
      "name" : "continued-907: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.43",
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
      "name" : "continued-907: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.6",
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
      "passed" : false
    },
    {
      "name" : "continued-907.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.conv.18: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-907.key.19: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-907.key.47: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.16: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.18: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.25: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.28: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.40: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.41: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "name" : "continued-1337: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.14",
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
      "name" : "continued-1337: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.31",
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
      "name" : "continued-1337: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.8",
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
      "name" : "continued-1337: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.12",
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
      "name" : "continued-1337: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.6",
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
      "passed" : false
    },
    {
      "name" : "continued-1337.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.conv.18: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-1337.key.19: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-1337.key.47: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.16: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.18: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.2: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.20: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.22: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.44: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "name" : "continued-2103: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.14",
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
      "name" : "continued-2103: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.20",
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
      "name" : "continued-2103: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.31",
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
      "name" : "continued-2103: deterministic repeated ssm.8",
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
      "name" : "continued-2103: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.12",
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
      "name" : "continued-2103: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.27",
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
      "name" : "continued-2103: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.43",
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
      "name" : "continued-2103: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.6",
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-2103.key.19: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-2103.key.47: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.16: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.21: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.22: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.38: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "name" : "rollback-1: greedy final token",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic field names",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.14",
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
      "name" : "rollback-1: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.31",
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
      "name" : "rollback-1: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.8",
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
      "name" : "rollback-1: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.12",
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
      "name" : "rollback-1: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.6",
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback-1.key.19: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback-1.key.47: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.20: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.22: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "detail" : "got 31921, want 1337",
      "name" : "rollback-2: greedy final token",
      "passed" : false
    },
    {
      "name" : "rollback-2: deterministic field names",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.14",
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
      "name" : "rollback-2: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.20",
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
      "name" : "rollback-2: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.31",
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
      "name" : "rollback-2: deterministic repeated ssm.8",
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
      "name" : "rollback-2: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.12",
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
      "name" : "rollback-2: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.27",
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
      "name" : "rollback-2: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.43",
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
      "name" : "rollback-2: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.6",
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback-2.key.19: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback-2.key.47: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.16: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.18: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.2: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "detail" : "got 31921, want 907",
      "name" : "rollback-3: greedy final token",
      "passed" : false
    },
    {
      "name" : "rollback-3: deterministic field names",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.14",
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
      "name" : "rollback-3: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.31",
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
      "name" : "rollback-3: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.8",
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
      "name" : "rollback-3: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.12",
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
      "name" : "rollback-3: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.6",
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback-3.key.19: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback-3.key.47: existing rechunk band",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback-3.ssm.16: existing rechunk band",
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
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
    "arm0.seconds" : 6.239111625,
    "arm0.workspace_piece_writes" : 0,
    "arm1.allocated_bytes" : 28311552,
    "arm1.chunk" : 512,
    "arm1.read_records" : 10438,
    "arm1.seconds" : 3.220358209,
    "arm1.workspace_piece_writes" : 0,
    "arm2.allocated_bytes" : 28311552,
    "arm2.chunk" : 64,
    "arm2.read_records" : 41193,
    "arm2.seconds" : 13.306754958,
    "arm2.workspace_piece_writes" : 0,
    "arm3.allocated_bytes" : 28311552,
    "arm3.chunk" : 64,
    "arm3.read_records" : 41193,
    "arm3.seconds" : 13.421548209,
    "arm3.workspace_piece_writes" : 0,
    "compact_scope_frontier" : 0,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0.005248091649264097,
    "continued-1337.conv.1.control" : 0,
    "continued-1337.conv.10.candidate" : 0.02829601988196373,
    "continued-1337.conv.10.control" : 0,
    "continued-1337.conv.12.candidate" : 0.018700508400797844,
    "continued-1337.conv.12.control" : 0,
    "continued-1337.conv.13.candidate" : 0.03089887648820877,
    "continued-1337.conv.13.control" : 0,
    "continued-1337.conv.14.candidate" : 0.03304687514901161,
    "continued-1337.conv.14.control" : 0.005625000223517418,
    "continued-1337.conv.16.candidate" : 0.03817734122276306,
    "continued-1337.conv.16.control" : 0.01681804098188877,
    "continued-1337.conv.17.candidate" : 0.0416666679084301,
    "continued-1337.conv.17.control" : 0.011574073694646358,
    "continued-1337.conv.18.candidate" : 0.029279278591275215,
    "continued-1337.conv.18.control" : 0.009009009227156639,
    "continued-1337.conv.2.candidate" : 0.028846153989434242,
    "continued-1337.conv.2.control" : 0,
    "continued-1337.conv.20.candidate" : 0.041025642305612564,
    "continued-1337.conv.20.control" : 0.025641025975346565,
    "continued-1337.conv.21.candidate" : 0.03212616965174675,
    "continued-1337.conv.21.control" : 0.014018691144883633,
    "continued-1337.conv.22.candidate" : 0.02500000037252903,
    "continued-1337.conv.22.control" : 0.010714286006987095,
    "continued-1337.conv.24.candidate" : 0.044986262917518616,
    "continued-1337.conv.24.control" : 0.03365384787321091,
    "continued-1337.conv.25.candidate" : 0.04929577559232712,
    "continued-1337.conv.25.control" : 0.028682511299848557,
    "continued-1337.conv.26.candidate" : 0.07236842066049576,
    "continued-1337.conv.26.control" : 0.04904306307435036,
    "continued-1337.conv.28.candidate" : 0.04518423601984978,
    "continued-1337.conv.28.control" : 0.03684701398015022,
    "continued-1337.conv.29.candidate" : 0.10160818696022034,
    "continued-1337.conv.29.control" : 0.05847953259944916,
    "continued-1337.conv.30.candidate" : 0.08673469722270966,
    "continued-1337.conv.30.control" : 0.07780612260103226,
    "continued-1337.conv.32.candidate" : 0.09557174891233444,
    "continued-1337.conv.32.control" : 0.08127802610397339,
    "continued-1337.conv.33.candidate" : 0.099609375,
    "continued-1337.conv.33.control" : 0.0654296875,
    "continued-1337.conv.34.candidate" : 0.10680379718542099,
    "continued-1337.conv.34.control" : 0.07489451766014099,
    "continued-1337.conv.36.candidate" : 0.12068965286016464,
    "continued-1337.conv.36.control" : 0.09852216392755508,
    "continued-1337.conv.37.candidate" : 0.08882319927215576,
    "continued-1337.conv.37.control" : 0.05067567527294159,
    "continued-1337.conv.38.candidate" : 0.09209559112787247,
    "continued-1337.conv.38.control" : 0.04117647185921669,
    "continued-1337.conv.4.candidate" : 0.017308181151747704,
    "continued-1337.conv.4.control" : 0,
    "continued-1337.conv.40.candidate" : 0.17678570747375488,
    "continued-1337.conv.40.control" : 0.0714285746216774,
    "continued-1337.conv.41.candidate" : 0.083404541015625,
    "continued-1337.conv.41.control" : 0.05059814453125,
    "continued-1337.conv.42.candidate" : 0.08673469722270966,
    "continued-1337.conv.42.control" : 0.05782312899827957,
    "continued-1337.conv.44.candidate" : 0.13812154531478882,
    "continued-1337.conv.44.control" : 0.10220994800329208,
    "continued-1337.conv.45.candidate" : 0.06604993343353271,
    "continued-1337.conv.45.control" : 0.051309119910001755,
    "continued-1337.conv.46.candidate" : 0.0848214253783226,
    "continued-1337.conv.46.control" : 0.1116071417927742,
    "continued-1337.conv.5.candidate" : 0.0555555559694767,
    "continued-1337.conv.5.control" : 0,
    "continued-1337.conv.6.candidate" : 0.019953051581978798,
    "continued-1337.conv.6.control" : 0,
    "continued-1337.conv.8.candidate" : 0.021844660863280296,
    "continued-1337.conv.8.control" : 0,
    "continued-1337.conv.9.candidate" : 0.021276595070958138,
    "continued-1337.conv.9.control" : 0,
    "continued-1337.index.11.candidate" : 0.05131172761321068,
    "continued-1337.index.11.control" : 0,
    "continued-1337.index.15.candidate" : 0.1130618005990982,
    "continued-1337.index.15.control" : 0.01755617931485176,
    "continued-1337.index.19.candidate" : 0.12007705122232437,
    "continued-1337.index.19.control" : 0.027397260069847107,
    "continued-1337.index.23.candidate" : 0.05178571492433548,
    "continued-1337.index.23.control" : 0.02276785671710968,
    "continued-1337.index.27.candidate" : 0.08090965449810028,
    "continued-1337.index.27.control" : 0.037128712981939316,
    "continued-1337.index.3.candidate" : 0.05917159840464592,
    "continued-1337.index.3.control" : 0,
    "continued-1337.index.31.candidate" : 0.20020747184753418,
    "continued-1337.index.31.control" : 0.19605809450149536,
    "continued-1337.index.35.candidate" : 0.18377482891082764,
    "continued-1337.index.35.control" : 0.11423841118812561,
    "continued-1337.index.39.candidate" : 0.7373417615890503,
    "continued-1337.index.39.control" : 0.04628164693713188,
    "continued-1337.index.43.candidate" : 0.793749988079071,
    "continued-1337.index.43.control" : 0.04707031324505806,
    "continued-1337.index.47.candidate" : 0.19208332896232605,
    "continued-1337.index.47.control" : 0.10187499970197678,
    "continued-1337.index.7.candidate" : 0.05003446713089943,
    "continued-1337.index.7.control" : 0,
    "continued-1337.key.11.candidate" : 0.1387019157409668,
    "continued-1337.key.11.control" : 0,
    "continued-1337.key.15.candidate" : 0.16742700338363647,
    "continued-1337.key.15.control" : 0.031934306025505066,
    "continued-1337.key.19.candidate" : 0.2057291716337204,
    "continued-1337.key.19.control" : 0.05613425746560097,
    "continued-1337.key.23.candidate" : 0.08520833402872086,
    "continued-1337.key.23.control" : 0.06541666388511658,
    "continued-1337.key.27.candidate" : 0.1999194473028183,
    "continued-1337.key.27.control" : 0.10896381735801697,
    "continued-1337.key.3.candidate" : 0.10152284055948257,
    "continued-1337.key.3.control" : 0,
    "continued-1337.key.31.candidate" : 0.19798657298088074,
    "continued-1337.key.31.control" : 0.14901426434516907,
    "continued-1337.key.35.candidate" : 0.2344980388879776,
    "continued-1337.key.35.control" : 0.16338582336902618,
    "continued-1337.key.39.candidate" : 0.8125,
    "continued-1337.key.39.control" : 0.08671875298023224,
    "continued-1337.key.43.candidate" : 0.666241466999054,
    "continued-1337.key.43.control" : 0.07823128998279572,
    "continued-1337.key.47.candidate" : 0.2942386865615845,
    "continued-1337.key.47.control" : 0.09786522388458252,
    "continued-1337.key.7.candidate" : 0.13295455276966095,
    "continued-1337.key.7.control" : 0,
    "continued-1337.logits.candidate" : 0.1625434011220932,
    "continued-1337.logits.control" : 0.10532407462596893,
    "continued-1337.ple.1.candidate" : 0.004081632476300001,
    "continued-1337.ple.1.control" : 0,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0.004986113868653774,
    "continued-1337.ssm.1.control" : 0,
    "continued-1337.ssm.10.candidate" : 0.06352058053016663,
    "continued-1337.ssm.10.control" : 0,
    "continued-1337.ssm.12.candidate" : 0.003911091014742851,
    "continued-1337.ssm.12.control" : 0,
    "continued-1337.ssm.13.candidate" : 0.02525811828672886,
    "continued-1337.ssm.13.control" : 0.00026312010595574975,
    "continued-1337.ssm.14.candidate" : 0.021550387144088745,
    "continued-1337.ssm.14.control" : 0.0042149461805820465,
    "continued-1337.ssm.16.candidate" : 0.0596618726849556,
    "continued-1337.ssm.16.control" : 0.013277687132358551,
    "continued-1337.ssm.17.candidate" : 0.031023789197206497,
    "continued-1337.ssm.17.control" : 0.012733696959912777,
    "continued-1337.ssm.18.candidate" : 0.045971136540174484,
    "continued-1337.ssm.18.control" : 0.014517116360366344,
    "continued-1337.ssm.2.candidate" : 0.01667885109782219,
    "continued-1337.ssm.2.control" : 0,
    "continued-1337.ssm.20.candidate" : 0.028137221932411194,
    "continued-1337.ssm.20.control" : 0.008949542418122292,
    "continued-1337.ssm.21.candidate" : 0.020894113928079605,
    "continued-1337.ssm.21.control" : 0.008825146593153477,
    "continued-1337.ssm.22.candidate" : 0.017854807898402214,
    "continued-1337.ssm.22.control" : 0.005606972612440586,
    "continued-1337.ssm.24.candidate" : 0.03911828249692917,
    "continued-1337.ssm.24.control" : 0.030068622902035713,
    "continued-1337.ssm.25.candidate" : 0.07220354676246643,
    "continued-1337.ssm.25.control" : 0.03369494900107384,
    "continued-1337.ssm.26.candidate" : 0.248576819896698,
    "continued-1337.ssm.26.control" : 0.16198740899562836,
    "continued-1337.ssm.28.candidate" : 0.0205400288105011,
    "continued-1337.ssm.28.control" : 0.004970375914126635,
    "continued-1337.ssm.29.candidate" : 0.07214256376028061,
    "continued-1337.ssm.29.control" : 0.04375261068344116,
    "continued-1337.ssm.30.candidate" : 0.05618108808994293,
    "continued-1337.ssm.30.control" : 0.09145420044660568,
    "continued-1337.ssm.32.candidate" : 0.06062105670571327,
    "continued-1337.ssm.32.control" : 0.0503963828086853,
    "continued-1337.ssm.33.candidate" : 0.10968449711799622,
    "continued-1337.ssm.33.control" : 0.1020117849111557,
    "continued-1337.ssm.34.candidate" : 0.11370441317558289,
    "continued-1337.ssm.34.control" : 0.06148255616426468,
    "continued-1337.ssm.36.candidate" : 0.10834356397390366,
    "continued-1337.ssm.36.control" : 0.0531274639070034,
    "continued-1337.ssm.37.candidate" : 0.081187404692173,
    "continued-1337.ssm.37.control" : 0.04999849572777748,
    "continued-1337.ssm.38.candidate" : 0.052794232964515686,
    "continued-1337.ssm.38.control" : 0.014088941738009453,
    "continued-1337.ssm.4.candidate" : 0.025857288390398026,
    "continued-1337.ssm.4.control" : 0,
    "continued-1337.ssm.40.candidate" : 0.045108452439308167,
    "continued-1337.ssm.40.control" : 0.015454727225005627,
    "continued-1337.ssm.41.candidate" : 0.05191900208592415,
    "continued-1337.ssm.41.control" : 0.016492173075675964,
    "continued-1337.ssm.42.candidate" : 0.05836445465683937,
    "continued-1337.ssm.42.control" : 0.02904917486011982,
    "continued-1337.ssm.44.candidate" : 0.07600487023591995,
    "continued-1337.ssm.44.control" : 0.022203821688890457,
    "continued-1337.ssm.45.candidate" : 0.16438011825084686,
    "continued-1337.ssm.45.control" : 0.16785705089569092,
    "continued-1337.ssm.46.candidate" : 0.18304312229156494,
    "continued-1337.ssm.46.control" : 0.22480647265911102,
    "continued-1337.ssm.5.candidate" : 0.06671188771724701,
    "continued-1337.ssm.5.control" : 0,
    "continued-1337.ssm.6.candidate" : 0.02519841678440571,
    "continued-1337.ssm.6.control" : 0,
    "continued-1337.ssm.8.candidate" : 0.023783670738339424,
    "continued-1337.ssm.8.control" : 0,
    "continued-1337.ssm.9.candidate" : 0.03470490127801895,
    "continued-1337.ssm.9.control" : 0,
    "continued-1337.value.11.candidate" : 0.0370953232049942,
    "continued-1337.value.11.control" : 0,
    "continued-1337.value.15.candidate" : 0.06274900585412979,
    "continued-1337.value.15.control" : 0.009213147684931755,
    "continued-1337.value.19.candidate" : 0.05994898080825806,
    "continued-1337.value.19.control" : 0.012519929558038712,
    "continued-1337.value.23.candidate" : 0.06744185835123062,
    "continued-1337.value.23.control" : 0.0417151153087616,
    "continued-1337.value.27.candidate" : 0.030048076063394547,
    "continued-1337.value.27.control" : 0.014546001330018044,
    "continued-1337.value.3.candidate" : 0.06161971762776375,
    "continued-1337.value.3.control" : 0,
    "continued-1337.value.31.candidate" : 0.08206521719694138,
    "continued-1337.value.31.control" : 0.072826087474823,
    "continued-1337.value.35.candidate" : 0.0987318828701973,
    "continued-1337.value.35.control" : 0.06159420311450958,
    "continued-1337.value.39.candidate" : 0.7654761672019958,
    "continued-1337.value.39.control" : 0.0494791679084301,
    "continued-1337.value.43.candidate" : 0.342521607875824,
    "continued-1337.value.43.control" : 0.04088050499558449,
    "continued-1337.value.47.candidate" : 0.4268292784690857,
    "continued-1337.value.47.control" : 0.20636433362960815,
    "continued-1337.value.7.candidate" : 0.03293413296341896,
    "continued-1337.value.7.control" : 0,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0.0037878789007663727,
    "continued-2103.conv.1.control" : 0,
    "continued-2103.conv.10.candidate" : 0.02657710202038288,
    "continued-2103.conv.10.control" : 0,
    "continued-2103.conv.12.candidate" : 0.018368056043982506,
    "continued-2103.conv.12.control" : 0,
    "continued-2103.conv.13.candidate" : 0.030054645612835884,
    "continued-2103.conv.13.control" : 0,
    "continued-2103.conv.14.candidate" : 0.03304687514901161,
    "continued-2103.conv.14.control" : 0.004999999888241291,
    "continued-2103.conv.16.candidate" : 0.03817734122276306,
    "continued-2103.conv.16.control" : 0.01681804098188877,
    "continued-2103.conv.17.candidate" : 0.04326923191547394,
    "continued-2103.conv.17.control" : 0.012019230984151363,
    "continued-2103.conv.18.candidate" : 0.026323197409510612,
    "continued-2103.conv.18.control" : 0.015343468636274338,
    "continued-2103.conv.2.candidate" : 0.0276497695595026,
    "continued-2103.conv.2.control" : 0,
    "continued-2103.conv.20.candidate" : 0.03768844157457352,
    "continued-2103.conv.20.control" : 0.015075377188622952,
    "continued-2103.conv.21.candidate" : 0.03212616965174675,
    "continued-2103.conv.21.control" : 0.014018691144883633,
    "continued-2103.conv.22.candidate" : 0.02464788779616356,
    "continued-2103.conv.22.control" : 0.011003521271049976,
    "continued-2103.conv.24.candidate" : 0.044497281312942505,
    "continued-2103.conv.24.control" : 0.03328804299235344,
    "continued-2103.conv.25.candidate" : 0.05121951177716255,
    "continued-2103.conv.25.control" : 0.029801828786730766,
    "continued-2103.conv.26.candidate" : 0.06692478060722351,
    "continued-2103.conv.26.control" : 0.04535398259758949,
    "continued-2103.conv.28.candidate" : 0.04518423601984978,
    "continued-2103.conv.28.control" : 0.03684701398015022,
    "continued-2103.conv.29.candidate" : 0.0904947891831398,
    "continued-2103.conv.29.control" : 0.0520833320915699,
    "continued-2103.conv.30.candidate" : 0.08673469722270966,
    "continued-2103.conv.30.control" : 0.07397959381341934,
    "continued-2103.conv.32.candidate" : 0.0942404717206955,
    "continued-2103.conv.32.control" : 0.056334082037210464,
    "continued-2103.conv.33.candidate" : 0.099609375,
    "continued-2103.conv.33.control" : 0.05731201171875,
    "continued-2103.conv.34.candidate" : 0.11053493618965149,
    "continued-2103.conv.34.control" : 0.07751091569662094,
    "continued-2103.conv.36.candidate" : 0.12068965286016464,
    "continued-2103.conv.36.control" : 0.09852216392755508,
    "continued-2103.conv.37.candidate" : 0.09171511977910995,
    "continued-2103.conv.37.control" : 0.05232558026909828,
    "continued-2103.conv.38.candidate" : 0.09431476145982742,
    "continued-2103.conv.38.control" : 0.04216867312788963,
    "continued-2103.conv.4.candidate" : 0.017308181151747704,
    "continued-2103.conv.4.control" : 0,
    "continued-2103.conv.40.candidate" : 0.17307692766189575,
    "continued-2103.conv.40.control" : 0.0699300691485405,
    "continued-2103.conv.41.candidate" : 0.083404541015625,
    "continued-2103.conv.41.control" : 0.05059814453125,
    "continued-2103.conv.42.candidate" : 0.08500000089406967,
    "continued-2103.conv.42.control" : 0.05666666850447655,
    "continued-2103.conv.44.candidate" : 0.14124293625354767,
    "continued-2103.conv.44.control" : 0.10451977699995041,
    "continued-2103.conv.45.candidate" : 0.06604993343353271,
    "continued-2103.conv.45.control" : 0.051309119910001755,
    "continued-2103.conv.46.candidate" : 0.08189655095338821,
    "continued-2103.conv.46.control" : 0.10775861889123917,
    "continued-2103.conv.5.candidate" : 0.05531914904713631,
    "continued-2103.conv.5.control" : 0,
    "continued-2103.conv.6.candidate" : 0.019953051581978798,
    "continued-2103.conv.6.control" : 0,
    "continued-2103.conv.8.candidate" : 0.021844660863280296,
    "continued-2103.conv.8.control" : 0,
    "continued-2103.conv.9.candidate" : 0.021276595070958138,
    "continued-2103.conv.9.control" : 0,
    "continued-2103.index.11.candidate" : 0.05131172761321068,
    "continued-2103.index.11.control" : 0,
    "continued-2103.index.15.candidate" : 0.1130618005990982,
    "continued-2103.index.15.control" : 0.01755617931485176,
    "continued-2103.index.19.candidate" : 0.12007705122232437,
    "continued-2103.index.19.control" : 0.027397260069847107,
    "continued-2103.index.23.candidate" : 0.05178571492433548,
    "continued-2103.index.23.control" : 0.02276785671710968,
    "continued-2103.index.27.candidate" : 0.08090965449810028,
    "continued-2103.index.27.control" : 0.037128712981939316,
    "continued-2103.index.3.candidate" : 0.05917159840464592,
    "continued-2103.index.3.control" : 0,
    "continued-2103.index.31.candidate" : 0.20020747184753418,
    "continued-2103.index.31.control" : 0.19605809450149536,
    "continued-2103.index.35.candidate" : 0.18377482891082764,
    "continued-2103.index.35.control" : 0.11423841118812561,
    "continued-2103.index.39.candidate" : 0.7373417615890503,
    "continued-2103.index.39.control" : 0.04628164693713188,
    "continued-2103.index.43.candidate" : 0.793749988079071,
    "continued-2103.index.43.control" : 0.04707031324505806,
    "continued-2103.index.47.candidate" : 0.19208332896232605,
    "continued-2103.index.47.control" : 0.10187499970197678,
    "continued-2103.index.7.candidate" : 0.05003446713089943,
    "continued-2103.index.7.control" : 0,
    "continued-2103.key.11.candidate" : 0.1387019157409668,
    "continued-2103.key.11.control" : 0,
    "continued-2103.key.15.candidate" : 0.16742700338363647,
    "continued-2103.key.15.control" : 0.031934306025505066,
    "continued-2103.key.19.candidate" : 0.2057291716337204,
    "continued-2103.key.19.control" : 0.05613425746560097,
    "continued-2103.key.23.candidate" : 0.08520833402872086,
    "continued-2103.key.23.control" : 0.06541666388511658,
    "continued-2103.key.27.candidate" : 0.1999194473028183,
    "continued-2103.key.27.control" : 0.10896381735801697,
    "continued-2103.key.3.candidate" : 0.10152284055948257,
    "continued-2103.key.3.control" : 0,
    "continued-2103.key.31.candidate" : 0.19798657298088074,
    "continued-2103.key.31.control" : 0.14901426434516907,
    "continued-2103.key.35.candidate" : 0.2344980388879776,
    "continued-2103.key.35.control" : 0.16338582336902618,
    "continued-2103.key.39.candidate" : 0.8125,
    "continued-2103.key.39.control" : 0.08671875298023224,
    "continued-2103.key.43.candidate" : 0.666241466999054,
    "continued-2103.key.43.control" : 0.07823128998279572,
    "continued-2103.key.47.candidate" : 0.2942386865615845,
    "continued-2103.key.47.control" : 0.09786522388458252,
    "continued-2103.key.7.candidate" : 0.13295455276966095,
    "continued-2103.key.7.control" : 0,
    "continued-2103.logits.candidate" : 0.09498820453882217,
    "continued-2103.logits.control" : 0.09433962404727936,
    "continued-2103.ple.1.candidate" : 0.004081632476300001,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0.004584168549627066,
    "continued-2103.ssm.1.control" : 0,
    "continued-2103.ssm.10.candidate" : 0.03242616355419159,
    "continued-2103.ssm.10.control" : 0,
    "continued-2103.ssm.12.candidate" : 0.003905530786141753,
    "continued-2103.ssm.12.control" : 0,
    "continued-2103.ssm.13.candidate" : 0.02697131223976612,
    "continued-2103.ssm.13.control" : 0.00027723138919100165,
    "continued-2103.ssm.14.candidate" : 0.022504184395074844,
    "continued-2103.ssm.14.control" : 0.002875519683584571,
    "continued-2103.ssm.16.candidate" : 0.0581330768764019,
    "continued-2103.ssm.16.control" : 0.01306831929832697,
    "continued-2103.ssm.17.candidate" : 0.033623773604631424,
    "continued-2103.ssm.17.control" : 0.012333724647760391,
    "continued-2103.ssm.18.candidate" : 0.05228498578071594,
    "continued-2103.ssm.18.control" : 0.026666244491934776,
    "continued-2103.ssm.2.candidate" : 0.012419282458722591,
    "continued-2103.ssm.2.control" : 0,
    "continued-2103.ssm.20.candidate" : 0.028188064694404602,
    "continued-2103.ssm.20.control" : 0.010438838973641396,
    "continued-2103.ssm.21.candidate" : 0.02478473074734211,
    "continued-2103.ssm.21.control" : 0.005878801923245192,
    "continued-2103.ssm.22.candidate" : 0.017850376665592194,
    "continued-2103.ssm.22.control" : 0.005343249067664146,
    "continued-2103.ssm.24.candidate" : 0.039126280695199966,
    "continued-2103.ssm.24.control" : 0.02550414949655533,
    "continued-2103.ssm.25.candidate" : 0.08567832410335541,
    "continued-2103.ssm.25.control" : 0.042839165776968,
    "continued-2103.ssm.26.candidate" : 0.10595341771841049,
    "continued-2103.ssm.26.control" : 0.07313300669193268,
    "continued-2103.ssm.28.candidate" : 0.01768329367041588,
    "continued-2103.ssm.28.control" : 0.005258497782051563,
    "continued-2103.ssm.29.candidate" : 0.10617813467979431,
    "continued-2103.ssm.29.control" : 0.04497474431991577,
    "continued-2103.ssm.30.candidate" : 0.045957259833812714,
    "continued-2103.ssm.30.control" : 0.032806556671857834,
    "continued-2103.ssm.32.candidate" : 0.11815951764583588,
    "continued-2103.ssm.32.control" : 0.09136993438005447,
    "continued-2103.ssm.33.candidate" : 0.10295309871435165,
    "continued-2103.ssm.33.control" : 0.06761748343706131,
    "continued-2103.ssm.34.candidate" : 0.13925594091415405,
    "continued-2103.ssm.34.control" : 0.07938974350690842,
    "continued-2103.ssm.36.candidate" : 0.07980860769748688,
    "continued-2103.ssm.36.control" : 0.04179370030760765,
    "continued-2103.ssm.37.candidate" : 0.12551170587539673,
    "continued-2103.ssm.37.control" : 0.04076423868536949,
    "continued-2103.ssm.38.candidate" : 0.05259736627340317,
    "continued-2103.ssm.38.control" : 0.016576921567320824,
    "continued-2103.ssm.4.candidate" : 0.026434598490595818,
    "continued-2103.ssm.4.control" : 0,
    "continued-2103.ssm.40.candidate" : 0.045325666666030884,
    "continued-2103.ssm.40.control" : 0.016824448481202126,
    "continued-2103.ssm.41.candidate" : 0.05256630480289459,
    "continued-2103.ssm.41.control" : 0.018600014969706535,
    "continued-2103.ssm.42.candidate" : 0.09079685807228088,
    "continued-2103.ssm.42.control" : 0.06506846845149994,
    "continued-2103.ssm.44.candidate" : 0.0765586867928505,
    "continued-2103.ssm.44.control" : 0.014560380950570107,
    "continued-2103.ssm.45.candidate" : 0.16757309436798096,
    "continued-2103.ssm.45.control" : 0.0805421993136406,
    "continued-2103.ssm.46.candidate" : 0.17405034601688385,
    "continued-2103.ssm.46.control" : 0.17004629969596863,
    "continued-2103.ssm.5.candidate" : 0.03435390442609787,
    "continued-2103.ssm.5.control" : 0,
    "continued-2103.ssm.6.candidate" : 0.025218496099114418,
    "continued-2103.ssm.6.control" : 0,
    "continued-2103.ssm.8.candidate" : 0.0237890537828207,
    "continued-2103.ssm.8.control" : 0,
    "continued-2103.ssm.9.candidate" : 0.03994060680270195,
    "continued-2103.ssm.9.control" : 0,
    "continued-2103.value.11.candidate" : 0.0370953232049942,
    "continued-2103.value.11.control" : 0,
    "continued-2103.value.15.candidate" : 0.06274900585412979,
    "continued-2103.value.15.control" : 0.009213147684931755,
    "continued-2103.value.19.candidate" : 0.05994898080825806,
    "continued-2103.value.19.control" : 0.012519929558038712,
    "continued-2103.value.23.candidate" : 0.06744185835123062,
    "continued-2103.value.23.control" : 0.0417151153087616,
    "continued-2103.value.27.candidate" : 0.030048076063394547,
    "continued-2103.value.27.control" : 0.014546001330018044,
    "continued-2103.value.3.candidate" : 0.06161971762776375,
    "continued-2103.value.3.control" : 0,
    "continued-2103.value.31.candidate" : 0.08206521719694138,
    "continued-2103.value.31.control" : 0.072826087474823,
    "continued-2103.value.35.candidate" : 0.0987318828701973,
    "continued-2103.value.35.control" : 0.06159420311450958,
    "continued-2103.value.39.candidate" : 0.7654761672019958,
    "continued-2103.value.39.control" : 0.0494791679084301,
    "continued-2103.value.43.candidate" : 0.342521607875824,
    "continued-2103.value.43.control" : 0.04088050499558449,
    "continued-2103.value.47.candidate" : 0.4268292784690857,
    "continued-2103.value.47.control" : 0.20636433362960815,
    "continued-2103.value.7.candidate" : 0.03293413296341896,
    "continued-2103.value.7.control" : 0,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0.005248091649264097,
    "continued-907.conv.1.control" : 0,
    "continued-907.conv.10.candidate" : 0.027212917804718018,
    "continued-907.conv.10.control" : 0,
    "continued-907.conv.12.candidate" : 0.018368056043982506,
    "continued-907.conv.12.control" : 0,
    "continued-907.conv.13.candidate" : 0.029856478795409203,
    "continued-907.conv.13.control" : 0,
    "continued-907.conv.14.candidate" : 0.0349702388048172,
    "continued-907.conv.14.control" : 0.006613756529986858,
    "continued-907.conv.16.candidate" : 0.03974359109997749,
    "continued-907.conv.16.control" : 0.015064102597534657,
    "continued-907.conv.17.candidate" : 0.0555555559694767,
    "continued-907.conv.17.control" : 0.016782406717538834,
    "continued-907.conv.18.candidate" : 0.03393665328621864,
    "continued-907.conv.18.control" : 0.009049774147570133,
    "continued-907.conv.2.candidate" : 0.030927835032343864,
    "continued-907.conv.2.control" : 0,
    "continued-907.conv.20.candidate" : 0.040816325694322586,
    "continued-907.conv.20.control" : 0.025510204955935478,
    "continued-907.conv.21.candidate" : 0.03212616965174675,
    "continued-907.conv.21.control" : 0.014018691144883633,
    "continued-907.conv.22.candidate" : 0.02500000037252903,
    "continued-907.conv.22.control" : 0.010714286006987095,
    "continued-907.conv.24.candidate" : 0.0357142873108387,
    "continued-907.conv.24.control" : 0.024038461968302727,
    "continued-907.conv.25.candidate" : 0.03462441265583038,
    "continued-907.conv.25.control" : 0.019366197288036346,
    "continued-907.conv.26.candidate" : 0.059241704642772675,
    "continued-907.conv.26.control" : 0.030805686488747597,
    "continued-907.conv.28.candidate" : 0.048828125,
    "continued-907.conv.28.control" : 0.04838709533214569,
    "continued-907.conv.29.candidate" : 0.0833333358168602,
    "continued-907.conv.29.control" : 0.0625,
    "continued-907.conv.30.candidate" : 0.0807291641831398,
    "continued-907.conv.30.control" : 0.0794270858168602,
    "continued-907.conv.32.candidate" : 0.0960022509098053,
    "continued-907.conv.32.control" : 0.08164414763450623,
    "continued-907.conv.33.candidate" : 0.0859375,
    "continued-907.conv.33.control" : 0.0654296875,
    "continued-907.conv.34.candidate" : 0.07172995805740356,
    "continued-907.conv.34.control" : 0.10126582533121109,
    "continued-907.conv.36.candidate" : 0.06862745434045792,
    "continued-907.conv.36.control" : 0.09803921729326248,
    "continued-907.conv.37.candidate" : 0.07411317527294159,
    "continued-907.conv.37.control" : 0.04954954981803894,
    "continued-907.conv.38.candidate" : 0.048621322959661484,
    "continued-907.conv.38.control" : 0.04117647185921669,
    "continued-907.conv.4.candidate" : 0.02388211339712143,
    "continued-907.conv.4.control" : 0,
    "continued-907.conv.40.candidate" : 0.09931506961584091,
    "continued-907.conv.40.control" : 0.07994434982538223,
    "continued-907.conv.41.candidate" : 0.08858267962932587,
    "continued-907.conv.41.control" : 0.06422244012355804,
    "continued-907.conv.42.candidate" : 0.05673758685588837,
    "continued-907.conv.42.control" : 0.060283686965703964,
    "continued-907.conv.44.candidate" : 0.07182320207357407,
    "continued-907.conv.44.control" : 0.11049723625183105,
    "continued-907.conv.45.candidate" : 0.05996621772646904,
    "continued-907.conv.45.control" : 0.051309119910001755,
    "continued-907.conv.46.candidate" : 0.0703125,
    "continued-907.conv.46.control" : 0.061011902987957,
    "continued-907.conv.5.candidate" : 0.05829596519470215,
    "continued-907.conv.5.control" : 0,
    "continued-907.conv.6.candidate" : 0.0211267601698637,
    "continued-907.conv.6.control" : 0,
    "continued-907.conv.8.candidate" : 0.021844660863280296,
    "continued-907.conv.8.control" : 0,
    "continued-907.conv.9.candidate" : 0.02649456448853016,
    "continued-907.conv.9.control" : 0,
    "continued-907.index.11.candidate" : 0.05131172761321068,
    "continued-907.index.11.control" : 0,
    "continued-907.index.15.candidate" : 0.1130618005990982,
    "continued-907.index.15.control" : 0.01755617931485176,
    "continued-907.index.19.candidate" : 0.12007705122232437,
    "continued-907.index.19.control" : 0.027397260069847107,
    "continued-907.index.23.candidate" : 0.05178571492433548,
    "continued-907.index.23.control" : 0.02276785671710968,
    "continued-907.index.27.candidate" : 0.08090965449810028,
    "continued-907.index.27.control" : 0.037128712981939316,
    "continued-907.index.3.candidate" : 0.05917159840464592,
    "continued-907.index.3.control" : 0,
    "continued-907.index.31.candidate" : 0.20020747184753418,
    "continued-907.index.31.control" : 0.19605809450149536,
    "continued-907.index.35.candidate" : 0.18377482891082764,
    "continued-907.index.35.control" : 0.11423841118812561,
    "continued-907.index.39.candidate" : 0.7373417615890503,
    "continued-907.index.39.control" : 0.04628164693713188,
    "continued-907.index.43.candidate" : 0.793749988079071,
    "continued-907.index.43.control" : 0.04707031324505806,
    "continued-907.index.47.candidate" : 0.19208332896232605,
    "continued-907.index.47.control" : 0.10187499970197678,
    "continued-907.index.7.candidate" : 0.05003446713089943,
    "continued-907.index.7.control" : 0,
    "continued-907.key.11.candidate" : 0.1387019157409668,
    "continued-907.key.11.control" : 0,
    "continued-907.key.15.candidate" : 0.16742700338363647,
    "continued-907.key.15.control" : 0.031934306025505066,
    "continued-907.key.19.candidate" : 0.2057291716337204,
    "continued-907.key.19.control" : 0.05613425746560097,
    "continued-907.key.23.candidate" : 0.08520833402872086,
    "continued-907.key.23.control" : 0.06541666388511658,
    "continued-907.key.27.candidate" : 0.1999194473028183,
    "continued-907.key.27.control" : 0.10896381735801697,
    "continued-907.key.3.candidate" : 0.10152284055948257,
    "continued-907.key.3.control" : 0,
    "continued-907.key.31.candidate" : 0.19798657298088074,
    "continued-907.key.31.control" : 0.14901426434516907,
    "continued-907.key.35.candidate" : 0.2344980388879776,
    "continued-907.key.35.control" : 0.16338582336902618,
    "continued-907.key.39.candidate" : 0.8125,
    "continued-907.key.39.control" : 0.08671875298023224,
    "continued-907.key.43.candidate" : 0.666241466999054,
    "continued-907.key.43.control" : 0.07823128998279572,
    "continued-907.key.47.candidate" : 0.2942386865615845,
    "continued-907.key.47.control" : 0.09786522388458252,
    "continued-907.key.7.candidate" : 0.13295455276966095,
    "continued-907.key.7.control" : 0,
    "continued-907.logits.candidate" : 0.13866877555847168,
    "continued-907.logits.control" : 0.11133121699094772,
    "continued-907.ple.1.candidate" : 0.004081632476300001,
    "continued-907.ple.1.control" : 0,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0.004202413838356733,
    "continued-907.ssm.1.control" : 0,
    "continued-907.ssm.10.candidate" : 0.062028173357248306,
    "continued-907.ssm.10.control" : 0,
    "continued-907.ssm.12.candidate" : 0.008271579630672932,
    "continued-907.ssm.12.control" : 0,
    "continued-907.ssm.13.candidate" : 0.03752462565898895,
    "continued-907.ssm.13.control" : 0.0002817342756316066,
    "continued-907.ssm.14.candidate" : 0.02149285562336445,
    "continued-907.ssm.14.control" : 0.0037336547393351793,
    "continued-907.ssm.16.candidate" : 0.0728236585855484,
    "continued-907.ssm.16.control" : 0.00977743323892355,
    "continued-907.ssm.17.candidate" : 0.0556153804063797,
    "continued-907.ssm.17.control" : 0.01111855823546648,
    "continued-907.ssm.18.candidate" : 0.07739315927028656,
    "continued-907.ssm.18.control" : 0.014318006113171577,
    "continued-907.ssm.2.candidate" : 0.012854773551225662,
    "continued-907.ssm.2.control" : 0,
    "continued-907.ssm.20.candidate" : 0.05334543064236641,
    "continued-907.ssm.20.control" : 0.011634263209998608,
    "continued-907.ssm.21.candidate" : 0.02122417464852333,
    "continued-907.ssm.21.control" : 0.012398164719343185,
    "continued-907.ssm.22.candidate" : 0.01784783974289894,
    "continued-907.ssm.22.control" : 0.005773540586233139,
    "continued-907.ssm.24.candidate" : 0.04115943983197212,
    "continued-907.ssm.24.control" : 0.018454771488904953,
    "continued-907.ssm.25.candidate" : 0.10074128210544586,
    "continued-907.ssm.25.control" : 0.033577900379896164,
    "continued-907.ssm.26.candidate" : 0.14826016128063202,
    "continued-907.ssm.26.control" : 0.06735121458768845,
    "continued-907.ssm.28.candidate" : 0.017666300758719444,
    "continued-907.ssm.28.control" : 0.0040559470653533936,
    "continued-907.ssm.29.candidate" : 0.051151592284440994,
    "continued-907.ssm.29.control" : 0.05295253545045853,
    "continued-907.ssm.30.candidate" : 0.0703592598438263,
    "continued-907.ssm.30.control" : 0.0886233001947403,
    "continued-907.ssm.32.candidate" : 0.12615032494068146,
    "continued-907.ssm.32.control" : 0.10987891256809235,
    "continued-907.ssm.33.candidate" : 0.10244809836149216,
    "continued-907.ssm.33.control" : 0.08728557825088501,
    "continued-907.ssm.34.candidate" : 0.10565444082021713,
    "continued-907.ssm.34.control" : 0.08165968954563141,
    "continued-907.ssm.36.candidate" : 0.172865092754364,
    "continued-907.ssm.36.control" : 0.0977427288889885,
    "continued-907.ssm.37.candidate" : 0.035670310258865356,
    "continued-907.ssm.37.control" : 0.056762851774692535,
    "continued-907.ssm.38.candidate" : 0.05294926092028618,
    "continued-907.ssm.38.control" : 0.016137052327394485,
    "continued-907.ssm.4.candidate" : 0.02681475318968296,
    "continued-907.ssm.4.control" : 0,
    "continued-907.ssm.40.candidate" : 0.04456901177763939,
    "continued-907.ssm.40.control" : 0.014509430155158043,
    "continued-907.ssm.41.candidate" : 0.0522015318274498,
    "continued-907.ssm.41.control" : 0.01707575097680092,
    "continued-907.ssm.42.candidate" : 0.06030741706490517,
    "continued-907.ssm.42.control" : 0.03383483365178108,
    "continued-907.ssm.44.candidate" : 0.07591438293457031,
    "continued-907.ssm.44.control" : 0.013975723646581173,
    "continued-907.ssm.45.candidate" : 0.1643075942993164,
    "continued-907.ssm.45.control" : 0.0766148567199707,
    "continued-907.ssm.46.candidate" : 0.19151948392391205,
    "continued-907.ssm.46.control" : 0.1926262527704239,
    "continued-907.ssm.5.candidate" : 0.03139709308743477,
    "continued-907.ssm.5.control" : 0,
    "continued-907.ssm.6.candidate" : 0.024968944489955902,
    "continued-907.ssm.6.control" : 0,
    "continued-907.ssm.8.candidate" : 0.02650604397058487,
    "continued-907.ssm.8.control" : 0,
    "continued-907.ssm.9.candidate" : 0.043156467378139496,
    "continued-907.ssm.9.control" : 0,
    "continued-907.value.11.candidate" : 0.0370953232049942,
    "continued-907.value.11.control" : 0,
    "continued-907.value.15.candidate" : 0.06274900585412979,
    "continued-907.value.15.control" : 0.009213147684931755,
    "continued-907.value.19.candidate" : 0.05994898080825806,
    "continued-907.value.19.control" : 0.012519929558038712,
    "continued-907.value.23.candidate" : 0.06744185835123062,
    "continued-907.value.23.control" : 0.0417151153087616,
    "continued-907.value.27.candidate" : 0.030048076063394547,
    "continued-907.value.27.control" : 0.014546001330018044,
    "continued-907.value.3.candidate" : 0.06161971762776375,
    "continued-907.value.3.control" : 0,
    "continued-907.value.31.candidate" : 0.08206521719694138,
    "continued-907.value.31.control" : 0.072826087474823,
    "continued-907.value.35.candidate" : 0.0987318828701973,
    "continued-907.value.35.control" : 0.06159420311450958,
    "continued-907.value.39.candidate" : 0.7654761672019958,
    "continued-907.value.39.control" : 0.0494791679084301,
    "continued-907.value.43.candidate" : 0.342521607875824,
    "continued-907.value.43.control" : 0.04088050499558449,
    "continued-907.value.47.candidate" : 0.4268292784690857,
    "continued-907.value.47.control" : 0.20636433362960815,
    "continued-907.value.7.candidate" : 0.03293413296341896,
    "continued-907.value.7.control" : 0,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0.004946043249219656,
    "prefill.conv.1.control" : 0,
    "prefill.conv.10.candidate" : 0.0396232046186924,
    "prefill.conv.10.control" : 0,
    "prefill.conv.12.candidate" : 0.031111111864447594,
    "prefill.conv.12.control" : 0,
    "prefill.conv.13.candidate" : 0.04783519729971886,
    "prefill.conv.13.control" : 0,
    "prefill.conv.14.candidate" : 0.032236840575933456,
    "prefill.conv.14.control" : 0.007894736714661121,
    "prefill.conv.16.candidate" : 0.04222756251692772,
    "prefill.conv.16.control" : 0.02580128237605095,
    "prefill.conv.17.candidate" : 0.0555555559694767,
    "prefill.conv.17.control" : 0.017433449625968933,
    "prefill.conv.18.candidate" : 0.03846153989434242,
    "prefill.conv.18.control" : 0.020644797012209892,
    "prefill.conv.2.candidate" : 0.010465116240084171,
    "prefill.conv.2.control" : 0,
    "prefill.conv.20.candidate" : 0.040816325694322586,
    "prefill.conv.20.control" : 0.025510204955935478,
    "prefill.conv.21.candidate" : 0.031707316637039185,
    "prefill.conv.21.control" : 0.024390242993831635,
    "prefill.conv.22.candidate" : 0.01986607164144516,
    "prefill.conv.22.control" : 0.010714286006987095,
    "prefill.conv.24.candidate" : 0.051861703395843506,
    "prefill.conv.24.control" : 0.037602849304676056,
    "prefill.conv.25.candidate" : 0.0422535203397274,
    "prefill.conv.25.control" : 0.030516432598233223,
    "prefill.conv.26.candidate" : 0.055687204003334045,
    "prefill.conv.26.control" : 0.042061612010002136,
    "prefill.conv.28.candidate" : 0.04536290466785431,
    "prefill.conv.28.control" : 0.04838709533214569,
    "prefill.conv.29.candidate" : 0.0607638880610466,
    "prefill.conv.29.control" : 0.0625,
    "prefill.conv.30.candidate" : 0.0803108811378479,
    "prefill.conv.30.control" : 0.07901554554700851,
    "prefill.conv.32.candidate" : 0.09959112107753754,
    "prefill.conv.32.control" : 0.0849883183836937,
    "prefill.conv.33.candidate" : 0.08627451211214066,
    "prefill.conv.33.control" : 0.08235294371843338,
    "prefill.conv.34.candidate" : 0.07172995805740356,
    "prefill.conv.34.control" : 0.10126582533121109,
    "prefill.conv.36.candidate" : 0.06862745434045792,
    "prefill.conv.36.control" : 0.0784313753247261,
    "prefill.conv.37.candidate" : 0.05686936900019646,
    "prefill.conv.37.control" : 0.04954954981803894,
    "prefill.conv.38.candidate" : 0.048621322959661484,
    "prefill.conv.38.control" : 0.04117647185921669,
    "prefill.conv.4.candidate" : 0.0348360650241375,
    "prefill.conv.4.control" : 0,
    "prefill.conv.40.candidate" : 0.062392979860305786,
    "prefill.conv.40.control" : 0.07994434982538223,
    "prefill.conv.41.candidate" : 0.08858267962932587,
    "prefill.conv.41.control" : 0.06422244012355804,
    "prefill.conv.42.candidate" : 0.04975620657205582,
    "prefill.conv.42.control" : 0.05673758685588837,
    "prefill.conv.44.candidate" : 0.06842105090618134,
    "prefill.conv.44.control" : 0.10526315867900848,
    "prefill.conv.45.candidate" : 0.04927007481455803,
    "prefill.conv.45.control" : 0.043795619159936905,
    "prefill.conv.46.candidate" : 0.06520061939954758,
    "prefill.conv.46.control" : 0.06018518656492233,
    "prefill.conv.5.candidate" : 0.0502283088862896,
    "prefill.conv.5.control" : 0,
    "prefill.conv.6.candidate" : 0.03392857313156128,
    "prefill.conv.6.control" : 0,
    "prefill.conv.8.candidate" : 0.04147274047136307,
    "prefill.conv.8.control" : 0,
    "prefill.conv.9.candidate" : 0.039402175694704056,
    "prefill.conv.9.control" : 0,
    "prefill.index.11.candidate" : 0.05131172761321068,
    "prefill.index.11.control" : 0,
    "prefill.index.15.candidate" : 0.1130618005990982,
    "prefill.index.15.control" : 0.01755617931485176,
    "prefill.index.19.candidate" : 0.12007705122232437,
    "prefill.index.19.control" : 0.027397260069847107,
    "prefill.index.23.candidate" : 0.05178571492433548,
    "prefill.index.23.control" : 0.02276785671710968,
    "prefill.index.27.candidate" : 0.08090965449810028,
    "prefill.index.27.control" : 0.037128712981939316,
    "prefill.index.3.candidate" : 0.05917159840464592,
    "prefill.index.3.control" : 0,
    "prefill.index.31.candidate" : 0.20020747184753418,
    "prefill.index.31.control" : 0.19605809450149536,
    "prefill.index.35.candidate" : 0.18377482891082764,
    "prefill.index.35.control" : 0.11423841118812561,
    "prefill.index.39.candidate" : 0.7373417615890503,
    "prefill.index.39.control" : 0.04628164693713188,
    "prefill.index.43.candidate" : 0.793749988079071,
    "prefill.index.43.control" : 0.04707031324505806,
    "prefill.index.47.candidate" : 0.19208332896232605,
    "prefill.index.47.control" : 0.10187499970197678,
    "prefill.index.7.candidate" : 0.05003446713089943,
    "prefill.index.7.control" : 0,
    "prefill.key.11.candidate" : 0.1387019157409668,
    "prefill.key.11.control" : 0,
    "prefill.key.15.candidate" : 0.16742700338363647,
    "prefill.key.15.control" : 0.031934306025505066,
    "prefill.key.19.candidate" : 0.2057291716337204,
    "prefill.key.19.control" : 0.05613425746560097,
    "prefill.key.23.candidate" : 0.08520833402872086,
    "prefill.key.23.control" : 0.06541666388511658,
    "prefill.key.27.candidate" : 0.1999194473028183,
    "prefill.key.27.control" : 0.10896381735801697,
    "prefill.key.3.candidate" : 0.10152284055948257,
    "prefill.key.3.control" : 0,
    "prefill.key.31.candidate" : 0.19798657298088074,
    "prefill.key.31.control" : 0.14901426434516907,
    "prefill.key.35.candidate" : 0.2344980388879776,
    "prefill.key.35.control" : 0.16338582336902618,
    "prefill.key.39.candidate" : 0.8125,
    "prefill.key.39.control" : 0.08671875298023224,
    "prefill.key.43.candidate" : 0.666241466999054,
    "prefill.key.43.control" : 0.07823128998279572,
    "prefill.key.47.candidate" : 0.2942386865615845,
    "prefill.key.47.control" : 0.09786522388458252,
    "prefill.key.7.candidate" : 0.13295455276966095,
    "prefill.key.7.control" : 0,
    "prefill.logits.candidate" : 0.07332402467727661,
    "prefill.logits.control" : 0.06354748457670212,
    "prefill.ple.1.candidate" : 0.004081632476300001,
    "prefill.ple.1.control" : 0,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0.003826902713626623,
    "prefill.ssm.1.control" : 0,
    "prefill.ssm.10.candidate" : 0.05798250064253807,
    "prefill.ssm.10.control" : 0,
    "prefill.ssm.12.candidate" : 0.003914250992238522,
    "prefill.ssm.12.control" : 0,
    "prefill.ssm.13.candidate" : 0.027360446751117706,
    "prefill.ssm.13.control" : 0.0002766742545645684,
    "prefill.ssm.14.candidate" : 0.021123632788658142,
    "prefill.ssm.14.control" : 0.0031120148487389088,
    "prefill.ssm.16.candidate" : 0.06627213954925537,
    "prefill.ssm.16.control" : 0.01928410865366459,
    "prefill.ssm.17.candidate" : 0.0742761567234993,
    "prefill.ssm.17.control" : 0.015351982787251472,
    "prefill.ssm.18.candidate" : 0.08008868247270584,
    "prefill.ssm.18.control" : 0.01835530996322632,
    "prefill.ssm.2.candidate" : 0.012507475912570953,
    "prefill.ssm.2.control" : 0,
    "prefill.ssm.20.candidate" : 0.03125230595469475,
    "prefill.ssm.20.control" : 0.010046429932117462,
    "prefill.ssm.21.candidate" : 0.02231304720044136,
    "prefill.ssm.21.control" : 0.010658453218638897,
    "prefill.ssm.22.candidate" : 0.017835993319749832,
    "prefill.ssm.22.control" : 0.005643798969686031,
    "prefill.ssm.24.candidate" : 0.039023224264383316,
    "prefill.ssm.24.control" : 0.02616826258599758,
    "prefill.ssm.25.candidate" : 0.06653700023889542,
    "prefill.ssm.25.control" : 0.05810854583978653,
    "prefill.ssm.26.candidate" : 0.0612693727016449,
    "prefill.ssm.26.control" : 0.034994207322597504,
    "prefill.ssm.28.candidate" : 0.017628243193030357,
    "prefill.ssm.28.control" : 0.004434869159013033,
    "prefill.ssm.29.candidate" : 0.07302200794219971,
    "prefill.ssm.29.control" : 0.057749681174755096,
    "prefill.ssm.30.candidate" : 0.03887692838907242,
    "prefill.ssm.30.control" : 0.03673890605568886,
    "prefill.ssm.32.candidate" : 0.07192522287368774,
    "prefill.ssm.32.control" : 0.15956521034240723,
    "prefill.ssm.33.candidate" : 0.16047346591949463,
    "prefill.ssm.33.control" : 0.13404248654842377,
    "prefill.ssm.34.candidate" : 0.12718750536441803,
    "prefill.ssm.34.control" : 0.09960776567459106,
    "prefill.ssm.36.candidate" : 0.06579519063234329,
    "prefill.ssm.36.control" : 0.07311578094959259,
    "prefill.ssm.37.candidate" : 0.0847870334982872,
    "prefill.ssm.37.control" : 0.1196533739566803,
    "prefill.ssm.38.candidate" : 0.052553076297044754,
    "prefill.ssm.38.control" : 0.022961735725402832,
    "prefill.ssm.4.candidate" : 0.028239380568265915,
    "prefill.ssm.4.control" : 0,
    "prefill.ssm.40.candidate" : 0.0448235459625721,
    "prefill.ssm.40.control" : 0.014941614121198654,
    "prefill.ssm.41.candidate" : 0.05210942029953003,
    "prefill.ssm.41.control" : 0.01651778258383274,
    "prefill.ssm.42.candidate" : 0.05985141173005104,
    "prefill.ssm.42.control" : 0.041674401611089706,
    "prefill.ssm.44.candidate" : 0.07597244530916214,
    "prefill.ssm.44.control" : 0.014857178553938866,
    "prefill.ssm.45.candidate" : 0.16851021349430084,
    "prefill.ssm.45.control" : 0.09404612332582474,
    "prefill.ssm.46.candidate" : 0.23136553168296814,
    "prefill.ssm.46.control" : 0.17168006300926208,
    "prefill.ssm.5.candidate" : 0.022573255002498627,
    "prefill.ssm.5.control" : 0,
    "prefill.ssm.6.candidate" : 0.025225061923265457,
    "prefill.ssm.6.control" : 0,
    "prefill.ssm.8.candidate" : 0.02375136688351631,
    "prefill.ssm.8.control" : 0,
    "prefill.ssm.9.candidate" : 0.03712891787290573,
    "prefill.ssm.9.control" : 0,
    "prefill.value.11.candidate" : 0.0370953232049942,
    "prefill.value.11.control" : 0,
    "prefill.value.15.candidate" : 0.06274900585412979,
    "prefill.value.15.control" : 0.009213147684931755,
    "prefill.value.19.candidate" : 0.05994898080825806,
    "prefill.value.19.control" : 0.012519929558038712,
    "prefill.value.23.candidate" : 0.06744185835123062,
    "prefill.value.23.control" : 0.0417151153087616,
    "prefill.value.27.candidate" : 0.030048076063394547,
    "prefill.value.27.control" : 0.014546001330018044,
    "prefill.value.3.candidate" : 0.06161971762776375,
    "prefill.value.3.control" : 0,
    "prefill.value.31.candidate" : 0.08206521719694138,
    "prefill.value.31.control" : 0.072826087474823,
    "prefill.value.35.candidate" : 0.0987318828701973,
    "prefill.value.35.control" : 0.06159420311450958,
    "prefill.value.39.candidate" : 0.7654761672019958,
    "prefill.value.39.control" : 0.0494791679084301,
    "prefill.value.43.candidate" : 0.342521607875824,
    "prefill.value.43.control" : 0.04088050499558449,
    "prefill.value.47.candidate" : 0.4268292784690857,
    "prefill.value.47.control" : 0.20636433362960815,
    "prefill.value.7.candidate" : 0.03293413296341896,
    "prefill.value.7.control" : 0,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0.0037878789007663727,
    "rollback-1.conv.1.control" : 0,
    "rollback-1.conv.10.candidate" : 0.023218458518385887,
    "rollback-1.conv.10.control" : 0,
    "rollback-1.conv.12.candidate" : 0.018888888880610466,
    "rollback-1.conv.12.control" : 0,
    "rollback-1.conv.13.candidate" : 0.032103825360536575,
    "rollback-1.conv.13.control" : 0,
    "rollback-1.conv.14.candidate" : 0.03125,
    "rollback-1.conv.14.control" : 0.0052083334885537624,
    "rollback-1.conv.16.candidate" : 0.03204719349741936,
    "rollback-1.conv.16.control" : 0.013392857275903225,
    "rollback-1.conv.17.candidate" : 0.036082472652196884,
    "rollback-1.conv.17.control" : 0.01663176529109478,
    "rollback-1.conv.18.candidate" : 0.028513824567198753,
    "rollback-1.conv.18.control" : 0.01569700427353382,
    "rollback-1.conv.2.candidate" : 0.008640552870929241,
    "rollback-1.conv.2.control" : 0,
    "rollback-1.conv.20.candidate" : 0.033919598907232285,
    "rollback-1.conv.20.control" : 0.02010050229728222,
    "rollback-1.conv.21.candidate" : 0.04047619178891182,
    "rollback-1.conv.21.control" : 0.013988095335662365,
    "rollback-1.conv.22.candidate" : 0.02464788779616356,
    "rollback-1.conv.22.control" : 0.011003521271049976,
    "rollback-1.conv.24.candidate" : 0.032608695328235626,
    "rollback-1.conv.24.control" : 0.02038043551146984,
    "rollback-1.conv.25.candidate" : 0.05450236797332764,
    "rollback-1.conv.25.control" : 0.02769549749791622,
    "rollback-1.conv.26.candidate" : 0.04811947047710419,
    "rollback-1.conv.26.control" : 0.04203539714217186,
    "rollback-1.conv.28.candidate" : 0.053460743278265,
    "rollback-1.conv.28.control" : 0.048553720116615295,
    "rollback-1.conv.29.candidate" : 0.0794270858168602,
    "rollback-1.conv.29.control" : 0.0520833320915699,
    "rollback-1.conv.30.candidate" : 0.10180412232875824,
    "rollback-1.conv.30.control" : 0.05541237071156502,
    "rollback-1.conv.32.candidate" : 0.08771929889917374,
    "rollback-1.conv.32.control" : 0.07456140220165253,
    "rollback-1.conv.33.candidate" : 0.13438735902309418,
    "rollback-1.conv.33.control" : 0.05978260934352875,
    "rollback-1.conv.34.candidate" : 0.11684484779834747,
    "rollback-1.conv.34.control" : 0.06195175275206566,
    "rollback-1.conv.36.candidate" : 0.12254464626312256,
    "rollback-1.conv.36.control" : 0.0833333358168602,
    "rollback-1.conv.37.candidate" : 0.08541666716337204,
    "rollback-1.conv.37.control" : 0.05714285746216774,
    "rollback-1.conv.38.candidate" : 0.07605421543121338,
    "rollback-1.conv.38.control" : 0.05120481923222542,
    "rollback-1.conv.4.candidate" : 0.01969004049897194,
    "rollback-1.conv.4.control" : 0,
    "rollback-1.conv.40.candidate" : 0.13636364042758942,
    "rollback-1.conv.40.control" : 0.09134615212678909,
    "rollback-1.conv.41.candidate" : 0.10483870655298233,
    "rollback-1.conv.41.control" : 0.0698084682226181,
    "rollback-1.conv.42.candidate" : 0.08416666835546494,
    "rollback-1.conv.42.control" : 0.07140625268220901,
    "rollback-1.conv.44.candidate" : 0.13596491515636444,
    "rollback-1.conv.44.control" : 0.0659722238779068,
    "rollback-1.conv.45.candidate" : 0.09863945841789246,
    "rollback-1.conv.45.control" : 0.07525510340929031,
    "rollback-1.conv.46.candidate" : 0.08220108598470688,
    "rollback-1.conv.46.control" : 0.07676630467176437,
    "rollback-1.conv.5.candidate" : 0.05106382817029953,
    "rollback-1.conv.5.control" : 0,
    "rollback-1.conv.6.candidate" : 0.02669902890920639,
    "rollback-1.conv.6.control" : 0,
    "rollback-1.conv.8.candidate" : 0.022058824077248573,
    "rollback-1.conv.8.control" : 0,
    "rollback-1.conv.9.candidate" : 0.022972973063588142,
    "rollback-1.conv.9.control" : 0,
    "rollback-1.index.11.candidate" : 0.05131172761321068,
    "rollback-1.index.11.control" : 0,
    "rollback-1.index.15.candidate" : 0.1130618005990982,
    "rollback-1.index.15.control" : 0.01755617931485176,
    "rollback-1.index.19.candidate" : 0.12007705122232437,
    "rollback-1.index.19.control" : 0.027397260069847107,
    "rollback-1.index.23.candidate" : 0.05178571492433548,
    "rollback-1.index.23.control" : 0.02276785671710968,
    "rollback-1.index.27.candidate" : 0.08090965449810028,
    "rollback-1.index.27.control" : 0.037128712981939316,
    "rollback-1.index.3.candidate" : 0.05917159840464592,
    "rollback-1.index.3.control" : 0,
    "rollback-1.index.31.candidate" : 0.20020747184753418,
    "rollback-1.index.31.control" : 0.19605809450149536,
    "rollback-1.index.35.candidate" : 0.18377482891082764,
    "rollback-1.index.35.control" : 0.11423841118812561,
    "rollback-1.index.39.candidate" : 0.7373417615890503,
    "rollback-1.index.39.control" : 0.04628164693713188,
    "rollback-1.index.43.candidate" : 0.793749988079071,
    "rollback-1.index.43.control" : 0.04707031324505806,
    "rollback-1.index.47.candidate" : 0.19208332896232605,
    "rollback-1.index.47.control" : 0.10187499970197678,
    "rollback-1.index.7.candidate" : 0.05003446713089943,
    "rollback-1.index.7.control" : 0,
    "rollback-1.key.11.candidate" : 0.1387019157409668,
    "rollback-1.key.11.control" : 0,
    "rollback-1.key.15.candidate" : 0.16742700338363647,
    "rollback-1.key.15.control" : 0.031934306025505066,
    "rollback-1.key.19.candidate" : 0.2057291716337204,
    "rollback-1.key.19.control" : 0.05613425746560097,
    "rollback-1.key.23.candidate" : 0.08520833402872086,
    "rollback-1.key.23.control" : 0.06541666388511658,
    "rollback-1.key.27.candidate" : 0.1999194473028183,
    "rollback-1.key.27.control" : 0.10896381735801697,
    "rollback-1.key.3.candidate" : 0.10152284055948257,
    "rollback-1.key.3.control" : 0,
    "rollback-1.key.31.candidate" : 0.19798657298088074,
    "rollback-1.key.31.control" : 0.14901426434516907,
    "rollback-1.key.35.candidate" : 0.2344980388879776,
    "rollback-1.key.35.control" : 0.16338582336902618,
    "rollback-1.key.39.candidate" : 0.8125,
    "rollback-1.key.39.control" : 0.08671875298023224,
    "rollback-1.key.43.candidate" : 0.666241466999054,
    "rollback-1.key.43.control" : 0.08843537420034409,
    "rollback-1.key.47.candidate" : 0.2942386865615845,
    "rollback-1.key.47.control" : 0.09786522388458252,
    "rollback-1.key.7.candidate" : 0.13295455276966095,
    "rollback-1.key.7.control" : 0,
    "rollback-1.logits.candidate" : 0.14446529746055603,
    "rollback-1.logits.control" : 0.12570355832576752,
    "rollback-1.ple.1.candidate" : 0.0010204081190750003,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0.003593211527913809,
    "rollback-1.ssm.1.control" : 0,
    "rollback-1.ssm.10.candidate" : 0.06553805619478226,
    "rollback-1.ssm.10.control" : 0,
    "rollback-1.ssm.12.candidate" : 0.0066534290090203285,
    "rollback-1.ssm.12.control" : 0,
    "rollback-1.ssm.13.candidate" : 0.02608552575111389,
    "rollback-1.ssm.13.control" : 0.0002743733348324895,
    "rollback-1.ssm.14.candidate" : 0.033239200711250305,
    "rollback-1.ssm.14.control" : 0.002468931255862117,
    "rollback-1.ssm.16.candidate" : 0.05904323235154152,
    "rollback-1.ssm.16.control" : 0.013193454593420029,
    "rollback-1.ssm.17.candidate" : 0.03465529903769493,
    "rollback-1.ssm.17.control" : 0.013512276113033295,
    "rollback-1.ssm.18.candidate" : 0.05416015163064003,
    "rollback-1.ssm.18.control" : 0.019590312615036964,
    "rollback-1.ssm.2.candidate" : 0.012205337174236774,
    "rollback-1.ssm.2.control" : 0,
    "rollback-1.ssm.20.candidate" : 0.027714187279343605,
    "rollback-1.ssm.20.control" : 0.009005283936858177,
    "rollback-1.ssm.21.candidate" : 0.019518660381436348,
    "rollback-1.ssm.21.control" : 0.011700308881700039,
    "rollback-1.ssm.22.candidate" : 0.01778852380812168,
    "rollback-1.ssm.22.control" : 0.004206422250717878,
    "rollback-1.ssm.24.candidate" : 0.03772624582052231,
    "rollback-1.ssm.24.control" : 0.017506999894976616,
    "rollback-1.ssm.25.candidate" : 0.08072198927402496,
    "rollback-1.ssm.25.control" : 0.06453016400337219,
    "rollback-1.ssm.26.candidate" : 0.09207778424024582,
    "rollback-1.ssm.26.control" : 0.07511690258979797,
    "rollback-1.ssm.28.candidate" : 0.01755533181130886,
    "rollback-1.ssm.28.control" : 0.003858801908791065,
    "rollback-1.ssm.29.candidate" : 0.07203832268714905,
    "rollback-1.ssm.29.control" : 0.04648992046713829,
    "rollback-1.ssm.30.candidate" : 0.055640846490859985,
    "rollback-1.ssm.30.control" : 0.051631566137075424,
    "rollback-1.ssm.32.candidate" : 0.13157206773757935,
    "rollback-1.ssm.32.control" : 0.08469836413860321,
    "rollback-1.ssm.33.candidate" : 0.22815360128879547,
    "rollback-1.ssm.33.control" : 0.163725346326828,
    "rollback-1.ssm.34.candidate" : 0.14948996901512146,
    "rollback-1.ssm.34.control" : 0.12615029513835907,
    "rollback-1.ssm.36.candidate" : 0.07312452793121338,
    "rollback-1.ssm.36.control" : 0.05243952199816704,
    "rollback-1.ssm.37.candidate" : 0.058172136545181274,
    "rollback-1.ssm.37.control" : 0.03943127393722534,
    "rollback-1.ssm.38.candidate" : 0.05131428316235542,
    "rollback-1.ssm.38.control" : 0.015095353126525879,
    "rollback-1.ssm.4.candidate" : 0.02805185876786709,
    "rollback-1.ssm.4.control" : 0,
    "rollback-1.ssm.40.candidate" : 0.04355742782354355,
    "rollback-1.ssm.40.control" : 0.01798965595662594,
    "rollback-1.ssm.41.candidate" : 0.05301055312156677,
    "rollback-1.ssm.41.control" : 0.022502552717924118,
    "rollback-1.ssm.42.candidate" : 0.09734984487295151,
    "rollback-1.ssm.42.control" : 0.0503694973886013,
    "rollback-1.ssm.44.candidate" : 0.07600901275873184,
    "rollback-1.ssm.44.control" : 0.015842685475945473,
    "rollback-1.ssm.45.candidate" : 0.22685714066028595,
    "rollback-1.ssm.45.control" : 0.12245684117078781,
    "rollback-1.ssm.46.candidate" : 0.1587250679731369,
    "rollback-1.ssm.46.control" : 0.128029465675354,
    "rollback-1.ssm.5.candidate" : 0.02973019704222679,
    "rollback-1.ssm.5.control" : 0,
    "rollback-1.ssm.6.candidate" : 0.025018850341439247,
    "rollback-1.ssm.6.control" : 0,
    "rollback-1.ssm.8.candidate" : 0.023790376260876656,
    "rollback-1.ssm.8.control" : 0,
    "rollback-1.ssm.9.candidate" : 0.044466543942689896,
    "rollback-1.ssm.9.control" : 0,
    "rollback-1.value.11.candidate" : 0.0370953232049942,
    "rollback-1.value.11.control" : 0,
    "rollback-1.value.15.candidate" : 0.06274900585412979,
    "rollback-1.value.15.control" : 0.009213147684931755,
    "rollback-1.value.19.candidate" : 0.05994898080825806,
    "rollback-1.value.19.control" : 0.012519929558038712,
    "rollback-1.value.23.candidate" : 0.06744185835123062,
    "rollback-1.value.23.control" : 0.0417151153087616,
    "rollback-1.value.27.candidate" : 0.030048076063394547,
    "rollback-1.value.27.control" : 0.014546001330018044,
    "rollback-1.value.3.candidate" : 0.06161971762776375,
    "rollback-1.value.3.control" : 0,
    "rollback-1.value.31.candidate" : 0.08206521719694138,
    "rollback-1.value.31.control" : 0.072826087474823,
    "rollback-1.value.35.candidate" : 0.0987318828701973,
    "rollback-1.value.35.control" : 0.06159420311450958,
    "rollback-1.value.39.candidate" : 0.7654761672019958,
    "rollback-1.value.39.control" : 0.0494791679084301,
    "rollback-1.value.43.candidate" : 0.342521607875824,
    "rollback-1.value.43.control" : 0.04088050499558449,
    "rollback-1.value.47.candidate" : 0.4268292784690857,
    "rollback-1.value.47.control" : 0.20636433362960815,
    "rollback-1.value.7.candidate" : 0.03293413296341896,
    "rollback-1.value.7.control" : 0,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0.003816793905571103,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0.028595266863703728,
    "rollback-2.conv.10.control" : 0,
    "rollback-2.conv.12.candidate" : 0.027840908616781235,
    "rollback-2.conv.12.control" : 0,
    "rollback-2.conv.13.candidate" : 0.040462426841259,
    "rollback-2.conv.13.control" : 0,
    "rollback-2.conv.14.candidate" : 0.04082532227039337,
    "rollback-2.conv.14.control" : 0.010256410576403141,
    "rollback-2.conv.16.candidate" : 0.04130569472908974,
    "rollback-2.conv.16.control" : 0.012995049357414246,
    "rollback-2.conv.17.candidate" : 0.03418975695967674,
    "rollback-2.conv.17.control" : 0.01663176529109478,
    "rollback-2.conv.18.candidate" : 0.024828767403960228,
    "rollback-2.conv.18.control" : 0.01198630128055811,
    "rollback-2.conv.2.candidate" : 0.010869565419852734,
    "rollback-2.conv.2.control" : 0,
    "rollback-2.conv.20.candidate" : 0.03482586890459061,
    "rollback-2.conv.20.control" : 0.019900497049093246,
    "rollback-2.conv.21.candidate" : 0.03095238097012043,
    "rollback-2.conv.21.control" : 0.01904761977493763,
    "rollback-2.conv.22.candidate" : 0.01906028389930725,
    "rollback-2.conv.22.control" : 0.009807180613279343,
    "rollback-2.conv.24.candidate" : 0.025930851697921753,
    "rollback-2.conv.24.control" : 0.019946807995438576,
    "rollback-2.conv.25.candidate" : 0.05450236797332764,
    "rollback-2.conv.25.control" : 0.02769549749791622,
    "rollback-2.conv.26.candidate" : 0.036556605249643326,
    "rollback-2.conv.26.control" : 0.017688678577542305,
    "rollback-2.conv.28.candidate" : 0.05154382437467575,
    "rollback-2.conv.28.control" : 0.03959163278341293,
    "rollback-2.conv.29.candidate" : 0.08111701905727386,
    "rollback-2.conv.29.control" : 0.05319149047136307,
    "rollback-2.conv.30.candidate" : 0.10076530277729034,
    "rollback-2.conv.30.control" : 0.05484693869948387,
    "rollback-2.conv.32.candidate" : 0.09569378197193146,
    "rollback-2.conv.32.control" : 0.08133970946073532,
    "rollback-2.conv.33.candidate" : 0.13438735902309418,
    "rollback-2.conv.33.control" : 0.05978260934352875,
    "rollback-2.conv.34.candidate" : 0.11633460968732834,
    "rollback-2.conv.34.control" : 0.0589519664645195,
    "rollback-2.conv.36.candidate" : 0.15243902802467346,
    "rollback-2.conv.36.control" : 0.1024390235543251,
    "rollback-2.conv.37.candidate" : 0.0683760717511177,
    "rollback-2.conv.37.control" : 0.048277243971824646,
    "rollback-2.conv.38.candidate" : 0.057575758546590805,
    "rollback-2.conv.38.control" : 0.04308712109923363,
    "rollback-2.conv.4.candidate" : 0.017022358253598213,
    "rollback-2.conv.4.control" : 0,
    "rollback-2.conv.40.candidate" : 0.1049107164144516,
    "rollback-2.conv.40.control" : 0.0535714291036129,
    "rollback-2.conv.41.candidate" : 0.07307692617177963,
    "rollback-2.conv.41.control" : 0.057692307978868484,
    "rollback-2.conv.42.candidate" : 0.08473154157400131,
    "rollback-2.conv.42.control" : 0.04739932715892792,
    "rollback-2.conv.44.candidate" : 0.18595679104328156,
    "rollback-2.conv.44.control" : 0.1358024626970291,
    "rollback-2.conv.45.candidate" : 0.08588435500860214,
    "rollback-2.conv.45.control" : 0.06568877398967743,
    "rollback-2.conv.46.candidate" : 0.06822644174098969,
    "rollback-2.conv.46.control" : 0.054973822087049484,
    "rollback-2.conv.5.candidate" : 0.02099236659705639,
    "rollback-2.conv.5.control" : 0,
    "rollback-2.conv.6.candidate" : 0.026570048183202744,
    "rollback-2.conv.6.control" : 0,
    "rollback-2.conv.8.candidate" : 0.022946860641241074,
    "rollback-2.conv.8.control" : 0,
    "rollback-2.conv.9.candidate" : 0.024861877784132957,
    "rollback-2.conv.9.control" : 0,
    "rollback-2.index.11.candidate" : 0.05131172761321068,
    "rollback-2.index.11.control" : 0,
    "rollback-2.index.15.candidate" : 0.1130618005990982,
    "rollback-2.index.15.control" : 0.01755617931485176,
    "rollback-2.index.19.candidate" : 0.12007705122232437,
    "rollback-2.index.19.control" : 0.027397260069847107,
    "rollback-2.index.23.candidate" : 0.05178571492433548,
    "rollback-2.index.23.control" : 0.02276785671710968,
    "rollback-2.index.27.candidate" : 0.08090965449810028,
    "rollback-2.index.27.control" : 0.037128712981939316,
    "rollback-2.index.3.candidate" : 0.05917159840464592,
    "rollback-2.index.3.control" : 0,
    "rollback-2.index.31.candidate" : 0.20020747184753418,
    "rollback-2.index.31.control" : 0.19605809450149536,
    "rollback-2.index.35.candidate" : 0.18377482891082764,
    "rollback-2.index.35.control" : 0.11423841118812561,
    "rollback-2.index.39.candidate" : 0.7373417615890503,
    "rollback-2.index.39.control" : 0.04628164693713188,
    "rollback-2.index.43.candidate" : 0.793749988079071,
    "rollback-2.index.43.control" : 0.04707031324505806,
    "rollback-2.index.47.candidate" : 0.19208332896232605,
    "rollback-2.index.47.control" : 0.10187499970197678,
    "rollback-2.index.7.candidate" : 0.05003446713089943,
    "rollback-2.index.7.control" : 0,
    "rollback-2.key.11.candidate" : 0.1387019157409668,
    "rollback-2.key.11.control" : 0,
    "rollback-2.key.15.candidate" : 0.16742700338363647,
    "rollback-2.key.15.control" : 0.031934306025505066,
    "rollback-2.key.19.candidate" : 0.2057291716337204,
    "rollback-2.key.19.control" : 0.05613425746560097,
    "rollback-2.key.23.candidate" : 0.08520833402872086,
    "rollback-2.key.23.control" : 0.06541666388511658,
    "rollback-2.key.27.candidate" : 0.1999194473028183,
    "rollback-2.key.27.control" : 0.10896381735801697,
    "rollback-2.key.3.candidate" : 0.10152284055948257,
    "rollback-2.key.3.control" : 0,
    "rollback-2.key.31.candidate" : 0.19798657298088074,
    "rollback-2.key.31.control" : 0.14901426434516907,
    "rollback-2.key.35.candidate" : 0.2344980388879776,
    "rollback-2.key.35.control" : 0.16338582336902618,
    "rollback-2.key.39.candidate" : 0.8125,
    "rollback-2.key.39.control" : 0.08671875298023224,
    "rollback-2.key.43.candidate" : 0.666241466999054,
    "rollback-2.key.43.control" : 0.07823128998279572,
    "rollback-2.key.47.candidate" : 0.2942386865615845,
    "rollback-2.key.47.control" : 0.09786522388458252,
    "rollback-2.key.7.candidate" : 0.13295455276966095,
    "rollback-2.key.7.control" : 0,
    "rollback-2.logits.candidate" : 0.08126194775104523,
    "rollback-2.logits.control" : 0.05688336491584778,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0.0023887481074780226,
    "rollback-2.ssm.1.control" : 0,
    "rollback-2.ssm.10.candidate" : 0.059214383363723755,
    "rollback-2.ssm.10.control" : 0,
    "rollback-2.ssm.12.candidate" : 0.003921369090676308,
    "rollback-2.ssm.12.control" : 0,
    "rollback-2.ssm.13.candidate" : 0.03520400449633598,
    "rollback-2.ssm.13.control" : 0.0002791119331959635,
    "rollback-2.ssm.14.candidate" : 0.0210354533046484,
    "rollback-2.ssm.14.control" : 0.0048773935995996,
    "rollback-2.ssm.16.candidate" : 0.05822568014264107,
    "rollback-2.ssm.16.control" : 0.010922309011220932,
    "rollback-2.ssm.17.candidate" : 0.05404665693640709,
    "rollback-2.ssm.17.control" : 0.013563264161348343,
    "rollback-2.ssm.18.candidate" : 0.056024547666311264,
    "rollback-2.ssm.18.control" : 0.013371502049267292,
    "rollback-2.ssm.2.candidate" : 0.01208097767084837,
    "rollback-2.ssm.2.control" : 0,
    "rollback-2.ssm.20.candidate" : 0.027865126729011536,
    "rollback-2.ssm.20.control" : 0.00973447598516941,
    "rollback-2.ssm.21.candidate" : 0.02129019796848297,
    "rollback-2.ssm.21.control" : 0.012765606865286827,
    "rollback-2.ssm.22.candidate" : 0.017765574157238007,
    "rollback-2.ssm.22.control" : 0.0044365995563566685,
    "rollback-2.ssm.24.candidate" : 0.03887055441737175,
    "rollback-2.ssm.24.control" : 0.014221612364053726,
    "rollback-2.ssm.25.candidate" : 0.056591395288705826,
    "rollback-2.ssm.25.control" : 0.03429656848311424,
    "rollback-2.ssm.26.candidate" : 0.07261309027671814,
    "rollback-2.ssm.26.control" : 0.05921730399131775,
    "rollback-2.ssm.28.candidate" : 0.01754978485405445,
    "rollback-2.ssm.28.control" : 0.0024056602269411087,
    "rollback-2.ssm.29.candidate" : 0.05542203038930893,
    "rollback-2.ssm.29.control" : 0.04527357220649719,
    "rollback-2.ssm.30.candidate" : 0.05496539548039436,
    "rollback-2.ssm.30.control" : 0.037865109741687775,
    "rollback-2.ssm.32.candidate" : 0.063469797372818,
    "rollback-2.ssm.32.control" : 0.05244925990700722,
    "rollback-2.ssm.33.candidate" : 0.10083483159542084,
    "rollback-2.ssm.33.control" : 0.09059132635593414,
    "rollback-2.ssm.34.candidate" : 0.09293091297149658,
    "rollback-2.ssm.34.control" : 0.07004349678754807,
    "rollback-2.ssm.36.candidate" : 0.06442391872406006,
    "rollback-2.ssm.36.control" : 0.03718012571334839,
    "rollback-2.ssm.37.candidate" : 0.10354065895080566,
    "rollback-2.ssm.37.control" : 0.0559813566505909,
    "rollback-2.ssm.38.candidate" : 0.05176632106304169,
    "rollback-2.ssm.38.control" : 0.01301589421927929,
    "rollback-2.ssm.4.candidate" : 0.026753302663564682,
    "rollback-2.ssm.4.control" : 0,
    "rollback-2.ssm.40.candidate" : 0.04487583413720131,
    "rollback-2.ssm.40.control" : 0.019173989072442055,
    "rollback-2.ssm.41.candidate" : 0.05262737721204758,
    "rollback-2.ssm.41.control" : 0.021716510877013206,
    "rollback-2.ssm.42.candidate" : 0.06387513130903244,
    "rollback-2.ssm.42.control" : 0.029392121359705925,
    "rollback-2.ssm.44.candidate" : 0.07685143500566483,
    "rollback-2.ssm.44.control" : 0.015560891479253769,
    "rollback-2.ssm.45.candidate" : 0.15334177017211914,
    "rollback-2.ssm.45.control" : 0.06941861659288406,
    "rollback-2.ssm.46.candidate" : 0.15462198853492737,
    "rollback-2.ssm.46.control" : 0.13302038609981537,
    "rollback-2.ssm.5.candidate" : 0.025962715968489647,
    "rollback-2.ssm.5.control" : 0,
    "rollback-2.ssm.6.candidate" : 0.025158949196338654,
    "rollback-2.ssm.6.control" : 0,
    "rollback-2.ssm.8.candidate" : 0.023640889674425125,
    "rollback-2.ssm.8.control" : 0,
    "rollback-2.ssm.9.candidate" : 0.044146787375211716,
    "rollback-2.ssm.9.control" : 0,
    "rollback-2.value.11.candidate" : 0.0370953232049942,
    "rollback-2.value.11.control" : 0,
    "rollback-2.value.15.candidate" : 0.06274900585412979,
    "rollback-2.value.15.control" : 0.009213147684931755,
    "rollback-2.value.19.candidate" : 0.05994898080825806,
    "rollback-2.value.19.control" : 0.012519929558038712,
    "rollback-2.value.23.candidate" : 0.06744185835123062,
    "rollback-2.value.23.control" : 0.0417151153087616,
    "rollback-2.value.27.candidate" : 0.030048076063394547,
    "rollback-2.value.27.control" : 0.014546001330018044,
    "rollback-2.value.3.candidate" : 0.06161971762776375,
    "rollback-2.value.3.control" : 0,
    "rollback-2.value.31.candidate" : 0.08206521719694138,
    "rollback-2.value.31.control" : 0.072826087474823,
    "rollback-2.value.35.candidate" : 0.0987318828701973,
    "rollback-2.value.35.control" : 0.06159420311450958,
    "rollback-2.value.39.candidate" : 0.7654761672019958,
    "rollback-2.value.39.control" : 0.0494791679084301,
    "rollback-2.value.43.candidate" : 0.342521607875824,
    "rollback-2.value.43.control" : 0.04088050499558449,
    "rollback-2.value.47.candidate" : 0.4268292784690857,
    "rollback-2.value.47.control" : 0.20636433362960815,
    "rollback-2.value.7.candidate" : 0.03293413296341896,
    "rollback-2.value.7.control" : 0,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0.003816793905571103,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0.028595266863703728,
    "rollback-3.conv.10.control" : 0,
    "rollback-3.conv.12.candidate" : 0.028551137074828148,
    "rollback-3.conv.12.control" : 0,
    "rollback-3.conv.13.candidate" : 0.03070443496108055,
    "rollback-3.conv.13.control" : 0,
    "rollback-3.conv.14.candidate" : 0.04615384712815285,
    "rollback-3.conv.14.control" : 0.010256410576403141,
    "rollback-3.conv.16.candidate" : 0.0445544570684433,
    "rollback-3.conv.16.control" : 0.015470297075808048,
    "rollback-3.conv.17.candidate" : 0.04015544056892395,
    "rollback-3.conv.17.control" : 0.01683937758207321,
    "rollback-3.conv.18.candidate" : 0.03995433822274208,
    "rollback-3.conv.18.control" : 0.021029537543654442,
    "rollback-3.conv.2.candidate" : 0.033363524824380875,
    "rollback-3.conv.2.control" : 0,
    "rollback-3.conv.20.candidate" : 0.041044775396585464,
    "rollback-3.conv.20.control" : 0.04042288661003113,
    "rollback-3.conv.21.candidate" : 0.03468899428844452,
    "rollback-3.conv.21.control" : 0.025119617581367493,
    "rollback-3.conv.22.candidate" : 0.021221188828349113,
    "rollback-3.conv.22.control" : 0.016400709748268127,
    "rollback-3.conv.24.candidate" : 0.03421787545084953,
    "rollback-3.conv.24.control" : 0.03072625771164894,
    "rollback-3.conv.25.candidate" : 0.03333333507180214,
    "rollback-3.conv.25.control" : 0.03928571566939354,
    "rollback-3.conv.26.candidate" : 0.04245283082127571,
    "rollback-3.conv.26.control" : 0.041347287595272064,
    "rollback-3.conv.28.candidate" : 0.050174303352832794,
    "rollback-3.conv.28.control" : 0.03187251091003418,
    "rollback-3.conv.29.candidate" : 0.06659836322069168,
    "rollback-3.conv.29.control" : 0.048497267067432404,
    "rollback-3.conv.30.candidate" : 0.0915178582072258,
    "rollback-3.conv.30.control" : 0.04950574040412903,
    "rollback-3.conv.32.candidate" : 0.07138625532388687,
    "rollback-3.conv.32.control" : 0.0758293867111206,
    "rollback-3.conv.33.candidate" : 0.07336956262588501,
    "rollback-3.conv.33.control" : 0.07890625298023224,
    "rollback-3.conv.34.candidate" : 0.0837710052728653,
    "rollback-3.conv.34.control" : 0.05567226931452751,
    "rollback-3.conv.36.candidate" : 0.15024039149284363,
    "rollback-3.conv.36.control" : 0.10096153616905212,
    "rollback-3.conv.37.candidate" : 0.09188034385442734,
    "rollback-3.conv.37.control" : 0.09401709586381912,
    "rollback-3.conv.38.candidate" : 0.05056818202137947,
    "rollback-3.conv.38.control" : 0.035606060177087784,
    "rollback-3.conv.4.candidate" : 0.019387755542993546,
    "rollback-3.conv.4.control" : 0,
    "rollback-3.conv.40.candidate" : 0.08214285969734192,
    "rollback-3.conv.40.control" : 0.07500000298023224,
    "rollback-3.conv.41.candidate" : 0.07442747801542282,
    "rollback-3.conv.41.control" : 0.05057251825928688,
    "rollback-3.conv.42.candidate" : 0.05033557116985321,
    "rollback-3.conv.42.control" : 0.05180368945002556,
    "rollback-3.conv.44.candidate" : 0.18595679104328156,
    "rollback-3.conv.44.control" : 0.1358024626970291,
    "rollback-3.conv.45.candidate" : 0.05681818351149559,
    "rollback-3.conv.45.control" : 0.03496503457427025,
    "rollback-3.conv.46.candidate" : 0.04712041839957237,
    "rollback-3.conv.46.control" : 0.0445026196539402,
    "rollback-3.conv.5.candidate" : 0.038167938590049744,
    "rollback-3.conv.5.control" : 0,
    "rollback-3.conv.6.candidate" : 0.03349282220005989,
    "rollback-3.conv.6.control" : 0,
    "rollback-3.conv.8.candidate" : 0.02251184917986393,
    "rollback-3.conv.8.control" : 0,
    "rollback-3.conv.9.candidate" : 0.025956284254789352,
    "rollback-3.conv.9.control" : 0,
    "rollback-3.index.11.candidate" : 0.05131172761321068,
    "rollback-3.index.11.control" : 0,
    "rollback-3.index.15.candidate" : 0.1130618005990982,
    "rollback-3.index.15.control" : 0.01755617931485176,
    "rollback-3.index.19.candidate" : 0.12007705122232437,
    "rollback-3.index.19.control" : 0.027397260069847107,
    "rollback-3.index.23.candidate" : 0.05178571492433548,
    "rollback-3.index.23.control" : 0.02276785671710968,
    "rollback-3.index.27.candidate" : 0.08090965449810028,
    "rollback-3.index.27.control" : 0.037128712981939316,
    "rollback-3.index.3.candidate" : 0.05917159840464592,
    "rollback-3.index.3.control" : 0,
    "rollback-3.index.31.candidate" : 0.20020747184753418,
    "rollback-3.index.31.control" : 0.19605809450149536,
    "rollback-3.index.35.candidate" : 0.18377482891082764,
    "rollback-3.index.35.control" : 0.11423841118812561,
    "rollback-3.index.39.candidate" : 0.7373417615890503,
    "rollback-3.index.39.control" : 0.04628164693713188,
    "rollback-3.index.43.candidate" : 0.793749988079071,
    "rollback-3.index.43.control" : 0.04707031324505806,
    "rollback-3.index.47.candidate" : 0.19208332896232605,
    "rollback-3.index.47.control" : 0.10187499970197678,
    "rollback-3.index.7.candidate" : 0.05003446713089943,
    "rollback-3.index.7.control" : 0,
    "rollback-3.key.11.candidate" : 0.1387019157409668,
    "rollback-3.key.11.control" : 0,
    "rollback-3.key.15.candidate" : 0.16742700338363647,
    "rollback-3.key.15.control" : 0.031934306025505066,
    "rollback-3.key.19.candidate" : 0.2057291716337204,
    "rollback-3.key.19.control" : 0.05613425746560097,
    "rollback-3.key.23.candidate" : 0.08520833402872086,
    "rollback-3.key.23.control" : 0.06541666388511658,
    "rollback-3.key.27.candidate" : 0.1999194473028183,
    "rollback-3.key.27.control" : 0.10896381735801697,
    "rollback-3.key.3.candidate" : 0.10152284055948257,
    "rollback-3.key.3.control" : 0,
    "rollback-3.key.31.candidate" : 0.19798657298088074,
    "rollback-3.key.31.control" : 0.14901426434516907,
    "rollback-3.key.35.candidate" : 0.2344980388879776,
    "rollback-3.key.35.control" : 0.16338582336902618,
    "rollback-3.key.39.candidate" : 0.8125,
    "rollback-3.key.39.control" : 0.08671875298023224,
    "rollback-3.key.43.candidate" : 0.666241466999054,
    "rollback-3.key.43.control" : 0.07823128998279572,
    "rollback-3.key.47.candidate" : 0.2942386865615845,
    "rollback-3.key.47.control" : 0.09786522388458252,
    "rollback-3.key.7.candidate" : 0.13295455276966095,
    "rollback-3.key.7.control" : 0,
    "rollback-3.logits.candidate" : 0.08199194818735123,
    "rollback-3.logits.control" : 0.06941650062799454,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0.0030561303719878197,
    "rollback-3.ssm.1.control" : 0,
    "rollback-3.ssm.10.candidate" : 0.05074189230799675,
    "rollback-3.ssm.10.control" : 0,
    "rollback-3.ssm.12.candidate" : 0.003892547218129039,
    "rollback-3.ssm.12.control" : 0,
    "rollback-3.ssm.13.candidate" : 0.03815753385424614,
    "rollback-3.ssm.13.control" : 0.0002753961889538914,
    "rollback-3.ssm.14.candidate" : 0.02258496731519699,
    "rollback-3.ssm.14.control" : 0.007244178093969822,
    "rollback-3.ssm.16.candidate" : 0.06646406650543213,
    "rollback-3.ssm.16.control" : 0.013954143971204758,
    "rollback-3.ssm.17.candidate" : 0.0467805415391922,
    "rollback-3.ssm.17.control" : 0.02861716039478779,
    "rollback-3.ssm.18.candidate" : 0.08467812091112137,
    "rollback-3.ssm.18.control" : 0.04236041009426117,
    "rollback-3.ssm.2.candidate" : 0.015732508152723312,
    "rollback-3.ssm.2.control" : 0,
    "rollback-3.ssm.20.candidate" : 0.04387398809194565,
    "rollback-3.ssm.20.control" : 0.021035408601164818,
    "rollback-3.ssm.21.candidate" : 0.020630186423659325,
    "rollback-3.ssm.21.control" : 0.012942383997142315,
    "rollback-3.ssm.22.candidate" : 0.01782633177936077,
    "rollback-3.ssm.22.control" : 0.004294726997613907,
    "rollback-3.ssm.24.candidate" : 0.03790345415472984,
    "rollback-3.ssm.24.control" : 0.014817526564002037,
    "rollback-3.ssm.25.candidate" : 0.059884097427129745,
    "rollback-3.ssm.25.control" : 0.06067748740315437,
    "rollback-3.ssm.26.candidate" : 0.09197630733251572,
    "rollback-3.ssm.26.control" : 0.09641925990581512,
    "rollback-3.ssm.28.candidate" : 0.017537958920001984,
    "rollback-3.ssm.28.control" : 0.003989783581346273,
    "rollback-3.ssm.29.candidate" : 0.06905647367238998,
    "rollback-3.ssm.29.control" : 0.061760202050209045,
    "rollback-3.ssm.30.candidate" : 0.06458068639039993,
    "rollback-3.ssm.30.control" : 0.04147869721055031,
    "rollback-3.ssm.32.candidate" : 0.080699622631073,
    "rollback-3.ssm.32.control" : 0.07607626914978027,
    "rollback-3.ssm.33.candidate" : 0.1706615686416626,
    "rollback-3.ssm.33.control" : 0.15820598602294922,
    "rollback-3.ssm.34.candidate" : 0.11450029164552689,
    "rollback-3.ssm.34.control" : 0.13165420293807983,
    "rollback-3.ssm.36.candidate" : 0.09645963460206985,
    "rollback-3.ssm.36.control" : 0.08035723119974136,
    "rollback-3.ssm.37.candidate" : 0.08557738363742828,
    "rollback-3.ssm.37.control" : 0.07587326318025589,
    "rollback-3.ssm.38.candidate" : 0.051687829196453094,
    "rollback-3.ssm.38.control" : 0.0154428631067276,
    "rollback-3.ssm.4.candidate" : 0.025617334991693497,
    "rollback-3.ssm.4.control" : 0,
    "rollback-3.ssm.40.candidate" : 0.045667096972465515,
    "rollback-3.ssm.40.control" : 0.025110634043812752,
    "rollback-3.ssm.41.candidate" : 0.052725549787282944,
    "rollback-3.ssm.41.control" : 0.02152792364358902,
    "rollback-3.ssm.42.candidate" : 0.06515450775623322,
    "rollback-3.ssm.42.control" : 0.034233737736940384,
    "rollback-3.ssm.44.candidate" : 0.07540929317474365,
    "rollback-3.ssm.44.control" : 0.015147016383707523,
    "rollback-3.ssm.45.candidate" : 0.16052067279815674,
    "rollback-3.ssm.45.control" : 0.092524953186512,
    "rollback-3.ssm.46.candidate" : 0.14926092326641083,
    "rollback-3.ssm.46.control" : 0.13415981829166412,
    "rollback-3.ssm.5.candidate" : 0.023264631628990173,
    "rollback-3.ssm.5.control" : 0,
    "rollback-3.ssm.6.candidate" : 0.025448618456721306,
    "rollback-3.ssm.6.control" : 0,
    "rollback-3.ssm.8.candidate" : 0.02357575297355652,
    "rollback-3.ssm.8.control" : 0,
    "rollback-3.ssm.9.candidate" : 0.04501700401306152,
    "rollback-3.ssm.9.control" : 0,
    "rollback-3.value.11.candidate" : 0.0370953232049942,
    "rollback-3.value.11.control" : 0,
    "rollback-3.value.15.candidate" : 0.06274900585412979,
    "rollback-3.value.15.control" : 0.009213147684931755,
    "rollback-3.value.19.candidate" : 0.05994898080825806,
    "rollback-3.value.19.control" : 0.012519929558038712,
    "rollback-3.value.23.candidate" : 0.06744185835123062,
    "rollback-3.value.23.control" : 0.0417151153087616,
    "rollback-3.value.27.candidate" : 0.030048076063394547,
    "rollback-3.value.27.control" : 0.014546001330018044,
    "rollback-3.value.3.candidate" : 0.06161971762776375,
    "rollback-3.value.3.control" : 0,
    "rollback-3.value.31.candidate" : 0.08206521719694138,
    "rollback-3.value.31.control" : 0.072826087474823,
    "rollback-3.value.35.candidate" : 0.0987318828701973,
    "rollback-3.value.35.control" : 0.06159420311450958,
    "rollback-3.value.39.candidate" : 0.7654761672019958,
    "rollback-3.value.39.control" : 0.0494791679084301,
    "rollback-3.value.43.candidate" : 0.342521607875824,
    "rollback-3.value.43.control" : 0.04088050499558449,
    "rollback-3.value.47.candidate" : 0.4268292784690857,
    "rollback-3.value.47.control" : 0.20636433362960815,
    "rollback-3.value.7.candidate" : 0.03293413296341896,
    "rollback-3.value.7.control" : 0,
    "routing.candidate" : 0.06345873786407767,
    "routing.control" : 0.022079288025889966,
    "workspace_token_tile" : 256
  },
  "name" : "context-small-pass-64",
  "passed" : false
}

````

## small64-6/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````
