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
# URLs and digests are pinned with the MLX version. Live PyPI metadata used to
# decide what entered a release build, making the same commit non-reproducible.
if [ "$HOST" -le 14 ]; then
    URL=https://files.pythonhosted.org/packages/39/66/2313497fdbc7fbadf8e026c09366e3f049f9114e65ca4edc23cdb8699186/mlx_metal-0.31.1-py3-none-macosx_14_0_arm64.whl
    SHA=70741174131dbf7fdd479cb730e06e08c358eac3bf7905d9e884e7960cfdd5b8
elif [ "$HOST" -lt 26 ]; then
    URL=https://files.pythonhosted.org/packages/c7/34/4c3c6890ce6095b2ab2ba2f5f15c9a7ba17208d47f8cacb572885a2dc0eb/mlx_metal-0.31.1-py3-none-macosx_15_0_arm64.whl
    SHA=6c56bd8cd27743e635f5a90a22535af7c31bd22b4b126d46b6da2da52d72e413
else
    URL=https://files.pythonhosted.org/packages/51/bc/987cb99e3aafb296aa11ce5133838a10eae8447edd53168d0804d4fb3a14/mlx_metal-0.31.1-py3-none-macosx_26_0_arm64.whl
    SHA=e7324b7c56b519ae67c025d3ced07e5d35bc3a9f19d4c45fe4927f385148c59e
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
