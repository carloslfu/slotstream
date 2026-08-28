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
BASE="https://github.com/$REPO/releases/latest/download"
BIN_DIR="$HOME/.slotstream/bin"

[ "$(uname -s)" = "Darwin" ] || { echo "slotstream runs on macOS only" >&2; exit 1; }
[ "$(uname -m)" = "arm64" ] || {
    echo "slotstream needs an Apple Silicon Mac (this machine is $(uname -m))" >&2; exit 1; }
MAJOR=$(sw_vers -productVersion | cut -d. -f1)
[ "$MAJOR" -ge 14 ] || {
    echo "slotstream needs macOS 14 or newer (this is $(sw_vers -productVersion))" >&2; exit 1; }

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

echo "downloading slotstream (latest release, about 50 MB)"
curl -fL --progress-bar -o "$TMP/slotstream.tar.gz" "$BASE/slotstream-arm64.tar.gz"
curl -fsSL -o "$TMP/expected.sha256" "$BASE/slotstream-arm64.tar.gz.sha256"
GOT=$(shasum -a 256 "$TMP/slotstream.tar.gz" | cut -d' ' -f1)
WANT=$(cut -d' ' -f1 < "$TMP/expected.sha256")
[ "$GOT" = "$WANT" ] || { echo "sha256 mismatch (got $GOT, want $WANT); aborting" >&2; exit 1; }

mkdir -p "$BIN_DIR"
tar xzf "$TMP/slotstream.tar.gz" -C "$BIN_DIR"
VERSION=$("$BIN_DIR/slotstream" --version) || {
    echo "the installed binary failed to run" >&2; exit 1; }
echo "installed slotstream $VERSION to $BIN_DIR"

# Put it on PATH: a wrapper in /usr/local/bin when that is writable without
# sudo, otherwise one guarded line in the shell profile. The wrapper execs the
# real binary so the Metal library colocated with it is always found.
NOW="slotstream"
case ":$PATH:" in
*":$BIN_DIR:"*) ;;
*)
    if [ -d /usr/local/bin ] && [ -w /usr/local/bin ]; then
        printf '#!/bin/sh\nexec "$HOME/.slotstream/bin/slotstream" "$@"\n' > /usr/local/bin/slotstream
        chmod +x /usr/local/bin/slotstream
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
            fi
            echo "added ~/.slotstream/bin to PATH in $PROFILE (new terminals pick it up)"
        else
            echo 'add to your PATH: export PATH="$HOME/.slotstream/bin:$PATH"'
        fi
        NOW="$BIN_DIR/slotstream"
    fi
    ;;
esac

if (exec < /dev/tty) 2>/dev/null; then
    printf "start the server now? (it will ask before downloading the 104 GB model) [Y/n] " > /dev/tty
    read -r ANS < /dev/tty || ANS=n
    case "$ANS" in
    n | N | no | NO) echo "when you are ready:  $NOW serve" ;;
    *) exec "$BIN_DIR/slotstream" serve ;;
    esac
else
    echo "next:  $NOW serve"
fi
