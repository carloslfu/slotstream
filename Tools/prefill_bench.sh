#!/usr/bin/env bash
# Unified optimization benchmark; see --help for paired runs.
set -euo pipefail
cd "$(dirname "$0")/.."
exec python3 Tools/prefill_bench.py "$@"
