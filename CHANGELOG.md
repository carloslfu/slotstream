# Changelog

What each release changed, newest first. `curl | sh` installs the latest
release; anything under **Unreleased** is on `main` only.

## Unreleased

- `pull` fetches the draft head. `mtp.safetensors` (1.47 GB, sha256-pinned)
  is hosted on the weights mirror and pulled with everything else, so `--mtp
  auto` works out of the box on a large Mac. It is the manifest's one optional
  file: a source without it leaves the pull green with a notice and
  speculative decode off, `pull --verify` skips it when absent, and the
  startup check never asks to repair it. The weights are 105.3 GB in 25 files.
- Speculative decode drafts one token instead of four, and its numbers are
  measured rather than projected. On the 0.2.0 build the A/B read ×0.55 /
  0.69 / 0.88 / 0.96 at 20 / 29 / 42 / 57 experts per layer, ×0.65 at a
  fixed 14 GB target, and ×0.88 at the 122 per layer auto enables it at: a
  loss everywhere. One draft reads ×1.13 at 57 and ×1.17 at 122 (two drafts
  ×1.13), so the default is now 1 and auto's 120-per-layer threshold stands,
  measured. The ceiling is measured too: with every expert resident a verify
  pass costs about a sixth of a pass per extra token (new hidden
  `mtp-passcost`), which caps one-draft speculation at about ×1.4. The
  ×1.5–1.9 estimate for large caches is withdrawn, and auto's threshold
  reads 28 GB, not ~26. The `mtp-check`
  continuation gate now bounds the reused state's logits by the plain
  re-chunking band instead of comparing liveness, which was a near-tie coin
  toss that the depth change flipped.
- `pull`'s connection report counts the connections in use at once, one per
  session, instead of every distinct connection since the start; 0.2.1 could
  print "10 connections in use" for eight workers after two reconnects.
- `Tools/e2e_release.sh` expects the Ollama load acknowledgment for a chat
  with no messages, the 0.2.1 behaviour, instead of the 400 it asserted
  before; it was the one failing check of 31 against the installed 0.2.1.

## 0.2.1 — 2026-09-01

- `pull` opens the connections it claimed. Each of its eight connections is
  now its own URLSession: HTTP/2 multiplexes every request in a session over
  one TCP connection and ignores `httpMaximumConnectionsPerHost`, so every
  pull through 0.2.0 ran at one connection's speed — 25 to 40 MB/s from a home
  link 100 ms from Hugging Face, 72 from a gigabit datacenter link. Eight real
  connections measured 112 MB/s over a full install on that link (16 minutes)
  and 50 to 63 at home, and `pull` now prints the count it actually measured. The
  README's claim that Hugging Face caps the transfer near 55 MB/s was this bug
  seen from one link; it is withdrawn, as is the "R2 tested and rejected"
  verdict that rested on the same link (MEASUREMENTS.md, 2026-09-01).
- The Ollama CLI works again. 0.1.8's strict validator rejected the empty
  `name`/`system`/`template`/`options` the CLI's `/api/show` request always
  carries, so `ollama run` stopped before its first message. `/api/show` now
  accepts the deprecated `name` alias and empty overrides (non-empty ones stay
  a 400), advertises `capabilities`, chat/generate accept `keep_alive` and a
  null `options`, and generate accepts the empty `suffix`/`template` the
  CLI's one-shot mode sends (a non-empty suffix or template is still a 400).
  Ollama's documented "load" request (an empty prompt, or no messages), which
  the CLI sends when an interactive session opens, is acknowledged with
  `done_reason: "load"` instead of refused. Gated by `Tools/api_robustness.sh`
  with the CLI's exact request shapes.
- A weights directory reached through a symlink loads. Foundation refuses to
  list a symlinked directory, so `run` and `serve` failed with "couldn't be
  opened" while `doctor` and `pull --verify` worked; paths are now resolved
  once at the CLI boundary and in the shard index. Gated by `runtime-check`
  (weights-free) and a `verify.sh` run through a symlink.


## 0.2.0 — 2026-09-01

- Speculative decode with the model's draft head: `--mtp auto|on|off` on
  `run`, `serve`, and `doctor`. Auto enables it only at 120 or more experts per layer
  after its 1.6 GB charge, which raises the auto ceiling to 34.6 GB. Measured
  depth-1 accept rate 85.8%; ×0.96 at a 16 GB target, so it stays off there;
  the large-cache A/B is still pending.
- `Tools/mtp_convert.py` rebuilds `mtp.safetensors` (1.47 GB) from the
  official release with sha256 provenance; new `mtp-parity`, `mtp-accept`,
  `mtp-bench`, and `mtp-check` commands; `verify.sh` runs the MTP gates when
  the file is present.

## 0.1.10 — 2026-08-31

- Parity goldens ship in the repo, so a fresh clone can run the battery.

## 0.1.9 — 2026-08-31

- Installer and CI hardening; GitHub Actions runtimes updated.

## 0.1.8 — 2026-08-31

- Every weight file is checked against a sha256 manifest compiled into the
  binary; `pull --verify` covers all 24.
- Elastic drill and battery memory targets fixed; the `--memory-gb` promise
  re-verified and its measurements corrected.

## 0.1.7 — 2026-08-30

- Warm-decode estimates re-anchored on measurement; the planner no longer
  extrapolates past verified points.
- `Tools/e2e_release.sh`: acceptance run against the installed release.
- Live governor resize behavior observed and recorded.

## 0.1.6 — 2026-08-30

- Conversation prefix cache: follow-up turns prefill only what is new.
- Prefill pass size recalibrated.

## 0.1.5 and earlier — 2026-08-28 to 2026-08-29

- Serving robustness: every input that used to crash the server or corrupt
  its output is now a gated test.
- First public releases: the streaming engine, memory planner, `doctor`,
  `pull`, and the Ollama/OpenAI server. Details on the
  [releases page](https://github.com/carloslfu/slotstream/releases).
