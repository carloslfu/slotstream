---
type: run
id: 01m1wb6935zyds3f21dbvxd7gd
created: 2026-09-06T21:50:01.317396+00:00
updated: 2026-09-06T21:50:01.569322+00:00
summary: Shared V193 exposes ordinary-context governor acceptance after an infeasible replan
binary: 8fdff8a06ade9a51aca4712ffb5a71ab0491b2bb3495aec8a47427f80c5ea5b9
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Shared V193 exposes ordinary-context governor acceptance after an infeasible replan
tool: Native Swift diagnostics and Python CLI gates
---
# Ordinary-context live feasibility counterexample

The optimization owner's identified shared V193 builds and passes T0
33groups/22263assertions, CLI116, HTTP context-serving835 and image-reuse76.
The next plain governor-boundary test passes72of80assertions and stops the
batch. In each scope/prefill/decode/nonstream phase, the configured infeasible
plan unexpectedly admits another request and reads experts. The exact observed
read totals are5624,5618,5664and5656. Pressure cancellation, bounded stop,
cleanup and explicit recovery assertions otherwise pass. The MTP/governor
and later bookkeeping cases do not run after this first failure.

Source inspection finds a real live-feasibility gap. At ordinary contexts,
the startup planner intentionally preserves its legacy minimum-floor advisory.
GovernorPolicy.desiredPlan reused that successful return without independently
checking the full ledger against credited available memory and safety slack.
The forced-MTP case's distinct mandatory-head refusal explains why the earlier
MTP gate did not reveal the plain-model defect. The diagnostic's expectations
are retained rather than changed to accept the extra work.

A prospective two-file correction adds that exact physical/target check to
the live governor at every context, preserving startup defaults and resize
deadbands. Thirty-two additional pure assertions cover plain/required-MTP
ordinary contexts, infeasible floor decisions and feasible recovery. The
correction is unbuilt at this capture and must pass both native variants.

Command: SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR=1 slotstream
optimization-state-check --variant governor-boundary --json, on the frozen
shared V193 binary below. This is a bounded coordinated download-overlap
correctness run; timing and capacity are excluded. The full source archive
is preserved exactly; it is a different source identity from context build20.
The process owner reports all owned children exited and independently checked
the model lock free before returning the slot. No default optimization,
public context limit, capacity protocol, release or installation changes.

## Frozen build identity

```json
{
  "binary_sha256": "8fdff8a06ade9a51aca4712ffb5a71ab0491b2bb3495aec8a47427f80c5ea5b9",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "6ef88b2c68e838e64ee338011424ace9178be4a381076acac4e1a414595de592"
}
```

## shared-v193-governor/public-result.json

SHA-256 `075910fc45f788a18a1dd5231f97f7a83c9df87d7597210b36b9c4741968906e`; 1606 bytes.

````text
{
  "candidate": "shared V193, not build20",
  "build_identity": {
    "binary_sha256": "8fdff8a06ade9a51aca4712ffb5a71ab0491b2bb3495aec8a47427f80c5ea5b9",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "source_archive_sha256": "6ef88b2c68e838e64ee338011424ace9178be4a381076acac4e1a414595de592"
  },
  "cases": [
    {
      "name": "t0",
      "passed": true,
      "assertions": 22263,
      "raw_sha256": "efa2c597e8ac86eba5f52d576ba109e70c566a7399c6daa1b1f2542c3eec1b7e",
      "raw_bytes": 2114989
    },
    {
      "name": "context-cli",
      "passed": true,
      "assertions": 116,
      "raw_sha256": "f146b5ddaecaa311044b5479421be34b9a8dbe5768a47242a7e380bb11522b0b",
      "raw_bytes": 330243
    },
    {
      "name": "context-serving",
      "passed": true,
      "assertions": 835,
      "raw_sha256": "cb00c737d1399c61d29239b009ef57ec45fce21be2815a025be0b268b25d0bb4",
      "raw_bytes": 96493
    },
    {
      "name": "image-reuse",
      "passed": true,
      "assertions": 76,
      "raw_sha256": "302beb2bbff45488e1df427b8ca9953e3bb35334c201ffb47b887152bd794417",
      "raw_bytes": 6727
    },
    {
      "name": "governor-boundary",
      "passed": false,
      "assertions": 80,
      "raw_sha256": "b2ba5257514ef489461eff247c4fe80ac0ff2efa51ae9b48d13164c3d96671f4",
      "raw_bytes": 8571
    }
  ],
  "first_failure": "governor-boundary",
  "following_cases_launched": false,
  "projection": "Exact result summaries and raw hashes. Private command paths and overlap timing/VM snapshots omitted; no timing or capacity claim."
}

````

## shared-v193-governor/stdout.txt

SHA-256 `b2ba5257514ef489461eff247c4fe80ac0ff2efa51ae9b48d13164c3d96671f4`; 8571 bytes.

````text
{
  "items" : [
    {
      "name" : "baseline delivers the bounded output",
      "passed" : true
    },
    {
      "name" : "explicit plans never receive a pressure cancellation",
      "passed" : true
    },
    {
      "name" : "explicit plans never donate capacity",
      "passed" : true
    },
    {
      "name" : "busy polling skips resizing",
      "passed" : true
    },
    {
      "name" : "queued request observes pending pressure before work",
      "passed" : true
    },
    {
      "name" : "queued refusal reports a runtime error",
      "passed" : true
    },
    {
      "name" : "queued refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "queued refusal takes no retained state",
      "passed" : true
    },
    {
      "name" : "queued pressure has an explicit image refusal",
      "passed" : true
    },
    {
      "name" : "queued pressure never loads the tower",
      "passed" : true
    },
    {
      "name" : "scope: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "scope: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "scope: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "scope: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "scope: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "scope: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "cancelled scope retains only its prior commit",
      "passed" : true
    },
    {
      "name" : "scope cancellation emits no token",
      "passed" : true
    },
    {
      "name" : "scope: pressure cannot exceed the arena floor",
      "passed" : true
    },
    {
      "name" : "scope: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "scope: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "scope: infeasible context refuses new work until recovery",
      "passed" : false
    },
    {
      "detail" : "got 5624, want 0",
      "name" : "scope: infeasible refusal reads no experts",
      "passed" : false
    },
    {
      "name" : "scope: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "scope: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "scope: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "scope: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "scope: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "prefill: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "prefill: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "prefill: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "prefill: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "prefill: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "prefill: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "prefill stops at one complete chronological pass",
      "passed" : true
    },
    {
      "name" : "prefill cancellation emits no token",
      "passed" : true
    },
    {
      "name" : "prefill: pressure cannot exceed the arena floor",
      "passed" : true
    },
    {
      "name" : "prefill: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "prefill: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "prefill: infeasible context refuses new work until recovery",
      "passed" : false
    },
    {
      "detail" : "got 5618, want 0",
      "name" : "prefill: infeasible refusal reads no experts",
      "passed" : false
    },
    {
      "name" : "prefill: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "prefill: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "prefill: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "prefill: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "prefill: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "decode: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "decode: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "decode: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "decode: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "decode: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "decode: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "decode emits a coherent prefix before cancellation",
      "passed" : true
    },
    {
      "name" : "decode: pressure cannot exceed the arena floor",
      "passed" : true
    },
    {
      "name" : "decode: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "decode: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "decode: infeasible context refuses new work until recovery",
      "passed" : false
    },
    {
      "detail" : "got 5664, want 0",
      "name" : "decode: infeasible refusal reads no experts",
      "passed" : false
    },
    {
      "name" : "decode: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "decode: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "decode: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "decode: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "decode: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "nonstream: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "nonstream: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "nonstream: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "nonstream: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "nonstream: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "nonstream: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "decode emits a coherent prefix before cancellation",
      "passed" : true
    },
    {
      "name" : "nonstream: pressure cannot exceed the arena floor",
      "passed" : true
    },
    {
      "name" : "nonstream: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "nonstream: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "nonstream: infeasible context refuses new work until recovery",
      "passed" : false
    },
    {
      "detail" : "got 5656, want 0",
      "name" : "nonstream: infeasible refusal reads no experts",
      "passed" : false
    },
    {
      "name" : "nonstream: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "nonstream: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "nonstream: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "nonstream: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "nonstream: retry is not spuriously cancelled",
      "passed" : true
    }
  ],
  "measurements" : {
    "decode.pressure_to_boundary_seconds" : 8.833e-06,
    "nonstream.pressure_to_boundary_seconds" : 0.000283584,
    "prefill.pressure_to_boundary_seconds" : 0.003594708,
    "scope.pressure_to_boundary_seconds" : 0.007747791
  },
  "name" : "optimization-governor-boundary-plain",
  "passed" : false
}

````

## shared-v193-governor/stderr.txt

SHA-256 `cc4a5dcf055c74240c9579f4cec8b1103977e5878c76fd7f635318ad4ce3a1c2`; 224 bytes.

````text
engine ready in 0.9s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
elastic: memory pressure (critical) — cache ~20 → ~13 experts/layer (2.7 → 1.8 GB pool, cold — refills from SSD)

````
