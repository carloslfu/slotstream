#!/usr/bin/env python3
"""Live end-to-end check of shared prefixes through `slotstream serve`.

Conversations that start with the same system prompt reuse it. Separate
servers at an explicit small memory target, one model process at a time:

  first    conversation A (system prompt S of about 3,500 tokens) keeps S as a
           shared prefix during its own prefill, at the last 256-token pass end
           at or before the end of the system message; conversation B, S with
           another question, reuses it from memory; A's second turn leaves it
  restart  a new server over the same directory answers conversation C, S with
           a third question, by restoring the shared prefix from disk; then
           conversation D, whose system prompt S' shares only the first part of
           S, keeps the head it shares and its own system prompt
  again    a new server answers conversation E (S') from disk and C's later
           turns; the shared prefixes survive them and `prefix-cache` lists them
  cold     a server without a prefix cache answers B and C from scratch; the
           reused conversations' output ids must equal these exactly (skip
           with --skip-cold)

Timings are the server's own statistics (SLOTSTREAM_BENCH_DETAILS=1). The
helpers are shared with persistent_prefix_e2e.py.

    Tools/shared_prefix_e2e.py --memory-gb 10 --words 2300 --out result.json
"""

import argparse
import json
import os
import re
import shutil
import signal
import subprocess
import sys
import tempfile
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from persistent_prefix_e2e import (MODEL, ROOT, brief, http, model_process_running, prefix_cache, prose,  # noqa: E402
                                   reclaimable_gb, _stop_owned_server, _cleanup_failed_server)

GRID = 256


class ModelSlotBusy(RuntimeError):
    """The binary refused to start because another model process holds the one-model lock."""


class Server:
    def __init__(self, binary, port, memory_gb, log_path, flags):
        self.port = port
        self.log_path = log_path
        self.log = open(log_path, "w")
        args = [binary, "serve", "--port", str(port), "--memory-gb", str(memory_gb), *flags]
        env = dict(os.environ, SLOTSTREAM_BENCH_DETAILS="1")
        try:
            self.process = subprocess.Popen(args, stdout=self.log, stderr=subprocess.STDOUT, env=env,
                                            start_new_session=True)
        except BaseException:
            _cleanup_failed_server(None, self.log)
            raise

    def wait_ready(self, timeout=900):
        try:
            deadline = time.time() + timeout
            while time.time() < deadline:
                if self.process.poll() is not None:
                    self.log.close()
                    with open(self.log_path, errors="replace") as handle:
                        if "already running" in handle.read():
                            raise ModelSlotBusy(f"another model process holds the slot; see {self.log_path}")
                    raise RuntimeError(f"server exited with {self.process.returncode}; see {self.log_path}")
                try:
                    status, _ = http(self.port, "GET", "/api/version", timeout=2)
                    if status == 200:
                        return
                except OSError:
                    pass
                time.sleep(1)
            raise RuntimeError(f"server not ready after {timeout} s; see {self.log_path}")
        except BaseException:
            _cleanup_failed_server(self.process, self.log)
            raise

    def stop(self):
        _stop_owned_server(self.process, self.log)
        deadline = time.time() + 30
        while model_process_running() and time.time() < deadline:
            time.sleep(0.5)
        if model_process_running():
            raise RuntimeError("a slotstream process is still running after stopping the server")

    def disk_lines(self):
        with open(self.log_path, errors="replace") as handle:
            return [line.rstrip() for line in handle if "prefix cache disk" in line]


def chat(port, messages, num_predict):
    body = {"model": MODEL, "messages": messages, "stream": False, "think": False,
            "options": {"temperature": 0, "seed": 7, "num_predict": num_predict}}
    started = time.time()
    status, payload = http(port, "POST", "/api/chat", body)
    wall = time.time() - started
    if status != 200:
        raise RuntimeError(f"/api/chat returned {status}: {payload[:500]!r}")
    frame = json.loads(payload)
    details = frame.get("slotstream_benchmark") or {}
    stats = details.get("stats") or {}
    return {
        "wall_seconds": round(wall, 3),
        "prompt_tokens": frame.get("prompt_eval_count"),
        "reused_prefix_tokens": stats.get("reusedPrefixTokens"),
        "prefill_tokens": stats.get("prefillTokens"),
        "prefill_seconds": stats.get("prefillSeconds"),
        "first_token_seconds": stats.get("firstTokenSeconds"),
        "request_seconds": stats.get("requestSeconds"),
        "decode_tokens": stats.get("decodeTokens"),
        "finish_reason": stats.get("finishReason"),
        "peak_memory_gb": stats.get("peakMemoryGB"),
        "shared_hint": stats.get("sharedPrefixHint"),
        "shared_common": stats.get("sharedPrefixCommon"),
        "shared_boundaries": stats.get("sharedPrefixBoundaries") or [],
        "shared_stores": stats.get("sharedPrefixStores"),
        "shared_refusals": stats.get("sharedPrefixRefusals"),
        "shared_errors": stats.get("sharedPrefixErrors"),
        "persistent": stats.get("persistentPrefix") or {},
        "prompt_ids": details.get("prompt_ids"),
        "output_ids": details.get("output_ids"),
        "content": (frame.get("message") or {}).get("content"),
    }


def common_prefix(a, b):
    n = 0
    for x, y in zip(a or [], b or []):
        if x != y:
            break
        n += 1
    return n


def floor(n):
    return None if n is None else n // GRID * GRID


def head_of(notes, fraction):
    """The notes up to the note boundary nearest `fraction` of their length."""
    starts = [m.start() for m in re.finditer(r"Note \d+:", notes)]
    cut = min(starts, key=lambda s: abs(s - fraction * len(notes)))
    return notes[:cut].rstrip()


def shared_tokens(listing):
    return sorted(state["tokens"] for state in listing.get("states", []) if state.get("shared"))


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--binary", default=os.path.join(ROOT, ".build/release/slotstream"))
    parser.add_argument("--port", type=int, default=11539)
    parser.add_argument("--memory-gb", type=float, default=10.0)
    parser.add_argument("--words", type=int, default=2300, help="approximate length of the system prompt's notes")
    parser.add_argument("--num-predict", type=int, default=48)
    parser.add_argument("--min-tokens", type=int, default=2048)
    parser.add_argument("--headroom-gb", type=float, default=4.0,
                        help="reclaimable memory required beyond --memory-gb before each server starts")
    parser.add_argument("--work", help="work directory (default: a new temporary directory)")
    parser.add_argument("--keep", action="store_true", help="keep state directories and logs")
    parser.add_argument("--skip-cold", action="store_true")
    parser.add_argument("--out", help="write the JSON result here")
    args = parser.parse_args()
    if not 8.1 <= args.memory_gb <= 10:
        sys.exit("--memory-gb must stay within the 8.1-10 GB test range")

    work = args.work or tempfile.mkdtemp(prefix="slotstream-shared-prefix-e2e-")
    os.makedirs(work, exist_ok=True)
    states = os.path.join(work, "states")
    notes = prose(args.words, seed=1)
    preamble = "You are a concise assistant for a river maintenance program.\n\n"
    system = preamble + notes
    sibling = preamble + head_of(notes, 0.7) + " " + prose(max(300, args.words * 3 // 10), seed=2)

    def conversation(prompt, question):
        return [{"role": "system", "content": prompt}, {"role": "user", "content": question}]

    def follow_up(messages, reply, question):
        return messages + [{"role": "assistant", "content": reply["content"] or ""},
                           {"role": "user", "content": question}]

    turn_a = conversation(system, "Summarize what the notes say about the spillway gate.")
    turn_b = conversation(system, "Which stations need a second visit, and why?")
    turn_c = conversation(system, "Which note reports the highest reading, and where?")
    turn_d = conversation(sibling, "List the notes about the telemetry uplink.")
    turn_e = conversation(sibling, "Who inspected the sediment trap, and when?")
    result = {"binary": args.binary, "memory_gb": args.memory_gb, "words": args.words,
              "num_predict": args.num_predict, "min_tokens": args.min_tokens, "work": work}
    cache_flags = ["--prefix-cache-dir", states, "--prefix-cache-min-tokens", str(args.min_tokens)]

    def start(label, flags):
        # Another session's model process may appear between two of these
        # servers; wait for it to finish rather than start a second model.
        deadline = time.time() + 1800
        while model_process_running():
            if time.time() > deadline:
                raise RuntimeError("another slotstream process kept running for 30 minutes; refusing to start a second model")
            time.sleep(10)
        available = reclaimable_gb()
        result.setdefault("reclaimable_gb_before", {})[label] = round(available, 1)
        if available < args.memory_gb + args.headroom_gb:
            raise RuntimeError(f"only {available:.1f} GB reclaimable; need {args.memory_gb + args.headroom_gb:.1f}")
        # Another process may take the one-model lock between two of these
        # servers, including one pgrep cannot see (an app with the engine in
        # process); wait for it rather than fail.
        for attempt in range(40):
            server = Server(args.binary, args.port, args.memory_gb, os.path.join(work, f"{label}.log"), flags)
            try:
                server.wait_ready()
                return server
            except ModelSlotBusy:
                if attempt == 39:
                    raise
                time.sleep(30)

    turns = {}
    try:
        server = start("first", cache_flags)
        try:
            turns["A"] = a1 = chat(args.port, turn_a, args.num_predict)
            turns["B"] = b1 = chat(args.port, turn_b, args.num_predict)
            turns["A_turn_2"] = chat(args.port, follow_up(turn_a, a1, "Which of those happened after the storm?"),
                                     args.num_predict)
        finally:
            server.stop()
        result["first_server_disk_log"] = server.disk_lines()
        listing_first = prefix_cache(args.binary, states)

        server = start("restart", cache_flags)
        try:
            turns["C"] = c1 = chat(args.port, turn_c, args.num_predict)
            turns["D"] = d1 = chat(args.port, turn_d, args.num_predict)
        finally:
            server.stop()
        result["restart_server_disk_log"] = server.disk_lines()

        server = start("again", cache_flags)
        try:
            turns["E"] = e1 = chat(args.port, turn_e, args.num_predict)
            turn_c2 = follow_up(turn_c, c1, "And the lowest?")
            turns["C_turn_2"] = c2 = chat(args.port, turn_c2, args.num_predict)
            turns["C_turn_3"] = chat(args.port, follow_up(turn_c2, c2, "Name the station of that one."),
                                     args.num_predict)
        finally:
            server.stop()
        result["again_server_disk_log"] = server.disk_lines()
        listing_final = prefix_cache(args.binary, states)

        cold_b = cold_c = None
        if not args.skip_cold:
            server = start("cold", ["--no-prefix-cache"])
            try:
                turns["B_cold"] = cold_b = chat(args.port, turn_b, args.num_predict)
                turns["C_cold"] = cold_c = chat(args.port, turn_c, args.num_predict)
            finally:
                server.stop()

        result.update({label: brief(turn) for label, turn in turns.items()})
        result["prefix_cache_listing_after_first"] = {k: v for k, v in listing_first.items() if k != "directory"}
        result["prefix_cache_listing_final"] = {k: v for k, v in listing_final.items() if k != "directory"}
        hint_a, hint_d = a1["shared_hint"], d1["shared_hint"]
        floor_a, floor_d = floor(hint_a), floor(hint_d)
        lcp = common_prefix(a1["prompt_ids"], d1["prompt_ids"])
        # One state per boundary, so two system prompts of the same length
        # are two shared prefixes; compare with multiplicity.
        expected = sorted(n for n in (floor_a, floor(lcp), floor_d) if n is not None)
        result["derived"] = {"system_boundary": hint_a, "system_floor": floor_a, "sibling_boundary": hint_d,
                             "sibling_floor": floor_d, "shared_head": lcp, "shared_head_floor": floor(lcp),
                             "expected_shared_prefixes": expected}
        pa, pb, pc, pd, pe = (turns[k]["persistent"] for k in ("A", "B", "C", "D", "E"))
        checks = {
            "A found its system boundary": bool(hint_a) and hint_a >= 512,
            "A kept its system prompt at the last pass end at or before the boundary":
                a1["shared_boundaries"] == [floor_a] and 0 <= hint_a - floor_a < GRID,
            "A wrote it to disk as a shared prefix": pa.get("sharedSaveOutcome") == "saved"
                and pa.get("sharedSavedTokens") == floor_a,
            "A's own state reused the shared prefix's rows": (pa.get("reusedBytes") or 0) > 0,
            "B reused the shared prefix from memory": b1["reused_prefix_tokens"] == floor_a
                and not pb.get("restoredTokens"),
            "B's first token came sooner than A's": b1["first_token_seconds"] < a1["first_token_seconds"],
            "A's second turn kept the shared prefix": floor_a in shared_tokens(listing_first),
            "a restarted server restored the shared prefix for C": pc.get("restoredTokens") == floor_a
                and c1["reused_prefix_tokens"] == floor_a,
            "D kept the head it shares with S": d1["shared_common"] == lcp and floor(lcp) in d1["shared_boundaries"]
                and lcp >= 512,
            "D kept its own system prompt too": floor_d in d1["shared_boundaries"],
            "another restarted server restored D's system prompt for E": pe.get("restoredTokens") == floor_d
                and e1["reused_prefix_tokens"] == floor_d,
            "C's later turns left the shared prefixes in place": set(expected) <= set(shared_tokens(listing_final)),
            "prefix-cache lists them as shared prefixes": shared_tokens(listing_final) == expected,
            "no shared prefix was refused or failed": all(
                not turns[k]["shared_refusals"] and not turns[k]["shared_errors"] for k in ("A", "B", "C", "D", "E")),
        }
        if cold_b and cold_c:
            checks["the cold server reused nothing"] = (cold_b["reused_prefix_tokens"] == 0
                                                        and cold_c["reused_prefix_tokens"] == 0)
            checks["B's output ids equal the cold server's"] = b1["output_ids"] == cold_b["output_ids"]
            checks["C's output ids equal the cold server's"] = c1["output_ids"] == cold_c["output_ids"]
        result["checks"] = checks
        result["passed"] = all(checks.values())
    finally:
        # Each server is stopped where it was started; a model process that
        # remains belongs to someone else and is left alone.
        if args.out:
            with open(args.out, "w") as handle:
                json.dump(result, handle, indent=2)
        if not args.keep and not args.work:
            shutil.rmtree(work, ignore_errors=True)

    for label in ("A", "B", "A_turn_2", "C", "D", "E", "C_turn_2", "C_turn_3", "B_cold", "C_cold"):
        turn = result.get(label)
        if not turn:
            continue
        persistent = turn.get("persistent") or {}
        print(f"{label}: prompt {turn['prompt_tokens']} tokens, reused {turn['reused_prefix_tokens']} "
              f"(restored {persistent.get('restoredTokens', 0)} from disk), shared prefix kept at "
              f"{turn['shared_boundaries'] or 'nothing'} (hint {turn['shared_hint']}, common {turn['shared_common']}), "
              f"first token {turn['first_token_seconds']:.2f} s, prefill {turn['prefill_seconds']:.2f} s, "
              f"shared save {persistent.get('sharedSaveOutcome')} "
              f"{(persistent.get('sharedSaveBytes') or 0) / 1e6:.1f} MB in {persistent.get('sharedSaveSeconds') or 0:.2f} s")
    for name, passed in result.get("checks", {}).items():
        print(f"{'PASS' if passed else 'FAIL'}  {name}")
    return 0 if result.get("passed") else 1


if __name__ == "__main__":
    sys.exit(main())
