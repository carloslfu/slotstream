#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
CONFIG=${SEVRA_BUILD_CONFIGURATION:-release}
DBMD=${SEVRA_DBMD:-$HOME/.dbmd/bin/dbmd}
APP="$PWD/.build/Sevra.app"
if pgrep -x Sevra >/dev/null; then
  echo "Quit the running Sevra app before rebuilding its bundle." >&2
  exit 1
fi
mkdir -p .build
STAGE=$(mktemp -d "$PWD/.build/sevra-bundle-XXXXXX")
trap 'rm -rf "$STAGE"' EXIT
python3 Tools/mac_build_inputs.py "$DBMD" > "$STAGE/before.json"
swift build --package-path apps/macos -c "$CONFIG" --product Sevra -j 2
swift build --package-path apps/macos -c "$CONFIG" --product sevra-extract -j 2
OUT=$(swift build --package-path apps/macos -c "$CONFIG" --show-bin-path)
python3 Tools/mac_build_inputs.py "$DBMD" > "$STAGE/after.json"
if ! cmp -s "$STAGE/before.json" "$STAGE/after.json"; then
  echo "Build inputs changed during compilation. Repeat the build with stable sources." >&2
  exit 1
fi
BUNDLE="$STAGE/Sevra.app"
mkdir -p "$BUNDLE/Contents/MacOS" "$BUNDLE/Contents/Resources" "$BUNDLE/Contents/Helpers"
cp -R apps/macos/Resources/Fonts "$BUNDLE/Contents/Resources/"
cp -R apps/macos/Resources/Licenses "$BUNDLE/Contents/Resources/"
cp apps/macos/Resources/Sevra.icns "$BUNDLE/Contents/Resources/"
cp "$OUT/Sevra" "$BUNDLE/Contents/MacOS/Sevra"
cp Tools/lib/mlx-0.32.2.metallib "$BUNDLE/Contents/MacOS/mlx.metallib"
cp "$DBMD" "$BUNDLE/Contents/Helpers/dbmd"
cp "$OUT/sevra-extract" "$BUNDLE/Contents/Helpers/sevra-extract"
cp apps/macos/Info.plist "$BUNDLE/Contents/Info.plist"
cp "$STAGE/before.json" "$BUNDLE/Contents/Resources/build-inputs.json"
codesign --force --sign - "$BUNDLE/Contents/Helpers/dbmd"
codesign --force --sign - "$BUNDLE/Contents/Helpers/sevra-extract"
codesign --force --sign - "$BUNDLE/Contents/MacOS/mlx.metallib"
codesign --force --sign - "$BUNDLE"
codesign --verify --deep --strict "$BUNDLE"
if [ -d "$APP" ]; then
  rm -rf "$PWD/.build/Sevra.previous.app"
  mv "$APP" "$PWD/.build/Sevra.previous.app"
fi
mv "$BUNDLE" "$APP"
printf '%s\n' "$APP"
