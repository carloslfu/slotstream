---
type: run
id: 01m1t1r54d4j4587q0hq9001fj
created: 2026-09-06T00:26:32.461420+00:00
updated: 2026-09-06T00:26:32.630015+00:00
summary: Verified Hermes source build installed locally
binary: 800502693480a7187f81fab231f8516dccc56a7926894e7c0e8c2ce2480ed3f8
captured_at: 2026-09-05
command: Commands and installation receipt in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Verified Hermes source build installed locally
tool: Atomic local installation and installed CLI checks
---
# Verified Hermes build installed locally

At the user's explicit request, the verified binary and matching Metal library were copied into a distinct local install directory, checked by SHA-256, and activated by one atomic bin-symlink replacement. The previous directory remains intact for rollback. Source identity and source archive are installed alongside the executable. This is a local source build, not a published release; the version string remains unchanged.

The installed command was run from outside the development repository. These installation checks load no model and claim no new inference or performance result. Earlier live-client qualification is preserved in [[sources/runs/2026/09/2026-09-05-hermes-final-integration-acceptance]].

## Installation receipt

```json
{
  "installed_at": "2026-09-06T00:25:14.772545+00:00",
  "kind": "verified-local-hermes-build",
  "binary_sha256": "800502693480a7187f81fab231f8516dccc56a7926894e7c0e8c2ce2480ed3f8",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "7ef615567ec0c2bda094f14ec236fb71e0aa0ed31b0c26610bf0b445e5be980b",
  "previous_bin_target": "releases/3bbc7cc66a50746b009222b0420f376e285b53f811bed0a6cde9d3feab8bf46a-macos26",
  "previous_binary_sha256": "3f7860883f0ae4e2e1559edb61d7e032f3de330bd960d1ac6e2577e94028a4b7",
  "new_bin_target": "releases/local-hermes-800502693480a7187f81fab231f8516dccc56a7926894e7c0e8c2ce2480ed3f8",
  "version_string": "0.2.7",
  "published_release": false,
  "post_install_version_output": "0.2.7"
}

```

## slotstream runtime-check

```text
PASS  request VM counters are monotonic
PASS  request VM reclaimable bytes are available
PASS  process physical footprint is readable
PASS  process RSS high-water is readable
PASS  lifetime RSS is separately readable
PASS  monotonic duration is nonnegative
PASS  footprint sampler includes endpoints
PASS  reference optimization defaults
PASS  typed override enables compaction
PASS  malformed override refused
PASS  unknown optimization refused
PASS  invalid read scope -1 refused
PASS  invalid read scope 1 refused
PASS  invalid read scope 16384 refused
PASS  invalid read scope bad refused
PASS  unbounded read scope refused
PASS  explicit workspace tile is recorded
PASS  unbounded workspace tile refused
PASS  terminal output needs no speculative draft
PASS  draft count fits remaining output
PASS  public depth cannot exceed recording cap
PASS  negative remaining output cannot underflow
PASS  prefix cache reaches its four-entry bound
PASS  an identical history replaces instead of duplicating an entry
PASS  a miss evicts before allocating a fifth state
PASS  a smaller live token ceiling evicts immediately
PASS  held GB includes fixed recurrent state
PASS  growing hit still reuses its state
PASS  growing hit reserves future state before allocation
PASS  huge reservation safely misses
PASS  huge reservation releases held state
PASS  capacity reservation still hits
PASS  capacity growth reserves bytes before reuse
PASS  saturated byte reservation evicts safely
PASS  identical bytes hash alike
PASS  different bytes do not
PASS  the same image at the same offset matches
PASS  a swapped image does not
PASS  an entry ending inside a run still matches that run
PASS  a text-only entry rejects a prompt with an image inside its range
PASS  an image beyond the entry's range is irrelevant to the match
PASS  a vision conversation is held, not discarded
PASS  the same ids with a different picture miss
PASS  the text-only splice never sees a vision entry
PASS  prefix splice chooses the longest retained extension
PASS  prefix splice is strict, not an identical-history match
PASS  prefix splice lookup does not consume the retained state
PASS  a disabled prefix cache offers no splice
PASS  shard listing works through a symlinked model dir
PASS  8.1 GB plan stays inside its target
PASS  10.0 GB plan stays inside its target
PASS  16.0 GB plan stays inside its target
PASS  30.0 GB plan stays inside its target
RUNTIME CHECK PASS

```

## slotstream doctor --memory-gb 10 --max-context 65536 --vision off --mtp off --json

```text
{
  "availability_clamped" : false,
  "device_available_gb" : 31.699999999999999,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 771.01176470588018,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 2.666666666666667,
  "expected_peak_gb" : 9.6999999999999993,
  "experts_per_layer_cached" : 13,
  "fully_resident" : false,
  "max_context_tokens" : 65536,
  "max_ram_percent" : 70,
  "mtp" : false,
  "pool_gb" : 1.8,
  "pool_slots" : 640,
  "prefill_chunk" : 256,
  "prefix_cache_max_tokens" : 6828,
  "source" : "--memory-gb",
  "target_gb" : 10,
  "vision" : false,
  "vision_charged_gb" : 0,
  "vision_resident_gb" : 0,
  "vision_resident_reserved" : false
}

```
