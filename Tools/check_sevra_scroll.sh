#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
# Compile the production native text view into an offscreen component probe.
# The Mac package's presentation product must already have been built.
OUT=$(swift build --package-path apps/macos -c release --show-bin-path)
TMP=$(mktemp -d "${TMPDIR:-/tmp}/sevra-scroll-check-XXXXXX")
trap 'rm -rf "$TMP"' EXIT
OBJECTS=()
# find, not ripgrep: a clean Mac, such as a CI runner, has only the system tools.
for target in SevraPresentation Markdown CAtomic cmark_gfm cmark_gfm_extensions; do
    while IFS= read -r object; do OBJECTS+=("$object"); done < <(find "$OUT/$target.build" -name '*.o' -type f | sort)
done
swiftc -swift-version 5 -parse-as-library -I "$OUT/Modules" \
    -I apps/macos/.build/checkouts/swift-markdown/Sources/CAtomic/include \
    -I apps/macos/.build/checkouts/swift-cmark/src/include \
    -I apps/macos/.build/checkouts/swift-cmark/extensions/include \
    apps/macos/App/NativeText.swift apps/macos/NativeChecks/ScrollChecks.swift \
    "${OBJECTS[@]}" -o "$TMP/checks"
"$TMP/checks"
