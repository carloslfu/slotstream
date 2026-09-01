# Changelog

What each release changed, newest first. `curl | sh` installs the latest
release; anything under **Unreleased** is on `main` only.

## Unreleased (main, versioned 0.2.0)

- Speculative decode with the model's draft head: `--mtp auto|on|off` on
  `run` and `serve`. Auto enables it only at 120 or more experts per layer
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
