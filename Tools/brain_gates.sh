#!/bin/bash
# The brain's gates: the store validates, the generated documents match their
# records, and every public number still has its needle on its surfaces.
# Needs dbmd (Tools/dbmd_install.sh pins the version CI uses).
set -euo pipefail
cd "$(dirname "$0")/.."
export PATH="$HOME/.dbmd/bin:$PATH"
if ! command -v dbmd >/dev/null 2>&1; then
  echo "dbmd not found: run Tools/dbmd_install.sh" >&2
  exit 1
fi
dbmd validate --all db
python3 Tools/projections.py --check
python3 Tools/claims_gate.py
echo "BRAIN GATES PASS"
