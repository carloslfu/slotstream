---
type: run
id: 01m2c4mcg2n0598a6m1tkr7n6g
created: 2026-09-13T01:03:14.434774+00:00
updated: 2026-09-13T01:05:06.849819+00:00
summary: 'Decode serialization round 1: deferring the per-layer GPU drain gains 3.8% to 5.1% with exact outputs; record reads and nine flags null; profiles show host time is GPU wait'
binary: 269b2da3cd1a3515167bb17673cb0dc76d828e8175977a61000e0a342fa9ed7e (pin generations, barrier period, whole-record reads, counters)
captured_at: 2026-09-12
command: 'see body: .build/decode-cpu/run-after-b0.sh (build, T0 checks, three parity captures, four sweeps) and the profiles in .build/decode-cpu/run-round2.sh'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, round 1: barrier period, read shape, flags, depth guard and CPU profiles'
tool: Tools/decode_sweep.py, Tools/decode_summary.py, Tools/expert_lookahead.py (capture, parity), macOS sample
---
Round 1 of the decode-path serialization line, opened on 2026-09-12 from a first-principles reading of the decode loop while the B0 cohort ran. Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Why

[[records/measurements/decode-wall-time-attribution-2026-09-10]] partitions decode into expert I/O 37.2%, GPU compute 30.1% and host categories 32.7%, summing to 100%. The code shows why nothing overlaps. Every MoE layer materializes its routing on the host (`idx.asType(.int32).asArray(Int32.self)` in `MoELayer.callAsFunction`), and every layer ends in a full evaluation (`eval(h)` in `runHiddenMulti`, commented as releasing pool references before the next layer's ensure scatters). That is two host-blocking synchronizations per layer, 96 per forward pass. The earlier optimization program rejected fifteen host-side accelerators on full-request materiality, the signature of a cost that is structural rather than local.

## Changes built into this binary

1. Pin generations. `SlotPins` can keep pins for several layer generations; `MoELayer` retires one generation per layer instead of unpinning everything; `runHiddenMulti` evaluates every K layers under `SLOTSTREAM_DECODE_BARRIER_LAYERS` (default 1, the original path) with K + 1 pin generations, so a slot an unevaluated gather still reads stays out of every victim scan. A pending router forecast still forces the barrier in this build.
2. Whole-record speculative reads. `SLOTSTREAM_EXPERT_PREFETCH_READ=record` makes a prefetch worker read the contiguous 2,764,800-byte record in one call and copy the nine pieces into the reserved slot, the shape the demand path already used; `piece`, the default, keeps nine reads.
3. Counters on the prefetch observation: `layersComplete` and `layersWithMisses` (layer events with no demand read, and with at least one), `recordReads` and `pieceModeReads`.
4. Checks: a pin-generation oracle (depths 1, 2, 3 and 5; depth one equal to unpin-all; a depth change keeps live pins) and whole-record checks (one read call, a byte-exact split against the piece oracle, fall back to piece reads when scratch is piece-sized).

A later change, deferred router-forecast consumption so the barrier can compose with prefetch, was written after this build and is not in it.

## Build, checks, exactness

    swift build -c release              Build complete! (103.22s)
    slotstream expert-lookahead-check   150 PASS, 0 FAIL

Exactness captures on the six correctness requests against the diagnostic shadow, each printing `PARITY PASS: exact output IDs, router digests and finish reasons on 6 requests`: the rebuild with no new controls; prefetch at the B0 setting with `SLOTSTREAM_EXPERT_PREFETCH_READ=record`; and `SLOTSTREAM_DECODE_BARRIER_LAYERS=4` with prefetch off.

## Sweeps

Driver `Tools/decode_sweep.py`, reusing the bench's preflight, model lock, 1,200 s arm timeout and swap accounting. Prompts r0005 (code), r0206 (prose) and r0096 (reasoning); 128 warmup and 256 measured outputs; configuration order rotated per cell; every configuration's output ids compared with its reference's. Ratios are paired: same request and round against the reference, then a geometric mean over pairs (see "Estimator correction").

Barrier period, prefetch off, reference K=1, 36 cells:

| K | paired ratio | pairs | range | median tps | median demand records | exact |
| --- | ---: | ---: | --- | ---: | ---: | --- |
| 8 | 1.051 | 6 | 1.030 to 1.068 | 12.95 | 31,063 | yes |
| 6 | 1.047 | 6 | 1.036 to 1.060 | 12.87 | 31,084 | yes |
| 4 | 1.040 | 6 | 1.029 to 1.057 | 12.75 | 31,087 | yes |
| 3 | 1.038 | 6 | 1.019 to 1.054 | 12.92 | 31,097 | yes |
| 2 | 1.025 | 5 | 1.019 to 1.036 | 12.58 | 31,123 | yes |
| 1 | 1.000 | 6 | reference | 12.32 | 31,160 | yes |

Tokens per verify pass were 2.40 at every K (2.45 on the five clean cells at K=2).

Read shape, prefetch at the B0 setting, reference piece reads, 30 cells:

| configuration | paired ratio | pairs | range | exact |
| --- | ---: | ---: | --- | --- |
| record reads, 16 lanes | 1.002 | 6 | 0.993 to 1.013 | yes |
| record reads, 24 lanes | 0.999 | 6 | 0.990 to 1.012 | yes |
| record reads, 8 lanes | 0.990 | 5 | 0.972 to 1.007 | yes |
| record reads, 4 lanes | 0.917 | 6 | 0.865 to 0.940 | yes |

Implemented but disabled flags, each on top of prefetch at the B0 setting, reference prefetch alone, one round, 30 cells: router weight cache 1.010 (three of three pairs positive), dense expert map 1.002, router top-k 1.002, direct read handles 1.002, resident overlap 1.001, shared overlap 1.001, floor cache 1.000, sparse pool pins 0.997, compiled norm finish 0.996. All 27 paired ratios: mean 1.0012, standard deviation 0.0101. Outputs exact throughout.

Draft depth, 36 cells: 24 failed closed with `Error: protocol pins SLOTSTREAM_DRAFT_DEPTH=2 but the process has 3` and the matching error at depths 1, 4 and 6. The legal configurations measured prefetch at depth 2 against no prefetch at depth 2: 14.01 against 12.31 tok/s, 1.138, demand records 15,690 against 31,160. A rerun with per-depth protocol variants is queued.

Layer completeness under prefetch at the B0 setting: 2.2% to 2.5% of layer events needed no demand read.

## Estimator correction

The first reading divided per-configuration medians taken across requests. The three prompts decode at different intrinsic rates (about 13.2, 13.9 and 14.9 tok/s), so that statistic reported the prompt mix: it put all nine flags at 1.010 to 1.023, most of it from one column where the reference had drawn the cold first position. Both tools now report paired per-(request, round) geometric means. The barrier result holds under the paired estimator; the flag results collapse to the values above.

## Profiles

macOS `sample` for 45 s during a 1,024-output decode of r0206 after 30 s of settling, run from `.build/decode-cpu/run-round2.sh` on this binary. Model-thread leaf frames bucketed by symbol (approximate, samples counted at the leaf):

| bucket | prefetch off | prefetch on |
| --- | ---: | ---: |
| GPU wait (IOKit user-client trap) | 69.7% | 73.5% |
| other host work | 15.6% | 16.4% |
| host locks and condition variables | 9.9% | 4.4% |
| allocation | 3.7% | 4.4% |
| memory copy | 1.1% | 1.3% |

Process-wide top of stack without prefetch: `__workq_kernreturn` 221,847, `__psynch_cvwait` 200,947 and `pread` 163,119, against 48 for `mlx::core::eval_impl` and 56 for AGX instruction encoding. An earlier profile attempt failed with `Error: protocol pins SLOTSTREAM_OPT_MTP_TAIL=0 but the process has <unset>` until the script exported the protocol environment.

## Interruptions

A pgrep-based chain meant to start round 2 matched the waiters' own command lines and idled the machine from about 16:30 to 18:27; rounds now run from one sequential script. A host shutdown was initiated at 18:44 during round 2's coverage sweep. The shutdown-stall stackshot at 18:44:51 shows the in-flight engine 44 s after fork at a 17.41 GB footprint, 13 worker threads in `pread` using 1.82 s of CPU over the 1 s sample and the model thread in the layer loop, with no panic or hang report: a busy process at shutdown, not the kernel I/O stall recorded in [[sources/runs/2026/09/2026-09-12-expert-lookahead-2-slot-adoption-screen]]. The coverage sweep keeps its ten completed cells and resumes from them.

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/` unless shown:

    6ab54523b379d64501ed91a777be43584d048d3b1ec09651e728038f62839c75  sweep-barrier/cells.jsonl
    76f191e302a41711a4cb157c30fd6c5bc1c4614bf632abc9ef385abca65d1f85  sweep-read/cells.jsonl
    2c0330ee6ac51cd9b575dab94e0c75a846a51a528fde15a467a7d3c55f0b1057  sweep-flags/cells.jsonl
    4fcd2848e315245bbf38c121fcdf4736c8a571313a443c1a2333c67997c913fa  sweep-depth/cells.jsonl
    3b1da0bd5b06babc17f1adaa3c79074b9fdb8d3e9e42e9a068d30e852bf84331  profile-base/sample.txt
    5cfbc0ee7b63acca734de1c5e81d31465741401c8434ad7789e7b31ef7e02546  profile-pf/sample.txt
    31584ab51037122bf2ebbc14d3ee2dbbfcb401cbb4cb950df32213c7e56afeca  parity-rebuild/parity.json
    78f3ff27c3569ecc3c253d243456eae74e8303399dffbfdcbc24667a32b53868  parity-record/parity.json
    4b2187dd866fd9710520a48af83b2ba895779ed92ec145198e81006253f850ea  parity-barrier4/parity.json
    f0c940bc0701721cebae5ac0572e97e29ee01194943b49c0bae150fb6b9ec10f  check.log
    720739423f86e1114f6462f57182bd85ffd220bc9c433ca7dda37f87b17b6722  Tools/decode_sweep.py (current file; the sweeps ran an earlier revision without the per-config protocol and paired-ratio changes)
    282bf12ca642feb60707a381ccc588387d7bc86fa4b650ddf32f7a6be64ecbcc  Tools/decode_summary.py (with the paired estimator)
