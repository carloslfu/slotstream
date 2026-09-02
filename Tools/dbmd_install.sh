#!/bin/bash
# Install the pinned dbmd release the brain gates run with. Version and
# tarball hashes are pinned here, so CI executes exactly the binary that was
# reviewed; bump both together. Installs to ~/.dbmd/bin (or $DBMD_INSTALL_DIR),
# no sudo, and is a no-op when that version is already there.
set -euo pipefail

VERSION=0.13.4
case "$(uname -s)-$(uname -m)" in
  Darwin-arm64)  target=darwin-aarch64;    sha=edccfa072babbadbbac965af3c4ad87aedb8ac33e56bc96e4cd48cf294d5708a ;;
  Darwin-x86_64) target=darwin-x86_64;     sha=20fdd7b78fe5e1e2b6db325ac25610f82e86576d68a9ae4ee7559bc82e21b461 ;;
  Linux-x86_64)  target=linux-x86_64-musl; sha=6d558e318703d0d6515219de13cf54c739466142e942e306fac35016782ff491 ;;
  Linux-aarch64) target=linux-aarch64-musl; sha=9c584b80724be47ae20ebd3e5069ad5adad711a0f3ce0a01d30baa923bb581b4 ;;
  *) echo "dbmd_install: unsupported platform $(uname -s)-$(uname -m)" >&2; exit 1 ;;
esac

dest="${DBMD_INSTALL_DIR:-$HOME/.dbmd/bin}"
if [ -x "$dest/dbmd" ] && [ "$("$dest/dbmd" --version 2>/dev/null || true)" = "dbmd $VERSION" ]; then
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
