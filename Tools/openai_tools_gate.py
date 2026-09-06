#!/usr/bin/env python3
"""Live OpenAI agent protocol checks. Uses an already-running loopback server.

No tool is executed: the caller supplies a fixed diagnostic result after checking
the generated function and arguments. Raw requests/replies are preserved as JSONL.
"""
import argparse
import base64
import json
from pathlib import Path
import urllib.error
import urllib.request


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--port", type=int, default=11434)
    p.add_argument("--output", type=Path, required=True)
    p.add_argument("--vision", action="store_true", help="Also check a tool loop using the repository's dog image fixture")
    a = p.parse_args()
    base = f"http://127.0.0.1:{a.port}"
    opener = urllib.request.build_opener(urllib.request.ProxyHandler({}))
    a.output.parent.mkdir(parents=True, exist_ok=True)
    log = a.output.open("w")
    passed = []

    def request(name, path, body=None, expected=200):
        req = urllib.request.Request(base + path,
            data=json.dumps(body).encode() if body is not None else None,
            headers={"Content-Type": "application/json"})
        try:
            with opener.open(req, timeout=600) as response:
                status, raw = response.status, response.read().decode()
        except urllib.error.HTTPError as exc:
            status, raw = exc.code, exc.read().decode()
        log.write(json.dumps({"case": name, "path": path, "request": body,
            "status": status, "response": raw}) + "\n"); log.flush()
        assert status == expected, (name, status, raw)
        return raw

    def check(name, condition, detail=None):
        assert condition, (name, detail)
        passed.append(name)
        print("PASS", name, flush=True)

    catalog = json.loads(request("catalog", "/v1/models"))["data"][0]
    model, cap = catalog["id"], catalog["context_length"]
    show = json.loads(request("show", "/api/show", {"model": model}))
    check("runtime context discovery agrees", f"num_ctx {cap}" in show["parameters"]
        and catalog["context_window"] == cap and 0 < catalog["max_output_tokens"] <= cap)
    function = {"type": "function", "function": {"name": "read_file",
        "description": "Read a named diagnostic file.", "strict": False,
        "parameters": {"type": "object", "properties": {"path": {"type": "string"},
            "start_line": {"type": "integer", "default": None}}, "required": ["path"]}}}
    user = {"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}
    common = {"model": model, "messages": [user], "tools": [function], "max_tokens": 192,
        "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": False,
        "options": {"num_ctx": cap}}

    def completion(name, body):
        raw = request(name, "/v1/chat/completions", body)
        if not body.get("stream"):
            result = json.loads(raw)
            return result["choices"][0]["message"], result["choices"][0]["finish_reason"], result["usage"]
        message = {"role": "assistant", "content": ""}
        calls = {}; finish = None; usage = None; done = False
        for line in raw.splitlines():
            if not line.startswith("data: "): continue
            if line == "data: [DONE]": done = True; continue
            item = json.loads(line[6:]); assert "error" not in item, item
            for choice in item["choices"]:
                delta = choice["delta"]
                message["content"] += delta.get("content", "")
                if "reasoning_content" in delta:
                    message["reasoning_content"] = message.get("reasoning_content", "") + delta["reasoning_content"]
                for call in delta.get("tool_calls", []):
                    index = call["index"]
                    dest = calls.setdefault(index, {"id": "", "type": "function", "function": {"name": "", "arguments": ""}})
                    dest["id"] += call.get("id", "")
                    for key in ("name", "arguments"):
                        dest["function"][key] += call.get("function", {}).get(key, "")
                finish = choice.get("finish_reason") or finish
            usage = item.get("usage") or usage
        assert done and finish is not None, raw
        if calls: message["tool_calls"] = [calls[i] for i in sorted(calls)]
        return message, finish, usage

    for stream in (False, True):
        label = "stream" if stream else "nonstream"
        body = dict(common, stream=stream, tool_choice={"type": "function", "function": {"name": "read_file"}})
        if stream: body["stream_options"] = {"include_usage": True}
        message, finish, usage = completion(label + "-call", body)
        calls = message.get("tool_calls", [])
        check(label + " returns executable OpenAI function", finish == "tool_calls" and len(calls) == 1, message)
        call = calls[0]
        check(label + " preserves function and typed arguments", call["function"]["name"] == "read_file"
            and json.loads(call["function"]["arguments"]) == {"path": "diagnostic.txt", "start_line": 1}, call)
        check(label + " includes call identity and usage", bool(call["id"]) and usage["completion_tokens"] > 0)
        history = [user, message, {"role": "tool", "tool_call_id": call["id"], "content": "OPENAI_TOOL_FIXTURE_42"},
            {"role": "user", "content": "Reply with only the exact file contents. Do not call a tool."}]
        final, reason, _ = completion(label + "-result", dict(common, messages=history, stream=stream, max_tokens=48))
        check(label + " completes tool-result round trip", "OPENAI_TOOL_FIXTURE_42" in final["content"]
            and not final.get("tool_calls") and reason == "stop", final)

    single, reason, _ = completion("single-call", dict(common, parallel_tool_calls=False, tool_choice="required"))
    check("parallel false returns one complete call", reason == "tool_calls" and len(single.get("tool_calls", [])) == 1, single)
    multi_user = {"role": "user", "content": "Call read_file twice now: once for alpha.txt and once for beta.txt. Use start_line 1 in each call. Emit both calls before waiting for results."}
    multi, reason, _ = completion("parallel-calls", dict(common, messages=[multi_user],
        parallel_tool_calls=True, tool_choice="required", stream=True, max_tokens=256))
    calls = multi.get("tool_calls", [])
    check("parallel stream has distinct complete calls", reason == "tool_calls"
        and len(calls) == 2 and len({c["id"] for c in calls}) == 2
        and {json.loads(c["function"]["arguments"])["path"] for c in calls} == {"alpha.txt", "beta.txt"}, multi)
    results = {"alpha.txt": "FIRST_FIXTURE_17", "beta.txt": "SECOND_FIXTURE_29"}
    history = [multi_user, multi] + [{"role": "tool", "tool_call_id": c["id"],
        "content": results[json.loads(c["function"]["arguments"])["path"]]} for c in reversed(calls)]
    history.append({"role": "user", "content": "Report each filename and its exact contents without a tool. Use exactly two lines in this format: alpha.txt=CONTENTS then beta.txt=CONTENTS."})
    final, reason, _ = completion("parallel-results", dict(common, messages=history, max_tokens=64))
    check("parallel results match by call ID", reason == "stop" and not final.get("tool_calls")
        and all(path + "=" + code in final["content"] for path, code in results.items()), final)
    disabled, reason, _ = completion("disabled-tools", dict(common, tool_choice="none", max_tokens=32,
        messages=[{"role": "user", "content": "Reply with only OK."}]))
    check("tool choice none remains text-only", not disabled.get("tool_calls") and reason == "stop", disabled)
    instructions, reason, _ = completion("multiple-system-instructions", {
        "model": model, "temperature": 0, "max_tokens": 32,
        "messages": [{"role": "system", "content": "The first half of the diagnostic code is ALPHA."},
            {"role": "system", "content": "The second half of the diagnostic code is BETA."},
            {"role": "user", "content": "Return only the two halves of the diagnostic code joined by a hyphen."}]})
    check("multiple initial instructions survive rendering", reason == "stop"
        and instructions["content"].strip() == "ALPHA-BETA", instructions)
    thought, _, _ = completion("reasoning-stream", {"model": model, "stream": True, "reasoning_effort": "low",
        "messages": [{"role": "user", "content": "What is 2+2? Answer briefly."}], "max_tokens": 384, "temperature": 0})
    check("reasoning separated from answer", bool(thought.get("reasoning_content"))
        and "4" in thought["content"] and "</think>" not in thought["content"], thought)

    invalid = [
        ("orphan-result", {"messages": [{"role": "tool", "tool_call_id": "orphan", "content": "bad"}]}),
        ("missing-result", {"messages": [user, single]}),
        ("context-inflation", {"options": {"num_ctx": cap + 1}}),
        ("reasoning-conflict", {"reasoning_effort": "none", "think": True}),
        ("unknown-function", {"tool_choice": {"type": "function", "function": {"name": "absent"}}}),
    ]
    for name, extra in invalid:
        request(name, "/v1/chat/completions", dict(common, **extra), expected=400)
        check(name + " rejected before inference", True)
    constrained = request("structured-output", "/v1/chat/completions", dict(common,
        response_format={"type": "json_schema", "json_schema": {"name": "title", "schema": {"type": "object"}}}), expected=400)
    check("unsupported structured output has actionable rejection", "response_format is not supported" in constrained)
    truncated = dict(common, max_tokens=1, tool_choice="required")
    request("truncated-tool", "/v1/chat/completions", truncated, expected=500)
    check("truncated required tool is an inference error", True)
    partial_stream = request("truncated-tool-stream", "/v1/chat/completions", dict(truncated, stream=True))
    check("streamed inference error cannot masquerade as success", '"error"' in partial_stream
        and "[DONE]" not in partial_stream and '"tool_calls"' not in partial_stream)
    request("smaller-request-context", "/v1/chat/completions", dict(common, options={"num_ctx": 1}), expected=400)
    check("request context limit is enforced before inference", True)
    if a.vision:
        check("enabled vision is discoverable by clients", "vision" in show["capabilities"], show["capabilities"])
        fixture = Path(__file__).resolve().parent / "assets/vision_test/secret1.jpg"
        data_url = "data:image/jpeg;base64," + base64.b64encode(fixture.read_bytes()).decode()
        image_tool = {"type": "function", "function": {"name": "report_animal",
            "description": "Report the animal in the image.", "parameters": {"type": "object",
                "properties": {"animal": {"type": "string"}}, "required": ["animal"]}}}
        image_user = {"role": "user", "content": [{"type": "text", "text": "Identify the animal in this image. Call report_animal with its common English name."},
            {"type": "image_url", "image_url": {"url": data_url}}]}
        image_request = dict(common, tools=[image_tool], messages=[image_user],
            tool_choice={"type": "function", "function": {"name": "report_animal"}})
        seen, reason, _ = completion("image-tool-call", image_request)
        image_calls = seen.get("tool_calls", [])
        check("OpenAI image and tool templates compose", reason == "tool_calls" and len(image_calls) == 1
            and "dog" in json.loads(image_calls[0]["function"]["arguments"]).get("animal", "").lower(), seen)
        history = [image_user, seen, {"role": "tool", "tool_call_id": image_calls[0]["id"], "content": "Recorded the animal."},
            {"role": "user", "content": "Which animal did you report? Answer briefly without a tool."}]
        answer, reason, _ = completion("image-tool-result", dict(image_request, messages=history, tool_choice="none", max_tokens=48))
        check("image tool-result history remains usable", reason == "stop" and "dog" in answer["content"].lower(), answer)
    request("survives-errors", "/api/version")
    print(json.dumps({"passed": len(passed), "context": cap, "model": model}), flush=True)


if __name__ == "__main__":
    main()
