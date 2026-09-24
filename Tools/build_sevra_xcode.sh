#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
# Build apps/macos/Sevra.xcodeproj the way someone with Xcode would: Release,
# Apple silicon, ad hoc signed. The development Mac has only the Command Line
# Tools, so CI runs this (sevra-mac.yml). The bundle phase copies the pinned
# dbmd and Metal library into the app: run Tools/dbmd_install.sh and
# Tools/fetch_metallib.sh first.
CONFIG=${SEVRA_BUILD_CONFIGURATION:-Release}
DBMD=${SEVRA_DBMD:-$HOME/.dbmd/bin/dbmd}
[ -x "$DBMD" ] || { echo "no dbmd at $DBMD: run Tools/dbmd_install.sh" >&2; exit 1; }
[ -s Tools/lib/mlx-0.32.2.metallib ] || { echo "no Metal library: run Tools/fetch_metallib.sh" >&2; exit 1; }

# Xcode keeps its own resolved file beside the project. Seed it from the
# package's, so the project builds the versions the scripted checks build,
# and fail below if Xcode moved any of them.
PINS=apps/macos/Sevra.xcodeproj/project.xcworkspace/xcshareddata/swiftpm
mkdir -p "$PINS"
cp apps/macos/Package.resolved "$PINS/Package.resolved"

xcodebuild -project apps/macos/Sevra.xcodeproj -scheme Sevra -configuration "$CONFIG" \
  -derivedDataPath .build/xcode -skipPackagePluginValidation -skipMacroValidation \
  ARCHS=arm64 build

python3 - "$PINS/Package.resolved" apps/macos/Package.resolved <<'PY'
import json, sys
def pins(path):
    return {p["identity"]: p["state"].get("revision") for p in json.load(open(path))["pins"]}
built, pinned = pins(sys.argv[1]), pins(sys.argv[2])
moved = sorted(name for name in pinned if built.get(name) != pinned[name])
if moved:
    sys.exit("Xcode built other versions than apps/macos/Package.resolved pins: " + ", ".join(moved))
print(f"Xcode built the {len(pinned)} pinned package versions")
PY

APP=.build/xcode/Build/Products/$CONFIG/Sevra.app
for part in Contents/MacOS/Sevra Contents/MacOS/mlx.metallib Contents/Helpers/dbmd Contents/Helpers/sevra-extract; do
  [ -s "$APP/$part" ] || { echo "the bundle is missing $part" >&2; exit 1; }
done
codesign --verify --deep --strict "$APP"
echo "built and verified $APP"
