---
type: run
id: 01m1hhwk2gyes5nfed4t0c1g0m
created: 2026-09-02T12:15:25-05:00
updated: 2026-09-02T17:20:22.110963+00:00
summary: 'slotstream doctor --json on the dev Mac on 2026-09-02: the auto plan with other apps holding memory (availability clamped), binary 0.2.1, local build.'
binary: 0.2.1, local release build in .build/release, built 2026-09-01T22:49-05:00 from a working tree earlier than 453ae8e; the doctor report reads the machine, not the build
captured_at: 2026-09-02T12:15:25-05:00
command: .build/release/slotstream doctor --json
discarded: false
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: slotstream doctor --json, dev Mac, 2026-09-02
tool: doctor
---

The first run captured under the "capture before you transcribe" rule, taken
while creating the store. `doctor` loads nothing and takes no lock. Other
apps were holding memory, so the plan is the clamped one, not the quiet-
machine plan the README quotes; that is exactly what the `notes` field says.

```json
{
  "availability_clamped" : true,
  "device_available_gb" : 24.399999999999999,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 332.53874599887024,
  "est_prefill_tok_s" : 113,
  "est_warm_tok_s" : 9.3146514410783183,
  "expected_peak_gb" : 20.899999999999999,
  "experts_per_layer_cached" : 88,
  "fully_resident" : false,
  "max_context_tokens" : 32768,
  "max_ram_percent" : 70,
  "mtp" : false,
  "notes" : [
    "only 24.4 GB of 52 GB RAM is reclaimable right now (other apps hold the rest) — sized down from the usual 33.0 GB; close apps and restart for full speed, or force a size with --memory-gb"
  ],
  "pool_gb" : 11.699999999999999,
  "pool_slots" : 4214,
  "prefill_chunk" : 2048,
  "prefix_cache_max_tokens" : 32768,
  "source" : "auto",
  "target_gb" : 21.899999999999999
}
```
