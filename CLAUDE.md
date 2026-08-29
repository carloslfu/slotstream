# slotstream — agent instructions

Qwen3.8-Flash-Next (125B + 51B n-gram, 4-bit, ~104 GB) on Macs via SSD-streamed
experts and a slot cache. Read [PLAN.md](PLAN.md) for design, [MEASUREMENTS.md](MEASUREMENTS.md)
for every measured number and its method, `Tools/verify.sh` for the acceptance
battery. Work lands directly on `main`.

## Memory safety — READ BEFORE RUNNING ANYTHING (incident 2026-08-28)

This Mac has **48 GB of unified memory shared with Carlos's live apps and
session**. On 2026-08-28 a session stacked test processes — a ~31.5 GB soak
server, a second test server, a browser pane, and builds — overcommitted the
machine and **crashed the whole system**. Every model process here is
multi-GB. These rules are mandatory:

1. **One model process at a time.** Never two servers; never `serve` plus a
   `run`/`elastic-check` concurrently. Before starting anything:
   `pkill -f "slotstream serve"` (and any request loops), then verify with
   `pgrep -fl slotstream` that nothing is left.
2. **Check reclaimable memory before every heavy step** (model launch, big
   build, verify run). Reclaimable = `vm_stat` free + purgeable + file-backed
   pages; `slotstream doctor` prints it as "reclaimable now". If what you are
   about to start does not fit with several GB to spare, do not start it.
3. **Tests use small explicit sizes** — `--memory-gb 8`..`10` — never auto,
   unless the large configuration is itself the measurement, and then nothing
   else heavy may be running.
4. **Kill every test process the moment its test ends**, and confirm.
5. `Tools/verify.sh` sizes its heavy gates to reclaimable memory on its own
   (181/layer when ≥32 GB, 60/layer otherwise). Do not force the big profile
   on a busy machine.
6. The engine caps MLX's allocator cache at 2 GB (`Engine.swift`,
   `GPU.set(cacheLimit:)`). Do not remove it: without the cap a 10 GB-target
   server held 15.1 GB of real RSS (freed transients hoarded by the
   allocator); with it, 6.0 GB flat at identical speed. RSS — not only the
   Metal peak metric — is what can take the machine down.
7. **No memory-hog stress experiments without Carlos's explicit go.** The
   2026-08-28 hog experiments are done and documented in MEASUREMENTS.md;
   never rerun them casually.
8. The elastic governor protects **one auto-sized instance** against the rest
   of the system. It cannot protect against deliberately stacked processes —
   that protection is these rules, i.e. you.

## Weight download

`pull` runs 8 parallel connections over 64 MB chunks with a per-file
`.partmap` (one byte per chunk) for exact resume. Hugging Face caps this
client at about 55 MB/s no matter what: 4 through 32 connections all plateau
there, `hf_xet` gets the same 55.7, and splitting across two mirror repos
gains nothing (the cap is per-IP, not per-repo). The link itself does 144 MB/s
against Hetzner, so more speed means hosting the weights off Hugging Face, not
tuning the client. Do not "optimize" the connection count without re-measuring.

To exercise the whole pull path without spending 104 GB of network, serve the
existing `models/` copy over a Range-capable local HTTP server and point
`SLOTSTREAM_WEIGHTS_SOURCES` at it; a full 24-file pull then runs at SSD speed
(2.47 GB/s measured) and ends in the real `VERIFY PASS`.

## Serving invariants (learned the hard way, 2026-08-29)

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
- **Incremental detokenization diffs by Unicode scalar, never by `Character`,
  and never resets its token list mid-generation.** Resetting when nothing has
  been emitted yet destroys a response that opens with an emoji; diffing by
  `Character` drops a scalar that merges into the grapheme already sent (`❤️`
  streams as `❤`). Non-streaming output was correct throughout, which is what
  made this invisible.
- **Prompts are capped (`--max-context`, default 32,768).** KV plus indexer
  state costs ~27 KiB/token *beyond* the memory plan, which models only the
  pool and a fixed footprint. At 8k tokens `--memory-gb 8` peaks at 7.9 GB —
  the margin is nearly gone. If you raise the cap, re-measure the peak.
- **`Geometry` constants are checked against config.json** in
  `Qwen4ExpModel.validate`. The planner sizes memory from the constants while
  the engine allocates from the config; if they drift, every memory number the
  user sees is wrong.

## Prefill, sampler, governor (0.1.5)

- **The prefill pass size is part of the memory plan, not a constant.** Prefill
  is expert-stream-bound: a pass touches nearly every expert of every layer, so
  a bigger pass is strictly faster (40 → 92 tok/s from 256 → 2048) and strictly
  more memory-hungry. `Planner.prefillChunkFor` takes at most a fifth of the
  pool budget. Output is byte-identical at every size — verified at 2,980 and
  7,960 tokens with the sparse indexer active — so do not treat the size as
  affecting correctness, and do not hard-code it back to 256.
- **`prefillCostGB` charges 1.8 MB/token, not the 1.1 the activations measure
  alone.** The extra covers the ~27 KiB/token of KV and indexer state that
  comes with the long context a big pass is for, which the pool math does not
  model. At 1.1 the `--memory-gb 12` promise held by 0.0 GB on an 8k prompt. If
  you retune it, re-measure with a long prompt, never a short one.
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
  release**: bump `version:` in `Sources/slotstream/main.swift` to match the
  tag, commit, then `git tag vX.Y.Z && git push origin vX.Y.Z` —
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
