#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
# Render production Home navigation offscreen with real dbmd and scripted inference.
# No model or user Home is loaded.
DBMD=${SLOTSTREAM_DBMD:-$HOME/.dbmd/bin/dbmd}
python3 Tools/prepare_slotstream_build.py
swift build --disable-build-manifest-caching --package-path apps/macos --product SlotstreamDesktop -j "${SLOTSTREAM_BUILD_JOBS:-2}"
BIN=$(swift build --disable-build-manifest-caching --package-path apps/macos --show-bin-path)
TMP=$(mktemp -d "${TMPDIR:-/tmp}/slotstream-home-ui-XXXXXX")
trap 'rm -rf "$TMP"' EXIT
# Reuse exactly the clang module flags SwiftPM used for the app module.
python3 Tools/slotstream_clang_flags.py "$(dirname "$BIN")/../debug.yaml" > "$TMP/xcc.args"
XCC=()
while IFS= read -r -d '' flag; do
  XCC+=("$flag")
done < "$TMP/xcc.args"
# Bash 3.2 treats an empty array as unset under nounset; guard its expansion.
SDK=$(xcrun --show-sdk-path)
# Command Line Tools keep their frameworks beside usr/; Xcode toolchains have none here.
FW="$(dirname "$(dirname "$(dirname "$(xcrun --find swiftc)")")")/Library/Developer/Frameworks"
[ -d "$FW" ] || FW="$SDK/System/Library/Frameworks"
swiftc -module-name SlotstreamHomeUIChecks -parse-as-library -c apps/macos/NativeChecks/HomeUIChecks.swift -o "$TMP/checks.o" \
  -I "$BIN/Modules" -target arm64-apple-macosx14.0 -Onone -enable-testing \
  -DSWIFT_PACKAGE -DDEBUG -DSWIFT_MODULE_RESOURCE_BUNDLE_UNAVAILABLE ${XCC[@]+"${XCC[@]}"} \
  -module-cache-path "$BIN/ModuleCache" -swift-version 5 -I "$FW" -L "$FW" \
  -sdk "$SDK" -g -Xcc -isysroot -Xcc "$SDK" -Xcc -fPIC -Xcc -g -package-name macos
swiftc -lc++ -L "$BIN" -o "$TMP/checks" -module-name SlotstreamHomeUIChecks -Xlinker -no_warn_duplicate_libraries -emit-executable \
  -Xlinker -rpath -Xlinker @loader_path "@$BIN/SlotstreamDesktop.product/Objects.LinkFileList" "$TMP/checks.o" \
  -target arm64-apple-macosx14.0 -framework Foundation -framework Metal -framework Accelerate -framework Vision -framework WebKit \
  -I "$FW" -L "$FW" -sdk "$SDK" -g
OUT=${SLOTSTREAM_UI_OUT:-$PWD/.build/slotstream-home-ui}
mkdir -p "$OUT"
SLOTSTREAM_UI_OUT="$OUT" SLOTSTREAM_FONTS="$PWD/apps/macos/Resources/Fonts" SLOTSTREAM_DBMD="$DBMD" "$TMP/checks"
