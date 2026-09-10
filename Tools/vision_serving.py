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

The server must already be running with the vision assets in
`Tools/assets/vision_test`. The complete original photographs need the bounded
full-vision profile from `Tools/verify.sh`: a 14.5 GB total target with
`SLOTSTREAM_PREFILL_CHUNK=3072`, MTP off and 20.5 GB real reclaimable preflight.
The smaller refusal/reuse-only modes keep their own declared test targets.
"""
import base64
import json
import os
import socket
import sys
import time
import hashlib
import struct
import zlib
from pathlib import Path

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ASSETS = os.path.join(ROOT, "Tools", "assets", "vision_test")
DOG = os.path.join(ASSETS, "secret1.jpg")     # a close-up of a dog's face
TREE = os.path.join(ASSETS, "secret2.jpg")    # green citrus on a tree
MODEL = "qwen3.8-flash-next:4bit"

PASS, FAIL = [], []
REQUEST_NUMBER = 0


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
    if b"Transfer-Encoding: chunked" in header:
        out, i = bytearray(), 0
        while i < len(rest):
            j = rest.find(b"\r\n", i)
            if j < 0:
                break
            try:
                n = int(rest[i:j].split(b";")[0], 16)
            except ValueError:
                break
            if n == 0:
                break
            out += rest[j + 2 : j + 2 + n]
            i = j + 2 + n + 2
        rest = bytes(out)
    text = rest.decode("utf-8", "replace")
    if capture := os.environ.get('SLOTSTREAM_VISION_CAPTURE_DIR'):
        global REQUEST_NUMBER
        REQUEST_NUMBER += 1
        directory = Path(capture); directory.mkdir(parents=True, exist_ok=True)
        # Exact request bytes are reconstructible from this frozen script and
        # the image fixtures; their digest is retained without copying every
        # repeated base64 image into the response ledger.
        (directory/f'{REQUEST_NUMBER:02d}.json').write_text(json.dumps({
            'path': path, 'request_sha256': hashlib.sha256(body).hexdigest(),
            'status': status, 'response': text}, indent=2)+'\n')
    return status, text


def b64(path):
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode()


def chat(port, messages, **extra):
    payload = {"model": MODEL, "stream": False, "messages": messages, "think": False,
               "options": {"num_predict": 32, "temperature": 0, "seed": 7}}
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


def solid_image_base64(rgb):
    """Deterministic equal-geometry inputs; no external image service or file."""
    def chunk(kind, data):
        return struct.pack('>I', len(data)) + kind + data + struct.pack('>I', zlib.crc32(kind + data) & 0xffffffff)
    pixels = b''.join(b'\x00' + bytes(rgb) * 256 for _ in range(256))
    png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>2I5B', 256, 256, 8, 2, 0, 0, 0))
    png += chunk(b'IDAT', zlib.compress(pixels)) + chunk(b'IEND', b'')
    return base64.b64encode(png).decode()


def same_geometry_invalidation(port):
    red, blue = solid_image_base64((255, 0, 0)), solid_image_base64((0, 0, 255))
    question = 'Say only: ok'
    st, first, _, raw = chat(port, [{'role': 'user', 'content': question, 'images': [red]}])
    answer = first.get('message', {}).get('content', '')
    check('same-geometry seed acknowledges the image', st == 200 and answer.strip().lower() == 'ok', raw[:200])
    a = first.get('slotstream_benchmark', {})
    history = [{'role': 'user', 'content': question, 'images': [blue]},
               {'role': 'assistant', 'content': answer},
               {'role': 'user', 'content': 'What color fills the image? Answer in one word.'}]
    st, second, _, raw = chat(port, history)
    b = second.get('slotstream_benchmark', {})
    held = a.get('prompt_ids', []) + a.get('output_ids', [])
    incoming = b.get('prompt_ids', [])
    check('changed image would extend the cached token IDs', bool(held) and len(incoming) > len(held) and incoming[:len(held)] == held,
          'this must be an eligible textual prefix, otherwise it does not test image identity')
    stats = b.get('stats', {})
    check('same-geometry changed content misses and re-encodes', stats.get('reusedPrefixTokens') == 0 and stats.get('encodedImages') == 1,
          f"reused={stats.get('reusedPrefixTokens')}, encoded={stats.get('encodedImages')}")
    answer = second.get('message', {}).get('content', '')
    check('same-geometry changed image is blue', st == 200 and says(answer, 'blue') and not says(answer, 'red'), answer)


def budget_refusal(port):
    st, before_raw = post(port, '/api/show', {'model': MODEL})
    st, refused, _, raw = chat(port, [{'role': 'user', 'content': 'Say only: ok',
                                     'images': [solid_image_base64((255, 0, 0))]}])
    check('image outside the total target is rejected', st == 400 and 'target cannot fit' in raw, raw[:200])
    st, after_raw = post(port, '/api/show', {'model': MODEL})
    before = json.loads(before_raw).get('details', {}).get('memory_plan', {})
    after = json.loads(after_raw).get('details', {}).get('memory_plan', {})
    check('refused image keeps the exact pool and prefix budget', bool(before) and before == after,
          'metadata must expose the actual plan')
    st, answer, _, raw = chat(port, [{'role': 'user', 'content': 'Say only: ok'}])
    check('text generation works after refused image', st == 200 and answer.get('message', {}).get('content', '').strip().lower() == 'ok', raw[:200])


def source_bounds(port):
    # The entire PNG is valid. Build its compressed scanlines incrementally,
    # without allocating or decoding its 67-million-pixel raster in the test.
    def chunk(kind, data):
        return struct.pack('>I', len(data)) + kind + data + struct.pack('>I', zlib.crc32(kind + data) & 0xffffffff)
    compressor = zlib.compressobj()
    row = bytes(1 + 8193 * 3)
    compressed = b''.join(compressor.compress(row) for _ in range(8192)) + compressor.flush()
    png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>2I5B', 8193, 8192, 8, 2, 0, 0, 0))
    png += chunk(b'IDAT', compressed) + chunk(b'IEND', b'')
    oversized = base64.b64encode(png).decode()
    before_status, before_raw = post(port, '/api/show', {'model': MODEL})
    before = json.loads(before_raw).get('details', {}).get('memory_plan', {})
    for streaming in [False, True]:
        shapes = [
            ('/api/chat', {'model': MODEL, 'stream': streaming,
                          'messages': [{'role': 'user', 'content': 'describe', 'images': [oversized]}]}),
            ('/api/generate', {'model': MODEL, 'stream': streaming, 'prompt': 'describe', 'images': [oversized]}),
            ('/v1/chat/completions', {'model': MODEL, 'stream': streaming,
                'messages': [{'role': 'user', 'content': [
                    {'type': 'text', 'text': 'describe'},
                    {'type': 'image_url', 'image_url': {'url': 'data:image/png;base64,' + oversized}}]}]}),
        ]
        for path, request in shapes:
            status, raw = post(port, path, request)
            check(f'{path} stream={streaming}: oversized metadata is refused before streaming',
                  status == 400 and 'decoded source image exceeds' in raw, f'{status}: {raw[:240]}')
    status, raw = post(port, '/v3/ai/language-model', {
        'prompt': [{'role': 'user', 'content': [
            {'type': 'file', 'mediaType': 'image/png', 'data': oversized},
            {'type': 'text', 'text': 'describe'}]}],
        'toolChoice': {'type': 'auto'}, 'maxOutputTokens': 1})
    check('gateway: oversized metadata is refused before generation',
          status == 400 and 'decoded source image exceeds' in raw, f'{status}: {raw[:240]}')
    after_status, after_raw = post(port, '/api/show', {'model': MODEL})
    after = json.loads(after_raw).get('details', {}).get('memory_plan', {})
    check('source refusal leaves pool, prefix and tower budget unchanged',
          before_status == after_status == 200 and bool(before) and before == after)
    status, response, _, raw = chat(port, [{'role': 'user', 'content': 'Say only: ok'}])
    check('text works after oversized sources', status == 200 and
          response.get('message', {}).get('content', '').strip().lower() == 'ok', raw[:240])


def source_reuse(port):
    red, blue = solid_image_base64((255, 0, 0)), solid_image_base64((0, 0, 255))
    reuse = '--expect-image-reuse' in sys.argv
    for label, images, wanted_decodes, wanted_reuses in [
        ('duplicate', [red, red], 1 if reuse else 2, 1 if reuse else 0),
        ('same geometry different bytes', [red, blue], 2, 0),
        ('new request after changed images', [red, red], 1 if reuse else 2, 1 if reuse else 0),
    ]:
        status, response, _, raw = chat(port, [{'role': 'user', 'content': 'Say only: ok', 'images': images}],
            options={'num_predict': 1, 'temperature': 0, 'seed': 7})
        stats = response.get('slotstream_benchmark', {}).get('stats', {})
        prep = stats.get('imagePreparation', {})
        check(f'{label}: request completes', status == 200 and response.get('done') is True, raw[:240])
        check(f'{label}: exact source decode/reuse counts',
              prep.get('sourceDecodedImages') == wanted_decodes and prep.get('sourceReusedImages') == wanted_reuses,
              str(prep))
        check(f'{label}: shared source storage charged once',
              prep.get('sourceAdmissionBytes') == wanted_decodes * 256 * 256 * 16, str(prep))
        check(f'{label}: source reuse retains all image tokens', stats.get('encodedImages', -1)
              + stats.get('reusedImageFeatures', -1) == 2, str(stats))


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

    if "--budget-refusal-only" in sys.argv:
        budget_refusal(port)
        print(f"{len(PASS)} passed, {len(FAIL)} failed")
        return 1 if FAIL else 0

    if "--source-bounds-only" in sys.argv:
        source_bounds(port)
        print(f"{len(PASS)} passed, {len(FAIL)} failed")
        return 1 if FAIL else 0

    if "--source-reuse-only" in sys.argv:
        source_reuse(port)
        print(f"{len(PASS)} passed, {len(FAIL)} failed")
        return 1 if FAIL else 0

    if "--same-geometry-only" in sys.argv:
        same_geometry_invalidation(port)
        print(f"{len(PASS)} passed, {len(FAIL)} failed")
        return 1 if FAIL else 0

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
        {"model": MODEL, "max_tokens": 32, "temperature": 0, "seed": 7, "messages": [{
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
         "images": [dog], "think": False, "options": {"num_predict": 32, "temperature": 0, "seed": 7}})
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
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 32, "temperature": 0, "seed": 7})
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
    ordered_subjects = reply.split(",", 1)
    check(
        "and they arrive in the order they were sent",
        len(ordered_subjects) == 2 and says(ordered_subjects[0], "dog", "puppy")
        and says(ordered_subjects[1], "fruit", "citrus", "tree", "lime", "pomelo", "grapefruit", "orange"),
        reply[:160])
    print(f"      -> {reply.strip()[:100]!r}")

    # 7. Prefix reuse. A follow-up turn extends the previous prompt, so the
    #    state is handed over whole: the tower does not run again and prefill
    #    reads only new text. Benchmark observations prove reuse directly;
    #    a short elapsed time alone is not evidence that a cache was used.
    history = [
        {"role": "user", "content": "Say only: ok",
         "images": [dog]},
    ]
    st, obj, first_secs, _ = chat(port, history)
    first_stats = obj.get('slotstream_benchmark', {}).get('stats', {})
    history.append({"role": "assistant", "content": obj.get("message", {}).get("content", "")})
    history.append({"role": "user", "content": "Now say only: still ok"})
    st, obj, second_secs, raw = chat(port, history)
    second_stats = obj.get('slotstream_benchmark', {}).get('stats', {})
    check("a follow-up turn on the same picture succeeds", st == 200, raw[:200])
    check(
        "and reuses the state instead of re-running the tower",
        first_stats.get('encodedImages') == 1 and second_stats.get('encodedImages') == 0
        and second_stats.get('reusedPrefixTokens', 0) > 0 and second_stats.get('prefixSkippedImages') == 1,
        f"encoded first={first_stats.get('encodedImages')}, follow-up={second_stats.get('encodedImages')}, "
        f"reused={second_stats.get('reusedPrefixTokens')}; requires SLOTSTREAM_BENCH_DETAILS=1")
    print(f"      -> first {first_secs:.1f}s, follow-up {second_secs:.1f}s")

    # 8. The same ids with a different picture must NOT reuse. Both images
    #    resize to different grids, so to make the ids identical the second
    #    request replays the first conversation with the other picture at the
    #    same place — a cache keyed on ids alone would answer from the dog's
    #    state about the tree.
    first_status, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [dog]}])
    first = obj.get("message", {}).get("content", "")
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [tree]}])
    second = obj.get("message", {}).get("content", "")
    check(
        "the same words with a different picture get a different answer",
        first_status == 200 and st == 200 and bool(second.strip())
        and says(first, "dog", "puppy", "canine")
        and not says(second, "dog", "puppy", "canine"),
        f"{first[:60]!r} then {second[:60]!r}")

    st, obj, _, raw = chat(port, [{'role': 'user', 'images': [dog, dog],
        'content': 'What animal is shown in both images? Reply in three words.'}])
    reply = obj.get('message', {}).get('content', '')
    observed = obj.get('slotstream_benchmark', {}).get('stats', {})
    check('duplicate images preserve the visible subject', st == 200 and says(reply, 'dog', 'puppy', 'canine'), raw[:200])
    check('duplicate image work is counted', observed.get('encodedImages', -1) + observed.get('reusedImageFeatures', -1) == 2,
          f"encoded={observed.get('encodedImages')}, reused={observed.get('reusedImageFeatures')}")
    if '--expect-image-reuse' in sys.argv:
        check('duplicate images execute the tower once', observed.get('encodedImages') == 1 and observed.get('reusedImageFeatures') == 1,
              f"encoded={observed.get('encodedImages')}, reused={observed.get('reusedImageFeatures')}")

    same_geometry_invalidation(port)

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
