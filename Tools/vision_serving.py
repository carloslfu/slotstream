#!/usr/bin/env python3
"""Every serving surface, with a picture, against a running server.

    Tools/vision_serving.py [port]

Assertions, not a transcript. Its predecessor printed the model's answers and a
trimmed log for a human to read, opened two image files by names that were not
the ones in the repository, and defaulted the model directory to a path on the
contributor's own machine — so it could not run anywhere and, if it had, would
not have failed at anything.

Raw sockets on purpose: this repository's agent sandbox proxies localhost HTTP
clients (CLAUDE.md), and a proxied curl answering for the server is a test that
passes without the server.

The server must already be running (`serve --memory-gb 10 --port N`) with the
vision assets in `Tools/assets/vision_test`.
"""
import base64
import json
import os
import socket
import sys
import time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ASSETS = os.path.join(ROOT, "Tools", "assets", "vision_test")
DOG = os.path.join(ASSETS, "secret1.jpg")     # a close-up of a dog's face
TREE = os.path.join(ASSETS, "secret2.jpg")    # green citrus on a tree
MODEL = "qwen3.8-flash-next:4bit"

PASS, FAIL = [], []


def ok(name):
    PASS.append(name)
    print(f"PASS  {name}", flush=True)


def bad(name, detail=""):
    FAIL.append(name)
    print(f"FAIL  {name}" + (f"\n        {detail}" if detail else ""), flush=True)


def check(name, cond, detail=""):
    ok(name) if cond else bad(name, detail)


def post(port, path, obj, timeout=1800):
    """One HTTP/1.1 POST over a raw socket. Returns (status, body)."""
    body = json.dumps(obj).encode()
    head = (
        f"POST {path} HTTP/1.1\r\nHost: 127.0.0.1:{port}\r\n"
        f"Content-Type: application/json\r\nContent-Length: {len(body)}\r\n"
        "Connection: close\r\n\r\n"
    ).encode()
    try:
        s = socket.create_connection(("127.0.0.1", port), timeout=timeout)
    except OSError as e:
        # A server the kernel killed mid-suite is not a vision failure, and a
        # traceback here would report it as one.
        return 0, f"connection failed: {e}"
    s.settimeout(timeout)
    s.sendall(head + body)
    buf = b""
    while True:
        try:
            d = s.recv(1 << 16)
        except socket.timeout:
            break
        if not d:
            break
        buf += d
    s.close()
    if not buf:
        return 0, ""
    header, _, rest = buf.partition(b"\r\n\r\n")
    status = int(header.split(b" ")[1]) if b" " in header else 0
    text = rest.decode("utf-8", "replace")
    if b"Transfer-Encoding: chunked" in header:
        out, i = "", 0
        while i < len(text):
            j = text.find("\r\n", i)
            if j < 0:
                break
            try:
                n = int(text[i:j].split(";")[0], 16)
            except ValueError:
                break
            if n == 0:
                break
            out += text[j + 2 : j + 2 + n]
            i = j + 2 + n + 2
        text = out
    return status, text


def b64(path):
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode()


def chat(port, messages, **extra):
    payload = {"model": MODEL, "stream": False, "messages": messages}
    payload.update(extra)
    t0 = time.time()
    status, text = post(port, "/api/chat", payload)
    try:
        obj = json.loads(text)
    except json.JSONDecodeError:
        return status, {}, time.time() - t0, text
    return status, obj, time.time() - t0, text


def says(reply, *words):
    """Does the answer mention any of these? Case-insensitive."""
    low = reply.lower()
    return any(w in low for w in words)


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    port = int(args[0]) if args else 11434
    for p in (DOG, TREE):
        if not os.path.exists(p):
            print(f"missing asset {p}")
            return 1

    status, text = post(port, "/api/version", {})
    if status not in (200, 405, 404):
        print(f"no server on {port} (status {status})")
        return 1

    dog, tree = b64(DOG), b64(TREE)

    # 1. Ollama dialect: base64 in `images`. The model must describe the
    #    picture, which is the only end-to-end proof the tower's rows reached
    #    the language model at the right positions — every wiring bug in this
    #    feature produces confident text about nothing in particular.
    st, obj, secs, raw = chat(
        port,
        [{"role": "user", "content": "In three words, what animal is this?",
          "images": [dog]}])
    reply = obj.get("message", {}).get("content", "")
    check("ollama /api/chat answers an image request", st == 200, raw[:200])
    check("and it recognises the dog", says(reply, "dog", "puppy", "canine"), reply[:120])
    print(f"      -> {reply.strip()[:100]!r} in {secs:.1f}s, "
          f"{obj.get('prompt_eval_count')} prompt tokens")
    dog_tokens = obj.get("prompt_eval_count", 0)

    # 2. A picture costs real tokens, and the count must match the geometry the
    #    weights-free check pins (846x859 -> 702 tokens for this asset).
    st, obj, _, _ = chat(port, [{"role": "user", "content": "In three words, what animal is this?"}])
    text_tokens = obj.get("prompt_eval_count", 0)
    # 702 placeholders (the geometry `vision-check` pins for this 846x859
    # asset) plus the template's own <|vision_start|> and <|vision_end|>.
    check(
        "the picture is worth its 702 placeholder tokens, plus the two sentinels",
        dog_tokens - text_tokens == 704,
        f"{dog_tokens} - {text_tokens} = {dog_tokens - text_tokens}")

    # 3. OpenAI dialect: an image_url part with a data: URL.
    st, text = post(
        port, "/v1/chat/completions",
        {"model": MODEL, "max_tokens": 32, "messages": [{
            "role": "user",
            "content": [
                {"type": "image_url",
                 "image_url": {"url": "data:image/jpeg;base64," + tree}},
                {"type": "text", "text": "In three words, what is growing here?"},
            ]}]})
    obj = json.loads(text) if text.startswith("{") else {}
    reply = (obj.get("choices") or [{}])[0].get("message", {}).get("content", "")
    check("/v1/chat/completions answers an image_url part", st == 200, text[:200])
    check(
        "and it sees the fruit on the tree",
        says(reply, "citrus", "fruit", "lime", "grapefruit", "pomelo", "orange", "lemon", "tree"),
        reply[:120])
    print(f"      -> {reply.strip()[:100]!r}")

    # 4. Ollama /api/generate, the other half of that dialect.
    st, text = post(
        port, "/api/generate",
        {"model": MODEL, "stream": False, "prompt": "In three words, what animal is this?",
         "images": [dog]})
    obj = json.loads(text) if text.startswith("{") else {}
    check("/api/generate answers an image request", st == 200, text[:200])
    check(
        "and it recognises the dog there too",
        says(obj.get("response", ""), "dog", "puppy", "canine"),
        obj.get("response", "")[:120])

    # 5. The fx gateway: a `file` part with an image media type.
    # The model is named by the route, not the body: an unknown body field is
    # a 400 by design, so the shape here is the one fx actually sends.
    st, text = post(
        port, "/v3/ai/language-model",
        {"prompt": [{
            "role": "user",
            "content": [
                {"type": "file", "mediaType": "image/jpeg", "data": dog},
                {"type": "text", "text": "In three words, what animal is this?"},
            ]}],
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 32})
    check("the fx gateway accepts an image file part", st == 200, text[:300])
    check(
        "and answers about the dog",
        says(text, "dog", "puppy", "canine"), text[-400:])
    st, text = post(
        port, "/v3/ai/language-model",
        {"prompt": [{
            "role": "user",
            "content": [{"type": "file", "mediaType": "application/pdf", "data": dog}]}],
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 8})
    check(
        "and still refuses a file part that is not an image",
        "unsupported_file_part" in text, text[:300])

    # 6. Two pictures in one conversation, in order. A swapped pair is the
    #    failure this cannot be allowed to have: both answers stay fluent.
    st, obj, _, raw = chat(
        port,
        [{"role": "user",
          "content": [
              {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + dog}},
              {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + tree}},
              {"type": "text",
               "text": "Answer with exactly two words separated by a comma: "
                       "the subject of the first picture, then of the second."},
          ]}])
    reply = obj.get("message", {}).get("content", "")
    check("two pictures in one turn are accepted", st == 200, raw[:200])
    check(
        "and they arrive in the order they were sent",
        says(reply, "dog", "puppy") and says(reply, "fruit", "citrus", "tree", "lime",
                                             "pomelo", "grapefruit", "orange"),
        reply[:160])
    print(f"      -> {reply.strip()[:100]!r}")

    # 7. Prefix reuse. A follow-up turn extends the previous prompt, so the
    #    state is handed over whole: the tower does not run again and prefill
    #    reads only the new text. `prompt_eval_count` reports the whole prompt,
    #    so the evidence is the time, which collapses.
    history = [
        {"role": "user", "content": "Say only: ok",
         "images": [dog]},
    ]
    st, obj, first_secs, _ = chat(port, history)
    history.append({"role": "assistant", "content": obj.get("message", {}).get("content", "")})
    history.append({"role": "user", "content": "Now say only: still ok"})
    st, obj, second_secs, raw = chat(port, history)
    check("a follow-up turn on the same picture succeeds", st == 200, raw[:200])
    check(
        "and reuses the state instead of re-running the tower",
        second_secs < first_secs * 0.7,
        f"first {first_secs:.1f}s, follow-up {second_secs:.1f}s")
    print(f"      -> first {first_secs:.1f}s, follow-up {second_secs:.1f}s")

    # 8. The same ids with a different picture must NOT reuse. Both images
    #    resize to different grids, so to make the ids identical the second
    #    request replays the first conversation with the other picture at the
    #    same place — a cache keyed on ids alone would answer from the dog's
    #    state about the tree.
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [dog]}])
    first = obj.get("message", {}).get("content", "")
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [tree]}])
    second = obj.get("message", {}).get("content", "")
    check(
        "the same words with a different picture get a different answer",
        says(first, "dog", "puppy", "canine")
        and not says(second, "dog", "puppy", "canine"),
        f"{first[:60]!r} then {second[:60]!r}")

    # 9. Refusals, on the surface a user meets them on.
    st, obj, _, raw = chat(
        port, [{"role": "user",
                "content": [{"type": "image_url",
                             "image_url": {"url": "file:///etc/passwd"}}]}])
    check("a file:// image is a 400", st == 400, f"{st}: {raw[:160]}")
    check("that says URLs are not fetched", "not fetched" in raw, raw[:160])
    st, obj, _, raw = chat(
        port, [{"role": "user", "content": "hi", "images": ["bm90IGFuIGltYWdl"]}])
    check("bytes that are not an image are a 400", st == 400, f"{st}: {raw[:160]}")
    # An upload cut short decodes, in ImageIO, to the rows it has plus blank
    # space — and the model then describes a mostly empty picture with
    # confidence. The container's end marker is what catches it.
    half = base64.b64encode(open(DOG, "rb").read()[: os.path.getsize(DOG) // 2]).decode()
    st, obj, _, raw = chat(port, [{"role": "user", "content": "hi", "images": [half]}])
    check("a truncated image is a 400, not a blank description",
          st == 400 and "incomplete" in raw, f"{st}: {raw[:160]}")

    print()
    print(f"{len(PASS)} passed, {len(FAIL)} failed")
    if FAIL:
        for f in FAIL:
            print(f"  FAILED: {f}")
        return 1
    print("VISION SERVING PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())
