# Using slotstream from Swift

Use the `Slotstream` Swift package to plan memory, download weights, run the
model, or start its HTTP server from your own Mac app or tool. It is the same
native engine the command-line tool uses, Swift on MLX and Metal end to end,
so your app runs the model in process with no local server or Python runtime
in between; see the [native stack](ENGINEERING.md#native-stack).

Add the package and product to `Package.swift`:

```swift
// Package.swift
dependencies: [
    .package(url: "https://github.com/carloslfu/slotstream.git", .upToNextMinor(from: "0.2.3")),
],
targets: [
    .executableTarget(name: "YourApp", dependencies: [
        .product(name: "Slotstream", package: "slotstream"),
    ]),
]
```

The example stays within the 0.2 release series because the library API is
still evolving. Library products are available from 0.2.3 onward.

Two products:

| Product | For |
|---|---|
| `Slotstream` | Running the model: weights, planning, generation, serving. |
| `SlotstreamDiagnostics` | Checks, goldens and benches. What the CLI and CI import; skip it in an app. |

## The Metal library

For a command-line build, place a prebuilt `mlx.metallib` **next to the
running executable**. MLX looks there for its Metal shaders. SwiftPM doesn't
compile them in the Command Line Tools setup.

- **Sevra's Xcode project**: its build phase bundles the pinned library.
  Other app targets must also include the matching MLX shaders at runtime.
- **A command-line build** (`swift build`): copy the matching library beside
  each executable after building.

  ```bash
  Tools/fetch_metallib.sh                       # from a slotstream checkout
  cp Tools/lib/mlx-0.32.2.metallib .build/debug/mlx.metallib
  ```
  Without it, the first MLX call fails with `Failed to load the default
  metallib`. A test bundle needs its own copy in `.xctest/Contents/MacOS/`.

The runtime pins mlx-swift to an exact revision and packages the matching MLX
shader library. Upgrade those together. The engine's qualified fused prefill
path uses upstream MLX attention; the experimental selected-block kernel
remains a separate control. `SLOTSTREAM_OPT_FUSED_PREFILL=0` restores MLX's
own dispatch heuristics, and `=1` requests the fused path on supported NAX
hardware. Automatic activation is limited to the measured M5 Pro profile;
other profiles retain MLX dispatch. Short decode and speculative verify calls
retain their existing paths. Persistent prompt-cache identities include the
attention settings, MLX backend overrides, GPU architecture and OS build, so changing arithmetic
starts a fresh cache.

The qualified profile also chooses expert-read groups automatically using the
fused kernel's workspace requirements. No application setting is needed. For
supported BF16 text prefill, including MTP, groups may share reads across more
chronological compute passes while staying within the existing memory target.
The larger groups end within the supported key range. Each candidate still
has to fit the actual process footprint, live headroom and request reservation;
the scheduler chooses a smaller group or an ordinary pass when necessary.
MTP prices the main and draft phases separately, including the hidden states
retained between them, and admits against the larger peak. The draft phase
keeps its full attention allowance regardless of whether its own kernel fuses.
When MTP's memory budget limits grouping, the engine can assemble expert
buffers one at a time. It uses that extra synchronization only when it can
at least double the group that fits with batched writes. This is an internal
performance policy, with the same memory and cancellation guards.
Images, CPU, other dtypes, small-query padding and attention fallbacks keep
full main-attention accounting and their established automatic grouping limits.

Diagnostic overrides remain available: `SLOTSTREAM_OPT_FUSED_WORKSPACE=0`
restores both the original accounting and automatic group cap;
`SLOTSTREAM_OPT_FUSED_PREFILL=0` also disables the combined policy.
`SLOTSTREAM_OPT_AUTO_SCOPE_LIMIT=8192|16384` can test grouping independently.
These controls do not increase the memory target or select a larger compute
pass. `InferenceOptimizations.environment()` selects the deployment policy;
the explicit reference initializer and older serialized settings retain their
original reservation. The [initial automatic-policy validation](../db/records/measurements/automatic-prefill-policy-2026-09-21.md)
and [MTP qualification](../db/records/measurements/mtp-prefill-policy-2026-09-21.md)
record the tested scope, with earlier experiments and exclusions preserved.

Planning, weight checks, prefill estimates, and most diagnostics run without
loading Metal. An app can show a memory plan and download status before the
user downloads the model.

<a id="is-a-model-here-and-what-would-it-cost"></a>

## Check and download weights

```swift
import Slotstream

let store = WeightStore.default            // ~/.slotstream/models, honours $HOME
switch store.status() {
case .ready:
    break
case let .missing(need, free), let .incomplete(need, free):
    print("need \(need / 1_000_000_000) GB, \(free / 1_000_000_000) GB free")
case let .corrupt(paths, _, _):
    print("damaged: \(paths.joined(separator: ", "))")
}
```

`status()` hashes the files before returning `.ready`, including files whose
sizes already match. Allow several seconds for a complete copy.

To download missing weights with resume, hash verification, and progress:

```swift
let cancellation = PullCancellation()
try store.download(PullOptions(cancellation: cancellation)) { line in print(line) }
// From another queue, call cancellation.cancel() to preserve resume progress.
```

The default uses the compressed CDN and tunes connection count. Explicit
`connections` fixes that count. `transport: .raw` selects raw mirrors;
setting `sources` also selects raw mirrors in automatic mode. Existing raw
partial downloads continue automatically. Download returns only after final
original-file verification; an immediate second `verify()` is unnecessary.
`status()` reports remaining reconstructed model bytes, not compressed wire
bytes, and permits an absent optional draft head.

<a id="what-will-it-do-on-this-mac"></a>

## Plan memory

```swift
let machine = Machine.current()
let plan = try Planner.plan(PlanRequest(memoryGB: 16), on: machine)
print(plan.banner())
print(plan.expertsPerLayerCached, "experts per layer,",
      plan.expectedPeakGB, "GB planned full-workload envelope")
```

`Machine.simulated(ramGB: 16)` previews a decimal-GB memory size, like
`slotstream doctor --sim-ram 16`; it does not simulate another chip or SSD.
`Engine` rejects simulated plans;
use `Machine.current()` for a plan that will allocate memory.

In the development version, `PlanRequest(memoryLimitGB: chosenLimitGB)` sets
an adaptive process ceiling. The supported hardware budget and available
memory may lower `plan.targetGB`; `plan.memoryLimitGB` keeps the saved ceiling.
Existing `memoryGB`, `poolGB` and `expertsPerLayer` controls keep a fixed cache
and cannot be combined with this option.

An embedding app must retain a `MemoryGovernor(engine:)` and call `start()`
to enable live resizing. Call `await governor.stopAndWait()` before releasing
the engine. Construct plans through `Planner.plan`; directly constructed
adaptive plans must use `.auto` and a positive target within the saved limit.
The engine validates these conditions before model allocation. The original
planner and initializer signatures remain available for existing Swift code.

<a id="pricing-a-prompt-before-you-send-it"></a>

## Estimate prompt-processing time

```swift
let seconds = PrefillSchedule.estSeconds(tokens: 8_000, maxChunk: plan.prefillChunk)
print("about", PrefillSchedule.describe(seconds: seconds), "to the first token")
```

This estimate needs no model loaded. An app can show the expected wait
before starting a long prompt.

## Serving

The library exposes the same `Server` used by the CLI. It listens on loopback
and provides the [Ollama/OpenAI endpoints](API.md) and [AI SDK gateway](FX.md).

## A thinking phase followed by an answer

`Engine.generatePhased` runs two phases under one generation gate, with
independent sampling parameters and output budgets. Its `transition` callback
returns nonempty separator or closure token ids. The engine transfers the
live state and consumes any pending sampled token exactly once, then reads
only the suffix needed for the second phase. Both phases obey the caller's
context and memory limits; cancellation also reaches the second phase.

Callbacks must not re-enter generation or configuration on the same engine.
The first phase throws on failure; inspect the returned second phase's
`stats.requestFailure` and `stats.runtimeError` as with ordinary generation.
Neither phase writes its private working state to the disk tier. Generated
rows remain ineligible for cold-equivalent reuse by a later conversation.

## Persistent prefix cache

`Engine.enablePersistentPrefixCache(_:)` adds a disk tier under
`prefixCache`. A restarted process, or a conversation longer than in-memory
retention allows, restores the longest persisted state its prompt extends
instead of processing that prompt again, and continues exactly as the saved
state would have.

```swift
let tier = try engine.enablePersistentPrefixCache(
    PersistentPrefixConfiguration(directory: URL(fileURLWithPath: "/path/to/prefix-states")))
tier.onEvent = { print("prefix cache disk:", $0) }
```

With aligned resume enabled, the generator saves states at completed prefill
pass boundaries, for text prefixes of at least `minimumTokens`. A restored
state must match the incoming prompt's boundaries and the producing prefill
pass size as well as the binary, model and optimization settings. Legacy
heads with unknown pass sizes are not eligible for aligned state reuse.
Generated conversation ids can still help render a later prompt, but do not
certify a numerical checkpoint. Unchanged persisted rows can be referenced
by later checkpoints instead of being written again. `maxBytes`
bounds the directory: when it is full, states nobody continued go first, then
kept previous turns, then conversations, then shared prefixes, least recently
used first. `maxAge`
(30 days by default, `nil` to keep states until the quota needs room) removes
unused states. Opening the directory removes files from other binaries, models
or settings, expired and damaged files, and anything over the quota;
`tier.maintenance` reports what it removed.

The prefix conversations share is kept too, with or without the disk tier.
While a prompt is processed, the head other conversations will start with is
stored as a shared prefix: the system message when it ends
`Generator.sharedPrefixMinimumTokens` (512) tokens or more in, and the longest
head the prompt shares with a state already in memory or on disk. The save
point is the last prefill pass end at or before that boundary, so no pass is
reshaped and outputs are unchanged; the state is forked into `prefixCache` and,
at `minimumTokens` or more, written to disk. The next conversation starting
with the same system prompt reuses it instead of processing it again. A shared
prefix is kept once, is never replaced by the conversations that extend it, and
is evicted after them. An app that knows where its stable preamble ends, for
example one without a system message, names it on the request; `0` leaves only
the shared-head rule:

```swift
let request = try engine.beginRequest()
request.sharedPrefixTokens = preambleTokenCount
```

`GenStats.sharedPrefixBoundaries` lists the save points a request wrote,
`sharedPrefixHint` and `sharedPrefixCommon` the two boundaries it considered,
and `persistentPrefix.sharedSaveOutcome` what the disk tier did with each.

The directory is created owner-only and holds conversation token ids and model
state. To keep a conversation off disk, set `persistsPrefixState = false` on the
controller of each of its requests and pass it to `generate`:

```swift
let request = try engine.beginRequest()
request.persistsPrefixState = false
```

`tier.removeStates(overlapping: ids)` removes the states of a conversation being
deleted, given its latest prompt ids, and `tier.clear()` removes everything.
Each request's `GenStats.persistentPrefix` reports what it restored, wrote and
reused, and `prefixCache.json()["persistent"]` holds the tier's totals.

`Engine.disablePersistentPrefixCache()` detaches the tier without deleting
saved files. Detach before encoding a private conversation, because chat
encoding can consult saved conversation ids. Clear the in-memory prefix
cache as well when changing ownership or privacy scope.

The native Mac app enables the tier for ordinary, non-thinking conversations
inside that Home's disposable `.sevra/prefix-cache` directory. Home backups
exclude this directory. Incognito and conversations with a recorded thinking
phase do not use the disk tier; Home and privacy transitions clear held
in-memory state before encoding. An unavailable disk cache falls back to
ordinary inference.

## Diagnostics

`SlotstreamDiagnostics` returns structured `CheckReport` values that an app
can inspect or display:

```swift
import SlotstreamDiagnostics

let report = Diagnostics.prefillSchedule()
print(report.name, report.passed, report.items.count)
```

`Diagnostics.runtime()`, `.governorPolicy()`, `.pullIntegrity()`,
`.machinePlanning()`, `.httpFraming()`, `.httpRouting()` and
`Goldens.sampler(...)` all run without weights. See [TESTING.md](TESTING.md).

<a id="what-is-not-here-yet"></a>

## Optimization controls

`InferenceOptimizations()` retains the explicit reference configuration.
`try InferenceOptimizations.environment()` resolves the deployment defaults
and validated environment overrides. These are deliberately different entry
points: an existing caller that constructs reference controls keeps those
semantics. Ordinary engine construction resolves the environment defaults.

Automatic prompt-read grouping requires the request memory controller and a
compatible chronological schedule. `Engine.generate` creates a controller
when the caller does not supply one. The lower-level `Generator.generate`
overload without a controller keeps ordinary chronological processing.
Begin and pass the controller before preparation, as described below, to
include that work in the same request deadline and memory reservation.
Explicit controls, saved control sets and public initializers retain their
compatibility behavior; no numerical or capacity guarantee follows from
enabling an experimental control.

## API stability

`Engine.generate` currently uses callbacks. A typed delta stream, dedicated
executor, and `Conversation` API are planned but not available. For now,
`slotstream run` shows how the CLI calls the engine; the HTTP API is also
available for callers in another process.

## Context and request control

These additive APIs are available starting in Slotstream 0.2.14.

Construct an engine with the plan that prices its context. Shared
`ContextConfiguration` validates `maxContextTokens` and
`maxPrefillWaitMinutes` before loading. Attach it using
`MemoryPlan.withRequestPolicy`, then use `Engine(modelDir:plan:)`.
Call `beginRequest` before tokenization or images, pass that controller to
`encodeChatWithVision`/`encodeWithVision` and `generate`, and use its
`connected` callback for cancellation. The request clock includes the generation
queue; it stops counting the deadline at the first sampled token.

Legacy call signatures remain available. `GenStats.requestFailure` adds a
structured code, elapsed/limit/estimate or memory details when applicable;
`runtimeError` and `finishReason` continue to expose failure to older callers.
Check these before using generated tools. An invalid legacy assignment to
`maxContextTokens` keeps the advertised window unchanged and refuses subsequent
work until corrected; a larger allocation requires a newly planned engine.

`Planner.contextFeasibility` searches actual discrete windows under frozen
machine inputs and runtime allocation controls. It returns the requested plan,
largest fitting plan and refusal, independently of the time policy. Diagnostic
qualification is explicit; it never changes the public implementation or
MTP/vision limits advertised by ordinary serving.

Starting in Slotstream 0.2.17, `Planner.resolveContextWindow(.automatic,
request:on:mtpAvailable:visionAvailable:)` returns the plan the command-line
server uses: the automatic window for the machine's memory tier, lowered at
startup when available memory is short, with an `AutomaticContextWindow` that
lists every candidate and why it was or wasn't taken. `.tokens(n)` plans an
explicit window, and `Planner.automaticContextWindow` evaluates the tier
without planning against live memory. `Planner.plan(_:on:)` still plans the
request's own `maxContextTokens`, 32,768 unless set. A window above 32,768 now
retains one complete conversation when its plan can hold one; otherwise the
plan's notes say how much a follow-up reuses. `ContextPolicy.maxTokens` is the
model's 262,144 tokens, and requests with images stay within
`ContextPolicy.visionLimit`.

Automatic selection preserves cache above the measured decode range when a
larger window would remove slots. Its clamped speed estimate cannot establish
that those slots have no value. Such candidates omit `relative_request_cost`
and set `request_cost_calibrated` to false. The plan's legacy
`expected_peak_gb` is the planned full-workload envelope, not measured usage;
`memory_target_semantics`, `expected_peak_semantics` and
`non_cache_allowance_bytes` make the distinction explicit in JSON.
`planned_headroom_gb` is the remaining planned budget after that envelope,
not live free RAM. Near the minimum cache size it can be smaller than the
nominal planning margin; a fully resident model can leave more unassigned.
