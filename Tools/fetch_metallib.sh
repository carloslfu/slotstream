#!/bin/bash
# Fetch the prebuilt MLX metallib (GPU kernels) that make colocates next to the
# binary. SwiftPM cannot compile Metal shaders without Xcode, so we take the
# metallib from the mlx-metal 0.31.1 PyPI wheel, the same MLX version mlx-swift
# vendors. Picks the wheel built for this macOS major version.
set -euo pipefail
cd "$(dirname "$0")/.."
OUT="${OUT:-Tools/lib/mlx-0.31.1.metallib}"
if [ -s "$OUT" ]; then
    echo "already have $OUT"
    exit 0
fi
mkdir -p "$(dirname "$OUT")"
# CI overrides this to package a specific build regardless of runner OS.
HOST=${SLOTSTREAM_METALLIB_MACOS:-$(sw_vers -productVersion | cut -d. -f1)}
URL=$(curl -fsSL https://pypi.org/pypi/mlx-metal/0.31.1/json | python3 -c "
import json, sys
host = int(sys.argv[1])
wheels = []
for u in json.load(sys.stdin)['urls']:
    name = u['filename']
    if 'arm64' not in name:
        continue
    ver = int(name.split('macosx_')[1].split('_')[0])
    wheels.append((ver, u['url']))
wheels.sort()
best = [w for w in wheels if w[0] <= host] or wheels[:1]
print(best[-1][1])
" "$HOST")
echo "downloading $(basename "$URL") (about 50 MB)"
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
curl -fL --progress-bar -o "$TMP/wheel.zip" "$URL"
unzip -p "$TMP/wheel.zip" 'mlx/lib/mlx.metallib' > "$TMP/mlx.metallib"
if [ "$(stat -f%z "$TMP/mlx.metallib")" -lt 50000000 ]; then
    echo "extracted metallib is implausibly small; aborting" >&2
    exit 1
fi
mv "$TMP/mlx.metallib" "$OUT"
echo "ok: $OUT"
