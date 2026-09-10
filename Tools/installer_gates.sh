#!/bin/bash
# Exercise the public installer against a local release fixture. This is the
# real install.sh, not a second implementation of its filesystem transitions.
set -euo pipefail
cd "$(dirname "$0")/.."

BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
LIB="$(dirname "$BIN")/mlx.metallib"
test -x "$BIN"
test -s "$LIB"

T=$(mktemp -d)
trap 'rm -rf "$T"' EXIT
FIXTURE="$T/release"
TEST_ROOT="$T/fresh"
LEGACY_ROOT="$T/legacy"
mkdir -p "$FIXTURE" "$TEST_ROOT" "$LEGACY_ROOT/bin" "$T/asset"

# Package the selected bytes under the public asset names, even if the
# caller uses a differently named executable or a directory with spaces.
cp "$BIN" "$T/asset/slotstream"
cp "$LIB" "$T/asset/mlx.metallib"
tar -czf "$FIXTURE/slotstream-arm64.tar.gz" -C "$T/asset" slotstream mlx.metallib
(cd "$FIXTURE" && shasum -a 256 slotstream-arm64.tar.gz > slotstream-arm64.tar.gz.sha256)
BASE="file://$FIXTURE"

install_into() {
  local root=$1
  PATH="$root/bin:$PATH" \
    SLOTSTREAM_ROOT_DIR="$root" \
    SLOTSTREAM_RELEASE_BASE="$BASE" \
    SLOTSTREAM_MACOS_MAJOR=26 \
    sh install.sh </dev/null
}

assert_installed_bytes() {
  local root=$1
  cmp -s "$root/bin/slotstream" "$BIN"
  cmp -s "$root/bin/mlx.metallib" "$LIB"
  test "$("$root/bin/slotstream" --version)" = "$("$BIN" --version)"
}

install_into "$TEST_ROOT" >/dev/null
test -L "$TEST_ROOT/bin"
test -x "$TEST_ROOT/bin/slotstream"
test -s "$TEST_ROOT/bin/mlx.metallib"
assert_installed_bytes "$TEST_ROOT"
FIRST_TARGET=$(readlink "$TEST_ROOT/bin")

# Reinstalling identical bytes must reuse the content-addressed release and
# leave a complete, runnable activation behind.
install_into "$TEST_ROOT" >/dev/null
test "$(readlink "$TEST_ROOT/bin")" = "$FIRST_TARGET"
assert_installed_bytes "$TEST_ROOT"

# A bad checksum must fail before changing the active installation.
cp "$FIXTURE/slotstream-arm64.tar.gz.sha256" "$T/good.sha256"
printf '%064d  slotstream-arm64.tar.gz\n' 0 > "$FIXTURE/slotstream-arm64.tar.gz.sha256"
if install_into "$TEST_ROOT" >/dev/null 2>&1; then
  echo "installer accepted a bad checksum" >&2
  exit 1
fi
test "$(readlink "$TEST_ROOT/bin")" = "$FIRST_TARGET"
assert_installed_bytes "$TEST_ROOT"
mv "$T/good.sha256" "$FIXTURE/slotstream-arm64.tar.gz.sha256"

# The first upgrade from the old directory layout preserves it for rollback
# and atomically replaces `bin` with the release symlink.
printf 'old install\n' > "$LEGACY_ROOT/bin/legacy-marker"
install_into "$LEGACY_ROOT" >/dev/null
test -L "$LEGACY_ROOT/bin"
assert_installed_bytes "$LEGACY_ROOT"
set -- "$LEGACY_ROOT"/bin.previous.*
test "$#" -eq 1 && test -f "$1/legacy-marker"

echo "INSTALLER GATES PASS"
