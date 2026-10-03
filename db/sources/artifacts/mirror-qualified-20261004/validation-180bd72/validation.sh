#!/bin/bash
set -euo pipefail
ROOT=/Volumes/llm/slotstream-pr24-upstream-180bd72
OUT=/Volumes/llm/slotstream-pr24-20261004-180bd72
PREVIOUS=/Volumes/llm/slotstream-pr24-20261003-followup
mkdir -p "$OUT/tmp"
exec > "$OUT/validation.out" 2>&1
export PATH=/Volumes/llm/dbmd/bin:/Volumes/llm/toolchains/swift-6.3/swift-6.3-RELEASE-osx-package.pkg/Payload/usr/bin:/opt/homebrew/bin:$PATH
export SDKROOT=$(xcrun --show-sdk-path)
export TMPDIR="$OUT/tmp"
export PYTHON=/opt/homebrew/Cellar/omlx/0.7.0rc1/libexec/bin/python3.11
export SLOTSTREAM_TEST_BINARY="$PREVIOUS/frozen/slotstream"
cd "$ROOT"
git diff --quiet f37412f HEAD -- Sources Package.swift Package.resolved Tools/verify.sh Tools/adaptive_memory_e2e.py
python3 - <<'PY'
import subprocess,json,hashlib
from pathlib import Path
out=Path('/Volumes/llm/slotstream-pr24-20261004-180bd72')
def git(*args): return subprocess.check_output(['git',*args],text=True).strip()
previous='f37412f65d2382cafd930172c9aec9da51cf3265';head=git('rev-parse','HEAD')
compiled={}
for path in ['Sources','Package.swift','Package.resolved']:
 a=git('rev-parse',previous+':'+path);b=git('rev-parse',head+':'+path);assert a==b
 compiled[path]={'measured_git_object':a,'current_git_object':b,'equal':True}
record={'measured_source':previous,'current_head':head,'compiled_inputs':compiled,'verify_script_equal':True,'adaptive_acceptance_tool_equal':True,'tools_diff':git('diff','--name-status',previous,head,'--','Tools'),'binary_sha256':hashlib.sha256(Path('/Volumes/llm/slotstream-pr24-20261003-followup/frozen/slotstream').read_bytes()).hexdigest(),'new_static_gate_uses_frozen_binary':True,'previous_mac_gates':'all seven stages passed at f37412f; actual logs retained separately'}
(out/'source-equivalence.json').write_text(json.dumps(record,indent=2)+'\n')
PY
run_gate() {
 name=$1; shift
 date -u; echo "START $name"
 set +e
 "$@" > "$OUT/$name.log" 2>&1
 code=$?
 set -e
 echo "$code" > "$OUT/$name.exit"
 tail -n 6 "$OUT/$name.log"
 echo "END $name exit=$code"
 return "$code"
}
run_gate affine-control python3 Tools/affine_expert_control_test.py
run_gate affine-reference python3 Tools/affine_expert_reference_test.py
run_gate static-entry python3 Tools/static_gates_binary_test.py
echo WAITING_FOR_FULL_MODEL_NATIVE_LOCK
while [ ! -f "$PREVIOUS/acceptance-keepalive-off/verify.exit" ]; do sleep 5; done
run_gate static bash Tools/static_gates.sh
git status --short > "$OUT/worktree-status.txt"
echo CURRENT_STATIC_COMPLETE
