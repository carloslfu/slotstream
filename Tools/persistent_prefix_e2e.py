#!/usr/bin/env python3
"""Live end-to-end check of the persistent prefix cache through `slotstream serve`.

One three-turn conversation, served by separate servers at an explicit small
memory target, one model process at a time:

  first       answers turns 1, 2 and 3; turn 1 keeps the system prompt as a
              shared prefix, and every turn after the first writes only its
              new rows and keeps the previous turn's state as its parent
  restart     a new server over a copy of the directory taken after turn 2
              answers turn 3 by restoring the turn-2 state, whose rows live in
              the segments turns 1 and 2 wrote
  regenerate  a new server over a copy taken after the restart answers turn 3
              again by restoring the kept turn-2 parent, as a regenerated reply
  cold        a new server over an empty directory answers turn 2 by re-reading
              the prompt (skip with --skip-cold)

The restarted and regenerating servers must produce exactly the first server's
turn-3 prompt and output ids. `slotstream prefix-cache` lists a snapshot and
clears a copy. Timings are the server's own statistics
(SLOTSTREAM_BENCH_DETAILS=1). The sandbox proxies HTTP client libraries, so
requests use raw sockets.

    Tools/persistent_prefix_e2e.py --memory-gb 10 --words 2400 --out result.json
"""

import argparse
import hashlib
import json
import os
import random
import re
import shutil
import signal
import socket
import subprocess
import sys
import tempfile
import time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODEL = "qwen3.8-flash-next:4bit"

SUBJECTS = ["The survey team", "A field engineer", "The river authority", "Our night shift", "The pump crew",
            "An auditor", "The harbor office", "A visiting hydrologist", "The maintenance lead", "The data desk"]
VERBS = ["recorded", "questioned", "replaced", "recalibrated", "photographed", "flagged", "inspected",
         "logged", "compared", "rerouted"]
OBJECTS = ["the north culvert gauge", "a cracked intake screen", "the backup generator", "three flow sensors",
           "the sediment trap", "the eastern levee toe", "a leaking valve", "the telemetry uplink",
           "the spillway gate", "two rain buckets"]
DETAILS = ["after the overnight storm", "before the morning tide", "during the scheduled outage",
           "while the dredger idled", "against last season's baseline", "under a temporary permit",
           "with the backup crew", "despite heavy fog", "at the request of the county", "in falling light"]


def prose(words, seed):
    rng = random.Random(seed)
    sentences, count = [], 0
    while count < words:
        sentence = (f"Note {len(sentences) + 1}: {rng.choice(SUBJECTS)} {rng.choice(VERBS)} "
                    f"{rng.choice(OBJECTS)} {rng.choice(DETAILS)}, reading {rng.randint(2, 97)} units "
                    f"at station {rng.randint(100, 999)}.")
        sentences.append(sentence)
        count += len(sentence.split())
    return " ".join(sentences)


def reclaimable_gb():
    text = subprocess.run(["vm_stat"], capture_output=True, text=True, check=True).stdout
    page = int(re.search(r"page size of (\d+) bytes", text).group(1))

    def pages(label):
        match = re.search(rf"{label}:\s+(\d+)\.", text)
        return int(match.group(1)) if match else 0

    return (pages("Pages free") + pages("Pages purgeable") + pages("File-backed pages")) * page / 1e9


def model_process_running():
    return subprocess.run(["pgrep", "-x", "slotstream"], capture_output=True).returncode == 0


def http(port, method, path, body=None, timeout=3600):
    payload = b"" if body is None else json.dumps(body).encode()
    head = (f"{method} {path} HTTP/1.1\r\nHost: 127.0.0.1:{port}\r\n"
            f"Content-Type: application/json\r\nContent-Length: {len(payload)}\r\n"
            "Connection: close\r\n\r\n").encode()
    with socket.create_connection(("127.0.0.1", port), timeout=timeout) as sock:
        sock.sendall(head + payload)
        buffer = b""
        while b"\r\n\r\n" not in buffer:
            data = sock.recv(65536)
            if not data:
                raise ConnectionError("connection closed before the response headers")
            buffer += data
        header, _, rest = buffer.partition(b"\r\n\r\n")
        lines = header.decode("latin-1").split("\r\n")
        status = int(lines[0].split()[1])
        headers = {k.strip().lower(): v.strip() for k, _, v in (line.partition(":") for line in lines[1:])}
        if "content-length" in headers:
            length = int(headers["content-length"])
            while len(rest) < length:
                data = sock.recv(65536)
                if not data:
                    break
                rest += data
            return status, rest[:length]
        if headers.get("transfer-encoding", "").lower() == "chunked":
            body_bytes = b""
            while True:
                while b"\r\n" not in rest:
                    data = sock.recv(65536)
                    if not data:
                        return status, body_bytes
                    rest += data
                size_line, _, rest = rest.partition(b"\r\n")
                size = int(size_line.split(b";")[0], 16)
                while len(rest) < size + 2:
                    data = sock.recv(65536)
                    if not data:
                        break
                    rest += data
                if size == 0:
                    return status, body_bytes
                body_bytes += rest[:size]
                rest = rest[size + 2:]
        while True:
            data = sock.recv(65536)
            if not data:
                return status, rest
            rest += data


class Server:
    def __init__(self, binary, port, memory_gb, directory, min_tokens, log_path):
        self.port = port
        self.log_path = log_path
        self.log = open(log_path, "w")
        args = [binary, "serve", "--port", str(port), "--memory-gb", str(memory_gb),
                "--prefix-cache-dir", directory, "--prefix-cache-min-tokens", str(min_tokens)]
        env = dict(os.environ, SLOTSTREAM_BENCH_DETAILS="1")
        self.process = subprocess.Popen(args, stdout=self.log, stderr=subprocess.STDOUT, env=env,
                                        start_new_session=True)

    def wait_ready(self, timeout=900):
        deadline = time.time() + timeout
        while time.time() < deadline:
            if self.process.poll() is not None:
                raise RuntimeError(f"server exited with {self.process.returncode}; see {self.log_path}")
            try:
                status, _ = http(self.port, "GET", "/api/version", timeout=2)
                if status == 200:
                    return
            except OSError:
                pass
            time.sleep(1)
        raise RuntimeError(f"server not ready after {timeout} s; see {self.log_path}")

    def stop(self):
        if self.process.poll() is None:
            self.process.send_signal(signal.SIGINT)
            try:
                self.process.wait(timeout=60)
            except subprocess.TimeoutExpired:
                self.process.kill()
                self.process.wait(timeout=30)
        self.log.close()
        deadline = time.time() + 30
        while model_process_running() and time.time() < deadline:
            time.sleep(0.5)
        if model_process_running():
            raise RuntimeError("a slotstream process is still running after stopping the server")

    def disk_lines(self):
        with open(self.log_path, errors="replace") as handle:
            return [line.rstrip() for line in handle if "prefix cache disk" in line]


def benchmark_token_ids(frame):
    """Require complete raw token evidence before prefix equality checks."""
    details = frame.get("slotstream_benchmark")
    if not isinstance(details, dict):
        raise RuntimeError("/api/chat is missing slotstream_benchmark token evidence")
    result = []
    for field, count_field in (("prompt_ids", "prompt_eval_count"), ("output_ids", "eval_count")):
        ids = details.get(field)
        if not isinstance(ids, list) or any(type(token) is not int or token < 0 for token in ids):
            raise RuntimeError(f"/api/chat benchmark {field} must be an array of nonnegative integers")
        count = frame.get(count_field)
        if type(count) is not int or count < 0 or len(ids) != count:
            raise RuntimeError(f"/api/chat benchmark {field} does not match {count_field}")
        result.append(ids)
    return result[0], result[1]


def chat(port, messages, num_predict):
    body = {"model": MODEL, "messages": messages, "stream": False, "think": False,
            "options": {"temperature": 0, "seed": 7, "num_predict": num_predict}}
    started = time.time()
    status, payload = http(port, "POST", "/api/chat", body)
    wall = time.time() - started
    if status != 200:
        raise RuntimeError(f"/api/chat returned {status}: {payload[:500]!r}")
    frame = json.loads(payload)
    prompt_ids, output_ids = benchmark_token_ids(frame)
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
        "request_sampled_peak_bytes": (stats.get("sampledFootprint") or {}).get("peakBytes"),
        "persistent": stats.get("persistentPrefix") or {},
        "prompt_ids": prompt_ids,
        "output_ids": output_ids,
        "content": (frame.get("message") or {}).get("content"),
    }


def state_files(path):
    heads = [n for n in os.listdir(path) if n.endswith(".slotprefix")]
    segments = [n for n in os.listdir(path) if n.endswith(".slotseg")]
    size = lambda names: sum(os.path.getsize(os.path.join(path, n)) for n in names)
    return {"heads": len(heads), "head_bytes": size(heads), "segments": len(segments), "segment_bytes": size(segments)}


def prefix_cache(binary, directory, *flags):
    completed = subprocess.run([binary, "prefix-cache", "--dir", directory, "--json", *flags],
                               capture_output=True, text=True, timeout=120)
    if completed.returncode != 0:
        raise RuntimeError(f"prefix-cache {' '.join(flags)} failed: {completed.stderr.strip()}")
    return json.loads(completed.stdout)


def brief(turn):
    """The turn without its id lists, which are kept as count and SHA-256."""
    result = {k: v for k, v in turn.items() if k not in ("prompt_ids", "output_ids")}
    for key in ("prompt_ids", "output_ids"):
        ids = turn.get(key)
        if ids is not None:
            digest = hashlib.sha256(json.dumps(ids, separators=(",", ":")).encode()).hexdigest()
            result[key] = {"count": len(ids), "sha256": digest}
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--binary", default=os.path.join(ROOT, ".build/release/slotstream"))
    parser.add_argument("--port", type=int, default=11537)
    parser.add_argument("--memory-gb", type=float, default=10.0)
    parser.add_argument("--words", type=int, default=2400, help="approximate length of the shared notes")
    # Each turn carries its own round of notes, because a state is now saved at
    # the prompt's last prefill pass boundary: a turn that adds only a short
    # question stays inside the band its parent already wrote, and writes
    # nothing. Real conversations carry tool results and pasted work, so the
    # incremental save is exercised by turns that cross a boundary.
    parser.add_argument("--turn-words", type=int, default=400,
                        help="approximate length of the notes each follow-up turn adds")
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

    work = args.work or tempfile.mkdtemp(prefix="slotstream-persistent-e2e-")
    os.makedirs(work, exist_ok=True)
    first_dir, after_turn_1, after_turn_2, after_restart, cleared, cold_dir = (
        os.path.join(work, name) for name in ("first", "after-turn-1", "after-turn-2", "after-restart",
                                               "cleared", "cold"))
    notes = prose(args.words, seed=1)
    turn1 = [{"role": "system", "content": "You are a concise assistant for a river maintenance program.\n\n" + notes},
             {"role": "user", "content": "Summarize what the notes say about the spillway gate."}]
    result = {"binary": args.binary, "memory_gb": args.memory_gb, "words": args.words, "turn_words": args.turn_words,
              "num_predict": args.num_predict, "work": work}

    def start(directory, label):
        if model_process_running():
            raise RuntimeError("another slotstream process is running; refusing to start a second model")
        available = reclaimable_gb()
        result.setdefault("reclaimable_gb_before", {})[label] = round(available, 1)
        if available < args.memory_gb + args.headroom_gb:
            raise RuntimeError(f"only {available:.1f} GB reclaimable; need {args.memory_gb + args.headroom_gb:.1f}")
        server = Server(args.binary, args.port, args.memory_gb, directory, args.min_tokens,
                        os.path.join(work, f"{label}.log"))
        server.wait_ready()
        return server

    def follow_up(messages, reply, question):
        return messages + [{"role": "assistant", "content": reply["content"] or ""},
                           {"role": "user", "content": question}]

    try:
        server = start(first_dir, "first")
        try:
            status, payload = http(args.port, "GET", "/api/ps", timeout=30)
            if status == 200:
                models = json.loads(payload).get("models") or [{}]
                plan = ((models[0] or {}).get("details") or {}).get("memory_plan") or {}
                result["in_memory_retention_tokens"] = plan.get("prefix_cache_max_tokens")
                result["max_context_tokens"] = plan.get("max_context_tokens")
            first_1 = chat(args.port, turn1, args.num_predict)
            shutil.copytree(first_dir, after_turn_1)
            turn2 = follow_up(turn1, first_1, "Here is today's round.\n\n" + prose(args.turn_words, seed=2)
                              + "\n\nWhich stations need a second visit, and why?")
            first_2 = chat(args.port, turn2, args.num_predict)
            shutil.copytree(first_dir, after_turn_2)
            turn3 = follow_up(turn2, first_2, "And the evening round.\n\n" + prose(args.turn_words, seed=3)
                              + "\n\nWhich note reports the highest reading, and where?")
            first_3 = chat(args.port, turn3, args.num_predict)
        finally:
            server.stop()
        result["first_server_disk_log"] = server.disk_lines()
        result["files"] = {"after_turn_1": state_files(after_turn_1), "after_turn_2": state_files(after_turn_2),
                           "after_turn_3": state_files(first_dir)}

        restart_dir = os.path.join(work, "restart")
        shutil.copytree(after_turn_2, restart_dir)
        server = start(restart_dir, "restart")
        try:
            restart_3 = chat(args.port, turn3, args.num_predict)
        finally:
            server.stop()
        result["restart_server_disk_log"] = server.disk_lines()
        shutil.copytree(restart_dir, after_restart)
        result["files"]["after_restart"] = state_files(after_restart)

        listing = prefix_cache(args.binary, after_restart)
        result["prefix_cache_listing"] = {k: v for k, v in listing.items() if k != "directory"}

        regenerate_dir = os.path.join(work, "regenerate")
        shutil.copytree(after_restart, regenerate_dir)
        server = start(regenerate_dir, "regenerate")
        try:
            regenerate_3 = chat(args.port, turn3, args.num_predict)
        finally:
            server.stop()
        result["regenerate_server_disk_log"] = server.disk_lines()

        shutil.copytree(after_restart, cleared)
        removed = prefix_cache(args.binary, cleared, "--clear")
        result["prefix_cache_clear"] = {k: v for k, v in removed.items() if k != "directory"}
        emptied = prefix_cache(args.binary, cleared)

        cold = None
        if not args.skip_cold:
            server = start(cold_dir, "cold")
            try:
                cold = chat(args.port, turn2, args.num_predict)
            finally:
                server.stop()

        turns = {"turn_1": first_1, "turn_2_first_server": first_2, "turn_3_first_server": first_3,
                 "turn_3_restarted_server": restart_3, "turn_3_regenerated_after_restart": regenerate_3}
        if cold:
            turns["turn_2_cold_server"] = cold
        result.update({label: brief(turn) for label, turn in turns.items()})
        p1, p2, p3 = first_1["persistent"], first_2["persistent"], first_3["persistent"]
        pr, pg = restart_3["persistent"], regenerate_3["persistent"]
        files = result["files"]
        # The system prompt is long enough to be kept as a shared prefix: turn 1
        # writes it first, then its own state reusing its rows. It stays in
        # every snapshot beside the conversation's own states.
        shared = 1 if p1.get("sharedSaveOutcome") == "saved" else 0
        result["shared_prefixes"] = shared
        states = listing.get("states", [])
        checks = {
            "turn 1 wrote its whole state, reusing only its shared prefix's rows": p1.get("saveOutcome") == "saved"
                and (p1.get("reusedBytes") or 0) <= (p1.get("sharedSaveBytes") or 0),
            "turn 2 wrote only its new rows": p2.get("saveOutcome") == "saved"
                and (p2.get("reusedBytes") or 0) > (p1.get("reusedBytes") or 0)
                and (p2.get("saveBytes") or 0) < (p1.get("saveBytes") or 0) + (p1.get("sharedSaveBytes") or 0),
            "turn 2 kept the turn-1 state as its parent": files["after_turn_2"]["heads"] == 2 + shared,
            "turn 3 removed the turn-1 state and kept turn 2": p3.get("saveOutcome") == "saved"
                and files["after_turn_3"]["heads"] == 2 + shared,
            "a restarted server restored the turn-2 state from its segments":
                pr.get("restoredTokens", 0) > 0 and pr.get("restoredTokens") == p2.get("savedTokens"),
            "restart turn-3 prompt ids equal the first server's": restart_3["prompt_ids"] == first_3["prompt_ids"],
            "restart turn-3 output ids equal the first server's": restart_3["output_ids"] == first_3["output_ids"],
            # At or above: a turn is saved at its prompt's last prefill pass
            # boundary, so the regenerating server may restore the deeper
            # state the restarted server wrote rather than the kept parent.
            # Either is a state of this conversation, and the output ids
            # below are what actually has to match.
            "a restarted server regenerating turn 3 restored the kept parent or deeper":
                pg.get("restoredTokens", 0) >= (p2.get("savedTokens") or 0) > 0,
            "regenerated turn-3 output ids equal the first server's": regenerate_3["output_ids"] == first_3["output_ids"],
            "prefix-cache lists both states of the snapshot and its shared prefix":
                sum(not s.get("shared") for s in states) == 2 and sum(bool(s.get("shared")) for s in states) == shared
                and listing.get("in_use") is False,
            "prefix-cache --clear empties a copy": (removed.get("removed_files") or 0) >= 3
                and not emptied.get("states") and emptied.get("segments") == 0,
        }
        if cold:
            checks["cold server re-read the prompt"] = cold["reused_prefix_tokens"] == 0
        retention = result.get("in_memory_retention_tokens")
        written = p1.get("savedTokens") or 0
        if retention and written > retention:
            # Memory never retains this conversation, so without the disk tier
            # the first server would re-read turn 1 as the cold one does.
            checks["the first server resumed a conversation longer than memory retention from disk"] = (
                first_2["persistent"].get("restoredTokens", 0) > 0)
        result["checks"] = checks
        result["passed"] = all(checks.values())
    finally:
        if args.out:
            with open(args.out, "w") as handle:
                json.dump(result, handle, indent=2)
        if not args.keep and not args.work:
            shutil.rmtree(work, ignore_errors=True)

    for label in ("turn_1", "turn_2_first_server", "turn_3_first_server", "turn_3_restarted_server",
                  "turn_3_regenerated_after_restart", "turn_2_cold_server"):
        turn = result.get(label)
        if not turn:
            continue
        persistent = turn.get("persistent") or {}
        print(f"{label}: prompt {turn['prompt_tokens']} tokens, reused {turn['reused_prefix_tokens']} "
              f"(restored {persistent.get('restoredTokens', 0)} from disk), first token "
              f"{turn['first_token_seconds']:.2f} s, prefill {turn['prefill_seconds']:.2f} s, "
              f"wrote {(persistent.get('saveBytes') or 0) / 1e6:.1f} MB, "
              f"reused {(persistent.get('reusedBytes') or 0) / 1e6:.1f} MB")
    for name, passed in result["checks"].items():
        print(f"{'PASS' if passed else 'FAIL'}  {name}")
    return 0 if result["passed"] else 1


if __name__ == "__main__":
    sys.exit(main())
