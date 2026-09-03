#!/usr/bin/env python3
"""Live scenarios for the loopback AI Gateway dialect (the surface fx speaks).

Run through Tools/fx_gates.sh, which starts and stops the server. Standard
library only, and raw sockets rather than urllib for two reasons: some sandboxes
proxy urllib/curl to localhost, and the write side of the socket must stay open
while the server generates. The server treats a peer half-close as a
disconnect and stops the turn before its first token, which looks exactly like a
model that produced nothing — an afternoon was spent on that once.

Usage: fx_scenarios.py <port> [--quick]
"""
import json
import socket
import sys
import time

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 11477
QUICK = "--quick" in sys.argv

HEADERS = {
    "ai-gateway-protocol-version": "0.0.1",
    "ai-language-model-specification-version": "4",
    "ai-language-model-streaming": "true",
    "ai-language-model-id": "slotstream/qwen3.8-flash-next",
    "authorization": "Bearer local-dummy-key",
}
TOOLS = [
    {
        "type": "function",
        "name": "read_file",
        "description": "Read a file from the workspace.",
        "inputSchema": {
            "type": "object",
            "properties": {"path": {"type": "string"}, "start_line": {"type": "integer"}},
            "required": ["path"],
        },
    }
]
USER = [{"role": "user", "content": [{"type": "text", "text": "Say OK."}]}]

passed = failed = 0


def ok(name):
    global passed
    passed += 1
    print(f"PASS  {name}")


def bad(name, detail=""):
    global failed
    failed += 1
    print(f"FAIL  {name}{'  (' + detail + ')' if detail else ''}")


def request(method, path, body=None, headers=None, timeout=1800):
    hdr = f"{method} {path} HTTP/1.1\r\nHost: 127.0.0.1:{PORT}\r\n"
    for k, v in (HEADERS if headers is None else headers).items():
        hdr += f"{k}: {v}\r\n"
    if body is not None:
        raw = body.encode()
        hdr += f"Content-Type: application/json\r\nContent-Length: {len(raw)}\r\n"
    hdr += "Connection: close\r\n\r\n"
    s = socket.create_connection(("127.0.0.1", PORT), timeout=timeout)
    s.settimeout(timeout)
    s.sendall(hdr.encode() + (body.encode() if body is not None else b""))
    out, t0 = [], time.time()
    while True:
        try:
            chunk = s.recv(65536)
        except socket.timeout:
            break
        if not chunk:
            break
        out.append(chunk)
    s.close()
    return b"".join(out).decode("utf-8", "replace"), time.time() - t0


def dechunk(raw):
    head, _, body = raw.partition("\r\n\r\n")
    if "chunked" not in head.lower():
        return head, body
    parts, i = [], 0
    while i < len(body):
        j = body.find("\r\n", i)
        if j < 0:
            break
        try:
            n = int(body[i:j].strip(), 16)
        except ValueError:
            break
        if n == 0:
            break
        parts.append(body[j + 2 : j + 2 + n])
        i = j + 2 + n + 2
    return head, "".join(parts)


def events(text):
    return [
        json.loads(line[6:])
        for line in text.splitlines()
        if line.startswith("data: ") and line[6:].strip() not in ("[DONE]", "DONE")
    ]


def post(body, headers=None, timeout=1800):
    raw, secs = request(
        "POST", "/v3/ai/language-model", json.dumps(body), headers, timeout=timeout
    )
    head, payload = dechunk(raw)
    return head.splitlines()[0], payload, secs


def get(path):
    head, payload = dechunk(request("GET", path, None, timeout=60)[0])
    return head.splitlines()[0], payload


def expect_400(name, body, code, headers=None):
    status, payload, _ = post(body, headers)
    if "400" not in status:
        return bad(name, f"status {status}")
    try:
        got = json.loads(payload)["error"]["code"]
    except Exception:
        return bad(name, f"body {payload[:120]}")
    ok(name) if got == code else bad(name, f"code {got}, want {code}")


def stream(name, body, want_finish=None, want_tool=False, want_reasoning=False):
    """Every accepted turn must satisfy the parts of the contract fx is strict about."""
    status, payload, secs = post(body)
    if "200" not in status:
        return bad(name, f"status {status} {payload[:160]}")
    if not payload.rstrip().endswith("[DONE]"):
        return bad(name, "stream did not end with [DONE]")
    ev = events(payload)
    types = [e["type"] for e in ev]
    if types[:1] != ["stream-start"]:
        return bad(name, f"first event {types[:1]}")
    fin = [e for e in ev if e["type"] == "finish"]
    if not fin:
        return bad(name, "no finish frame")
    reason = fin[0].get("finishReason")
    if not isinstance(reason, dict) or not isinstance(reason.get("unified"), str):
        return bad(name, f"finishReason must be an object with a string unified: {reason!r}")
    usage = fin[0].get("usage", {})
    if not isinstance(usage.get("inputTokens"), dict) or "total" not in usage["inputTokens"]:
        return bad(name, "usage.inputTokens.total must be nested")
    if not isinstance(usage.get("outputTokens"), dict) or "total" not in usage["outputTokens"]:
        return bad(name, "usage.outputTokens.total must be nested")
    if want_finish and reason["unified"] != want_finish:
        return bad(name, f"finish {reason['unified']}, want {want_finish}")
    if want_tool and "tool-call" not in types:
        return bad(name, f"no tool call; types={types[:10]}")
    if want_reasoning and "reasoning-delta" not in types:
        return bad(name, f"no reasoning; types={types[:10]}")
    # Streamed input deltas must concatenate into the final call input.
    for call in [e for e in ev if e["type"] == "tool-call"]:
        acc = "".join(
            e["delta"] for e in ev
            if e["type"] == "tool-input-delta" and e["id"] == call["toolCallId"]
        )
        if acc and acc != call["input"]:
            return bad(name, f"deltas {acc!r} != input {call['input']!r}")
    ok(f"{name} ({secs:.0f}s, {len(ev)} events)")
    return ev


# --- catalogue -------------------------------------------------------------
status, payload = get("/coding-agent/v1/models")
try:
    data = json.loads(payload).get("data", [])
except Exception:
    data = []
ok("catalogue responds") if "200" in status else bad("catalogue responds", status)
ok("catalogue lists four models") if len(data) == 4 else bad("four models", str(len(data)))
violations = [
    f"{e['id']}: max_tokens {e['max_tokens']} >= context_window {e['context_window']}"
    for e in data
    if e["max_tokens"] >= e["context_window"]
]
# fx subtracts the output budget only when it is strictly smaller than the
# window; equal or larger silently hands the whole window back as usable input.
(
    ok("live catalogue keeps max_tokens < context_window")
    if not violations
    else bad("catalogue invariant", "; ".join(violations))
)
ids = {e["id"] for e in data}
helpers = {"moonshotai/kimi-k3", "openai/gpt-5.6-luna", "google/gemini-2.5-flash"}
(
    ok("catalogue carries fx's three hardcoded helper ids")
    if helpers <= ids
    else bad("helper ids", str(helpers - ids))
)
status, payload = get("/coding-agent/v1/credits")
(
    ok("credits endpoint answers")
    if "200" in status and "balance" in payload
    else bad("credits endpoint", status)
)

# --- refused shapes --------------------------------------------------------
expect_400(
    "a wrong specification version is refused",
    {"prompt": USER},
    "unsupported_specification_version",
    dict(HEADERS, **{"ai-language-model-specification-version": "5"}),
)
expect_400(
    "a wrong protocol version is refused",
    {"prompt": USER},
    "unsupported_protocol_version",
    dict(HEADERS, **{"ai-gateway-protocol-version": "9.9.9"}),
)
expect_400("an unknown top-level field is refused", {"prompt": USER, "nope": 1}, "unsupported_field")
expect_400(
    "image parts are refused",
    {"prompt": [{"role": "user", "content": [{"type": "file", "mediaType": "image/png", "data": "AA"}]}]},
    "images_unsupported",
)
expect_400(
    "a json responseFormat is refused",
    {"prompt": USER, "responseFormat": {"type": "json", "name": "x", "schema": {}}},
    "response_format_unsupported",
)
expect_400(
    "a system message after the conversation is refused",
    {"prompt": USER + [{"role": "system", "content": "late"}]},
    "system_after_conversation",
)
expect_400(
    "an assistant-final prompt is refused",
    {"prompt": USER + [{"role": "assistant", "content": [{"type": "text", "text": "x"}]}]},
    "assistant_prefill_unsupported",
)
expect_400(
    "a non-zero frequencyPenalty is refused",
    {"prompt": USER, "frequencyPenalty": 0.7},
    "frequency_penalty_unsupported",
)

# --- JSON nulls, which fx really sends -------------------------------------
# `"default": null` inside a tool schema, and nulls for unset optional
# arguments, failed the whole turn with a 400 in 0.2.4: swift-jinja throws on
# NSNull. Found in live use, not by a gate. Each shape is now a gate.
NULL_TOOL = [
    {
        "type": "function",
        "name": "terminal",
        "description": "Run a command.",
        "inputSchema": {
            "type": "object",
            "properties": {
                "command": {"type": "string"},
                "timeout": {"anyOf": [{"type": "number"}, {"type": "null"}], "default": None},
                "background": {"anyOf": [{"type": "boolean"}, {"type": "null"}]},
            },
            "required": ["command"],
        },
    }
]
stream(
    "a null inside a tool schema does not fail the turn",
    {"prompt": USER, "tools": NULL_TOOL, "maxOutputTokens": 8},
)
stream(
    "a null tool-call argument does not fail the turn",
    {
        "prompt": USER
        + [
            {"role": "assistant", "content": [
                {"type": "tool-call", "toolCallId": "c1", "toolName": "terminal",
                 "input": {"command": "ls", "timeout": None, "background": None}}]},
            {"role": "tool", "content": [
                {"type": "tool-result", "toolCallId": "c1", "toolName": "terminal",
                 "output": {"type": "text", "value": "ok"}}]},
        ],
        "tools": NULL_TOOL,
        "maxOutputTokens": 8,
    },
)
stream(
    "a null in a json tool result does not fail the turn",
    {
        "prompt": USER
        + [
            {"role": "assistant", "content": [
                {"type": "tool-call", "toolCallId": "c1", "toolName": "terminal",
                 "input": {"command": "ls"}}]},
            {"role": "tool", "content": [
                {"type": "tool-result", "toolCallId": "c1", "toolName": "terminal",
                 "output": {"type": "json", "value": {"exit": 0, "stderr": None}}}]},
        ],
        "tools": NULL_TOOL,
        "maxOutputTokens": 8,
    },
)

# --- accepted turns --------------------------------------------------------
stream("a plain text turn streams and finishes", {"prompt": USER, "maxOutputTokens": 32})
stream(
    "toolChoice none renders no tools (the compaction shape)",
    {
        "prompt": [{"role": "user", "content": [{"type": "text", "text": "Reply with the single word OK."}]}],
        "tools": TOOLS,
        "toolChoice": {"type": "none"},
        "maxOutputTokens": 32,
    },
)
stream(
    "maxOutputTokens is honoured and reports length",
    {
        "prompt": [{"role": "user", "content": [{"type": "text", "text": "Count slowly from one to fifty."}]}],
        "maxOutputTokens": 8,
    },
    want_finish="length",
)
stream(
    "a provider tool is stripped rather than refused",
    {
        "prompt": USER,
        "tools": TOOLS
        + [{"type": "provider", "id": "gateway.perplexity_search", "name": "perplexity_search", "args": {}}],
        "maxOutputTokens": 32,
    },
)

if not QUICK:
    stream(
        "thinking on streams reasoning parts",
        {
            "prompt": [{"role": "user", "content": [{"type": "text", "text": "What is 2+2? Think first."}]}],
            "reasoning": "low",
            "maxOutputTokens": 96,
        },
        want_reasoning=True,
    )

    # The whole point: a tool call, then the result fed back, on a warm cache.
    turn1 = [
        {"role": "system", "content": "You are fx, a coding agent working in the user's workspace."},
        {"role": "user", "content": [{"type": "text", "text": "Read hello.txt and tell me what it says."}]},
    ]
    ev = stream(
        "turn 1 produces a well-formed tool call",
        {"prompt": turn1, "tools": TOOLS, "toolChoice": {"type": "auto"}, "maxOutputTokens": 128},
        want_finish="tool-calls",
        want_tool=True,
    )
    if isinstance(ev, list):
        call = [e for e in ev if e["type"] == "tool-call"][0]
        args = json.loads(call["input"])
        (
            ok("the call names the file the user asked for")
            if args.get("path", "").endswith("hello.txt")
            else bad("call arguments", call["input"])
        )
        text1 = "".join(e.get("delta", "") for e in ev if e["type"] == "text-delta")
        turn2 = turn1 + [
            {
                "role": "assistant",
                "content": ([{"type": "text", "text": text1}] if text1.strip() else [])
                + [
                    {
                        "type": "tool-call",
                        "toolCallId": call["toolCallId"],
                        "toolName": call["toolName"],
                        "input": args,
                    }
                ],
            },
            {
                "role": "tool",
                "content": [
                    {
                        "type": "tool-result",
                        "toolCallId": call["toolCallId"],
                        "toolName": call["toolName"],
                        "output": {"type": "text", "value": "hello from slotstream"},
                    }
                ],
            },
        ]
        ev2 = stream(
            "turn 2 accepts the tool result and answers",
            {"prompt": turn2, "tools": TOOLS, "toolChoice": {"type": "auto"}, "maxOutputTokens": 128},
        )
        if isinstance(ev2, list):
            answer = "".join(e.get("delta", "") for e in ev2 if e["type"] == "text-delta")
            (
                ok("the answer uses the tool result")
                if "slotstream" in answer.lower()
                else bad("answer ignored the tool result", answer[:120])
            )
            usage = [e for e in ev2 if e["type"] == "finish"][0]["usage"]["inputTokens"]
            # The agent loop is only affordable if turn 2 reuses turn 1's state.
            (
                ok(f"turn 2 hits the prefix cache ({usage['cacheRead']}/{usage['total']} tokens reused)")
                if usage["cacheRead"] > 0
                else bad("prefix cache missed on turn 2", json.dumps(usage))
            )

    # With reasoning on, the client never echoes the reasoning back, so the
    # re-rendered history cannot match the ids that produced it. Without the
    # raw-id splice this turn reuses nothing and pays a full prefill again.
    t1 = [
        {"role": "system", "content": "You are fx, a coding agent working in the user's workspace."},
        {"role": "user", "content": [{"type": "text", "text": "Read hello.txt and say what it contains."}]},
    ]
    ev = stream(
        "turn 1 with reasoning on produces a call",
        {"prompt": t1, "tools": TOOLS, "toolChoice": {"type": "auto"},
         "reasoning": "low", "maxOutputTokens": 160},
        want_tool=True,
    )
    if isinstance(ev, list):
        call = [e for e in ev if e["type"] == "tool-call"][0]
        text1 = "".join(e.get("delta", "") for e in ev if e["type"] == "text-delta")
        t2 = t1 + [
            {"role": "assistant", "content": ([{"type": "text", "text": text1}] if text1.strip() else [])
             + [{"type": "tool-call", "toolCallId": call["toolCallId"],
                 "toolName": call["toolName"], "input": json.loads(call["input"])}]},
            {"role": "tool", "content": [
                {"type": "tool-result", "toolCallId": call["toolCallId"], "toolName": call["toolName"],
                 "output": {"type": "text", "value": "hello from slotstream"}}]},
        ]
        ev2 = stream(
            "turn 2 with reasoning on answers",
            {"prompt": t2, "tools": TOOLS, "toolChoice": {"type": "auto"},
             "reasoning": "low", "maxOutputTokens": 160},
        )
        if isinstance(ev2, list):
            usage = [e for e in ev2 if e["type"] == "finish"][0]["usage"]["inputTokens"]
            (
                ok(f"the splice keeps reasoning turns on the cache ({usage['cacheRead']}/{usage['total']} reused)")
                if usage["cacheRead"] > 0
                else bad("reasoning turn missed the prefix cache", json.dumps(usage))
            )

# --- a client that leaves mid-stream must not take the server with it ------
body = json.dumps({"prompt": [{"role": "user", "content": [{"type": "text", "text": "Count to two hundred."}]}]})
s = socket.create_connection(("127.0.0.1", PORT), timeout=30)
s.sendall(
    (
        f"POST /v3/ai/language-model HTTP/1.1\r\nHost: 127.0.0.1\r\n"
        f"Content-Type: application/json\r\nContent-Length: {len(body)}\r\n"
        f"Connection: close\r\n\r\n"
    ).encode()
    + body.encode()
)
time.sleep(3)
s.close()
time.sleep(2)
status, _ = get("/coding-agent/v1/models")
(
    ok("the server survives a client that leaves mid-stream")
    if "200" in status
    else bad("survived disconnect", status)
)

print(f"\n{passed} passed, {failed} failed")
sys.exit(1 if failed else 0)
