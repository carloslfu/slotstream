# Testing

Every check has one body, in `SlotstreamDiagnostics`, and three ways to run it:
the CLI subcommand a user runs, the catalogue CI runs, and a host app that wants
to verify its own installation. A check is not a script that greps output; it
returns a `CheckReport` and the callers render it.

```bash
make checks          # the tier that needs nothing: no GPU, no weights, no network
make checks-all      # adds the MLX tier
make test            # Tools/verify.sh, the acceptance battery against real weights
make coverage        # line coverage of the library
```

## Why there is no `swift test`

The Command Line Tools toolchain ships neither XCTest nor Swift Testing. Xcode
has both, but requiring Xcode to run the tests would mean the project's own
contributors could not run them — and `CONTRIBUTING.md` deliberately supports a
CLT-only build, which is exactly why the Makefile fetches a prebuilt metallib.

So the catalogue is a plain executable, `slotstream-checks`. It runs anywhere
Swift builds, it is what CI runs, and it reports each check by name.

```bash
.build/release/slotstream-checks --list
.build/release/slotstream-checks --tier t0 --tier t1
.build/release/slotstream-checks --filter http --json
```

## Tiers

A tier says what a check needs from the machine, so a run on a laptop with no
weights is a pass rather than a confusing failure.

| Tier | Needs | Runs |
|---|---|---|
| **T0** | Nothing. Pure Swift. | Every push |
| **T1** | MLX, and so the Metal library beside the runner | Every push |
| **T2** | The pinned tokenizer fixture | Not yet built |
| **T3** | A synthetic checkpoint | Not yet built |
| **T4** | The real 105 GB of weights | The dev Mac, per release |

**Tiers above T0 are never run concurrently.** The per-user process guard stops
a *second process* from loading a model, but it deliberately permits several
model objects inside one process — its own comment says so. Nothing else would
stop two checks stacking GPU allocations on a shared machine, and stacking
memory-heavy processes is what crashed this Mac on 2026-08-28.

### The Metal library

MLX finds its shaders beside the executable that is running, through `dladdr` on
its own code. `make build` puts `mlx.metallib` in `.build/release`, which the CLI
and the runner share, so T1 works there with no extra step. A test bundle would
need its own copy in `.xctest/Contents/MacOS/`. Without it the first MLX call
fails with `Failed to load the default metallib`.

## What runs where

| Suite | What it covers | Weights | Where |
|---|---|---|---|
| `slotstream-checks` (T0/T1) | prefill schedule, context policy, runtime and cache bounds, governor policy, pull integrity, machine planning, HTTP framing and routing, sampler behaviour | no | CI + local |
| `Tools/static_gates.sh` | shell and python syntax, doc parity, fixture digests, manifest digests, planner gates, installer gates | no | CI |
| `Tools/sampler_gates.sh` | the sampler against a numpy reference, and the governor's branches | no | CI |
| `Tools/consumer_smoke.sh` | a package outside the repository can import and use the library | no | CI |
| `Tools/verify.sh` | the acceptance battery: provenance, goldens, byte-equality across cache sizes and live resizes, MTP, the memory promise, long context | **yes** | dev Mac |
| `Tools/api_robustness.sh` | 68 serving-layer regressions against a live server | **yes** | dev Mac |
| `Tools/e2e_release.sh` | the installed release, end to end | **yes** | dev Mac, per release |

## Coverage

```bash
Tools/coverage.sh t0 t1 --lcov coverage.info
python3 Tools/coverage_ratchet.py coverage.info
```

`swift test --enable-code-coverage` is not available here, so the runner is
built with the profiling instrumentation directly and `llvm-cov` reads what it
wrote; the CLT ships `llvm-profdata` and `llvm-cov`, just not the test modules.

The ratchet holds a **per-file** floor in `Tools/coverage-floor.json`, not a
single number, because one number hides the case it exists to catch: new
well-covered code masking a regression in older code. A deliberate drop is
`--update` plus an explanation in the commit.

The percentage is a ratchet, not a target. What matters is which lines are
uncovered and why.

### Where the coverage is not

21.73% of 7,138 library lines, from 121 assertions that need no weights. The
percentage on its own says little; these are the gaps and the reason for each,
largest first.

| File | Lines | Covered | Why the rest is not |
|---|---|---|---|
| `Server.swift` | 1,132 | 6% | The socket loop and the request handlers. The framing, routing and CORS rules are split out and covered; the handlers still need an engine to answer with. |
| `WeightDownload.swift` | 642 | 0% | The download engine. It needs a server to talk to. A local Range server would reach resume, mirror fallback and the sources override, which have no gate at all today. |
| `Layers.swift`, `ExpertStore.swift`, `Engine.swift`, `Checkpoint.swift`, `Model.swift`, `NgramStore.swift`, `GatedDelta.swift` | ~2,900 | 0–3% | The model. These need a checkpoint. On the dev Mac they are covered by parity against the Python reference and by the byte-equality gates; a synthetic checkpoint would bring that to CI. |
| `Generate.swift` | 388 | 19% | The sampler is covered; the prefill and decode loops, and the sweep's admission and cache-cap hooks, run only with the model loaded. Gated by `sweep-check` and `Tools/verify.sh`. |
| `Governor.swift` | 213 | 27% | The policy is fully covered as a pure function. The live loop — poll, decide, lock, resize — still needs an engine to resize. |

None of this is untested: `verify.sh` and `api_robustness.sh` exercise most of
it against the real model. It is untested *on CI*, which is a weaker and
different claim, and the table says which is which.
