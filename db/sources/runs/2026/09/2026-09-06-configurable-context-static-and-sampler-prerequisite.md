---
type: run
id: 01m1w6vq3babr6yqdzmd32hysj
created: 2026-09-06T20:34:20.907254+00:00
updated: 2026-09-06T20:34:21.180163+00:00
summary: Build 19 static suite passes; sampler stops before execution on missing environment prerequisite
binary: ee9f87581d78a7df38f18748556ebbf8587224df5b093017b0f8dba629e217ad
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Build 19 static suite passes; sampler stops before execution on missing environment prerequisite
tool: Native Swift diagnostics and Python CLI gates
---
# Static regression and preserved environment failure

The complete existing static suite passes against frozen build 19. Its output
records syntax and compilation checks, coverage, driver rejection tests,
runtime and pull checks, Slotpack fixtures, the 64 planner assertions, the
installer fixtures, authoritative brain records and generated projections.
Installer fixtures do not prove a real installed release.

The next sampler gate exits immediately because the isolated worktree does
not contain the shared parity environment at its default relative path.
No sampler numerical comparison or subsequent native model case ran. The
existing canonical environment was independently located and reports NumPy
2.5.2 and MLX 0.31.1; the next bounded batch will pass its absolute interpreter
through the already supported PYTHON variable. No oracle, baseline, dependency
version or numerical criterion is changed to address this invocation error.

Commands: BIN=<frozen-build-19>/slotstream bash Tools/static_gates.sh;
BIN=<frozen-build-19>/slotstream bash Tools/sampler_gates.sh.
The first failure stopped the batch, and the shared model lock and process
audit confirmed all owned work exited before the slot was returned. The
overlapping download excludes timing and capacity interpretations. This
record closes the static portion only; C21 native regression, P5 full-window
capacity, public release, actual installation and rollback remain open.

## Frozen build identity

```json
{
  "binary_sha256": "ee9f87581d78a7df38f18748556ebbf8587224df5b093017b0f8dba629e217ad",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "d47f3059f298de5e82261882e6b49485ea20ecaf3e2ef6ce41ddc360c9a5bceb"
}
```

## c21-native-19/static/stdout.txt

SHA-256 `6ed475d03e204e7e66e96afc74e08bbd656396246f0e3a4e9d71b01495b37f30`; 14604 bytes.

````text
coverage ratchet checks pass
{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}
{"passed": true, "case": "timeout drains a separately grouped descendant ignoring TERM", "processes": 2}
llms-full.txt is current
warning LOG_UNKNOWN_KIND log.md:124 — log entry kind `change` is not recognized
    hint: use one of: ingest, create, update, delete, rename, link, validate, index-rebuild, contradiction
1 issue(s): 0 error(s), 1 warning(s), 0 info
MEASUREMENTS.md is current
PLAN.md is current
claims gate: 92 needle checks, 0 failures
BRAIN GATES PASS
dequant_row.txt: OK
layer_0.bin: OK
layer_1.bin: OK
layer_2.bin: OK
layer_3.bin: OK
ngram_ids.txt: OK
tokens.txt: OK
PASS  request VM counters are monotonic
PASS  request VM reclaimable bytes are available
PASS  process physical footprint is readable
PASS  process RSS high-water is readable
PASS  lifetime RSS is separately readable
PASS  monotonic duration is nonnegative
PASS  footprint sampler includes endpoints
PASS  reference optimization defaults
PASS  qualified platform keeps the complete joint candidate
PASS  unqualified platform 0 keeps portable work and original rotation
PASS  unqualified platform 1 keeps portable work and original rotation
PASS  unqualified platform 2 keeps portable work and original rotation
PASS  unqualified platform 3 keeps portable work and original rotation
PASS  unqualified platform 4 keeps portable work and original rotation
PASS  unqualified platform 5 keeps portable work and original rotation
PASS  unqualified platform 6 keeps portable work and original rotation
PASS  unqualified platform 7 keeps portable work and original rotation
PASS  unqualified platform 8 keeps portable work and original rotation
PASS  unqualified platform 9 keeps portable work and original rotation
PASS  unqualified platform 10 keeps portable work and original rotation
PASS  unqualified platform 11 keeps portable work and original rotation
PASS  unqualified platform 12 keeps portable work and original rotation
PASS  platform selection is deterministic
PASS  explicit kernel qualification remains available
PASS  explicit kernel fallback remains available
PASS  absent overrides retain the selected default family
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPACT_STATE
PASS  explicit one restores only SLOTSTREAM_OPT_COMPACT_STATE
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPACT_MTP
PASS  explicit one restores only SLOTSTREAM_OPT_COMPACT_MTP
PASS  explicit zero disables only SLOTSTREAM_OPT_FINAL_FORWARD
PASS  explicit one restores only SLOTSTREAM_OPT_FINAL_FORWARD
PASS  explicit zero disables only SLOTSTREAM_OPT_SAMPLER_THRESHOLD
PASS  explicit one restores only SLOTSTREAM_OPT_SAMPLER_THRESHOLD
PASS  explicit zero disables only SLOTSTREAM_OPT_SAMPLER_DRAW
PASS  explicit one restores only SLOTSTREAM_OPT_SAMPLER_DRAW
PASS  explicit zero disables only SLOTSTREAM_OPT_OUTPUT_QUEUE
PASS  explicit one restores only SLOTSTREAM_OPT_OUTPUT_QUEUE
PASS  explicit zero disables only SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR
PASS  explicit one restores only SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPLETE_PROMPT
PASS  explicit one restores only SLOTSTREAM_OPT_COMPLETE_PROMPT
PASS  explicit zero disables only SLOTSTREAM_OPT_SHARED_ROPE
PASS  explicit one restores only SLOTSTREAM_OPT_SHARED_ROPE
PASS  explicit zero disables only SLOTSTREAM_OPT_FUSED_ROPE
PASS  explicit one restores only SLOTSTREAM_OPT_FUSED_ROPE
PASS  explicit zeros restore the complete reference inference family
PASS  explicit numeric zero disables inherited prefix retention
PASS  non-optimization environment leaves the family intact
PASS  selected defaults still reject invalid override ["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"]
PASS  selected defaults still reject invalid override ["SLOTSTREAM_OPT_TYPO": "0"]
PASS  valid inherited read scope retains its prerequisites
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_COMPACT_STATE
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_COMPACT_MTP
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_LAYER_WORKSPACE
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_INDEXER_TILES
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_PLE_TILES
PASS  scope can be disabled while retaining its other independent work
PASS  public environment function value keeps its signature and reference default
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
PASS  matching file is accepted
PASS  same-size corruption is rejected
PASS  exact Content-Range is accepted
PASS  wrong range start is rejected
PASS  wrong range total is rejected
PASS  unknown range total is rejected
PASS  every pinned file has a digest
PASS  the draft head is pinned as the one optional file
PASS  an absent optional file is not a repair; an absent required one is
PASS  an empty directory reads as missing
PASS  missing needs the required model
PASS  status carries free disk
PASS  bytesToFetch agrees with required files
PASS  a missing copy is not ready
PULL CHECK PASS
{"bf16_predictions":16711680,"centers":1000000,"roundtrips":60,"malformed_inputs":39583,"pass":true}
MANIFEST CHECKS PASS
{"name": "normal", "pass_": true, "seconds": 0.329, "returncode": 0}
{"name": "cache-miss-reporting", "pass_": true, "seconds": 0.031, "returncode": 0}
{"name": "redirect", "pass_": true, "seconds": 0.03, "returncode": 0}
{"name": "bad-object-fallback", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.032, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.015, "returncode": 1}
{"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.014, "returncode": 1}
{"name": "optional-absent", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "bad-object-fails", "pass_": true, "seconds": 0.014, "returncode": 1}
{"name": "retry-after", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "hugging-face-rate-limit", "pass_": true, "seconds": 5.597, "returncode": 0}
{"name": "cancel-during-hugging-face-rate-limit", "pass_": true, "seconds": 0.503, "returncode": 1}
{"name": "transient-retry", "pass_": true, "seconds": 5.624, "returncode": 0}
{"name": "wrong-length-fallback", "pass_": true, "seconds": 11.161, "returncode": 0}
{"name": "short-body-fallback", "pass_": true, "seconds": 36.232, "returncode": 0}
{"name": "content-encoding-fallback", "pass_": true, "seconds": 36.431, "returncode": 0}
{"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.487, "returncode": 1}
{"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.038, "returncode": 1}
{"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "resume", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "already-installed", "pass_": true, "seconds": 0.014, "returncode": 0}
{"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.013, "returncode": 0}
{"name": "corruption-seed", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "same-size-final-repair", "pass_": true, "seconds": 0.017, "returncode": 0}
{"name": "invalid-resume-map", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "part-symlink-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.004, "returncode": 1}
{"name": "part-fifo-rejected", "pass_": true, "seconds": 0.004, "returncode": 1}
{"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.011, "returncode": 1}
ALL HTTP CHECKS PASS
{"name": "raw-multichunk", "pass_": true, "seconds": 0.908, "returncode": 0}
{"name": "raw-installed-no-http", "pass_": true, "seconds": 0.251, "returncode": 0}
{"name": "raw-source-fallback-missing", "pass_": true, "seconds": 0.327, "returncode": 0}
{"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 0.332, "returncode": 0}
{"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 40.721, "returncode": 0}
{"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 0.322, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.024, "returncode": 1}
{"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.161, "returncode": 1}
{"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.204, "returncode": 0}
{"name": "raw-cancel", "pass_": true, "seconds": 3.307, "returncode": 1}
{"name": "raw-resume", "pass_": true, "seconds": 0.33, "returncode": 0}
{"name": "raw-same-size-repair", "pass_": true, "seconds": 0.443, "returncode": 0}
ALL RAW HTTP CHECKS PASS
SUSTAINED MEMORY PASS 340918272 bytes peak RSS
SLOTPACK GATES PASS
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: refuses an unphysical minimum allocation
PASS  8GB Mac: refuses an unphysical minimum allocation
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 refuses physical overcommit without trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
PASS  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
PASS  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
PASS  --model with a corrupt safetensors header
PASS  safetensors dtype/shape byte mismatch rejected
PASS  safetensors header over 100MB rejected before allocation
PASS  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: full model window obeys the product without exemptions
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 64, failed 0
INSTALLER GATES PASS
STATIC GATES PASS

````

## c21-native-19/static/stderr.txt

SHA-256 `03ef6265a6ea8aa311c6cf825b725ab709727742545a98471533ce5982348fa2`; 453 bytes.

````text
.......
----------------------------------------------------------------------
Ran 7 tests in 0.007s

OK
.......
----------------------------------------------------------------------
Ran 7 tests in 0.009s

OK
######################################################################## 100.0%
######################################################################## 100.0%
######################################################################## 100.0%

````

## c21-native-19/sampler/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## c21-native-19/sampler/stderr.txt

SHA-256 `b67c4f31f459b3a65be64ef64970d52cbb6fa6e22165214af35bf1bf97b9b06f`; 72 bytes.

````text
FAIL  sampler oracle needs numpy (set PYTHON to the parity environment)

````
