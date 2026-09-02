---
type: measurement
id: 01m1hhwkrbws55fbk516e96ms8
created: 2026-09-02T17:15:25.835046+00:00
updated: 2026-09-02T17:15:25.835046+00:00
summary: 'One-command install (2026-08-28): v0.1.0 release + installer, proven end to end'
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '230'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'One-command install (2026-08-28): v0.1.0 release + installer, proven end to end'
status: measured
---

Release v0.1.0 ships `slotstream-arm64.tar.gz` (50.8 MB compressed: the
36.9 MB binary + the 131 MB mlx-0.31.1 metallib, built from commit `6a038fe`)
plus a `.sha256` asset; names are stable because the installer fetches
`releases/latest/download/`. `install.sh` (repo root) gates on
Darwin/arm64/macOS ≥ 14, sha256-verifies the tarball, installs to
`~/.slotstream/bin`, wires PATH (a wrapper in `/usr/local/bin` when writable
without sudo, else one grep-guarded profile line), and offers a handoff to
`serve` when a real terminal exists.

`serve`/`run` now offer the download themselves: pinned model missing + a
terminal → a size/destination/free-disk block and one `[Y/n]`. Proven live
with an APFS-cloned copy missing only `config.json`: consent pulled the
missing file over the network, ran the full 24-file verify (PASS), and
generated correctly at a 6.9 GB peak. Decline exits 1 with "when you are
ready: slotstream pull"; no terminal (piped stdin, no usable `/dev/tty`)
exits 1 with the pull hint. `serve` now also prints a copy-paste curl and the
client hint at bind time; the exact printed payload returned HTTP 200 NDJSON
with the CORS header on the wire.

End-to-end as a stranger, from GitHub, under an isolated `$HOME`: the README
one-liner installed 0.1.0, appended the PATH line exactly once, printed the
no-terminal fallback, and exited 0; under a pty it prompted and honored "n".
From the installed directory (outside any checkout), `doctor` initialized
Metal off the colocated metallib and a real generation produced the exact
requested string at a 6.9 GB peak. Two installer findings: `[ -r /dev/tty ]`
passes even with no controlling terminal, so the guard must actually open it
(`(exec < /dev/tty)`); and raw.githubusercontent caches for ~5 minutes and
ignores query-string cache busting, so after editing `install.sh` wait out
the cache before re-testing. Not proven here: a truly clean machine (this
Mac's dev checkout resolves first via the embedded path), and the handoff
"y" branch was not exec'd live (it composes two proven pieces).

**Clean-machine simulation (2026-08-28, follow-up):** with the dev checkout's
weights hidden and a fresh `$HOME`, the full stranger chain ran live:
one-liner → installer → "y" handoff (exec'd this time) → serve → "y" → the
real 104 GB pull streamed (killed deliberately at ~0.6 GB). It exposed two
defects, both fixed and re-proven in v0.1.1: (1) the weights presence check
was `config.json` alone, and small files download first, so an interrupted
first download passed the check and died later in engine load — `serve`/`run`
now size-check every manifest file (plus `.part` progress) and the prompt
says `have: N GB already here — the download resumes`; proven by resuming the
interrupted state at the exact byte offset through the prompt. (2)
`FileManager.homeDirectoryForCurrentUser` ignores the `$HOME` environment
variable, so redirecting the download (external drive, tests) silently used
the passwd home — `ModelLocator` now honors `$HOME` when set.

**Per-OS Metal library (2026-08-28, follow-up):** the release tarball's
metallib is built for macOS 26, but mlx-metal publishes separate builds for
macOS 14, 15, and 26 — shipping the 26 build to older systems is the
forward-compatibility direction that can fail. The installer now fetches the
build matching the host's macOS from the mlx-metal 0.31.1 wheel (URL and
sha256 hardcoded per OS; PyPI files are immutable) on macOS 14 and 15, and
keeps the tarball's copy on 26 and later. Tested via an override on this
host: the macOS 15 wheel downloaded, hash-verified, and extracted (107 MB vs
the 26 build's 131 MB), Metal initialized from it, and a real generation ran
at a 7.0 GB peak. A physical macOS 14/15 machine still hasn't run it, but
each OS now gets exactly the library a from-source build there would use.
Also fixed: re-running the installer says "PATH already set up" and appends
nothing (verified one profile line after two runs).

**CI-built releases with signed provenance (2026-08-28):** v0.1.0 and v0.1.1
were built on the dev machine and traceable only to a commit hash and
checksum in hand-written notes. From v0.1.2, pushing a tag runs
`.github/workflows/release.yml` on a GitHub macos-26 runner: newest-Xcode
selection (mlx-swift needs Swift 6.3), the pinned-wheel metallib
(`SLOTSTREAM_METALLIB_MACOS=26`), a smoke gate that fails the build unless
`--version` equals the tag, packaging with sha256, GitHub artifact
attestation (verify:
`gh attestation verify slotstream-arm64.tar.gz --repo carloslfu/slotstream`),
and publish with the commit and build-log URL in the notes. First live run
found the macos-15 image's Swift too old for mlx-swift 0.31.6 (tools version
6.3); the macos-26 image with newest Xcode selected is the working recipe.
Local asset builds are retired to a documented emergency fallback.

**Weights mirror + multi-source pull (2026-08-29):** `pull` previously had a
single hard-coded download base, so slotstream's availability depended on a
third-party HF repo staying up. It now takes an ordered source list (env
override `SLOTSTREAM_WEIGHTS_SOURCES`), tries each in turn, and skips straight
to the next source on a permanent HTTP refusal instead of burning retries.
Proven: bogus-primary falls back and completes (401 → next source, full verify
pass); all-sources-bogus fails closed with "failed from all N source(s)";
default path unchanged.

A byte-identical mirror now ships as the primary source:
`carloslfu/Qwen3.8-Flash-Next-MLX-4bit` @ `852ebf6f` (README added in a later
commit, which is why the pin matters — the pinned revision's files are exactly
the manifest's). Upload took seconds rather than hours because HF's
content-addressed storage already held these chunks from the upstream repo —
the practical argument for mirroring *while* the source is alive rather than
after it disappears. Verified three ways: all 24 files present at exact sizes;
all 12 LFS sha256s on the mirror equal the pinned upstream hashes (i.e. the
whole 103.8 GB is byte-identical, proven without downloading it); and a live
`pull` of a hashed file (`tokenizer.json`) from the pinned mirror URL passed
the hash gate with a full 24/24 verify. Integrity semantics are unchanged:
sources supply bytes, the compiled-in manifest supplies truth.

**README correction (2026-08-31).** The README claimed "every file is checked
against a hash compiled into the binary". Only 12 of the 24 are: the 11 shards
plus `tokenizer.json`, which is 103.783 of the 103.794 GB. The other 12 —
configs, `merges.txt`, `vocab.json`, the index, 10.5 MB total, 0.01% — are
size-checked and then structurally parsed on load. The user-facing promise (a
corrupted download cannot become garbage tokens) survives, but the README now
states the split. A full `pull --verify` re-measured at **7.7 s** wall for
103.8 GB (13.4 GB/s, ~6 readers wide at 559% CPU — consistent with the 17.3 GB/s
sequential SSD figure and unrelated to the 4.5 GB/s random-`pread` expert path).

**Download time, stated honestly (2026-08-31).** The README quoted "35 to 45
minutes on a fast link", which gets the cause wrong: the link is not the
constraint. Hugging Face plateaus past four connections, and the two sessions
above disagree about where — **50 to 57 MB/s** in the parallel-download work,
**36.5 MB/s** in the R2 comparison — so 103.8 GB is a 30-to-47-minute job
depending on Hugging Face's day, on a link that does 134 MB/s to a plain host.
Past roughly 400 Mbps more bandwidth buys nothing; below it the user's link
binds and the wait is ordinary arithmetic (200 Mbps 1h09, 100 2h18, 50 4h36,
25 9h13). The README now carries that table, `doctor` reports whether the disk
can hold the weights and the best-case time, and the first-run prompt quotes
the same estimate before asking. Both new surfaces were tested against a real
1 GB volume for the refusal path.
