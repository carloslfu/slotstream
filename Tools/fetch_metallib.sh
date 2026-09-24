#!/bin/bash
# Fetch the prebuilt MLX metallib (GPU kernels) that make colocates next to the
# binary. SwiftPM cannot compile Metal shaders without Xcode, so we take the
# metallib from the mlx-metal 0.32.2 PyPI wheel, the same MLX version mlx-swift
# vendors. Picks the wheel built for this macOS major version.
set -euo pipefail
cd "$(dirname "$0")/.."
OUT="${OUT:-Tools/lib/mlx-0.32.2.metallib}"
if [ -s "$OUT" ]; then
    echo "already have $OUT"
    exit 0
fi
mkdir -p "$(dirname "$OUT")"
# CI overrides this to package a specific build regardless of runner OS.
HOST=${SLOTSTREAM_METALLIB_MACOS:-$(sw_vers -productVersion | cut -d. -f1)}
# URLs and digests are pinned with the MLX version. Live PyPI metadata used to
# decide what entered a release build, making the same commit non-reproducible.
if [ "$HOST" -le 14 ]; then
    URL=https://files.pythonhosted.org/packages/f7/ab/ba1952908c5d2a5070cf1cfbfea0161c4751ea62299e2776819810917483/mlx_metal-0.32.2-py3-none-macosx_14_0_arm64.whl
    SHA=3825fff379dbc107dd3413e564a06caeaa24819910ec49c0439e454c06a1b9b8
elif [ "$HOST" -lt 26 ]; then
    URL=https://files.pythonhosted.org/packages/79/ec/34f37376e26d537fadffb99af3a760d6545e37f5e1a30a552baadf237fc5/mlx_metal-0.32.2-py3-none-macosx_15_0_arm64.whl
    SHA=55a369250d220b2cf10213a87a2ac1b1a420608c5b35b1df4e7147ac8e32f121
else
    URL=https://files.pythonhosted.org/packages/dd/cd/4e50bf325100e7165e13d025f264362bf0009196269f9eaf87f2c6e738a2/mlx_metal-0.32.2-py3-none-macosx_26_0_arm64.whl
    SHA=e6abeac9ac5265830c9c1541b6f96e9be37a85c2446763a46ad466c63a3837ab
fi
echo "downloading $(basename "$URL") (about 50 MB)"
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
curl -fL --progress-bar -o "$TMP/wheel.zip" "$URL"
GOT=$(shasum -a 256 "$TMP/wheel.zip" | cut -d' ' -f1)
[ "$GOT" = "$SHA" ] || { echo "mlx-metal wheel sha256 mismatch" >&2; exit 1; }
unzip -p "$TMP/wheel.zip" 'mlx/lib/mlx.metallib' > "$TMP/mlx.metallib"
if [ "$(stat -f%z "$TMP/mlx.metallib")" -lt 50000000 ]; then
    echo "extracted metallib is implausibly small; aborting" >&2
    exit 1
fi
mv "$TMP/mlx.metallib" "$OUT"
echo "ok: $OUT"
