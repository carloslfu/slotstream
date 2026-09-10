---
type: run
id: 01m1wjpvbec0cy5hpxvej07gaz
created: 2026-09-07T00:01:24.334018+00:00
updated: 2026-09-07T00:01:24.742983+00:00
summary: Full vision test profile and mandatory acceptance hardening
binary: runtime unchanged V202 b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf
captured_at: 2026-09-06
command: V209 full image profile import and9 provider-free tests
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Full vision test profile and mandatory acceptance hardening
tool: reviewed patch import and provider-free shell/predicate checks
---
V209 imports the reviewed full vision-serving test profile and stronger distinct-image predicate. Only exact matching hunks are applied to the two shared human documents; unrelated context/public-release history is preserved. Tools match their reviewed preimages. All143 runtime Source files remain byte-identical. The existing full-image25/25, ordinary10GB quality15/15 and actual Hermes/Ollama client pass are correctness-only and do not qualify throughput/capacity. Their profile2 exact receipt is preserved below. Full-image server uses14.5GB/3072-token prefill reservation with20.5GB actual reclaimable preflight; override is confined to that server, with ordinary equality/quality budgets unchanged. Runtime guards, images, subject checks and defaults are unchanged.

Two remaining mandatory-vision skip paths now increment FAIL: missing independent-reference environment, and insufficient full-image headroom. Original safe no-launch behavior is preserved. Nine provider-free checks execute both actual shell fragments, six actual source-predicate cases, and shell syntax. Neither error/empty image responses nor a skipped required vision suite can qualify. The separately documented optional absent MTP head behavior is retained; this optimization task requires its present fixture and complete no-skip full acceptance.

## /tmp/slotstream-optimization-execution/vision-acceptance-v209/manifest.json

SHA256 `6e9a842bc77911961fa69d63350b0fbe163182ac37a1b0ac35055b560abe3b6c`

```
{
  "classification": "Exact helper/verification profile import; matching docs hunks only; mandatory vision skips fail full acceptance",
  "runtime_sources_unchanged": true,
  "paths": [
    {
      "path": "Tools/vision_serving.py",
      "before_sha256": "cf2d20d547c29e8d65bcc0dafa8c349d743425ed629a0259bbe9c861ffc94f62",
      "proposal_preimage_matches": true,
      "after_sha256": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
    },
    {
      "path": "Tools/verify.sh",
      "before_sha256": "e5cf7f3849faee9f796d34173b899d2326c0d2ab606bf395acccc6b31dda2764",
      "proposal_preimage_matches": true,
      "after_sha256": "065603247c7f82afb19935ae3656a16f1fa15b5a70618d2f70d26d7e618a3b35"
    },
    {
      "path": "CLAUDE.md",
      "before_sha256": "db920481905568abcfbb44f66621e5023a9884a8211fea772a696539740b50fc",
      "proposal_preimage_matches": false,
      "after_sha256": "62775fb54c3cb74c3402a27d06b7f5ab69b0fe6863abe9928e76a83b1343950e"
    },
    {
      "path": "docs/TESTING.md",
      "before_sha256": "da34833652eace5a832d85f9aa00a1aa25f269ecab0ba5f0a2ce673abafef861",
      "proposal_preimage_matches": false,
      "after_sha256": "419e6cc014292fc78d6406381c337d809755c776b6b825d021dc43d634129abf"
    }
  ],
  "proposal": {
    "reason": "Original full-size image workspace must fit the explicit verification target; an error response cannot count as different image content",
    "runtime_sources_changed": false,
    "defaults_changed": false,
    "gate_result": "remaining-clients-v202-profile2: 25 image, 15 quality, actual Hermes tool/followup/title/image and Ollama image pass",
    "paths": [
      {
        "path": "Tools/vision_serving.py",
        "before_sha256": "cf2d20d547c29e8d65bcc0dafa8c349d743425ed629a0259bbe9c861ffc94f62",
        "after_sha256": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
      },
      {
        "path": "Tools/verify.sh",
        "before_sha256": "e5cf7f3849faee9f796d34173b899d2326c0d2ab606bf395acccc6b31dda2764",
        "after_sha256": "d2f9ace4a9d87d5d2ce248b03729da1d7097a369f10fa56fab16dc9e75238216"
      },
      {
        "path": "CLAUDE.md",
        "before_sha256": "4c0981a6e42b819fa01fff8c2eab9f4b0b23aacf35a7e27b2f1d2d258d8e397c",
        "after_sha256": "6f027e5aade4675bc5bb31b2e5a31947357d592be309ae90330242069bf7c343"
      },
      {
        "path": "docs/TESTING.md",
        "before_sha256": "c9c377ada97812b0f3f338c8b111d9e1341291503ffe6c5d3defa1fa3c437b57",
        "after_sha256": "8da04fe76a448e19c632c953c0010c2d8b6b21165438612f076eaf6b971987bb"
      }
    ]
  }
}

```

## /tmp/slotstream-optimization-execution/vision-acceptance-v209/fix.patch

SHA256 `9d347e75c6d8277d0070bf3e14cb55e3b8fa8ec8f11c55ee865546598fd637dc`

```
--- a/Tools/vision_serving.py
+++ b/Tools/vision_serving.py
@@ -13,8 +13,11 @@
 clients (CLAUDE.md), and a proxied curl answering for the server is a test that
 passes without the server.
 
-The server must already be running (`serve --memory-gb 10 --port N`) with the
-vision assets in `Tools/assets/vision_test`.
+The server must already be running with the vision assets in
+`Tools/assets/vision_test`. The complete original photographs need the bounded
+full-vision profile from `Tools/verify.sh`: a 14.5 GB total target with
+`SLOTSTREAM_PREFILL_CHUNK=3072`, MTP off and 20.5 GB real reclaimable preflight.
+The smaller refusal/reuse-only modes keep their own declared test targets.
 """
 import base64
 import json
@@ -414,7 +417,7 @@
     #    request replays the first conversation with the other picture at the
     #    same place — a cache keyed on ids alone would answer from the dog's
     #    state about the tree.
-    st, obj, _, _ = chat(
+    first_status, obj, _, _ = chat(
         port, [{"role": "user", "content": "In three words, what is this?", "images": [dog]}])
     first = obj.get("message", {}).get("content", "")
     st, obj, _, _ = chat(
@@ -422,7 +425,8 @@
     second = obj.get("message", {}).get("content", "")
     check(
         "the same words with a different picture get a different answer",
-        says(first, "dog", "puppy", "canine")
+        first_status == 200 and st == 200 and bool(second.strip())
+        and says(first, "dog", "puppy", "canine")
         and not says(second, "dog", "puppy", "canine"),
         f"{first[:60]!r} then {second[:60]!r}")
 
--- a/Tools/verify.sh
+++ b/Tools/verify.sh
@@ -263,25 +263,29 @@
   fi
 else
   echo "SKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)"
+  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
 fi
 
 # Every serving surface, with a real picture, against a real server. The model
 # has to name what is in the photograph: a tower wired to the wrong positions
 # still answers fluently, and nothing cheaper than this notices.
 #
-# At 10 GB including the tower reservation, and only with verified headroom. This gate runs last,
-# after an hour of goldens has filled the file cache, and on 2026-09-03 the
-# kernel killed its server mid-suite at the 10 GB target with 0.3 GB free and
-# swap nearly full. A skip that says so is the correct outcome there; an
-# OOM-killed server is not a vision failure and must not be reported as one.
-NEED_GB=$(awk "BEGIN{print $BIG_MEMORY + 6}")
+# Full original photographs require a 3.99 GB attention workspace reservation.
+# Keep this explicit profile local to this server: ordinary equality/quality
+# gates still use BIG_MEMORY. The 10 GB predecessor now correctly refuses the
+# larger image before dispatch, and that counterexample remains in db/.
+VISION_MEMORY=14.5
+VISION_PREFILL=3072
+NEED_GB=$(awk "BEGIN{print $VISION_MEMORY + 6}")
 AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
 if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
   echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
-  echo "      re-run alone:  $BIN serve --memory-gb $BIG_MEMORY --port 11468 &  Tools/vision_serving.py 11468"
+  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
+  echo "      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=$VISION_PREFILL SLOTSTREAM_BENCH_DETAILS=1 $BIN serve --memory-gb $VISION_MEMORY --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468"
+  echo "      then: python3 Tools/vision_serving.py 11468"
 else
 safety_before "$NEED_GB"
-SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb $BIG_MEMORY --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
+SLOTSTREAM_PREFILL_CHUNK="$VISION_PREFILL" SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb "$VISION_MEMORY" --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
 QPID=$!
 for _ in $(seq 1 120); do
   if grep -q "listening on" /tmp/ssv-vision-serve.log 2>/dev/null; then break; fi
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -122,8 +122,11 @@
    with a 16 GB real reclaimable preflight, internal target-plus-3 GB checks,
    sampled memory/swap evidence and no other heavy work. A skipped drill does
    not pass acceptance. The full image/MTP diagnostic separately uses an
-   explicitly priced 12 GB target and a 15 GB preflight. Never use spare RAM
-   to enlarge an equality profile.
+   explicitly priced 12 GB target and a 15 GB preflight. The complete original
+   vision-serving photographs separately use 14.5 GB and a 3072-token prefill
+   reservation, after a 20.5 GB preflight; that workspace prevents the larger
+   image's correct target refusal. Keep this override local to the image
+   server. Never use spare RAM to enlarge an equality profile.
 6. The engine caps MLX's allocator cache at 2 GB (`Engine.swift`,
    `MLX.Memory.cacheLimit`). Do not remove it: without the cap a 10 GB-target
    server held 15.1 GB of real RSS (freed transients hoarded by the
--- a/docs/TESTING.md
+++ b/docs/TESTING.md
@@ -58,6 +58,15 @@
 target after a 15 GB reclaimable preflight. Its text-only leg can be selected
 with `--vision off` under the ordinary 10 GB test target. A text-only pass does
 not prove the combined image/MTP leg.
+
+The full original vision-serving photographs need a separate profile:
+`--memory-gb 14.5` with `SLOTSTREAM_PREFILL_CHUNK=3072`, MTP off, and a
+20.5 GB real reclaimable preflight. The explicit workspace covers the larger
+image's attention buffers while retaining the original photographs and
+assertions. The old 10 GB profile correctly refuses that image before
+dispatch. This override applies only to the full image server; ordinary
+quality gates keep their smaller target. Successful and nonempty responses
+are required before different-image answers count as content evidence.
 
 ### The Metal library
 

```

## /tmp/slotstream-optimization-execution/vision-acceptance-v209/required-skips.patch

SHA256 `ec3149f8fa1240e896bb1f282edab0076355c7eaaca36d7ba84f2994d7649d3a`

```
--- a/Tools/verify.sh
+++ b/Tools/verify.sh
@@ -263,6 +263,7 @@
   fi
 else
   echo "SKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)"
+  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
 fi
 
 # Every serving surface, with a real picture, against a real server. The model
@@ -279,6 +280,7 @@
 AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
 if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
   echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
+  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
   echo "      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=$VISION_PREFILL SLOTSTREAM_BENCH_DETAILS=1 $BIN serve --memory-gb $VISION_MEMORY --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468"
   echo "      then: python3 Tools/vision_serving.py 11468"
 else

```

## /tmp/slotstream-optimization-execution/vision-acceptance-v209/checks.json

SHA256 `48d5bcc4df006bce77edad85b96cd15da40f6ae77a977a43b7a6ab84a7fe1d81`

```
{
  "classification": "Provider-free actual shell-branch and source-predicate tests; no native/model/GPU work",
  "passed": true,
  "tests": [
    {
      "name": "missing-vision-reference",
      "passed": true,
      "exit": 1,
      "commands": [],
      "stdout": "== vision ==\nSKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)\ncounts=0,1\n",
      "stderr": "",
      "script_sha256": "85700be2730577e7fa4bc3cdbbac7618a4e5ecc96942104141b0942c25d70339"
    },
    {
      "name": "insufficient-vision-headroom",
      "passed": true,
      "exit": 1,
      "commands": [
        "doctor --json"
      ],
      "stdout": "SKIP  vision serving suite (only 1 GB reclaimable, needs 20.5)\n      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=3072 SLOTSTREAM_BENCH_DETAILS=1 /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/vision-acceptance-gate-yz3_xevq/metadata-only serve --memory-gb 14.5 --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468\n      then: python3 Tools/vision_serving.py 11468\ncounts=0,1\n",
      "stderr": "",
      "script_sha256": "10c3ceec4054262c75dcac4dea756a19ebc6b4b6fc5b52b5b8d39269feae008a"
    },
    {
      "name": "successful-different",
      "passed": true,
      "expected": true,
      "actual": true
    },
    {
      "name": "error-is-not-content",
      "passed": true,
      "expected": false,
      "actual": false
    },
    {
      "name": "empty-success-is-not-content",
      "passed": true,
      "expected": false,
      "actual": false
    },
    {
      "name": "first-request-must-succeed",
      "passed": true,
      "expected": false,
      "actual": false
    },
    {
      "name": "same-subject-still-fails",
      "passed": true,
      "expected": false,
      "actual": false
    },
    {
      "name": "original-subject-is-required",
      "passed": true,
      "expected": false,
      "actual": false
    },
    {
      "name": "shell-syntax",
      "passed": true,
      "exit": 0,
      "stderr": ""
    }
  ]
}

```

## /tmp/slotstream-optimization-execution/vision-acceptance-v209/missing-vision-reference.sh

SHA256 `85700be2730577e7fa4bc3cdbbac7618a4e5ecc96942104141b0942c25d70339`

```
set -eo pipefail
PASS=0
FAIL=0
QPID=""
BIN=/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/vision-acceptance-gate-xt_vvmqp/metadata-only
VERIFY_OUT=/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/vision-acceptance-gate-xt_vvmqp
safety_before() { exit 97; }
check() { exit 98; }
echo "== vision =="
# The tower against an independent implementation. It loads 0.9 GB of vision
# tensors and none of the 105 GB trunk, so it is cheap and can run anywhere the
# weights are. mlx 0.31.1 for the same reason the parity goldens use it.
VP="$VERIFY_OUT/vision-parity"
if [ -x .venv31/bin/python ]; then
  check "vision tower dumps its pixels and embeddings" \
    "$BIN vision-parity --out $VP"
  safety_before 7
  if .venv31/bin/python Tools/vision_ref.py "$VP" | tail -8; then
    echo "PASS  vision tower matches the float32 reference within the bf16 band"
    PASS=$((PASS+1))
  else
    echo "FAIL  vision tower parity"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
fi


printf "counts=%s,%s\n" "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]

```

## /tmp/slotstream-optimization-execution/vision-acceptance-v209/insufficient-vision-headroom.sh

SHA256 `10c3ceec4054262c75dcac4dea756a19ebc6b4b6fc5b52b5b8d39269feae008a`

```
set -eo pipefail
PASS=0
FAIL=0
QPID=""
BIN=/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/vision-acceptance-gate-yz3_xevq/metadata-only
VERIFY_OUT=/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/vision-acceptance-gate-yz3_xevq
safety_before() { exit 97; }
check() { exit 98; }
# Every serving surface, with a real picture, against a real server. The model
# has to name what is in the photograph: a tower wired to the wrong positions
# still answers fluently, and nothing cheaper than this notices.
#
# Full original photographs require a 3.99 GB attention workspace reservation.
# Keep this explicit profile local to this server: ordinary equality/quality
# gates still use BIG_MEMORY. The 10 GB predecessor now correctly refuses the
# larger image before dispatch, and that counterexample remains in db/.
VISION_MEMORY=14.5
VISION_PREFILL=3072
NEED_GB=$(awk "BEGIN{print $VISION_MEMORY + 6}")
AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
  echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
  echo "      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=$VISION_PREFILL SLOTSTREAM_BENCH_DETAILS=1 $BIN serve --memory-gb $VISION_MEMORY --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468"
  echo "      then: python3 Tools/vision_serving.py 11468"
else
safety_before "$NEED_GB"
SLOTSTREAM_PREFILL_CHUNK="$VISION_PREFILL" SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb "$VISION_MEMORY" --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if grep -q "listening on" /tmp/ssv-vision-serve.log 2>/dev/null; then break; fi
  sleep 1
done
if python3 Tools/vision_serving.py 11468; then
  echo "PASS  vision serving suite"; PASS=$((PASS+1))
else
  echo "FAIL  vision serving suite"; FAIL=$((FAIL+1))
fi
kill "$QPID" 2>/dev/null || true
wait "$QPID" 2>/dev/null || true
QPID=""
fi

printf "counts=%s,%s\n" "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]

```

## /tmp/slotstream-context-implementation-20260906/remaining-clients-v202-profile2/manifest.json

SHA256 `6ddd80c7426be8fecd81a0d01abade17fe6354b5a4bfa3dc37a542d6cf636050`

```
{
  "passed": true,
  "classification": "image and actual-client correctness; no throughput or capacity claim",
  "identity": {
    "binary_sha256": "b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "source_archive_sha256": "38707bb9cd38ddefe5a793451b55da56012dac1e03332b129d88577831622664"
  },
  "rows": [
    {
      "name": "server-32768-14.5",
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate/slotstream",
        "serve",
        "--port",
        "11630",
        "--memory-gb",
        "14.5",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--max-context",
        "32768",
        "--max-prefill-wait",
        "0",
        "--no-elastic"
      ],
      "prefill_override": 3072,
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 26996736000,
        "swapins": 43826504,
        "swapouts": 77363405,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   117081.\nPages active:                                1155678.\nPages inactive:                               782282.\nPages speculative:                            419155.\nPages throttled:                                   0.\nPages wired down:                             223423.\nPages purgeable:                                8590.\n\"Translation faults\":                    15009719337.\nPages copy-on-write:                       703098151.\nPages zero filled:                       20859465505.\nPages reactivated:                        3421852148.\nPages purged:                               71059606.\nFile-backed pages:                           1522079.\nAnonymous pages:                              835036.\nPages stored in compressor:                  1611027.\nPages occupied by compressor:                 384032.\nDecompressions:                           1160738608.\nCompressions:                             1473004379.\nPageins:                                  7315832670.\nPageouts:                                   11009110.\nSwapins:                                    43826504.\nSwapouts:                                   77363405.\nPages tagged:                                 158213.\nPages tagged resident:                        124424.\nPages tagged compressed:                       33789.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6793.\nPages tag-storage free:                         4077.\nPages tag-storage non-tag pageable:            87426.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6088000.\nTagged compressions:                        11029320.\nTagged decompressions:                      10189508.\n"
      },
      "passed": true,
      "exit": -15,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 31222169600,
        "swapins": 43826532,
        "swapouts": 77363405,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   637070.\nPages active:                                 813488.\nPages inactive:                               530516.\nPages speculative:                            281843.\nPages throttled:                                   0.\nPages wired down:                             223905.\nPages purgeable:                                4487.\n\"Translation faults\":                    15011372274.\nPages copy-on-write:                       703136052.\nPages zero filled:                       20879353478.\nPages reactivated:                        3440523943.\nPages purged:                               71101033.\nFile-backed pages:                           1264093.\nAnonymous pages:                              361754.\nPages stored in compressor:                  2044331.\nPages occupied by compressor:                 596950.\nDecompressions:                           1161601574.\nCompressions:                             1474431955.\nPageins:                                  7339958467.\nPageouts:                                   11013969.\nSwapins:                                    43826532.\nSwapouts:                                   77363405.\nPages tagged:                                 154030.\nPages tagged resident:                        112205.\nPages tagged compressed:                       41825.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                         1798.\nPages tag-storage non-tag pageable:            89709.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7627456.\nTagged compressions:                        11043475.\nTagged decompressions:                      10195596.\n"
      },
      "stdout.txt_sha256": "febe7b1aa155a300004dc5ade140d9b30edf0439fd650289fa3f5fe3ab9cc28f",
      "stderr.txt_sha256": "4d44a118ba83ec9a14fda23e22cebae4a9176485f41f826ffa49796fe9bb7bce"
    },
    {
      "name": "vision-serving",
      "command": [
        "python3",
        "Tools/vision_serving.py",
        "11630"
      ],
      "passed": true,
      "exit": 0,
      "stdout.txt_sha256": "cad604355a037fa28fe4a80e97fd458c0174ddccdd5d08f046ef9859688d37f7",
      "stderr.txt_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    },
    {
      "name": "server-32768-10",
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate/slotstream",
        "serve",
        "--port",
        "11632",
        "--memory-gb",
        "10",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--max-context",
        "32768",
        "--max-prefill-wait",
        "0",
        "--no-elastic"
      ],
      "prefill_override": null,
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 31223693312,
        "swapins": 43826532,
        "swapouts": 77363405,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   637197.\nPages active:                                 813491.\nPages inactive:                               530515.\nPages speculative:                            281849.\nPages throttled:                                   0.\nPages wired down:                             223905.\nPages purgeable:                                4447.\n\"Translation faults\":                    15011372830.\nPages copy-on-write:                       703136203.\nPages zero filled:                       20879353530.\nPages reactivated:                        3440523943.\nPages purged:                               71101033.\nFile-backed pages:                           1264099.\nAnonymous pages:                              361756.\nPages stored in compressor:                  2044326.\nPages occupied by compressor:                 596949.\nDecompressions:                           1161601584.\nCompressions:                             1474431955.\nPageins:                                  7339958468.\nPageouts:                                   11013969.\nSwapins:                                    43826532.\nSwapouts:                                   77363405.\nPages tagged:                                 154030.\nPages tagged resident:                        112205.\nPages tagged compressed:                       41825.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                         1818.\nPages tag-storage non-tag pageable:            89689.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7627456.\nTagged compressions:                        11043475.\nTagged decompressions:                      10195596.\n"
      },
      "passed": true,
      "exit": -15,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 31376588800,
        "swapins": 43826536,
        "swapouts": 77363405,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   469109.\nPages active:                                 788078.\nPages inactive:                              1002187.\nPages speculative:                              8209.\nPages throttled:                                   0.\nPages wired down:                             223598.\nPages purgeable:                                 748.\n\"Translation faults\":                    15011843154.\nPages copy-on-write:                       703150771.\nPages zero filled:                       20879898075.\nPages reactivated:                        3441284996.\nPages purged:                               71105009.\nFile-backed pages:                           1445218.\nAnonymous pages:                              353256.\nPages stored in compressor:                  2038799.\nPages occupied by compressor:                 593563.\nDecompressions:                           1161674529.\nCompressions:                             1474501212.\nPageins:                                  7345871809.\nPageouts:                                   11014171.\nSwapins:                                    43826536.\nSwapouts:                                   77363405.\nPages tagged:                                 153920.\nPages tagged resident:                        113276.\nPages tagged compressed:                       40644.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                          798.\nPages tag-storage non-tag pageable:            90709.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7368640.\nTagged compressions:                        11044364.\nTagged decompressions:                      10197665.\n"
      },
      "stdout.txt_sha256": "ef22963f77edc30d41fb58a7a7a502fc760df37880d39ea239307545cd364ce0",
      "stderr.txt_sha256": "4697e7554db893087d32784c8a196d0905db6f81abb61f72367df1be25d28d31"
    },
    {
      "name": "quality-probe",
      "command": [
        "bash",
        "Tools/quality_probe.sh",
        "11632"
      ],
      "passed": true,
      "exit": 0,
      "stdout.txt_sha256": "66ea787719f1ffd60f65980dfbe8de8cf6de0a0976292817b927c746ee7ce34a",
      "stderr.txt_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    },
    {
      "name": "server-65536-11",
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate/slotstream",
        "serve",
        "--port",
        "11631",
        "--memory-gb",
        "11",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--max-context",
        "65536",
        "--max-prefill-wait",
        "0",
        "--no-elastic"
      ],
      "prefill_override": null,
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 31372886016,
        "swapins": 43826536,
        "swapouts": 77363405,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   469105.\nPages active:                                 788084.\nPages inactive:                              1002188.\nPages speculative:                              8218.\nPages throttled:                                   0.\nPages wired down:                             223598.\nPages purgeable:                                 516.\n\"Translation faults\":                    15011843713.\nPages copy-on-write:                       703150919.\nPages zero filled:                       20879898137.\nPages reactivated:                        3441284996.\nPages purged:                               71105009.\nFile-backed pages:                           1445228.\nAnonymous pages:                              353262.\nPages stored in compressor:                  2038798.\nPages occupied by compressor:                 593562.\nDecompressions:                           1161674535.\nCompressions:                             1474501212.\nPageins:                                  7345871811.\nPageouts:                                   11014171.\nSwapins:                                    43826536.\nSwapouts:                                   77363405.\nPages tagged:                                 153920.\nPages tagged resident:                        113276.\nPages tagged compressed:                       40644.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                          833.\nPages tag-storage non-tag pageable:            90674.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7368640.\nTagged compressions:                        11044364.\nTagged decompressions:                      10197665.\n"
      },
      "passed": true,
      "exit": -15,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 31159697408,
        "swapins": 43826556,
        "swapouts": 77363405,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   501081.\nPages active:                                 885364.\nPages inactive:                               653733.\nPages speculative:                            229615.\nPages throttled:                                   0.\nPages wired down:                             221941.\nPages purgeable:                                  41.\n\"Translation faults\":                    15014122168.\nPages copy-on-write:                       703241615.\nPages zero filled:                       20883819203.\nPages reactivated:                        3456550131.\nPages purged:                               71157709.\nFile-backed pages:                           1400715.\nAnonymous pages:                              367997.\nPages stored in compressor:                  2037318.\nPages occupied by compressor:                 590880.\nDecompressions:                           1163424159.\nCompressions:                             1476291506.\nPageins:                                  7365961599.\nPageouts:                                   11015456.\nSwapins:                                    43826556.\nSwapouts:                                   77363405.\nPages tagged:                                 154622.\nPages tagged resident:                        115382.\nPages tagged compressed:                       39240.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                         3033.\nPages tag-storage non-tag pageable:            88474.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7073152.\nTagged compressions:                        11053355.\nTagged decompressions:                      10207499.\n"
      },
      "stdout.txt_sha256": "62d7d65c171d873cb04a64ff867e932fb986df579f607be0cbb76ce50862f6d8",
      "stderr.txt_sha256": "9586dcb66738246a5b71b7f5a9f68f6ceaf4e9cf400348ca77b909414f3f9715"
    },
    {
      "name": "hermes-image",
      "command": [
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release/.venv/bin/python",
        "Tools/hermes_integration_gate.py",
        "/tmp/slotstream-context-implementation-20260906/hermes-clean-29112bef",
        "/private/tmp/slotstream-context-implementation-20260906/remaining-clients-v202-profile2/hermes-image/report",
        "--port",
        "11631",
        "--context",
        "65536",
        "--image",
        "Tools/assets/vision_test/secret1.jpg"
      ],
      "passed": true,
      "exit": 0,
      "stdout.txt_sha256": "7c454d689910ffdbdb93ba318c97c8205935c22d04a4eaad20d6d1fb11ab3b1a",
      "stderr.txt_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    },
    {
      "name": "ollama-image",
      "command": [
        "/opt/homebrew/bin/ollama",
        "run",
        "qwen3.8-flash-next:4bit",
        "Name the animal in this image in one word. /Users/carlos/Projects/slotstream-context-window/Tools/assets/vision_test/secret1.jpg"
      ],
      "passed": true,
      "exit": 0,
      "stdout.txt_sha256": "4c57097fd5d69bf35fefe4d7e98631c23480a0f43b0ccf68ce8557b4d771b1c1",
      "stderr.txt_sha256": "cc3941b9a3f4aa3f140b7bc03b4e0e08e45cfbba646d6c33b255514fac15bcbe"
    }
  ],
  "driver_sources": {
    "Tools/vision_serving.py": "a176f0c92465a3fa0efe7a7b120f6de8597baff496198a8624b9d08d7392de04",
    "Tools/quality_probe.sh": "cfa2ae2995acd9dd0d416ff2d9e71ec538ab0b259ebbb30324c4ad28c6fca3ba",
    "Tools/hermes_integration_gate.py": "517c4b7fbdc5a24bedb7924cb57051ec65b58d44d0c0df40e7119ab44e54b0f6"
  },
  "prior_vision_reference": "remaining-clients-v202: independent tower reference passed on this unchanged binary",
  "qualification": "Correctness only; exclude all timing/capacity interpretations while background VM swap-ins persist",
  "seconds": 286.625064416
}

```

