#!/bin/sh
# slotstream installer.
#
#   curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
#
# Installs the prebuilt binary and its Metal library into ~/.slotstream/bin,
# puts it on your PATH, and offers to start the server. Re-run the same line
# to upgrade. Uninstall: rm -rf ~/.slotstream and remove the PATH line this
# script printed, if it added one.
set -eu

REPO="carloslfu/slotstream"
# Overrides exist only so CI can exercise the real installer without touching a
# developer's home directory or downloading an already-published release.
BASE=${SLOTSTREAM_RELEASE_BASE:-"https://github.com/$REPO/releases/latest/download"}
ROOT_DIR=${SLOTSTREAM_ROOT_DIR:-"$HOME/.slotstream"}
BIN_DIR="$ROOT_DIR/bin"

[ "$(uname -s)" = "Darwin" ] || { echo "slotstream runs on macOS only" >&2; exit 1; }
[ "$(uname -m)" = "arm64" ] || {
    echo "slotstream needs an Apple Silicon Mac (this machine is $(uname -m))" >&2; exit 1; }
MAJOR=$(sw_vers -productVersion | cut -d. -f1)
[ "$MAJOR" -ge 14 ] || {
    echo "slotstream needs macOS 14 or newer (this is $(sw_vers -productVersion))" >&2; exit 1; }

TMP=$(mktemp -d)
NEXT_LINK=""
trap 'rm -rf "$TMP"; [ -z "$NEXT_LINK" ] || rm -f "$NEXT_LINK"' EXIT

echo "downloading slotstream (latest release, about 50 MB)"
curl -fL --progress-bar -o "$TMP/slotstream.tar.gz" "$BASE/slotstream-arm64.tar.gz"
curl -fsSL -o "$TMP/expected.sha256" "$BASE/slotstream-arm64.tar.gz.sha256"
GOT=$(shasum -a 256 "$TMP/slotstream.tar.gz" | cut -d' ' -f1)
WANT=$(cut -d' ' -f1 < "$TMP/expected.sha256")
[ "$GOT" = "$WANT" ] || { echo "sha256 mismatch (got $GOT, want $WANT); aborting" >&2; exit 1; }

STAGE="$TMP/release"
mkdir -p "$STAGE"
tar xzf "$TMP/slotstream.tar.gz" -C "$STAGE"

# The tarball's Metal library is built for macOS 26. On macOS 14 and 15,
# replace it with the build for that OS from the pinned mlx-metal 0.31.1
# wheel — the same source and version a from-source build uses.
WHEEL_MAJOR=${SLOTSTREAM_MACOS_MAJOR:-$MAJOR} # override exists for testing only
WHEEL_URL="" WHEEL_SHA=""
case "$WHEEL_MAJOR" in
14)
    WHEEL_URL="https://files.pythonhosted.org/packages/39/66/2313497fdbc7fbadf8e026c09366e3f049f9114e65ca4edc23cdb8699186/mlx_metal-0.31.1-py3-none-macosx_14_0_arm64.whl"
    WHEEL_SHA=70741174131dbf7fdd479cb730e06e08c358eac3bf7905d9e884e7960cfdd5b8
    ;;
15)
    WHEEL_URL="https://files.pythonhosted.org/packages/c7/34/4c3c6890ce6095b2ab2ba2f5f15c9a7ba17208d47f8cacb572885a2dc0eb/mlx_metal-0.31.1-py3-none-macosx_15_0_arm64.whl"
    WHEEL_SHA=6c56bd8cd27743e635f5a90a22535af7c31bd22b4b126d46b6da2da52d72e413
    ;;
esac
if [ -n "$WHEEL_URL" ]; then
    echo "fetching the Metal library built for macOS $WHEEL_MAJOR (about 40 MB)"
    curl -fL --progress-bar -o "$TMP/mlx-metal.whl" "$WHEEL_URL"
    GOTW=$(shasum -a 256 "$TMP/mlx-metal.whl" | cut -d' ' -f1)
    [ "$GOTW" = "$WHEEL_SHA" ] || { echo "sha256 mismatch on the mlx-metal wheel; aborting" >&2; exit 1; }
    unzip -p "$TMP/mlx-metal.whl" 'mlx/lib/mlx.metallib' > "$STAGE/mlx.metallib"
fi

test -s "$STAGE/slotstream" && test -s "$STAGE/mlx.metallib" || {
    echo "release is missing the binary or Metal library" >&2; exit 1; }
chmod +x "$STAGE/slotstream"
VERSION=$("$STAGE/slotstream" --version) || {
    echo "the staged binary failed to run; existing install was not changed" >&2; exit 1; }

# Publish a complete, verified release directory, then switch one symlink. A
# failed download/unzip can no longer leave a new binary beside an old or
# zero-byte metallib. The first upgrade from the old directory layout preserves
# that directory as bin.previous.<pid> for manual rollback.
RELEASE_KEY="$WANT-macos$WHEEL_MAJOR"
RELEASE_DIR="$ROOT_DIR/releases/$RELEASE_KEY"
mkdir -p "$ROOT_DIR/releases"
if [ -d "$RELEASE_DIR" ]; then
    # A content-addressed directory may already exist after a prior install.
    # Do not trust its name alone: local damage or an interrupted manual copy
    # must not be activated in place of the release we just verified.
    cmp -s "$STAGE/slotstream" "$RELEASE_DIR/slotstream" \
        && cmp -s "$STAGE/mlx.metallib" "$RELEASE_DIR/mlx.metallib" || {
        echo "existing staged release is incomplete or corrupt: $RELEASE_DIR" >&2
        echo "remove that one directory and rerun the installer" >&2
        exit 1
    }
else
    mv "$STAGE" "$RELEASE_DIR"
fi
NEXT_LINK="$ROOT_DIR/.bin.next.$$"
ln -s "releases/$RELEASE_KEY" "$NEXT_LINK"
if [ -L "$BIN_DIR" ]; then
    mv -fh "$NEXT_LINK" "$BIN_DIR"
elif [ -e "$BIN_DIR" ]; then
    PREVIOUS="$ROOT_DIR/bin.previous.$$"
    mv "$BIN_DIR" "$PREVIOUS"
    if ! mv "$NEXT_LINK" "$BIN_DIR"; then
        mv "$PREVIOUS" "$BIN_DIR"
        echo "could not activate the staged release; previous install restored" >&2
        exit 1
    fi
    echo "previous install preserved at $PREVIOUS"
else
    mv "$NEXT_LINK" "$BIN_DIR"
fi
NEXT_LINK=""
echo "installed slotstream $VERSION to $BIN_DIR"

# Put it on PATH: a wrapper in /usr/local/bin when that is writable without
# sudo, otherwise one guarded line in the shell profile. The wrapper execs the
# real binary so the Metal library colocated with it is always found.
NOW="slotstream"
case ":$PATH:" in
*":$BIN_DIR:"*) ;;
*)
    if [ -d /usr/local/bin ] && [ -w /usr/local/bin ]; then
        WRAPPER="$TMP/slotstream-wrapper"
        printf '#!/bin/sh\nexec "$HOME/.slotstream/bin/slotstream" "$@"\n' > "$WRAPPER"
        chmod +x "$WRAPPER"
        mv -f "$WRAPPER" /usr/local/bin/slotstream
        echo "linked /usr/local/bin/slotstream"
    else
        PROFILE=""
        case "${SHELL:-}" in
        */zsh) PROFILE="$HOME/.zshrc" ;;
        */bash) PROFILE="$HOME/.bash_profile" ;;
        esac
        if [ -n "$PROFILE" ]; then
            if ! grep -qs '\.slotstream/bin' "$PROFILE"; then
                printf '\nexport PATH="$HOME/.slotstream/bin:$PATH"\n' >> "$PROFILE"
                echo "added ~/.slotstream/bin to PATH in $PROFILE (new terminals pick it up)"
            else
                echo "PATH already set up in $PROFILE"
            fi
        else
            echo 'add to your PATH: export PATH="$HOME/.slotstream/bin:$PATH"'
        fi
        NOW="$BIN_DIR/slotstream"
    fi
    ;;
esac

if (exec < /dev/tty) 2>/dev/null; then
    printf "start the server now? (it will ask before downloading the 105 GB model) [Y/n] " > /dev/tty
    read -r ANS < /dev/tty || ANS=n
    case "$ANS" in
    n | N | no | NO) echo "when you are ready:  $NOW serve" ;;
    *) exec "$BIN_DIR/slotstream" serve ;;
    esac
else
    echo "next:  $NOW serve"
fi
