#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
# Native development regressions use scripted inference and disposable Homes.
# This never starts a model or qualifies a signed/installed public release.
for product in Sevra sevra-local sevra-composer-checks sevra-presentation-checks sevra-mac-checks sevra-extract; do
  swift build --package-path apps/macos -c release --product "$product" -j 2
done
OUT=$(swift build --package-path apps/macos -c release --show-bin-path)
# Run every suite even after one fails, so a slow run reports all its failures
# at once. The script still fails if any suite did.
failed=()
suite() { "$@" || failed+=("$*"); }
suite "$OUT/sevra-composer-checks"
suite "$OUT/sevra-presentation-checks"
suite bash Tools/check_sevra_scroll.sh
suite bash Tools/check_sevra_thinking_ui.sh
suite bash Tools/check_sevra_apps_ui.sh
suite bash Tools/check_sevra_memory_ui.sh
# The runtime finds the helper beside the check binary; name it explicitly.
suite env SEVRA_EXTRACT="$OUT/sevra-extract" "$OUT/sevra-mac-checks"
if [ ${#failed[@]} -gt 0 ]; then
  printf 'FAILED SUITE: %s\n' "${failed[@]}" >&2
  exit 1
fi
