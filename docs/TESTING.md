# Testing

Checks in `SlotstreamDiagnostics` return a `CheckReport`. The CLI, test
runner, and host apps use those same functions.

Choose a suite based on what you have installed:

```bash
make checks          # the tier that needs nothing: no GPU, no weights, no network
make checks-all      # adds the MLX tier
make test            # Tools/verify.sh, the acceptance battery against real weights
make coverage        # line coverage of the library
```

## Why there is no `swift test`

The supported Command Line Tools setup lacks XCTest and Swift Testing.
The project uses a plain executable, `slotstream-checks`, so contributors
can run checks without installing Xcode. CI uses the same runner.

```bash
.build/release/slotstream-checks --list
.build/release/slotstream-checks --tier t0 --tier t1
.build/release/slotstream-checks --filter http --json
```

## Tiers

Tiers group checks by their dependencies. Choose the tiers your machine can
run; a T0 pass covers only T0.

| Tier | Needs | Runs |
|---|---|---|
| **T0** | Nothing. Pure Swift. | Every push |
| **T1** | MLX, and so the Metal library beside the runner | Every push |
| **T2** | The pinned tokenizer fixture | Not yet built |
| **T3** | A synthetic checkpoint | Not yet built |
| **T4** | The real 105 GB of weights | The dev Mac, per release |

**Run tiers above T0 sequentially.** Several checks in one process can still
allocate memory at the same time, despite the guard against multiple model
processes. Use the small explicit targets in `Tools/verify.sh` and check
available memory before a model test.

### The Metal library

MLX finds its shaders beside the executable that is running, through `dladdr` on
its own code. `make build` puts `mlx.metallib` in `.build/release`, which the CLI
and the runner share, so T1 works there with no extra step. A test bundle would
need its own copy in `.xctest/Contents/MacOS/`. Without it the first MLX call
fails with `Failed to load the default metallib`.

## What runs where

| Suite | What it covers | Weights | Where |
|---|---|---|---|
| `slotstream-checks` (T0/T1) | prefill schedule, context policy, runtime and cache bounds, governor policy, pull integrity, machine planning, HTTP framing and routing, vision geometry, request shaping and the embedding splice, sampler behaviour | no | CI + local |
| `Tools/static_gates.sh` | shell and python syntax, doc parity, fixture digests, manifest digests, planner gates, installer gates | no | CI |
| `Tools/sampler_gates.sh` | the sampler against a numpy reference, and the governor's branches | no | CI |
| `Tools/consumer_smoke.sh` | a package outside the repository can import and use the library | no | CI |
| `Tools/verify.sh` | the acceptance battery: provenance, goldens, byte-equality across cache sizes and live resizes, MTP, the memory promise, long context | **yes** | dev Mac |
| `Tools/api_robustness.sh` | Serving regressions against a live server | **yes** | dev Mac |
| `Tools/vision_ref.py` | the vision tower against an independent float32 implementation of the reference | tower only (0.9 GB) | dev Mac |
| `Tools/vision_serving.py` | every dialect with a real picture, against a live server | **yes** | dev Mac |
| `Tools/e2e_release.sh` | the installed release, end to end | **yes** | dev Mac, per release |

<a id="why-vision-needs-two-of-those"></a>

### Vision checks

A faulty image encoder can produce embeddings with the correct shape while
losing the image content. `Tools/vision_ref.py` compares the encoder with an
independent implementation. `Tools/vision_serving.py` checks the full request
path by requiring the model to identify the photograph's content.

The encoder comparison allows numerical variation from bfloat16 arithmetic.
The tolerance comes from comparing the reference at float32 and bfloat16;
slotstream must stay within that band. The two independent float32
implementations agree to 0.99996. These checks test implementation correctness,
not general vision accuracy.

## Coverage

```bash
Tools/coverage.sh t0 t1 --lcov coverage.info
python3 Tools/coverage_ratchet.py coverage.info
```

`swift test --enable-code-coverage` is not available here, so the runner is
built with the profiling instrumentation directly and `llvm-cov` reads what it
wrote; the CLT ships `llvm-profdata` and `llvm-cov`, just not the test modules.

`Tools/coverage-floor.json` sets a minimum for each file. This catches a loss
of coverage in an existing file even if new code raises the overall
percentage. Use `--update` only for a deliberate change, with an explanation
in the commit.

<a id="where-the-coverage-is-not"></a>

### Initial coverage snapshot

The table below records the initial weights-free suite: 21.73% of 7,138
library lines, from 121 assertions. It is a historical snapshot, not a current
coverage report. Run the commands above for the current checkout.

| File | Lines | Covered | Why the rest is not |
|---|---|---|---|
| `Server.swift` | 1,132 | 6% | The socket loop and the request handlers. The framing, routing and CORS rules are split out and covered; the handlers still need an engine to answer with. |
| `WeightDownload.swift` | 642 | 0% | The download engine. It needs a server to talk to. A local Range server would reach resume, mirror fallback and the sources override, which have no gate at all today. |
| `Layers.swift`, `ExpertStore.swift`, `Engine.swift`, `Checkpoint.swift`, `Model.swift`, `NgramStore.swift`, `GatedDelta.swift` | ~2,900 | 0–3% | The model. These need a checkpoint. On the dev Mac they are covered by parity against the Python reference and by the byte-equality gates; a synthetic checkpoint would bring that to CI. |
| `Generate.swift` | 388 | 19% | The sampler is covered; the prefill and decode loops, and the sweep's admission and cache-cap hooks, run only with the model loaded. Gated by `sweep-check` and `Tools/verify.sh`. |
| `Governor.swift` | 213 | 27% | The policy is fully covered as a pure function. The live loop — poll, decide, lock, resize — still needs an engine to resize. |

The snapshot covers the weights-free runner. Tests against the real model,
such as `verify.sh` and `api_robustness.sh`, exercise additional paths locally;
those runs aren't included in this coverage percentage.
