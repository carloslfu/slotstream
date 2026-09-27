#!/usr/bin/env python3
"""Live check that a continued conversation writes one state per turn.

One `slotstream serve` at an explicit small memory target over a fresh cache
directory. A conversation with a system prompt of about 1,600 tokens gets two
follow-up turns, and each reply is long enough to cross a 256-token prefill
pass before the next turn. 0.2.22 to 0.2.25 treated that point, inside the
previous reply, as a prefix other conversations share: 0.2.25 rewrote most
turns' own state there as a shared prefix, and earlier versions wrote a
second state when the new message crossed another pass.

The checks read the server's own statistics (SLOTSTREAM_BENCH_DETAILS=1) and
`slotstream prefix-cache`:

  - the first turn keeps its system prompt as a shared prefix;
  - each later turn writes its own state and keeps no shared prefix;
  - the directory then lists the system prompt as its only shared prefix.

The run only counts when a later prompt matches the previous prompt and reply
past a pass boundary beyond what that turn reused, where the old rule saved.
Otherwise it exits 2, inconclusive.

    Tools/prefix_turn_writes_e2e.py --memory-gb 10 --out result.json
"""

import argparse
import json
import os
import sys
import tempfile
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from persistent_prefix_e2e import ROOT, brief, model_process_running, prefix_cache, prose, reclaimable_gb  # noqa: E402
from shared_prefix_e2e import ModelSlotBusy, Server, chat, common_prefix, floor  # noqa: E402


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--binary", default=os.path.join(ROOT, ".build/release/slotstream"))
    parser.add_argument("--port", type=int, default=11541)
    parser.add_argument("--memory-gb", type=float, default=10.0)
    parser.add_argument("--words", type=int, default=1000, help="approximate length of the system prompt's notes")
    parser.add_argument("--num-predict", type=int, default=320, help="reply length; must cross a 256-token pass")
    parser.add_argument("--min-tokens", type=int, default=1024)
    parser.add_argument("--headroom-gb", type=float, default=4.0,
                        help="reclaimable memory required beyond --memory-gb before the server starts")
    parser.add_argument("--work", help="work directory (default: a new temporary directory)")
    parser.add_argument("--out", help="write the JSON result here")
    args = parser.parse_args()
    if not 8.1 <= args.memory_gb <= 10:
        sys.exit("--memory-gb must stay within the 8.1-10 GB test range")

    work = args.work or tempfile.mkdtemp(prefix="slotstream-turn-writes-e2e-")
    os.makedirs(work, exist_ok=True)
    states = os.path.join(work, "states")
    system = "You are a careful analyst. The field notes below are the only data. " + prose(args.words, seed=11)
    questions = ["Summarize the notes station by station in detail.",
                 "Which reading was the lowest, and why might that be?",
                 "Name the station of that reading and what it measured."]
    result = {"binary": args.binary, "memory_gb": args.memory_gb, "words": args.words,
              "num_predict": args.num_predict, "min_tokens": args.min_tokens, "work": work}

    # Another session's model process may be running; wait rather than start
    # a second model.
    deadline = time.time() + 1800
    while model_process_running():
        if time.time() > deadline:
            sys.exit("another slotstream process kept running for 30 minutes; refusing to start a second model")
        time.sleep(10)
    available = reclaimable_gb()
    result["reclaimable_gb_before"] = round(available, 1)
    if available < args.memory_gb + args.headroom_gb:
        sys.exit(f"only {available:.1f} GB reclaimable; need {args.memory_gb + args.headroom_gb:.1f}")
    flags = ["--prefix-cache-dir", states, "--prefix-cache-min-tokens", str(args.min_tokens)]
    for attempt in range(40):
        server = Server(args.binary, args.port, args.memory_gb, os.path.join(work, "serve.log"), flags)
        try:
            server.wait_ready()
            break
        except ModelSlotBusy:
            if attempt == 39:
                raise
            time.sleep(30)

    turns = []
    messages = [{"role": "system", "content": system}]
    try:
        for question in questions:
            messages.append({"role": "user", "content": question})
            turn = chat(args.port, messages, args.num_predict)
            messages.append({"role": "assistant", "content": turn["content"] or ""})
            turns.append(turn)
    finally:
        server.stop()
    result["disk_log"] = server.disk_lines()
    listing = prefix_cache(args.binary, states)
    result["prefix_cache_listing"] = {k: v for k, v in listing.items() if k != "directory"}
    shared = sorted(state["tokens"] for state in listing.get("states", []) if state.get("shared"))

    first, later = turns[0], turns[1:]
    system_floor = floor(first["shared_hint"])
    # Where the old rule saved: past the previous prompt, inside its reply,
    # at a pass end beyond what this turn reused.
    reached = []
    for previous, turn in zip(turns, later):
        matched = common_prefix(turn["prompt_ids"], (previous["prompt_ids"] or []) + (previous["output_ids"] or []))
        reached.append({"matched": matched, "previous_prompt": len(previous["prompt_ids"] or []),
                        "reused": turn["reused_prefix_tokens"],
                        "old_rule_saved": matched > len(previous["prompt_ids"] or [])
                        and (floor(matched) or 0) > (turn["reused_prefix_tokens"] or 0)})
    result["later_turns"] = reached
    result["turns"] = [brief(turn) for turn in turns]
    checks = {
        "the first turn kept its system prompt as a shared prefix":
            system_floor is not None and first["shared_boundaries"] == [system_floor]
            and first["persistent"].get("sharedSaveOutcome") == "saved",
        "each later turn wrote its own state": all(t["persistent"].get("saveOutcome") == "saved" for t in later),
        "no later turn kept a shared prefix": all(not t["shared_boundaries"] for t in later),
        "the directory lists the system prompt as its only shared prefix": shared == [system_floor],
    }
    result["checks"] = checks
    result["reached"] = any(r["old_rule_saved"] for r in reached)
    result["passed"] = result["reached"] and all(checks.values())
    if args.out:
        with open(args.out, "w") as handle:
            json.dump(result, handle, indent=2)

    for n, turn in enumerate(turns, 1):
        persistent = turn["persistent"]
        print(f"turn {n}: prompt {turn['prompt_tokens']}, reused {turn['reused_prefix_tokens']}, "
              f"decoded {turn['decode_tokens']}; saved {persistent.get('savedTokens')} tokens "
              f"({(persistent.get('saveBytes') or 0) / 1e6:.1f} MB), shared prefix kept at "
              f"{turn['shared_boundaries'] or 'nothing'} ({(persistent.get('sharedSaveBytes') or 0) / 1e6:.1f} MB)")
    for line in result["disk_log"]:
        print("  " + line)
    for name, passed in checks.items():
        print(f"{'PASS' if passed else 'FAIL'}  {name}")
    if not result["reached"]:
        print("INCONCLUSIVE: no later prompt matched the previous reply past a pass boundary")
        return 2
    return 0 if result["passed"] else 1


if __name__ == "__main__":
    sys.exit(main())
