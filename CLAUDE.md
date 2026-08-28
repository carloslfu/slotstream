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
