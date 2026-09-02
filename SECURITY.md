# Security

## Reporting

Report a vulnerability privately through GitHub's
[Report a vulnerability](https://github.com/carloslfu/slotstream/security/advisories/new)
form, or email carloslfu@gmail.com. I aim to acknowledge within a few days.
Please do not open a public issue for anything exploitable.

## What runs where

- `serve` binds 127.0.0.1 only and has no authentication. Anything on the
  same machine can talk to it; nothing off the machine can.
- Browser origins are allowed only from loopback hosts (`localhost`,
  `127.0.0.1`, `::1`, `0.0.0.0`). A wildcard would let any website you visit
  drive the model through your browser, so there isn't one.
- The engine makes no network calls. Only the download path does, to the
  pinned Hugging Face mirror with the original repo as fallback.
- No telemetry, no analytics, no update checks.

## Supply chain

- Releases are built by GitHub Actions from the tagged commit with signed
  provenance. Verify an asset instead of trusting the download:
  `gh attestation verify slotstream-arm64.tar.gz --repo carloslfu/slotstream`.
- `install.sh` downloads the latest release and its `.sha256` and aborts on a
  mismatch. The Metal library it fetches for macOS 14 and 15 comes from
  pinned wheel URLs with pinned hashes.
- All 25 weight files are checked against sha256 hashes compiled into the
  binary before the engine reads them; `pull --verify` re-checks a copy any
  time.

## Scope

Supported: the latest release and `main`. Out of scope: the model's own
behavior, and third-party clients that talk to the server.
