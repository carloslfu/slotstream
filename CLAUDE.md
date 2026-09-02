# slotstream — agent instructions

Qwen3.8-Flash-Next (125B + 51B n-gram, 4-bit, ~104 GB) on Macs via SSD-streamed
experts and a slot cache. Read [PLAN.md](PLAN.md) for design, [MEASUREMENTS.md](MEASUREMENTS.md)
for every measured number and its method, `Tools/verify.sh` for the acceptance
battery. Work lands directly on `main`.

## Claims and measurement discipline (mistakes made 2026-08-29/30)

Every rule here is one this project already got wrong. They share a root:
**asserting from a document instead of checking the system.**

- **Before calling something blocked, check whether the repo already does it.**
  Four docs said closing the prefill gap "needs a Metal kernel, which needs
  Xcode", for two releases — while `GatedDelta.swift` shipped a JIT-compiled
  custom kernel as its fast path. The blocker was read off the risk register,
  which is about a *different* thing (mlx-swift's bundled shader library), and
  never tested. One `xcrun`, one four-line kernel, and it collapsed. A blocker
  that has never been reproduced is a rumour.
- **An estimator may not return a value outside the range it measured.** The
  decode curve extrapolated to 20 tok/s at 181/layer and over-promised 25 to
  45% through its own middle. Worse: immediately after fixing that, the prefill
  ladder was left returning 125 tok/s for chunk 4096, which nothing had
  measured. Cap at the last verified point, or measure a *ratio* at a config
  that fits and say so. Under-promising is the correct failure direction for a
  planner.
- **Re-anchoring a curve invalidates every number derived from it.** Fixing
  only the row in front of you produces contradictions readers will trust: the
  README's tier table ended up claiming a 32 GB Mac is faster than a 48 GB one.
  Regenerate the whole family — and prefer generating tables *from the tool*
  (`doctor --sim-ram N`) so they cannot drift from the code again.
- **A failing test is a bug in the test until proven otherwise.** Three "product
  failures" in one run were nested python-inside-shell quoting mangling the
  JSON; another two were a hardcoded version literal reporting a release bump as
  a regression. Reproduce by hand before believing a failure, and never pin a
  value a release will change.
- **`set -e` makes cleanup lethal.** `wait $PID` returns 143 after a `kill` and
  silently truncated the whole battery — it looked like a hang. Always
  `kill ... || true; wait ... || true`, or use a `trap ... EXIT` like
  `api_robustness.sh` does.
- **Benchmarks on a loaded machine are noise.** Single runs here vary 15%+, and
  one pair read 137.6 against 90.7 for the same config. Check reclaimable
  memory first, interleave A/B rounds, and discard anything measured while the
  machine is swapping. Report medians of paired rounds, never a best-of.
- **Explicit knobs bypass the safety clamp — that is their purpose, and it
  makes them dangerous.** `--experts-per-layer 181` is never resized by the
  availability clamp, and forcing it against 26.6 GB reclaimable drove the
  machine to 158 MB free and 13 GB of swap. `Planner.availabilityOverride` is
  worse: simulating 60 GB free made the governor allocate a *real* 25.4 GB pool
  and pushed swap to 39 GB. Bound both by `deviceAvailableGB()` before use.
- **Kill your own background waiters.** A poll loop watching a log that would
  never get its line sat in the task list for six hours looking like live work,
  and the "nothing is running" check missed it because it grepped for expected
  process names. Check the task list, not your assumptions about it.

## Memory safety — READ BEFORE RUNNING ANYTHING (incident 2026-08-28)

This Mac has **48 GB of unified memory shared with Carlos's live apps and
session**. On 2026-08-28 a session stacked test processes — a ~31.5 GB soak
server, a second test server, a browser pane, and builds — overcommitted the
machine and **crashed the whole system**. Every model process here is
multi-GB. These rules are mandatory:

1. **One model process at a time.** Never two servers; never `serve` plus a
   `run`/`elastic-check` concurrently. The binary now enforces this with a
   per-user file lock before model allocation. Still inspect `pgrep -fl
   slotstream` before heavy work; do not kill a process owned by another task
   without coordinating with its owner.
2. **Check reclaimable memory before every heavy step** (model launch, big
   build, verify run). Reclaimable = `vm_stat` free + purgeable + file-backed
   pages; `slotstream doctor` prints it as "reclaimable now". If what you are
   about to start does not fit with several GB to spare, do not start it.
3. **Tests use small explicit sizes** — `--memory-gb 8.1`..`10` — never auto,
   unless the large configuration is itself the measurement, and then nothing
   else heavy may be running.
4. **Kill every test process the moment its test ends**, and confirm.
5. `Tools/verify.sh` keeps every heavy gate between the 8.1 GB floor and a
   10 GB target. Equality tests use small pools because their property is
   size-independent; never restore a spare-RAM-driven large profile.
6. The engine caps MLX's allocator cache at 2 GB (`Engine.swift`,
   `MLX.Memory.cacheLimit`). Do not remove it: without the cap a 10 GB-target
   server held 15.1 GB of real RSS (freed transients hoarded by the
   allocator); with it, 6.0 GB flat at identical speed. `GenStats.peakMemoryGB`
   and the verification gate now use the Mach/getrusage process RSS high-water;
   the MLX-only peak is diagnostic only.
7. **No memory-hog stress experiments without Carlos's explicit go.** The
   2026-08-28 hog experiments are done and documented in MEASUREMENTS.md;
   never rerun them casually.
8. The elastic governor protects **one auto-sized instance** against the rest
   of the system. It cannot protect against deliberately stacked processes —
   that protection is these rules, i.e. you.

## Weight download

`pull` runs 8 parallel connections over 64 MB chunks with a per-file
`.partmap` (one byte per chunk) for exact resume. Each connection is its own
URLSession, and that is not optional: HTTP/2 multiplexes every request in a
session over one TCP connection and ignores `httpMaximumConnectionsPerHost`
(Apple documents this), so through 0.2.0 the "8 connections" were 8 streams on
one connection and every pull ran at single-connection speed. The 2026-08-29
finding that "Hugging Face caps this client at 55 MB/s" was that one
connection, measured from a home link that caps every host near 55; from a
1 Gbit/s datacenter link Hugging Face gives 72 MB/s on one connection and 103
to 112 on 8 to 32 (the port; a full install took 16 minutes). `pull` prints the
connection count it measures
from task metrics; if it ever reports fewer than requested, measure before
tuning anything. Hosting the weights elsewhere does not raise one connection's
speed; only more connections or a shorter round trip do (MEASUREMENTS.md,
2026-09-01). `Tools/pull_bench_linux.sh` runs the exact pull code on a Linux
box in Docker for a gigabit measurement.

To exercise the whole pull path without spending 104 GB of network, serve the
existing `models/` copy over a Range-capable local HTTP server and point
`SLOTSTREAM_WEIGHTS_SOURCES` at it; a full 24-file pull then runs at SSD speed
(2.47 GB/s measured) and ends in the real `VERIFY PASS`.

## Serving invariants (learned the hard way)

These were all real bugs found by adversarial probing. Each is now gated by
`Tools/api_robustness.sh`; do not "simplify" any of them away.

- **SIGPIPE must stay ignored.** `Server.run` sets `signal(SIGPIPE, SIG_IGN)`
  and each accepted socket gets `SO_NOSIGPIPE`. Without it a client closing a
  tab mid-stream kills the whole daemon, and every `alive`/`send -> Bool` check
  in the handlers is dead code because `write` can never return `-1`.
- **Every sampling knob goes through `SampleParams.sanitized()`.** Clients send
  Ollama's documented defaults `seed: -1` and `num_predict: -1`; `UInt64(-1)`
  and `0 ..< -1` both trap and take the process with them. Out-of-range
  `top_p`/`min_p` used to empty the candidate set and turn `probs/probs.sum()`
  into NaN, after which the sampler emitted token 0 forever.
- **Never normalize the sampling probabilities.** The draw is scaled by the
  unnormalized CDF total instead. That removes the 0/0 and, since `u < 1`,
  guarantees the pick lands on a token with actual mass.
- **Incremental detokenization is bounded and scalar-safe.** Qwen's ByteLevel
  decoder is run over small stable token groups while incomplete UTF-8 bytes
  and stop-sequence prefixes remain buffered. Non-streaming requests do one
  final decode only; never restore full-prefix decoding after every token.
- **Prompt plus completion is capped (`--max-context`, default 32,768).** The
  planner charges a full active context, and `Engine.generate` clamps new
  tokens to the remaining room. If you raise the cap, update the memory model
  and re-measure process RSS.
- **`Geometry` constants are checked against config.json** in
  `Qwen4ExpModel.validate`. The planner sizes memory from the constants while
  the engine allocates from the config; if they drift, every memory number the
  user sees is wrong.

## Conversation prefix cache

- **A reused state is extend-only and can never be rewound.** `LinearCache`
  holds the GDN recurrent state, a fold over every token with no inverse, and
  `ngramCtx` is carried forward the same way. So reuse requires
  `prompt.starts(with: heldIds)` and `prompt.count > heldIds.count`; anything
  else is a full rebuild. Do not add "partial rewind" or longest-common-prefix
  matching — there is nothing to rewind to.
- **The held id list is tracked, never inferred.** A token is sampled *before*
  it is fed, so both break paths in the decode loop leave the last token
- **The Ollama CLI's wire format is a gate, not an assumption.** Its
  `ShowRequest` serializes every field, so `ollama run` opens `/api/show`
  with empty `name`/`system`/`template`/`options`, its one-shot mode uses
  `/api/generate` with empty `suffix`/`system`/`template`, its interactive
  mode opens with Ollama's documented "load" request (an empty prompt,
  answered `done_reason: "load"` without touching the engine), and its chat
  can carry `keep_alive` and `options: null`. 0.1.8's strict validator rejected them
  and the CLI could not start; nothing noticed for two releases because the
  claim lived in PLAN.md, not in a test (found 2026-09-01). Accept the
  deprecated `name` alias, empty overrides, `keep_alive`, and null `options`;
  keep refusing unknown fields and non-empty overrides. `api_robustness.sh`
  gates the CLI's exact request shapes; a client claim in the README needs a
  gate like it.

  unconsumed. `Generator.generate` records exactly what the state consumed; a
  caller that recomputes this from the returned ids will be off by one and the
  next request will silently reuse a state that does not match its prompt.
- **A miss must evict before the caller allocates.** Four conversations may be
  retained, so `PrefixCache.take` evicts LRU entries until retained + active
  states fit both the four-state and shared-token ceilings. Each state has
  ~113 MB of fixed GDN memory in addition to ~27 KiB/token; both are charged.
- **Do not gate this on byte-equality with a cold rebuild — it will never
  pass.** Reuse re-batches the same tokens, MLX picks reduction orders by shape,
  and floating point is not associative: swept over a 64-token sequence, all 63
  split points differ. §6.1's "streaming is math-invisible" is about the expert
  pool, where hit and miss deliver identical bytes. The gate is
  `slotstream prefix-check`: reuse must perturb logits no more than re-chunking
  a plain prefill already does (measured 4.37% vs 5.90% of logit spread), stay
  flat with depth, be deterministic run to run, and actually be reusing.
  Corollary worth knowing: the existing byte-identical-across-chunk-sizes result
  is luckier than it reads — the logit deltas are several percent either way and
  the text matches because top-1 usually survives.
- **The governor sheds it before shrinking the pool.** One re-prefill is a
  cheaper give-back than a starved cache, which taxes every token after it.
- **It holds four conversations, and must not be reduced to one.** A single slot
  passed every synthetic test and then scored 0 hits / 7 misses against Open
  WebUI, whose title-generation request lands between turns and evicted the chat
  every time. Any client that decorates a conversation (titles, tags,
  suggestions) breaks a one-slot cache. Because several held states are
  additive, the retention ceiling is charged against the memory budget.

## Prefill

Each of these cost a measured experiment. Do not re-derive them, and do not
revert the constants to their older values — two of those older values are
still quoted in commit history and both are wrong.

- **The pass size is part of the memory plan, not a constant.** Prefill is
  expert-stream-bound: a pass touches nearly every expert of every layer, so a
  bigger pass is strictly faster and strictly more memory-hungry. Measured
  40 → 113 tok/s from 256 → 2048, and 4096 beat 2048 in all three paired rounds
  at a matched pool (1.15x). Output is byte-identical at every size, verified
  at 2,980 and 7,960 tokens with the sparse indexer active — the size does not
  affect correctness, and it must not be hard-coded back to 256.
- **`prefillCostGB` charges ~1.30 MB per chunk token, linear from zero.**
  It previously charged `(chunk - 256) x 1.8 MB`, which conflated two different
  things — pass activations, which scale with the chunk, and KV plus indexer
  state, which scales with the *context* — and so overcharged a big pass by 2x
  and kept the planner one size below the best available. Measured directly:
  1024 → 1.30 GB, 2048 → 2.19, 4096 → 4.30. Context state is separate and
  small: 4k → 8k tokens moved peak by 0.1 GB. **Do not restore the 1.8 figure.**
- **`prefillChunkFor` takes at most a quarter of the pool budget**, raised from
  a fifth once the cost above was honest. The deciding experiment held total
  memory fixed and traded pool for pass size: 2048 dominated 1024 on every axis
  — faster prefill, faster decode, *lower* peak.
- **Prefill IO runs at ~4.5 GB/s, not the SSD's 17.3, and queue depth is not
  why.** An expert is nine ~307 KB pieces, not one 2.76 MB block. QD 12 and 32
  tie; 64 and 128 are worse. Making it faster means a contiguous on-disk repack
  (the skipped M2 container) — this is the evidence that would un-skip it.
- **Expert-load staging is capped at 32 records.** A 256-token layer can route
  all 512 experts; loading them as one 1.415 GB record batch, then
  materializing its MLX scatter while the source buffers were live, made a
  `--memory-gb 10` long prompt peak at 12.4 GB. Thirty-two-record slices cut
  the same 7,960-token run to 8.6 GB while retaining 41.3 tok/s prefill. Do not
  coalesce those slices without re-running the real process-RSS gate.
- **Cross-layer read-ahead does not work here. Do not rebuild it** without
  first making reads contiguous. It was built, measured slower in every paired
  run, and removed: the reads already saturate, so a background reader steals
  CPU from the thread feeding the GPU and competes for the same unified memory.
- **Compute is now the majority of a pass** (io 33.9 / scatter 10.3 / compute
  50.3 s on an 8k prefill). Closing it means a grouped GEMM over the routed
  experts instead of per-token gathers.
- **That is NOT blocked on Xcode, despite what the risk register implies.**
  The register's entry is about building *mlx-swift's own bundled shader
  library* from source, which is worked around by vendoring `mlx.metallib`.
  Writing a **new** kernel is a different thing: `MLXFast.metalKernel` JIT-
  compiles Metal source at runtime through the Metal framework, needing no
  offline toolchain. This repo already does it — `GatedDelta.swift` builds the
  gated-DeltaNet kernel that way and it is the shipped fast path. Verified on
  this CLT-only machine: a fresh kernel compiled and ran. Do not repeat the
  "needs Xcode" claim about custom kernels.

## Sampler and governor

- **The sampler has a numpy oracle.** `Tools/sampler_ref.py` must stay in step
  with `Sampler.next`; both build logits from the same splitmix64 stream using
  only exactly representable float operations, so the comparison is exact.
  Changing the sampler means changing both.
- **The governor's policy is a pure function on purpose.** `GovernorPolicy.decide`
  is tested through all its branches by `governor-check` with no model loaded.
  Do not fold the policy back into the daemon: the alternative test is putting
  this machine under real memory pressure, which is exactly what the memory
  safety rules forbid. Note the invariant it asserts — the decision depends on
  (available + pool), never on either alone, which is why `desiredSlots` credits
  what a restart would release.
- **`elastic-drill` covers the wiring the policy test cannot**: poll, decide,
  take the generation lock, resize, log. It uses `Planner.availabilityOverride`,
  which **does not make the allocation imaginary** — simulating 60 GB free on a
  machine with 7 GB made the governor take a real 25.4 GB pool and drove swap
  from 13 to 39 GB. Anything using that seam must bound the simulated value by
  `deviceAvailableGB()`.
- **Warm decode estimates are measured, not extrapolated.** 6.0 / 8.2 / 11.2 /
  11.6 tok/s at 30 / 60 / 120 / 150 experts per layer, flat by 120. An older
  20.0 at 181/layer has never reproduced; the estimator holds flat above the
  verified points rather than extrapolating to it.
- **Speculative decode's multiplier is a measured ratio per cache size and
  depth.** `mtp-bench` on 0.2.0 (four drafts) read ×0.55 / 0.69 / 0.88 / 0.96
  at 20 / 29 / 42 / 57 experts per layer, all below break-even; depths 1 and
  2 read ×1.13 / ×1.12 at 57, which is why the default is 2; ≥120/layer is
  unmeasured. The "×1.5–1.9" once written here assumed a five-token verify
  pass costs one token's pass; `mtp-passcost` measured 1.65 with every
  expert resident (a sixth of a pass per extra token), so the ceiling is
  ×1.5 at depth 2 and the estimate is withdrawn. Quote the ladder and the
  ceiling, never the launch-bound arithmetic.

## Repo facts

- Model weights: `models/qwen38-flash-next-mlx-4bit/` (97 GB, gitignored),
  pinned `pipenetwork` revision; `slotstream pull --verify` re-checks all
  hashes in ~14 s and is a verify.sh gate.
- Parity goldens must be generated under **mlx 0.31.1** (`.venv31`,
  `Tools/parity_ref.py`) — mlx-swift vendors 0.31.x and 0.32.x kernels differ
  measurably. Never regenerate goldens under a newer mlx.
- SwiftPM cannot compile Metal shaders with CLT only: the Makefile colocates
  the prebuilt `mlx.metallib` next to the binary. `swift test` is unavailable
  (no XCTest in CLT) — `Tools/verify.sh` is the acceptance suite.
- The sandbox proxies localhost HTTP clients (curl/urllib): test the server
  with `nc` raw sockets, or the app's Browser pane (which reaches localhost).
- Launch background servers with `(nohup ... &)` subshells; TaskStop kills
  whole process groups.
- Distribution: `install.sh` (repo root) is the public one-line installer; it
  fetches the latest release asset `slotstream-arm64.tar.gz` (binary +
  `mlx.metallib`, plus a `.sha256` file) into `~/.slotstream/bin`. **Cutting a
  release**: bump `version` in `Sources/SlotstreamCore/Version.swift` (moved
  there in 0.1.5; it is the single source for `--version`, `/api/version` and
  the CI tag check) to match the tag, commit, then
  `git tag vX.Y.Z && git push origin vX.Y.Z` —
  `.github/workflows/release.yml` builds on a macos-15 runner, fails unless
  `--version` equals the tag, packages, attests provenance
  (`gh attestation verify <asset> --repo carloslfu/slotstream`), and
  publishes. Never build release assets locally except as a documented
  emergency fallback. Asset names are stable (the installer uses
  `releases/latest/download/`), so never rename them. The tarball's metallib
  is the macOS 26 build (CI pins it via `SLOTSTREAM_METALLIB_MACOS=26`);
  `install.sh` swaps in the macOS 14/15 builds from pinned mlx-metal wheels —
  when bumping the MLX version, update those wheel URLs + sha256s alongside
  `Tools/fetch_metallib.sh`. raw.githubusercontent caches `install.sh` for
  ~5 minutes after a push.
