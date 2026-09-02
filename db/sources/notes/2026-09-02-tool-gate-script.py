#!/usr/bin/env python3
"""Live tool-calling gates against a slotstream tools-branch server (port 11477).

Captured 2026-09-02, MacBook Pro M3 Max — the probe behind the run record
`db/sources/runs/2026/09/2026-09-02-live-tool-gates-macbook-pro-m3-max.md`.
Served by: slotstream serve --port 11477 --memory-gb 12 --no-elastic
"""
import json, re, sys, time, urllib.request, urllib.error

URL = "http://127.0.0.1:11477/v1/chat/completions"

TOOLS = [
    {"type": "function", "function": {
        "name": "get_time",
        "description": "Get the current time in a timezone.",
        "parameters": {"type": "object", "properties": {
            "timezone": {"type": "string", "description": "IANA timezone, e.g. Europe/Paris"}},
            "required": ["timezone"]}}},
    {"type": "function", "function": {
        "name": "get_weather",
        "description": "Get the current weather for a city.",
        "parameters": {"type": "object", "properties": {
            "city": {"type": "string"}, "unit": {"type": "string", "enum": ["c", "f"]}},
            "required": ["city"]}}},
]

def call(messages, tools=None, max_tokens=100, temperature=0.0):
    body = {"model": "qwen3.8-flash-next:4bit", "messages": messages,
            "max_tokens": max_tokens, "temperature": temperature}
    if tools is not None: body["tools"] = tools
    req = urllib.request.Request(URL, data=json.dumps(body).encode(), method="POST")
    for attempt in range(2):
        try:
            with urllib.request.urlopen(req, timeout=240) as r:
                return json.load(r)
        except urllib.error.HTTPError as e:
            if attempt == 0 and e.code >= 500: time.sleep(5); continue
            return {"http_error": e.code, "body": e.read().decode()[:200]}
    return {"http_error": "unreachable"}

def judge(tc):
    try:
        f = tc.get("function", {})
        name = f.get("name", "")
        args = json.loads(f.get("arguments", "{}")) if isinstance(f.get("arguments"), str) else f.get("arguments", {})
        return name, isinstance(args, dict), args
    except Exception:
        return "", False, {}

CASES = [
    ("calls a tool",          "What time is it in Paris right now? Use the provided tool.", "get_time", True),
    ("calls the right tool",  "Is it raining in Tokyo? Use the provided tools.", "get_weather", True),
    ("two-argument call",     "What's the weather in Berlin in celsius? Use the provided tools.", "get_weather", True),
    ("no tool when unneeded", "What is 2+2? Answer with the number only.", None, False),
]

well = 0; detail = []
for i, (label, prompt, expect, should_call) in enumerate(CASES):
    r = call([{"role": "user", "content": prompt}], tools=TOOLS, max_tokens=120)
    if "http_error" in r: detail.append(f"{label}: HTTP {r['http_error']}"); continue
    msg = r["choices"][0]["message"]; fr = r["choices"][0].get("finish_reason")
    tcs = msg.get("tool_calls") or []
    if should_call:
        if tcs:
            name, okargs, args = judge(tcs[0])
            ok = (name == expect) and okargs
            well += 1 if ok else 0
            detail.append(f"{label}: finish={fr} call={name}({args}) {'OK' if ok else 'MISMATCH'}")
        else:
            detail.append(f"{label}: NO CALL, finish={fr}")
    else:
        ok = (fr == "stop") and not tcs
        well += 1 if ok else 0
        detail.append(f"{label}: finish={fr} {'OK' if ok else 'UNEXPECTED CALL'}")
    print(f"[{i+1}/{len(CASES)}] {detail[-1]}", flush=True)

print(f"FORMAT GATE: {well}/{len(CASES)} well-formed", flush=True)

t0 = time.time()
r1 = call([{"role": "user", "content": "What time is it in Paris? Use the tool."}], tools=TOOLS, max_tokens=120)
if "http_error" in r1:
    print("LOOP GATE: FAIL (first leg", r1["http_error"], ")"); sys.exit(1)
m1 = r1["choices"][0]["message"]
if not m1.get("tool_calls"):
    print("LOOP GATE: FAIL (no tool call on leg 1)"); sys.exit(1)
tc = m1["tool_calls"][0]
args = json.loads(tc["function"]["arguments"]) if isinstance(tc["function"]["arguments"], str) else tc["function"]["arguments"]
print(f"leg1: finish={r1['choices'][0]['finish_reason']} call={tc['function']['name']}({args}) [{time.time()-t0:.0f}s]", flush=True)

tool_msg = {"role": "tool", "tool_call_id": tc.get("id", "call_0"), "content": json.dumps({"time": "14:32", "timezone": args.get("timezone", "Europe/Paris")})}
r2 = call([{"role": "user", "content": "What time is it in Paris? Use the tool."},
           {"role": "assistant", "content": m1.get("content") or "", "tool_calls": m1["tool_calls"]},
           tool_msg], tools=TOOLS, max_tokens=80)
if "http_error" in r2:
    print("LOOP GATE: FAIL (second leg", r2["http_error"], ")", r2.get("body", "")[:160]); sys.exit(1)
m2 = r2["choices"][0]["message"]
final = (m2.get("content") or "").strip()
ok2 = r2["choices"][0].get("finish_reason") == "stop" and re.search(r"14:32|2:32", final) and not m2.get("tool_calls")
print(f"leg2: finish={r2['choices'][0].get('finish_reason')} content={final[:90]!r} [{time.time()-t0:.0f}s]")
print("LOOP GATE:", "PASS" if ok2 else "FAIL")
