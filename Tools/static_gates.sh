#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py
python3 Tools/coverage_ratchet_test.py
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

.build/release/slotstream runtime-check
.build/release/slotstream pull-check
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"
