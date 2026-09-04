#!/bin/bash
# Line coverage for the library, measured by running the check catalogue.
#
# This does not use `swift test --enable-code-coverage`, because that needs
# XCTest and this toolchain is Command Line Tools only. Instead the runner is
# built with the profiling instrumentation directly and llvm-cov reads what it
# wrote — the CLT ships llvm-profdata and llvm-cov, just not the test modules.
#
#   Tools/coverage.sh                 # T0, the tier that needs nothing
#   Tools/coverage.sh t0 t1           # add the MLX tier (needs the metallib)
#   Tools/coverage.sh --lcov out.info # also write lcov, for CI to upload
#
# Prints a per-file table for Sources/Slotstream and Sources/SlotstreamDiagnostics.
set -euo pipefail
cd "$(dirname "$0")/.."

TIERS=()
LCOV=""
while [ $# -gt 0 ]; do
    case "$1" in
        --lcov) shift; LCOV="${1:-coverage.info}" ;;
        t0|t1|t2|t3|t4) TIERS+=("--tier" "$1") ;;
        *) echo "usage: Tools/coverage.sh [t0 t1 ...] [--lcov FILE]" >&2; exit 2 ;;
    esac
    shift
done
[ ${#TIERS[@]} -eq 0 ] && TIERS=("--tier" "t0")

BUILD=.build/coverage
PROF="$BUILD/checks.profraw"
rm -rf "$BUILD"; mkdir -p "$BUILD"

echo "== build (instrumented) =="
swift build --scratch-path "$BUILD" \
    --skip-update \
    -Xswiftc -profile-generate -Xswiftc -profile-coverage-mapping \
    --product slotstream-checks 2>&1 | grep -E 'error:|Build complete' || true

BIN="$BUILD/debug/slotstream-checks"
[ -x "$BIN" ] || { echo "no runner at $BIN" >&2; exit 1; }
# MLX finds its shaders next to whatever executable is running.
[ -f Tools/lib/mlx-0.31.1.metallib ] && cp Tools/lib/mlx-0.31.1.metallib "$BUILD/debug/mlx.metallib"

echo "== run =="
LLVM_PROFILE_FILE="$PROF" "$BIN" "${TIERS[@]}"

echo "== coverage =="
xcrun llvm-profdata merge -sparse "$PROF" -o "$BUILD/checks.profdata"
xcrun llvm-cov report "$BIN" -instr-profile "$BUILD/checks.profdata" \
    -ignore-filename-regex='(checkouts/|Sources/SlotstreamTestKit|Sources/slotstream-checks)' \
    2>/dev/null | grep -E 'Filename|^-|Sources/(Slotstream|SlotstreamDiagnostics)/|TOTAL'

if [ -n "$LCOV" ]; then
    xcrun llvm-cov export -format=lcov "$BIN" -instr-profile "$BUILD/checks.profdata" \
        -ignore-filename-regex='(checkouts/|Sources/SlotstreamTestKit|Sources/slotstream-checks)' \
        > "$LCOV" 2>/dev/null
    echo "lcov: $LCOV ($(grep -c '^DA:' "$LCOV") line records)"
fi
