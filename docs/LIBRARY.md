# Using slotstream from Swift

Use the `Slotstream` Swift package to plan memory, download weights, run the
model, or start its HTTP server from your own Mac app or tool.

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

- **An Xcode app**: Xcode compiles the shaders itself. No manual copy is needed.
- **A command-line build** (`swift build`): copy it yourself, once.

  ```bash
  Tools/fetch_metallib.sh                       # from a slotstream checkout
  cp Tools/lib/mlx-0.31.1.metallib .build/debug/mlx.metallib
  ```
  Without it, the first MLX call fails with `Failed to load the default
  metallib`. A test bundle needs its own copy in `.xctest/Contents/MacOS/`.

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
      plan.expectedPeakGB, "GB expected peak")
```

`Machine.simulated(ramGB: 16)` previews another memory size, like
`slotstream doctor --sim-ram 16`. `Engine.load` rejects simulated plans;
use `Machine.current()` for a plan that will allocate memory.

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

These additive APIs are available starting in Slotstream 0.2.13.

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
