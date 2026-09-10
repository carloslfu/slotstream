---
type: run
id: 01m1wnkg5bzm33sm8qc2rb9k9g
created: 2026-09-07T00:52:00.299792+00:00
updated: 2026-09-07T01:07:59.736776+00:00
summary: Installed acceptance reads the actual nested discovery cap; no installed run yet
binary: 9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9
captured_at: 2026-09-07
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Installed acceptance reads the actual nested discovery cap; no installed run yet
tool: Native Swift diagnostics and Python CLI gates
---
# Installed-gate correction before release

The new dynamic over-context payload in e2e_release.sh initially read the
memory plan from an absent top-level key. Actual Server discovery puts it
under details.memory_plan. The single path is corrected before running the
installed acceptance; the unchanged HTTP 400 requirement remains. The real
shell extraction helper recovers 32768, 65536 and 262144 from corresponding
discovery-shaped fixtures, and bash syntax validation passes. The complete
shared-worktree packet also includes the previously reviewed typed refusals
for simulated unavailable memory, replacing obsolete floor-success assertions.

These are harness checks only. No installed end-to-end run, release,
installation or rollback was performed. The preserved public 0.2.11 binary
and Metal library remain the prepared, unexercised rollback target.

## Frozen build identity

```json
{
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "dbdef8e89d59e853fabca4661eff67851fd097c8680beed9fab5fb465a0b819d"
}
```

## e2e-discovery-path-v215/manifest.json

SHA-256 `46b33d165aa99a1924526bd3ee5bbe6c84a7b6177e19458a27aa96fb4b4ee5d4`; 500 bytes.

````text
{
  "file": "Tools/e2e_release.sh",
  "before_sha256": "5028fe66d6e2646ac30d0f40acb4b6d07080f5ca2b3e73ee149e7219f133e9bf",
  "after_sha256": "7b1f8bbe71d7b176b4880b1c909c6076fa873c67b62d128bdc95d10190b9b861",
  "shared_matches_before": false,
  "checks": [
    {
      "cap": 32768,
      "observed": 32768
    },
    {
      "cap": 65536,
      "observed": 65536
    },
    {
      "cap": 262144,
      "observed": 262144
    }
  ],
  "shell_syntax_passed": true,
  "installed_run_started": false
}

````

## e2e-discovery-path-v215/fix.patch

SHA-256 `c00f502d56eacde1f1f0539cef425b1fc65abfcce11d87e3d7d9304989f445ac`; 1224 bytes.

````text
--- a/Tools/e2e_release.sh
+++ b/Tools/e2e_release.sh
@@ -90,7 +90,7 @@
 # A chat with no messages is Ollama's documented "load" request (0.2.1): it is
 # acknowledged with done_reason "load" and no text, never refused or answered.
 chk "no-messages chat is the load request"  "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[],\"stream\":false}' http://127.0.0.1:$PORT/api/chat | grep -q '\"done_reason\":\"load\"'"
-CONTEXT=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['memory_plan']['max_context_tokens']")
+CONTEXT=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['memory_plan']['max_context_tokens']")
 python3 -c "import json,sys; cap=int(sys.argv[1]); assert 1<=cap<=262144; print(json.dumps({'model':'qwen3.8-flash-next:4bit','messages':[{'role':'user','content':'x '*(cap+1000)}],'stream':False}))" "$CONTEXT" > /tmp/ss_big.json
 chk "over-length prompt refused with 400"    "[ \"\$(curl -s -o /dev/null -w '%{http_code}' --max-time 300 -H 'Content-Type: application/json' --data-binary @/tmp/ss_big.json http://127.0.0.1:$PORT/api/chat)\" = 400 ]"
 

````

## e2e-context-acceptance-packet/manifest.json

SHA-256 `d1eba2db28d325dfa2639312446588868feb973cf17ac8b211ab4364b7cb2528`; 347 bytes.

````text
{
  "file": "Tools/e2e_release.sh",
  "before_sha256": "c20b4a568696772b1c7d14dae79c97cd8bc50cb09f2b82b098f0a1ca0684f180",
  "after_sha256": "7b1f8bbe71d7b176b4880b1c909c6076fa873c67b62d128bdc95d10190b9b861",
  "purpose": "Use typed busy-memory refusals and actual discovery window in installed release acceptance",
  "installed_e2e_ran": false
}

````

## e2e-context-acceptance-packet/fix.patch

SHA-256 `fe477d2fe2afd8262d04f7cfed19e85f55b68a50b10fe9def09e78c321d22db1`; 2546 bytes.

````text
--- a/Tools/e2e_release.sh
+++ b/Tools/e2e_release.sh
@@ -31,8 +31,8 @@
 chk "installed binary reports a version"    "[ -n \"$EXPECTED\" ]"
 chk "metallib shipped beside the binary"    "[ -f \$HOME/.slotstream/bin/mlx.metallib ]"
 chk "doctor runs with no model loaded"      "$B doctor >/dev/null"
-chk "doctor simulates a 16 GB Mac"          "$B doctor --sim-ram 17.2 --sim-available 6 | grep -q 'experts per layer'"
-chk "doctor simulates an 8 GB Mac"          "$B doctor --sim-ram 8 --sim-available 3 >/dev/null"
+chk "doctor refuses unavailable memory on a busy 16 GB Mac" "$B doctor --sim-ram 17.2 --sim-available 6 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\"'"
+chk "doctor refuses unavailable memory on an 8 GB Mac" "$B doctor --sim-ram 8 --sim-available 3 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\"'"
 
 echo "== weights-free gates from the installed binary =="
 chk "sampler golden (greedy)"                "$B sampler-golden --temperature 0 --draws 8 >/dev/null"
@@ -90,7 +90,8 @@
 # A chat with no messages is Ollama's documented "load" request (0.2.1): it is
 # acknowledged with done_reason "load" and no text, never refused or answered.
 chk "no-messages chat is the load request"  "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[],\"stream\":false}' http://127.0.0.1:$PORT/api/chat | grep -q '\"done_reason\":\"load\"'"
-python3 -c "import json;print(json.dumps({'model':'qwen3.8-flash-next:4bit','messages':[{'role':'user','content':'x '*90000}],'stream':False}))" > /tmp/ss_big.json
+CONTEXT=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['memory_plan']['max_context_tokens']")
+python3 -c "import json,sys; cap=int(sys.argv[1]); assert 1<=cap<=262144; print(json.dumps({'model':'qwen3.8-flash-next:4bit','messages':[{'role':'user','content':'x '*(cap+1000)}],'stream':False}))" "$CONTEXT" > /tmp/ss_big.json
 chk "over-length prompt refused with 400"    "[ \"\$(curl -s -o /dev/null -w '%{http_code}' --max-time 300 -H 'Content-Type: application/json' --data-binary @/tmp/ss_big.json http://127.0.0.1:$PORT/api/chat)\" = 400 ]"
 
 R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count from 1 to 9 separated by spaces, digits only."}],"stream":false,"options":{"temperature":0,"num_predict":40,"stop":["4"]}}' | jq_ "d['message']['content']")

````
