# Testing

Checks in `SlotstreamDiagnostics` return a `CheckReport`. The CLI, test
runner, and host apps use those same functions.

Choose a suite based on what you have installed:

```bash
make checks          # build, then run T0: no GPU, weights or network during the checks
make checks-all      # adds the MLX tier
make test            # Tools/verify.sh, the acceptance battery against real weights
make context-test    # isolated context policy + proxy fixtures; no MLX or weights
make coverage        # line coverage of the library
python3 Tools/process_memory_gate.py  # native CPU/GPU peak accounting, no model
python3 Tools/memory_override_gate.py # CLI override matrix on simulated Macs
```

The initial build can download Swift packages and the prebuilt Metal library.
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

`make checks` builds first, which can need network access, then runs T0
without weights, network access or a GPU. `make checks-all` adds the MLX tests.
`Tools/verify.sh` tests against the real model, including
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

The battery also requires `elastic-drill --memory-limit-gb 10
--max-memory-gb 10 --mtp off`. This checks that a small cache recovers after
pressure even when the lost cache is below the normal growth threshold.
It preserves both cooldowns, the saved ceiling and exact output. The public
adaptive-server gate separately checks startup, the production timer,
status metadata and a completed request; its `--limit-gb` and `--no-elastic`
options cover fractional limits and explicitly pinned serving.

MTP diagnostics require and price the draft head before Engine allocation,
including when their `--mtp` option is left at `auto`; explicit `off` is
incompatible. The full `mtp-check` includes vision and uses an explicit 12 GB
target after a 15 GB reclaimable preflight. Its text-only leg can be selected
with `--vision off` under the ordinary 10 GB test target. A text-only pass does
not prove the combined image/MTP leg. `mtp-rowcheck` runs under the ordinary
10 GB target: it synthesizes one prompt below and one above the indexer budget
and requires that, in the exact mode, every row of a two-row and a three-row
verify pass reproduces the one-row pass at its position in the same mode bit
for bit, and that a three-row pass leaves the state three one-row passes leave
(checked through the next token's logits); the stock pass's deviation is
printed beside it. The shorter prompt is extended to just below 1,024 keys and
its positions advance one token at a time across that count, where the
backend switches attention kernels. The weights-free `verify-pass-rows` check
(T1) holds the kernels: every dense matmul shape, the exact mode's attention
at each key count where the backend changes kernels or block layout, its
indexer selection with tied blocks at the budget, and quantized products of
up to five rows. It also counts what the split and whole-pass paths change at
those points.

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

Each push and pull request runs the workflows for what it changes. `ci.yml`
builds and checks the engine. `sevra-mac.yml` checks the Mac app in
`apps/macos`, and also runs for engine changes because the app builds on the
engine. `context-proxies.yml` covers the context proxies, and `docs.yml` the
documentation and the brain.

| Suite | What it covers | Weights | Where |
|---|---|---|---|
| `slotstream-checks` (T0/T1) | prefill schedule, context policy, runtime and cache bounds, governor policy, pull integrity, machine planning, HTTP framing and routing, vision geometry, request shaping and the embedding splice, sampler behaviour, persistent prefix policy, state files, rows shared across turns, a shared head surviving the conversation's own checkpoint at its boundary, eviction and directory maintenance | no | CI + local |
| `Tools/static_gates.sh` | shell and python syntax, doc parity, fixture digests, manifest digests, planner gates, installer gates | no | CI |
| `Tools/sampler_gates.sh` | the sampler against a numpy reference, and the governor's branches | no | CI |
| `Tools/consumer_smoke.sh` | a package outside the repository can import and use the library | no | CI |
| `Tools/check_sevra_mac.sh` | the Mac app over scripted inference in disposable Homes: runtime, sources and the sandboxed document helper, reviewed changes, knowledge bases, skills, mini-apps, and offscreen checks of the production views | no | CI + local |
| `Tools/build_sevra_xcode.sh` | the Xcode project builds for Apple silicon, ad hoc signed, with the package versions the checks use and the helper, dbmd and Metal library in the bundle | no | CI |
| `Tools/verify.sh` | the acceptance battery: provenance, goldens, byte-equality across cache sizes and live resizes, MTP, the memory promise, long context | **yes** | dev Mac |
| `Tools/api_robustness.sh` | Serving regressions against a live server | **yes** | dev Mac |
| `Tools/issue21_gate.py` | Chat Completions caps with and without tools, incremental truncated scalar/nullable-string arguments, compatible branch selection and later-turn reuse when reasoning is omitted, terminal usage and process survival | **yes** | dev Mac, already-running server |
| `Tools/issue21_e2e.py` | issue-21 and OpenAI compatibility gates plus exact conversation replay after restart; saves requests, SSE, commands and cleanup receipts | **yes** | `Tools/verify.sh`, owns one bounded server at a time |
| `Tools/issue21_long_context.py` | long tool-enabled conversations, advancing disk reuse when reasoning is omitted, and identical prompt/output after a real restart; captures raw SSE and progress logs | **yes** | dev Mac, owns one bounded server at a time |
| `sevra-mac-checks --real-basics` | the Mac app's basic jobs with the real model: a PDF answer, a reviewed edit, a mini-app and an attached file | **yes** | dev Mac |
| `optimization-state-check --variant persistent-prefix[-mtp]` | a persisted state restores with the saved representation; a disk hit continues exactly like a memory hit; that continuation, written as reused plus new rows, restores exactly; a regenerated reply resumes the kept parent; a request that keeps its state off disk writes nothing; draft cache included | **yes** | dev Mac |
| `optimization-state-check --variant shared-prefix[-mtp]` | a prompt's system message is kept during its own prefill at the last 256-token pass end at or before its boundary, forked into memory and written to disk as a shared prefix; a second conversation reuses it from memory and a fresh cache restores it from disk, both continuing exactly like the cold prompt; a prompt sharing only a head with a kept state writes that head; a `sharedPrefixTokens` hint replaces the system boundary; a request kept off disk writes nothing; the shared prefix outlives later turns and is classed after conversations; draft cache included | **yes** | dev Mac |
| `Tools/shared_prefix_e2e.py` | shared prefixes through `serve`: the first conversation writes its system prompt during prefill; a second one in the same process reuses it from memory; a restarted server restores it from disk; a conversation whose system prompt shares only a head writes that head and its own system prompt; another restarted server reuses those; later turns leave the shared prefixes in place and `prefix-cache` lists them; reused conversations' output ids equal a server without a prefix cache exactly | **yes** | dev Mac |
| `Tools/persistent_prefix_e2e.py` | the disk prefix cache through `serve` over three turns: later turns write only their new rows; a restarted server must restore the turn-2 state from its segments and match the first server's turn-3 prompt and output ids exactly; another restarted server regenerating turn 3 must restore the kept parent and match again; `prefix-cache` lists and clears copies; a cold server shows the prompt cost it saves | **yes** | dev Mac |
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
stream equivalence, and the separate default/maximum context budgets. The
`responses-request`, `responses-events`, `responses-codex-tools`, and
`responses-codex-fixture` checks cover the Responses API that Codex uses:
item and tool parsing, the event stream and its response object, Codex's
real tool schemas, and a captured Codex first-turn request. The
`anthropic-request` and `anthropic-events` checks cover the Messages API that
Claude Code uses, with fixtures in the shapes Claude Code 2.1.270 sends: the
system prompt and its attribution line, tool loops with replayed thinking
signatures, images, documents and errors, and the streamed events and
non-streamed message. `think-split-stream` checks that streamed reasoning and
answer split exactly as a whole reply does, wherever deltas break.
`serving-edges` covers tool arguments the model writes out of range, stop
sequences after reasoning, and the request line of refused requests.
`launch-plans` builds every `slotstream launch` plan without a server, tool or
file system: the connection each agent receives, the routes to cloud
providers each plan closes, Codex's `-c` placement under its subcommands, the
Pi models file edited in place with its order and numbers kept, the opencode
configuration, Hermes's folder, profile and side-task pins, dry-run redaction,
and the refusals. `launch-server` covers the server `slotstream launch`
starts: its command line, paths and messages, when a running server is
restarted or left alone, the agent picker, the `/slotstream/status` body, and
the idle policy with a fake clock and fake processes, including a process id
reused by another program and a child that exited but was not collected.

`slotstream launch` itself is accepted against a real model with every agent
installed:

```sh
AGENT_PATH=/path/with/claude/codex/pi/opencode/hermes/and/node \
  Tools/coding_agents_gate.sh .build/arm64-apple-macosx/release/slotstream /tmp/coding-agents
```

It starts one server at `MEMORY_GB` (default 12) behind
`Tools/token_usage_proxy.py`, which records each request's prompt and reused
tokens. Each agent, in a throwaway home, creates `hello.txt` with the line
`SLOTSTREAM OK` and reads it back in one session, then reads a note in a
second session that must start from the instructions the first one read;
Claude Code also reads a picture, and runs again across a server restart
with `--prefix-cache-dir`. The Anthropic Python SDK's stream accumulator, a
tool result and a token count run against the same server when
`ANTHROPIC_SDK_PYTHON` names a Python that has the SDK. Name phases after the
output folder to run only some of them; `FAKE=1` swaps the model for
`Tools/launch_fake_server.py` to check the script's own plumbing. Follow the
repository's model-process and memory rules before running it. Its launches
pass `--no-start`, so they use only the server the script measures.

The server `slotstream launch` starts on its own is accepted with Claude Code,
Pi and Hermes installed:

```sh
AGENT_PATH=/path/with/claude/pi/hermes/and/node \
  Tools/launch_start_gate.sh .build/arm64-apple-macosx/release/slotstream /tmp/launch-start
```

It uses port 11531 and a throwaway home whose model folder links to the real
one. Its phases, in order: `--no-start` refuses and starts nothing; a dry run
describes the server and starts nothing; a terminal is asked which agent to
start; a Hermes folder the launch cannot use is refused before any server
starts; the first launch starts the server in its own session and answers; a
second launch reuses it; Hermes restarts it with a 65,536-token window;
`slotstream stop` stops it; two Pi launches at once start one server; a
server with a short `--idle-exit` stops by itself only after its agent exits;
a server started by hand is never restarted; Control-C during a start stops
that server; and `slotstream stop` during a start stops it too. Name phases
after the output folder to run only some of them. Each phase that loads the
model first waits until no other model process runs.

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
It also checks that the guide pins every side task Hermes defines to the main
model, and that with the server failing or stopped the command-approval check
asks the user instead of sending the command to another provider.
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

Coverage is a review aid. Historical per-file percentages do not block CI.
The job still fails on a build error, a failed instrumented check, or a missing
or invalid report. It uploads LCOV and puts per-file changes in the job summary.
`Tools/coverage-floor.json` is the retained comparison snapshot; its historical
name is kept for compatibility. `--update` deliberately refreshes that snapshot,
and is not needed to make CI pass.

Inspect uncovered behavior in each change. Memory limits, recovery, cache
integrity, cancellation, download verification and public API compatibility
require meaningful boundary and failure checks. Regression checks should fail
when the bug is reintroduced. All existing correctness suites remain required.
Context-proxy, CLI and real-model checks run separately and are not included
in this coverage report. A narrower coverage gate needs reliable measurement
and a specific risk justification before adoption. See the
[coverage policy](../db/records/decisions/coverage-as-review-feedback.md).

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
termination without loading weights. The frozen allocation is pinned at an
explicit 32,768-token window, and the automatic window for the frozen tiers is
checked against `Tools/fixtures/context-automatic-v1.json`.
`Tools/planner_gates.sh` also checks each tier's automatic window, quiet and
busy starts, fixed caches and explicit windows. `Tools/consumer_smoke.sh` compiles the
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
   billion. Only decode is printed: the second and third requests reuse the
   whole prompt, so their prompt timings measure no prefill. Step 5
   measures prefill.

   ```bash
   for i in 1 2 3; do
     curl -s localhost:11434/api/generate -d '{
       "model": "qwen3.8-flash-next:4bit",
       "prompt": "Explain how a hash map works, in about 200 words.",
       "stream": false,
       "options": {"temperature": 0, "num_predict": 128}
     }' | python3 -c 'import json,sys; d=json.load(sys.stdin); print("decode %.2f tok/s" % (d["eval_count"]/d["eval_duration"]*1e9))'
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

## Prompt-speed qualification

The prompt-speed diagnostics use one bounded model process at a time. Check
reclaimable memory and wait for other model runs and builds to finish first.
`prompt-checkpoint` checks exact interior reuse, disk arithmetic provenance,
and admission of the larger automatic scope. The phase checks cover pending
token ownership, later cold-equivalent reuse, cancellation and private state:

```bash
.build/release/slotstream optimization-state-check --variant prompt-checkpoint --json
.build/release/slotstream optimization-state-check --variant generation-phase --json
.build/release/slotstream optimization-state-check --variant generation-phase-mtp --json
```

`prompt-scopes-bench` runs warmups and alternating pairs in one loaded engine.
It excludes paging-contaminated pairs from its timing decision and checks
identical output, unchanged compute shapes, read bytes and physical memory.
The separate `scope-larger-family --tokens 8192` numerical gate uses
`SLOTSTREAM_OPT_WORKSPACE_TILE=1024 SLOTSTREAM_OPT_SCOPE_FRONTIER=1`.

After `Tools/check_sevra_mac.sh`, place the pinned Metal library beside
`apps/macos/.build/release/sevra-mac-checks`. Its `--real-cache --home <new-dir>`
check uses synthetic inventory text to test save, unload, reload, incognito
isolation and thinking-state exclusion. The existing `--real-thinking` and
`--real-metrics` checks exercise the app's phase transition and recorded
statistics. Each requires its own new disposable Home; none is a clean
throughput benchmark.


The fused prefill integration adds a scalar Double reference over the actual
BF16 inputs to the MLX check tier. It exercises causal and sparse masks,
strided queries, grouped heads and partial tiles, and checks exact fallback
for decode and unsupported dtypes. The real-model checkpoint diagnostic
requires fusion to execute and preserves exact warm/cold cache equivalence:

```bash
.build/release/slotstream optimization-state-check --variant fused-prefill-component --json
.build/release/slotstream optimization-state-check --variant fused-prefill-checkpoint --json
```

Run the phase, app-cache and ordinary acceptance gates against the deployed
settings too. The arithmetic-preserving `integrated` diagnostic remains a
separate reference test. A kernel upgrade is evaluated against numerical and
task-quality evidence; changing an old greedy token alone does not establish
an error. Never regenerate the historical parity goldens with the upgraded
backend. For timing, retain the old executable and its matching Metal library,
use alternating paired runs, and separately compare the new executable with
`SLOTSTREAM_OPT_FUSED_PREFILL=0`. Exclude intervals with paging from speed
claims while preserving their functional results.

The qualified profile automatically couples fused-workspace accounting with
larger expert-read groups. Test the default with no optimization environment
overrides using the `fused-workspace-component`,
`prefill-opportunity-equality`, `prefill-followup-lifecycle`,
`prefill-followup-checkpoint`, `prefill-followup-mtp-equality` and
`prefill-followup-mtp-vision` variants. Equality accepts `--tokens 16387` and
checks raw logits, every retained state tensor and teacher-forced continuation
against the original grouping. Run one model process at a time with the
documented memory preflight. The separate `prefill-opportunity-compute` probe
requires `SLOTSTREAM_OPPORTUNITY_PROMPT_FILE` and `SLOTSTREAM_PREFILL_CHUNK`;
it tests physical feasibility at a fixed floor-sized pool, not normal planner
acceptance or an output-quality guarantee. The catalogue includes the pure
policy's hardware, dtype, image, shape, key-boundary and explicit-disable
fallbacks, plus MTP phase lifetimes, shifted draft positions and retained output
accounting and the tradeoff between write barriers and larger read groups.
Run `optimization-state-check --variant prefill-followup-mtp-equality --tokens 16387` to require that
MTP actually exercises larger automatic groups while preserving prompt logits,
retained state, speculative output and continuation exactly.
Use `SLOTSTREAM_OPT_FUSED_WORKSPACE=0` for the original main-attention accounting
and automatic group cap; explicit group controls remain diagnostic tools.
Preserve excluded timing cells and the fixed trial limit in the
[initial automatic-policy validation](../db/records/measurements/automatic-prefill-policy-2026-09-21.md)
and [MTP qualification](../db/records/measurements/mtp-prefill-policy-2026-09-21.md).

`Tools/verify.sh` requires a Python environment with `mlx==0.32.2` and
`mlx-lm` for the independent current-backend model comparisons. It defaults
to `.venv/bin/python`; `SLOTSTREAM_REFERENCE_PYTHON` selects another interpreter.
`Tools/current_backend_reference.py` writes into a new verification directory,
holds the model lock and enforces a physical-memory ceiling. Its main-layer
reference reads only requested n-gram rows from the original weights.

Historical MLX 0.31 layer goldens still run with `parity --row-invariant`,
which selects the original one-row projection arithmetic. The ordinary
production projections are checked separately against the current Python
reference. Both comparisons retain the existing numerical tolerance. The old
draft-head golden is also run and its cross-backend differences are reported
explicitly as diagnostics; the current-backend draft-head comparison remains
required. Neither historical fixture is regenerated or relaxed.

`prefix-check` requires live reply equality, reuse and invalidation behavior.
It also prints the historical experiment that compared arbitrary batch
schedules. `--legacy-rechunk-bounds` reinstates that experiment's old numerical
bounds and depth heuristic when reproducing its original protocol. Those
different arithmetic schedules are not a cache-corruption oracle.
`prefix-exact-check` remains a required, separate gate for bit-identical raw
logits and tokens under the actual cache schedule.
