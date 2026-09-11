# Testing

Checks in `SlotstreamDiagnostics` return a `CheckReport`. The CLI, test
runner, and host apps use those same functions.

Choose a suite based on what you have installed:

```bash
make checks          # the tier that needs nothing: no GPU, no weights, no network
make checks-all      # adds the MLX tier
make test            # Tools/verify.sh, the acceptance battery against real weights
make context-test    # isolated context policy + proxy fixtures; no MLX or weights
make coverage        # line coverage of the library
python3 Tools/process_memory_gate.py  # native CPU/GPU peak accounting, no model
python3 Tools/memory_override_gate.py # CLI override matrix on simulated Macs
```

The native process-memory regression compiles the production counter and uses
small Metal buffers. It checks that peaks survive buffer release, persistent
and temporary allocations remain distinguishable, concurrent reads retain the
high-water, and an older or invalid kernel reply cannot become a bogus peak.
The static gates run it automatically. Request samples remain separate from
the process-lifetime counter; the memory acceptance gate checks both when the
native lifetime observation is present.

## Memory acceptance and macOS paging

Correctness and process-memory acceptance do not require unchanged system-wide
swap counters. Those counters include every app on the Mac and cannot attribute
paging to Slotstream. The speculative, governor and context diagnostics record
`swap_clean` separately; the memory assessor reports `global_swap_deltas`.
Neither field overrides a completed correctness check or an observed process
footprint within its budget. Unavailable paging observations are not evidence
of a clean interval.

Real headroom checks, process-memory ceilings, OS pressure cancellation,
allocation safeguards and required output remain mandatory. Paging can still
indicate system contention, so retain the observations and investigate actual
pressure or loss of responsiveness. A passing functional run with paging does
not qualify clean benchmark timings. Performance studies keep their declared
exclusion rules; frozen historical results are not regraded under this policy.
See the [decision](../db/records/decisions/global-paging-is-diagnostic.md).

## Configurable context without a model

`make context-test` compiles the production planner, feasibility solver,
schedule and request controller with inert device observers. It uses the
existing allocation golden and process/transport fixtures. It needs Python
and a Swift compiler, but does not invoke SwiftPM, load MLX, touch weights,
start a server or simulate pressure on the host. The dedicated
`context-proxies` CI workflow runs this same command.

Every run writes a fresh report and raw logs. Set `CONTEXT_TEST_OUT` to choose
the directory. Reports bind the exact tested source and driver bytes, map
each acceptance case to its proxy scope, and list its deferred native checks.
Missing prerequisites or failing checks fail the command. Proxy success never
certifies tensor numerical parity, model capacity, speed, answer quality, a
real client installation or a release.

To check explicit windows against an already built candidate without a new
compile or model launch:

```bash
python3 -m unittest discover -s Tools -p context_window_matrix_test.py
python3 Tools/context_window_matrix.py \
  --binary /path/to/candidate/slotstream --out .build/context-window-matrix
```

The candidate needs its build identity, source archive and Metal library beside
it. This command invokes only `doctor` with simulated device metadata and
`prefill-schedule`. It checks the public ceiling, allocation ledger, cold and
continued scheduling, padded attention bounds and overflow refusals. Its report
identifies any source differences between the candidate and the current checkout;
it does not turn an older candidate's result into current-source build evidence.
These checks do not load the model or establish native capacity.

Create a portable source handoff without a binary or model:

```bash
python3 Tools/context_acceptance.py prepare --out .build/context-handoff
```

The handoff contains a source archive, its hashes, the acceptance inventory,
the original capacity profiles and explicit external dependencies. Preserve
the handoff manifest outside the extracted source. On the intended test Mac,
extract into a fresh directory, review the manifest, restore the pinned model,
and build that exact source with the normal `make build` procedure. The archive
contains the source and fixtures for the proxy/capacity workflow; the complete
repository brain/docs and independently installed clients remain dependencies
of the broader release battery.

Bind the new candidate and model on that target, then explicitly run native
capacity qualification there:

```bash
python3 Tools/context_acceptance.py bind \
  --handoff /path/to/context-handoff/handoff.json \
  --binary .build/release/slotstream --model /path/to/pinned-model \
  --out .build/context-binding
python3 Tools/context_acceptance.py run-capacity \
  --binding .build/context-binding/binding.json \
  --out .build/context-native --execute-on-target
```

Binding reads metadata and calls only `context-check --plan-only`. It checks
the candidate's source archive against the handoff; an older binary cannot
stand in for changed source. The native command runs the required governor
and combined draft/image resource checks, then the frozen incremental capacity
profiles in order. It preserves original retained warm-up lengths, verifies
model payloads, rechecks identities and real readiness, and stops the entire
campaign at the first failed stage. It never refreshes a failed baseline or
retries silently. Rebinding on a different host captures that host's model
metadata without changing the frozen workload.

Capacity success still leaves numerical, final API/client, installed release
and rollback acceptance separate. The catalog names those remaining checks;
the public context ceiling changes only after its native qualification. There
is no background model waiter and no automatic hardware fallback from the
software command.


## Building from source

To build from source, install Apple's Command Line Tools, then run:

```bash
git clone https://github.com/carloslfu/slotstream
cd slotstream
make build
make checks
```

`make checks` runs without weights, network access, or a GPU. `make checks-all`
adds the MLX tests. `Tools/verify.sh` tests against the real model, including
reference comparisons, cache resizes, speculative decode, and server
regressions. [Testing](TESTING.md) explains the suites and coverage gaps;
[Contributing](../CONTRIBUTING.md) covers the development workflow.

Release builds come from tagged commits in GitHub Actions. After downloading
a release archive, you can verify its provenance with the GitHub CLI:

```bash
gh attestation verify slotstream-arm64.tar.gz --repo carloslfu/slotstream
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

The full live-governor drill is a separate bounded exception: its normal
1 GB shrink and 2 GB grow deadbands require a starting arena larger than the
ordinary 10 GB tests. `verify.sh` uses `elastic-drill --slots 1000
--max-memory-gb 13`, after checking 16 GB reclaimable. The command independently
checks its derived total target plus 3 GB spare, each controlled poll and
generation and actual process-memory peaks, and records global paging separately. It preserves the real
cooldown and exact output checks. A skipped drill fails full acceptance.
Run this gate without other heavy work. Full model hashing holds the same
process exclusion lock as inference and must pass before native acceptance.

MTP diagnostics require and price the draft head before Engine allocation,
including when their `--mtp` option is left at `auto`; explicit `off` is
incompatible. The full `mtp-check` includes vision and uses an explicit 12 GB
target after a 15 GB reclaimable preflight. Its text-only leg can be selected
with `--vision off` under the ordinary 10 GB test target. A text-only pass does
not prove the combined image/MTP leg.

The full original vision-serving photographs need a separate profile:
`--memory-gb 14.5` with `SLOTSTREAM_PREFILL_CHUNK=3072`, MTP off, and a
20.5 GB real reclaimable preflight. The explicit workspace covers the larger
image's attention buffers while retaining the original photographs and
assertions. The old 10 GB profile correctly refuses that image before
dispatch. This override applies only to the full image server; ordinary
quality gates keep their smaller target. Successful and nonempty responses
are required before different-image answers count as content evidence.

### The Metal library

MLX finds its shaders beside the executable that is running, through `dladdr` on
its own code. `make build` puts `mlx.metallib` in `.build/release`, which the CLI
and the runner share, so T1 works there with no extra step. A test bundle would
need its own copy in `.xctest/Contents/MacOS/`. Without it the first MLX call
fails with `Failed to load the default metallib`.

The LCOV path also runs instrumented transport fixtures over real loopback
HTTP, including malformed responses, resumability, raw-source compatibility,
and sustained-memory bounds. Their line hits are combined with the catalogue;
network code is no longer represented only by weights-free catalogue coverage.

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

## OpenAI agent integration

The `openai-conversation`, `openai-tool-output`, and `openai-context-budget`
catalogue checks cover request/history semantics, complete-call publication,
stream equivalence, and the separate default/maximum context budgets.

Against an already-running server, run `python3 Tools/openai_tools_gate.py
--output /tmp/openai-tools.jsonl`. This exercises the real model and HTTP/SSE
wire contract and saves every request and response. It supplies fixed tool
results after validating calls, without executing model-authored commands.
The [Hermes guide](HERMES.md) covers the real-client configuration and fixture
read. Run the ordinary API, gateway, and image gates when changing shared
serving code.

For an installed Hermes source checkout with its own environment:

```sh
/path/to/hermes/.venv/bin/python Tools/hermes_config_gate.py \
  /path/to/hermes /tmp/hermes-config-check
/path/to/hermes/.venv/bin/python Tools/hermes_integration_gate.py \
  /path/to/hermes /tmp/hermes-slotstream-check --compress --long-output --contaminated
```

Both gates read the configuration from the guide and use Hermes's CLI agent
initialization. The configuration gate uses synthetic HTTP responses with real
network access disabled. It checks output limits, optional reasoning, stale
custom-provider settings, an explicit profile override, missing/disabled providers, unavailable endpoints,
title fallback, auxiliary timeouts, and preservation after failed summaries.
Run it separately against each supported Hermes checkout.

The integration gate uses a real model and requires the larger context in the
Hermes guide. To check the guide's automatic planning, start the server with
`slotstream serve --max-context 65536`, following the repository's model-process
and memory-safety rules. The gate records the running server's memory plan and
checks its context. Add `--expect-mtp on` or `--expect-mtp off` to require the
selected state when qualifying that path; a planning-only `doctor` result does
not prove which path an integration run exercised. It creates an isolated
Hermes home, denies non-loopback Python network connections, permits only the
fixture's `cat` command through the actual Hermes tool dispatcher, and checks
the real agent, title fallback, compaction, and recall. `--long-output` also
requires a complete reply beyond the ordinary server default, with tools disabled
for that probe. `--contaminated` adds stale generic-provider settings.
`--cli` checks the actual CLI entry point instead of the multi-turn scenario;
run it separately. Raw HTTP and result records stay in the output directory.
Add `--image Tools/assets/vision_test/secret1.jpg` to check Hermes's own vision
discovery and an actual image turn. The server must have enough memory for both
the configured context and the vision tower. The OpenAI gate's `--vision` option
also checks image tool calls and the advertised capability.

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
| `WeightDownload.swift` | 642 | 0% | Historical coverage snapshot. The dedicated `Tools/slotpack/checks.py` gate now exercises real HTTP multi-chunk raw and compressed pulls, resume, corruption, fallback, cancellation, optional-file races, file safety, and manifest/codec bounds. |
| `Layers.swift`, `ExpertStore.swift`, `Engine.swift`, `Checkpoint.swift`, `Model.swift`, `NgramStore.swift`, `GatedDelta.swift` | ~2,900 | 0–3% | The model. These need a checkpoint. On the dev Mac they are covered by parity against the Python reference and by the byte-equality gates; a synthetic checkpoint would bring that to CI. |
| `Generate.swift` | 388 | 19% | The sampler is covered; the prefill and decode loops, and the sweep's admission and cache-cap hooks, run only with the model loaded. Gated by `sweep-check` and `Tools/verify.sh`. |
| `Governor.swift` | 213 | 27% | The policy is fully covered as a pure function. The live loop — poll, decide, lock, resize — still needs an engine to resize. |

The snapshot covers the weights-free runner. Tests against the real model,
such as `verify.sh` and `api_robustness.sh`, exercise additional paths locally;
those runs aren't included in this coverage percentage.

## Download transport gates

`Tools/static_gates.sh` runs `python3 Tools/slotpack/checks.py` without the
model. Its native harness compiles exact production sources into an immutable
per-run executable. The gate includes AddressSanitizer/UndefinedBehaviorSanitizer
codec checks, manifest identity and coverage, real HTTP fault injection, and
legacy raw multi-chunk compatibility. Receipts include source and binary hashes.

A new package also requires a full original-hash-checked offline build, an
independent public CDN reconstruction through the actual CLI default, and a
model-load smoke test before release. See [DOWNLOAD-FORMAT.md](DOWNLOAD-FORMAT.md)
for the producer, full-pull, and libFuzzer tools. Full transfer timings are
diagnostic unless the machine and network conditions qualify as a benchmark.

## Configurable context gates

`Tools/context_gates.py --report result.json` compares frozen default allocation
fields and validates CLI bounds, metadata, complete schedules and strict tool
termination without loading weights. `Tools/consumer_smoke.sh` compiles the
original public function signatures as an external package.

The native `optimization-state-check --variant context-serving --json` injects
memory and monotonic-clock failures through real HTTP handlers and a single
floor-sized model, including queued requests and subsequent recovery. Variants
`context-small-projections-64` and `context-small-projections-128` exercise the
complete bounded arithmetic family with a prospectively fixed rechunking
control, repeated state checks and rollback/continuation checks. The matching
`partial`, `prefix`, `shorttail` and `sparse-prefix` variants cover boundaries
and reused state. These are correctness gates; their synthetic prompts do not
demonstrate answer quality.

`Tools/context_qualification.py` accepts a frozen binary/model-window protocol
and advances through strictly increasing prompt lengths only when the preceding
rung completes its required output within its planned memory and independent
wall-clock limits. Global paging remains diagnostic. The protocol binds the driver files,
reconstructible build, pinned model manifest and model directory observations;
the runner fully verifies model payload hashes before inference. It checks
actual physical query rows and padded key extents as well as prompt and
delivered output IDs. The retained protocol additionally requires completed,
interleaved warm conversations and exact observed cache ownership.
`Tools/context_qualification_checks.py` verifies refusal of incomplete,
over-budget and malformed evidence, including stopping after a failed rung.
It preserves the first counterexample and
never retries or changes the protocol. Full-window capacity, numerical parity,
latency calibration, advertised MTP/vision combinations and real clients remain
separate acceptance requirements in the engineering plan.

`Tools/gateway_client_gate.mjs <sdk-root> <output-dir> <port> <context>` uses
the separately installed, published `ai` and `@ai-sdk/gateway` packages. It
records their versions and checks discovery, streaming and a complete tool
round trip through an allowlisted fixture read. Requests stay on the selected
loopback server. This successful-client check does not replace the strict
receiving-side terminal and authority gates.

## Measure your Mac

Allow about ten minutes once the weights are downloaded. For comparable speed
results, reduce competing load and exclude timing intervals affected by paging.
Functional checks may run with apps open when real memory safeguards permit
them. Run one model process at a time.

1. Install or upgrade, then record the version:

   ```bash
   curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
   slotstream --version
   ```

2. Print the plan. Copy the whole `slotstream memory plan` block; it carries
   the device line, the target, and the cache size:

   ```bash
   slotstream doctor
   ```

3. One cold generation. This offers the download on first use. When it
   finishes, `run` prints `--` lines to stderr: prefill, decode, and the
   expert-cache line that ends with the peak. Copy all of them.

   ```bash
   slotstream run --greedy --max-tokens 128 --prompt "Explain how a hash map works, in about 200 words."
   ```

4. Warm decode. Start the server in one terminal:

   ```bash
   slotstream serve
   ```

   In another, send the same request three times and keep all three
   results. The third is the warm number. If you would rather not run the
   Python one-liner, the JSON carries `eval_count` and `eval_duration` in
   nanoseconds; decode tok/s is the first divided by the second, times a
   billion.

   ```bash
   for i in 1 2 3; do
     curl -s localhost:11434/api/generate -d '{
       "model": "qwen3.8-flash-next:4bit",
       "prompt": "Explain how a hash map works, in about 200 words.",
       "stream": false,
       "options": {"temperature": 0, "num_predict": 128}
     }' | python3 -c 'import json,sys; d=json.load(sys.stdin); print("decode %.2f tok/s, prefill %.1f tok/s" % (d["eval_count"]/d["eval_duration"]*1e9, d["prompt_eval_count"]/d["prompt_eval_duration"]*1e9))'
   done
   ```

   Press **Ctrl+C** in the server terminal before the next step.

5. Measure a long prompt. It reports time, speed, and peak memory, checking
   available memory between passes. Use 4096 tokens on a small Mac.

   ```bash
   slotstream context-check --tokens 8192
   ```

6. Open a [measurement report](https://github.com/carloslfu/slotstream/issues/new?template=measurement-report.yml)
   and paste the raw output from steps 1 to 5, plus the Mac model, the SSD,
   the macOS version, what else was open, and whether the fans ran or the
   machine throttled.

Single runs vary by 15% or more on a loaded machine. If two runs disagree by
that much, say so rather than picking the better one.
