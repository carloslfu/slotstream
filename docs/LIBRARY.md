# Using slotstream from Swift

slotstream is a command-line tool and a Swift package. The binary and the
`curl | sh` install are unchanged; this page is about the other way in, for a
Mac app or a tool of your own.

```swift
// Package.swift
dependencies: [
    .package(url: "https://github.com/carloslfu/slotstream.git", .upToNextMinor(from: "0.3.0")),
],
targets: [
    .executableTarget(name: "YourApp", dependencies: [
        .product(name: "Slotstream", package: "slotstream"),
    ]),
]
```

`.upToNextMinor` rather than `from:`, because for a 0.x version `from:` accepts
every later 0.x release, and the surface is still moving.

Two products:

| Product | For |
|---|---|
| `Slotstream` | Running the model: weights, planning, generation, serving. |
| `SlotstreamDiagnostics` | Checks, goldens and benches. What the CLI and CI import; skip it in an app. |

## The Metal library

MLX's shaders cannot be compiled by SwiftPM on the command line, so a prebuilt
`mlx.metallib` has to sit **next to the executable that is running** — MLX finds
it with `dladdr` on its own code, not by searching the bundle you might expect.

- **An Xcode app**: Xcode compiles the shaders itself. Nothing to do.
- **A command-line build** (`swift build`): copy it yourself, once.
  ```bash
  Tools/fetch_metallib.sh                       # from a slotstream checkout
  cp Tools/lib/mlx-0.31.1.metallib .build/debug/mlx.metallib
  ```
  Without it, the first MLX call dies with `Failed to load the default
  metallib`. A test bundle needs its own copy in `.xctest/Contents/MacOS/`.

**You only need this if you touch the model.** Planning, the weight manifest,
the prefill schedule, context arithmetic and most diagnostics are pure Swift and
run with no Metal at all — which is worth knowing, because it means a menu-bar
app can show what slotstream *would* do on this Mac before downloading 105 GB.

## Is a model here, and what would it cost?

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

`status()` hashes a complete-looking copy before calling it ready, because size
alone cannot tell a good file from same-size corruption. That takes seconds and
is the reason a damaged tokenizer never reaches the engine.

To fetch what is missing — resumable, hash-verified against the pinned
revision, and silent unless you ask for progress:

```swift
try store.download(PullOptions(connections: 8)) { line in print(line) }
```

## What will it do on this Mac?

```swift
let machine = Machine.current()
let plan = try Planner.plan(PlanRequest(memoryGB: 16), on: machine)
print(plan.banner())
print(plan.expertsPerLayerCached, "experts per layer,",
      plan.expectedPeakGB, "GB expected peak")
```

`Machine.simulated(ramGB: 16)` plans for a machine that is not this one — the
same thing `slotstream doctor --sim-ram 16` prints. A plan made for a simulated
machine is marked, and `Engine.load` refuses it: a simulated availability figure
still produces a real allocation, and pretending 60 GB was free once drove this
Mac to 39 GB of swap.

Named `Machine` and not `Device` because MLX exports its own `Device`, and an
app using this library imports MLX too.

## Pricing a prompt before you send it

```swift
let seconds = PrefillSchedule.estSeconds(tokens: 8_000, maxChunk: plan.prefillChunk)
print("about", PrefillSchedule.describe(seconds: seconds), "to the first token")
```

Reading a long prompt is a real wait, not a hiccup, and it is the number a UI
should show before it starts rather than after. This needs no model loaded.

## Serving

The HTTP server the CLI runs is `Server` in the library, speaking the Ollama and
OpenAI subsets on loopback. Everything about its behaviour is in
[API.md](API.md); embedding it is the same server in your process.

## Diagnostics

`SlotstreamDiagnostics` exposes the checks the project gates itself with, as
functions returning a `CheckReport` rather than things that print:

```swift
import SlotstreamDiagnostics

let report = Diagnostics.prefillSchedule()
print(report.name, report.passed, report.items.count)
```

`Diagnostics.runtime()`, `.governorPolicy()`, `.pullIntegrity()`,
`.machinePlanning()`, `.httpFraming()`, `.httpRouting()` and
`Goldens.sampler(...)` all run without weights. See [TESTING.md](TESTING.md).

## What is not here yet

The surface is honest about its age. `Engine` is still the class the CLI has
always used, with a callback-based `generate`; the typed delta stream, the
dedicated executor and `Conversation` are designed but not landed, because their
gate is byte-equality against the real weights and that has to run on a quiet
machine. Until then, generation through the library is what `slotstream run`
does, and the HTTP API is the stable way to drive it from another process.
