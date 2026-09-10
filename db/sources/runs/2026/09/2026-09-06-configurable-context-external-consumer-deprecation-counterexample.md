---
type: run
id: 01m1w4zzhn7gjs9125c985kzka
created: 2026-09-06T20:01:43.477743+00:00
updated: 2026-09-06T20:01:43.653500+00:00
summary: External Swift consumer compiles but strict warning gate exposes deprecated stride metadata
binary: 85638bad9c7b1f8e40921e7ac4ac61ac6b2618442521ef35611db40bafef760a
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: External Swift consumer compiles but strict warning gate exposes deprecated stride metadata
tool: Native Swift diagnostics and Python CLI gates
---
# External public-consumer counterexample

The external SwiftPM fixture builds the public imports and original function
signatures from an independent temporary package. The initial network-heavy
attempt was stopped while fetching upstream MLX history. The next attempt
reuses only already committed upstream Git objects through child-specific
file mirrors; SwiftPM still independently resolves and checks out revisions.

Compilation reaches the source, but the existing strict consumer gate fails
on two deprecated MLXArray.strides uses in the GDN projection diagnostic. The
criterion is preserved. The documented replacement is asData(access:.noCopy)
and its strides field, which evaluates the original backing and preserves its
layout while the arrays remain alive. The default copy method would instead
make a contiguous copy and must not be substituted. A prospective diagnostic-
only correction and clearer context CLI help await build19 and fresh external
consumer verification. No public source compatibility pass is claimed here.

Command: bash Tools/consumer_smoke.sh, -j2, one build under the shared lock.
All model/compiler children exited; escaped old network-clone descendants were
explicitly found and terminated in the recorded follow-up cleanup.

## Frozen build identity

```json
{
  "binary_sha256": "85638bad9c7b1f8e40921e7ac4ac61ac6b2618442521ef35611db40bafef760a",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "cfad0737b11adb19cf2c3b33d428dbce7c83de67207ef89451737132c4f61ff1"
}
```

## consumer-cached-18-public.json

SHA-256 `3ebab9b1197fc6ac3684da628722f826fe6d6f17caaaf3f26861efd141100ebe`; 636 bytes.

````text
{
  "passed": false,
  "exit_code": 1,
  "source_unchanged": true,
  "method": "independent external SwiftPM consumer, -j2, exact committed upstream Git repositories reused through child-only file mirrors",
  "raw_stdout_sha256": "5edb74ae9acda9002fccedd08227d2f238d50f4a2ea4ff0371b6002a1792d77a",
  "projection": "only absolute checkout prefix replaced with <checkout>; warning wording unchanged",
  "initial_network_attempt": {
    "exit_code": -15,
    "reason": "bounded attempt stopped after approximately ten minutes of slow upstream Git submodule fetching; exact descendant cleanup preserved in the private local manifest"
  }
}

````

## consumer-cached-18-public.txt

SHA-256 `493cdc470d370da6feded64d1448b36c36bfefcd4fccab5b16573a563616c607`; 14140 bytes.

````text
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:75: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                           `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
<checkout>/Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift:40:86: warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]
   |                                                                                      `- warning: 'strides' is deprecated: Do not use -- see asData(access:) [#DeprecatedDeclaration]

````
