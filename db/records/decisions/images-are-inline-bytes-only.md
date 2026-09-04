---
type: decision
id: 01m1mtx00b0hawxkasv8a9fm59
created: 2026-09-03T23:50:38.859168+00:00
updated: 2026-09-03T23:50:38.879295+00:00
summary: slotstream never dereferences a URL a request hands it; images are inline bytes only
decided_on: 2026-09-03
evidence: '[[records/design/vision-how-a-picture-becomes-tokens]]'
reversible_if: never, without an explicit allowlist, a size bound, a timeout, and a SECURITY.md that says so
title: slotstream never dereferences a URL a request hands it; images are inline bytes only
status: standing
---
An `image_url` may be a `data:` URL or bare base64. Any other scheme is a 400 that names itself. The version this replaces fell through to `Data(contentsOf:)` whenever a base64 decode failed, which is an unbounded, untimed fetch of an attacker-chosen host and, via `file://`, a read of any image on the disk — reachable from anything that can POST to the loopback port, and a contradiction of SECURITY.md's loopback-only, no-outbound-traffic promise. Ollama accepts base64 only for the same reason. `vision-check` and `api_robustness.sh` both gate it.