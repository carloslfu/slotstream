#!/usr/bin/env python3
"""Vision prefix-cache reuse test (pairs with 0001-vision-prefix-cache.diff).

Builds a two-image conversation where every turn extends the previous one, so
the prefix cache should reuse the earlier turns (image rows included, now that
images are keyed on their bytes) on turns 2->4. Then it snaps the server log
and sends a follow-up turn (R5) that extends request 4, which must reuse the
whole R4 state — tower skipped, only the new text prefilled. It prints the
model's answers on 4 and 5 plus the log with prefill progress lines trimmed,
so the reuse per request is visible (the "reading N prompt tokens" line shows
how much was NOT reused).

Usage:
  Tools/vision_prefix_reuse_test.py [--thinking] [--mtp auto|on|off] [port] [model-dir]
"""
import argparse
import base64
import json
import os
import re
import subprocess
import sys
import time
import urllib.request

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BIN = os.path.join(ROOT, ".build/release/slotstream")
HERE = os.getcwd()


def say(*a):
    print(*a, flush=True)


def run(cmd):
    return subprocess.run(cmd, text=True, capture_output=True)


def post(port, payload):
    body = json.dumps(payload).encode()
    req = urllib.request.Request(
        f"http://127.0.0.1:{port}/api/chat", data=body,
        headers={"Content-Type": "application/json"}, method="POST")
    with urllib.request.urlopen(req, timeout=1800) as r:
        return json.loads(r.read())


def wait_up(port, srv, log):
    for _ in range(120):
        try:
            urllib.request.urlopen(
                f"http://127.0.0.1:{port}/api/version", timeout=2)
            return True
        except Exception:
            if srv.poll() is not None:
                say(f"server exited: {srv.returncode}")
                say(open(log).read())
                return False
            time.sleep(1)
    return False


def image_part(image, mime):
    data = base64.b64encode(open(image, "rb").read()).decode()
    return {"type": "image_url",
            "image_url": {"url": f"data:{mime};base64,{data}"}}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--thinking", action="store_true",
                    help="set think=true on every request. serve has no "
                         "--thinking flag of its own; thinking is a per-request "
                         "field on /api/chat.")
    ap.add_argument("--mtp", choices=["auto", "on", "off"], default="auto",
                    help="speculative decode mode passed to serve (--mtp). "
                         "auto enables the draft head only when the expert "
                         "cache still reaches its ~120/layer floor after the "
                         "1.6 GB charge, which a 10 GB target does not — so "
                         "--mtp on is what forces it, and the script then "
                         "fails unless the server log confirms the draft head "
                         "is actually on.")
    ap.add_argument("port", nargs="?", default=11469)
    ap.add_argument("model", nargs="?", default="/opt/common/models/text/"
                    "pipenetwork/Qwen3.8-Flash-Next-MLX-4bit/")
    args = ap.parse_args()
    port = int(args.port)

    if not os.path.exists(BIN):
        say("build first: make build")
        return 1
    if not os.path.isdir(args.model):
        say(f"model dir not found: {args.model}")
        return 1
    for im in ("Tools/assets/vision_test/secret1.jpg", "Tools/assets/vision_test/secret2.jpg"):
        if not os.path.exists(im):
            say(f"{im} missing in repo root")
            return 1
    pg = run(["pgrep", "-fl", "slotstream serve"])
    if pg.returncode == 0 and pg.stdout.strip():
        say("a server is already running; stop it first")
        return 1

    say("reclaimable memory before start:")
    for line in run(["vm_stat"]).stdout.splitlines():
        if any(k in line for k in ("Pages free", "Pages inactive",
                                   "Pages purgeable")):
            say(f"  {line.strip()}")

    log = f"/tmp/slotstream-vision-reuse-{os.getpid()}.log"
    srv = subprocess.Popen(
        [BIN, "serve", "--model", args.model, "--port", str(port),
         "--memory-gb", os.environ.get("MEMORY_GB", "10"),
         "--mtp", args.mtp],
        cwd=ROOT, stdout=open(log, "w"), stderr=subprocess.STDOUT)
    say(f"server pid: {srv.pid}")
    say(f"capture file: {log}")
    try:
        if not wait_up(port, srv, log):
            return 1
        say(f"thinking: {args.thinking}")

        # The engine banner is the only per-request-free place serve names the
        # draft head: serve does not log per-request MTP stats, but the startup
        # line "mtp draft head on" is written to stderr before the accept loop
        # answers /api/version, so once the server is up the log already says
        # definitively whether speculation can run. --mtp on must engage it —
        # otherwise every "request" below runs plain and the whole run is
        # measuring the wrong thing — so that is a hard failure, not a warning.
        mtp_on_in_log = "mtp draft head on" in open(log).read()
        say(f"mtp: --mtp {args.mtp}, draft head {'confirmed ON by the log banner' if mtp_on_in_log else 'off in the log banner'}")
        if args.mtp == "on" and not mtp_on_in_log:
            say("  ERROR: --mtp on did not enable the draft head "
                "(no 'mtp draft head on' banner in the server log)")
            say(open(log).read())
            return 1

        think = args.thinking
        msgs = []
        stats = []

        def chat(tag, prefix):
            t0 = time.time()
            r = post(port, {"model": "qwen3.8-flash-next:4bit", "stream": False,
                            "think": think, "messages": prefix})
            wall = time.time() - t0
            if "error" in r:
                say(f"  {tag} ERROR: {r['error']}")
                sys.exit(1)
            reply = r["message"]
            row = {"tag": tag, "wall_s": round(wall, 1),
                   "prompt_eval_count": r.get("prompt_eval_count"),
                   "prompt_eval_s": round(r.get("prompt_eval_duration", 0) / 1e9, 1),
                   "eval_count": r.get("eval_count"),
                   "eval_s": round(r.get("eval_duration", 0) / 1e9, 1)}
            say(f"  {tag} -> {reply['content'][:80]}")
            say(f"       {row}")
            stats.append(row)
            return reply

        # 1. opening instruction (text only)
        say("request 1: opening instruction (text only)")
        msgs.append({
            "role": "user",
            "content": "I am going to send you two pictures, you may not say "
                       "anything about them, just say ok, only after your "
                       "second ok I will ask you something"})
        r1 = chat("R1", msgs)
        msgs.append({"role": "assistant", "content": r1["content"]})

        def turn(tag, text, image=None, mime=None):
            parts = []
            if image is not None:
                parts.append(image_part(image, mime))
            parts.append({"type": "text", "text": text})
            msgs.append({"role": "user", "content": parts})
            r = chat(tag, msgs)
            msgs.append({"role": "assistant", "content": r["content"]})
            return r

        # 2. first picture + "Say nothing but ok"
        say("request 2: secret1.png + 'Say nothing but ok'")
        r2 = turn("R2", "Say nothing but 'ok'",
                  "secret1.png", "image/png")

        # 3. second picture + "say nothing but ok"
        say("request 3: secret2.jpg + 'say nothing but ok'")
        r3 = turn("R3", "Say nothing but 'ok'",
                  "secret2.jpg", "image/jpeg")

        # 4. describe both (a prefix the cache has never seen before)
        say("request 4: 'Now describe each image in one sentence each'")
        msgs.append({"role": "user", "content": [{
            "type": "text",
            "text": "Now describe each image in one sentence each"}]})
        step4_prompt = msgs[:]  # the exact prompt request 4 sends
        r4 = chat("R4", step4_prompt)
        msgs.append({"role": "assistant", "content": r4["content"]})

        # 5. snapshot the log, then send a follow-up turn that EXTENDS request
        #    4's prompt. A plain resend cannot reuse: the cache is extend-only,
        #    the held state covers R4-prompt + reply, and a resend is shorter
        #    than it, so the match fails and the whole prompt rebuilds. An
        #    appended turn strictly extends that same state, so the cache hands
        #    everything over — both images' rows included — the tower does not
        #    run again, and prefill reads only the new text. That is the win
        #    this test exists to show.
        safe_dir = "/tmp/vpr-step4-logs"
        os.makedirs(safe_dir, exist_ok=True)
        safe = os.path.join(safe_dir, f"step4-{os.getpid()}.log")
        open(safe, "w").write(open(log).read())
        say(f"saved step-4 log: {safe}")
        say("request 5: follow-up turn extending request 4 (reuses the prefix)")
        r5reply = turn("R5", "Now compare the two images and say which one "
                             "you found more interesting and why.")

        # 6. print outputs on 4 and 5, and the trimmed log
        say("")
        say("======== model output on request 4 ========")
        say(r4["content"])
        say("")
        say("======== model output on request 5 (follow-up turn) ========")
        say(r5reply["content"])
        say("")
        say("======== final log (prefill progress lines trimmed) ========")
        for line in open(log):
            # Drop the per-quarter "prefill: N/M tokens (P%)..." heartbeats;
            # keep the "reading N prompt tokens" summary per request.
            if re.search(r"prefill: \d+/\d+ tokens \(\d+%\),", line):
                continue
            print(line, end="")
        say("")
        say("---- per-request API stats (reuse evidence) ----")
        for row in stats:
            say(f"  {row['tag']}: wall {row['wall_s']}s, "
                f"prompt_eval {row['prompt_eval_count']} tok in {row['prompt_eval_s']}s, "
                f"decode {row['eval_count']} tok in {row['eval_s']}s")
        say("  (a reused turn skips nearly all prefill, so prompt_eval_s collapses;")
        say("   the log's 'reading N prompt tokens' shows the token-count view)")
        say("")
        say("reuse summary (from the log):")
        full = open(log).read()
        reads = [int(x) for x in re.findall(
            r"prefill: reading (\d+) prompt tokens", full)]
        done = [int(x) for x in re.findall(
            r"prefill: done, (\d+) tokens", full)]
        say(f"  prefill 'reading N' per logged request: {reads}")
        say(f"  prefill 'done N'    per logged request: {done}")
        say("  (serve prints these only for prompts >= 2048 NEW tokens, so a")
        say("   turn that reuses everything (R4, R5) is quiet in the log — the")
        say("   API stats are its proof. The cache is extend-only: a resend of")
        say("   the same prompt is shorter than the held state and misses; a")
        say("   follow-up turn extends it and reuses all of it, image rows included.")
        say("")
        say(f"capture file: {log}")
        say(f"step-4 log snapshot: {safe}")
        return 0
    finally:
        srv.terminate()
        try:
            srv.wait(timeout=30)
        except subprocess.TimeoutExpired:
            srv.kill()


if __name__ == "__main__":
    sys.exit(main())
