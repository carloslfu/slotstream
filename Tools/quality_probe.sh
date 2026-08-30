#!/usr/bin/env bash
# Behavioural sanity probe: does the 4-bit conversion still answer things it
# obviously should? This is NOT the FP8 comparison N4 calls for — that needs an
# inference credential for Qwen3.8-Flash-Next FP8, which is not provisioned.
# What this DOES catch is gross quantization or architecture damage, and it is a
# durable regression gate for any future re-quantization or kernel change.
set -uo pipefail
PORT="${1:-11466}"
PASS=0; FAIL=0

ask() { # ask <prompt> <extended-regex the answer must match> <label>
  local out
  out=$(curl -s --max-time 600 "http://127.0.0.1:$PORT/api/chat" -d "$(python3 -c '
import json,sys; print(json.dumps({"model":"qwen3.8-flash-next:4bit",
 "messages":[{"role":"user","content":sys.argv[1]}],"stream":False,
 "options":{"temperature":0,"num_predict":60}}))' "$1")" \
    | python3 -c 'import json,sys; print(json.load(sys.stdin)["message"]["content"])' 2>/dev/null)
  if printf '%s' "$out" | grep -Eqi "$2"; then
    echo "PASS  $3"; PASS=$((PASS+1))
  else
    echo "FAIL  $3 -> $(printf '%s' "$out" | tr '\n' ' ' | cut -c1-90)"; FAIL=$((FAIL+1))
  fi
}

echo "== factual recall =="
ask "What is the capital of France? One word." "Paris" "capital of France"
ask "Who wrote the play Hamlet? Just the name." "Shakespeare" "author of Hamlet"
ask "What is the chemical symbol for gold? Just the symbol." "\bAu\b" "symbol for gold"
ask "How many continents are there? Just the number." "\b7\b|seven" "continent count"

echo "== arithmetic and reasoning =="
ask "What is 17 times 23? Just the number." "391" "17x23"
ask "If a train leaves at 2pm and arrives 3 hours 30 minutes later, what time does it arrive? Just the time." "5:?30|5\.30|half past five" "elapsed time"
# Deliberately NOT the bat-and-ball question. This probe exists to detect
# quantization damage, so every item has to be something the unquantized model
# reliably gets right; bat-and-ball is a known System-1 trap that a 6B-active
# model fails on its own merits, which would make this a flaky gate that says
# nothing about the conversion.
ask "A shop sells pens for 3 dollars each. How much do 7 pens cost? Just the number." "\b21\b" "multi-step arithmetic"
ask "Sort these numbers ascending, comma separated, nothing else: 12, 3, 47, 8" "3,? *8,? *12,? *47" "sorting"
ask "Which is larger, 9.11 or 9.9? Answer with just the number." "9\.9\b" "decimal comparison"

echo "== instruction following =="
ask "Reply with exactly the word BANANA and nothing else." "^BANANA\.?$" "exact-word obedience"
ask "List three primary colors, comma separated, no other words." "red.*blue|blue.*red" "list format"
ask "Answer only YES or NO: is the sky blue on a clear day?" "^YES\.?$" "yes/no obedience"

echo "== language and code =="
ask "Translate to Spanish, nothing else: The house is big." "casa.*grande|grande.*casa" "translation"
ask "Write a Python one-liner that returns the sum of a list named xs. Code only." "sum\(xs\)" "python one-liner"
ask "Complete: The mitochondria is the ___ of the cell. One word." "powerhouse" "cloze completion"

echo
echo "quality probe: passed $PASS, failed $FAIL"
[ "$FAIL" -eq 0 ]
