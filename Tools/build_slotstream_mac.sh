#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
CONFIG=${SLOTSTREAM_BUILD_CONFIGURATION:-release}
DBMD=${SLOTSTREAM_DBMD:-$HOME/.dbmd/bin/dbmd}
APP="$PWD/.build/Slotstream.app"
if pgrep -x Slotstream >/dev/null; then
  echo "Quit the running Slotstream app before rebuilding its bundle." >&2
  exit 1
fi
mkdir -p .build
STAGE=$(mktemp -d "$PWD/.build/slotstream-bundle-XXXXXX")
trap 'rm -rf "$STAGE"' EXIT
python3 Tools/mac_build_inputs.py "$DBMD" > "$STAGE/before.json"
python3 Tools/prepare_slotstream_build.py --configuration "$CONFIG"
swift build --disable-build-manifest-caching --package-path apps/macos -c "$CONFIG" --product SlotstreamDesktop -j 2
swift build --disable-build-manifest-caching --package-path apps/macos -c "$CONFIG" --product slotstream-extract -j 2
OUT=$(swift build --disable-build-manifest-caching --package-path apps/macos -c "$CONFIG" --show-bin-path)
python3 Tools/mac_build_inputs.py "$DBMD" > "$STAGE/after.json"
if ! cmp -s "$STAGE/before.json" "$STAGE/after.json"; then
  echo "Build inputs changed during compilation. Repeat the build with stable sources." >&2
  exit 1
fi
BUNDLE="$STAGE/Slotstream.app"
mkdir -p "$BUNDLE/Contents/MacOS" "$BUNDLE/Contents/Resources" "$BUNDLE/Contents/Helpers"
cp -R apps/macos/Resources/Fonts "$BUNDLE/Contents/Resources/"
cp -R apps/macos/Resources/Licenses "$BUNDLE/Contents/Resources/"
cp apps/macos/Resources/Slotstream.icns "$BUNDLE/Contents/Resources/"
cp "$OUT/SlotstreamDesktop" "$BUNDLE/Contents/MacOS/Slotstream"
cp Tools/lib/mlx-0.32.2.metallib "$BUNDLE/Contents/MacOS/mlx.metallib"
cp "$DBMD" "$BUNDLE/Contents/Helpers/dbmd"
cp "$OUT/slotstream-extract" "$BUNDLE/Contents/Helpers/slotstream-extract"
cp apps/macos/Info.plist "$BUNDLE/Contents/Info.plist"
cp "$STAGE/before.json" "$BUNDLE/Contents/Resources/build-inputs.json"
codesign --force --sign - "$BUNDLE/Contents/Helpers/dbmd"
codesign --force --sign - "$BUNDLE/Contents/Helpers/slotstream-extract"
codesign --force --sign - "$BUNDLE/Contents/MacOS/mlx.metallib"
codesign --force --sign - "$BUNDLE"
codesign --verify --deep --strict "$BUNDLE"
# Copying helpers/resources and signing are part of the stable-input interval.
# Refuse a changed input before replacing either existing bundle.
python3 Tools/mac_build_inputs.py "$DBMD" > "$STAGE/final.json"
if ! cmp -s "$STAGE/before.json" "$STAGE/final.json"; then
  echo "Bundle inputs changed during assembly. Repeat the build with stable sources." >&2
  exit 1
fi
if [ -d "$APP" ]; then
  rm -rf "$PWD/.build/Slotstream.previous.app"
  mv "$APP" "$PWD/.build/Slotstream.previous.app"
fi
mv "$BUNDLE" "$APP"
printf '%s\n' "$APP"
