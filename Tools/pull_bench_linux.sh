#!/bin/bash
# Measure `slotstream pull` from a Linux box with a fast port, in Docker.
# Builds the exact Sources/slotstream/Pull.swift + PinnedModel.swift (swift-crypto
# stands in for CryptoKit; the Darwin-only connection report is compiled out)
# and runs a real pull of the pinned weights. Linux is not a supported platform;
# this is a bandwidth instrument. 2026-09-01 on a 1 Gbit/s Hetzner port: 8
# connections held 108 MB/s, VERIFY PASS (MEASUREMENTS.md).
#
#   Tools/pull_bench_linux.sh [workdir] [connections]     # default /tmp/slotstream-bench, 8
#
# Needs docker (the swift:6.1-noble image, ~4.5 GB) and ~110 GB free under workdir.
# Delete workdir afterwards; it holds the 104 GB of weights and a root-owned .build.
set -euo pipefail
cd "$(dirname "$0")/.."
WORK="${1:-/tmp/slotstream-bench}"
CONNS="${2:-8}"
IMAGE=swift:6.1-noble
mkdir -p "$WORK/pullbench/Sources" "$WORK/model"
cp Sources/slotstream/Pull.swift Sources/slotstream/PinnedModel.swift "$WORK/pullbench/Sources/"
cp Tools/pull-bench-linux/main.swift "$WORK/pullbench/Sources/main.swift"
cp Tools/pull-bench-linux/Package.swift "$WORK/pullbench/Package.swift"
echo "== build ($IMAGE) =="
docker run --rm -v "$WORK/pullbench:/src" -w /src "$IMAGE" swift build -c release 2>&1 | grep -E "error:|Build complete" || true
echo "== weights-free regressions =="
docker run --rm -v "$WORK/pullbench:/src" -w /src "$IMAGE" /src/.build/release/pullbench pull-check | tail -1
echo "== pull, $CONNS connections, into $WORK/model (Ctrl-C is safe; rerun resumes) =="
START=$(date +%s)
docker run --rm --network host -v "$WORK/pullbench:/src" -v "$WORK/model:/model" -w /src "$IMAGE" \
  /src/.build/release/pullbench pull --dir /model --connections "$CONNS"
END=$(date +%s)
echo "wall time: $(( (END - START) / 60 )) min $(( (END - START) % 60 )) s"
