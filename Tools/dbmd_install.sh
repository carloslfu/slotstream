#!/bin/bash
# Install the pinned dbmd release the brain gates run with. Version and
# tarball hashes are pinned here, so CI executes exactly the binary that was
# reviewed; bump both together. Installs to ~/.dbmd/bin (or $DBMD_INSTALL_DIR),
# no sudo, and is a no-op when that version is already there.
set -euo pipefail

VERSION=0.14.0
case "$(uname -s)-$(uname -m)" in
  Darwin-arm64)  target=darwin-aarch64;    sha=c990ddfa251e063d7e9c6c8d6b632c4a0124290f71a46a59315049596e16edfd ;;
  Darwin-x86_64) target=darwin-x86_64;     sha=248ac058663711d6334a52e52a7f34732c3565b0d6ff9794b02129b3c5632074 ;;
  Linux-x86_64)  target=linux-x86_64-musl; sha=910f4c24bac6e5dc9afaf1906114e7ce1ad8a8c69649c9c2aff37ec56d8129f1 ;;
  Linux-aarch64) target=linux-aarch64-musl; sha=d24bf9678a925f76600391411abf9dbae825b560d00fdd1dab28d7e893dbb4fc ;;
  *) echo "dbmd_install: unsupported platform $(uname -s)-$(uname -m)" >&2; exit 1 ;;
esac

dest="${DBMD_INSTALL_DIR:-$HOME/.dbmd/bin}"
if [ -x "$dest/dbmd" ] && installed_version=$("$dest/dbmd" --version 2>/dev/null) \
    && [ "$installed_version" = "dbmd $VERSION" ]; then
  echo "dbmd $VERSION already installed at $dest/dbmd"
  exit 0
fi

tarball="dbmd-$VERSION-$target.tar.gz"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
curl -fsSL "https://github.com/carloslfu/db.md/releases/download/v$VERSION/$tarball" -o "$tmp/$tarball"
if command -v sha256sum >/dev/null 2>&1; then
  actual="$(sha256sum "$tmp/$tarball" | cut -d' ' -f1)"
else
  actual="$(shasum -a 256 "$tmp/$tarball" | cut -d' ' -f1)"
fi
if [ "$actual" != "$sha" ]; then
  echo "dbmd_install: checksum mismatch for $tarball (got $actual)" >&2
  exit 1
fi
tar -xzf "$tmp/$tarball" -C "$tmp"
mkdir -p "$dest"
install -m 0755 "$tmp/dbmd-$VERSION-$target/dbmd" "$dest/dbmd"
echo "installed dbmd $VERSION to $dest/dbmd"
