#!/usr/bin/env python3
"""Weight-free configurable-context CLI/metadata contracts; never loads a model."""
import argparse
import json
import os
import re
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent.parent


def run(binary, args):
    env = {k: v for k, v in os.environ.items() if not k.startswith("SLOTSTREAM_")}
    result = subprocess.run([str(binary), *args], env=env, text=True, capture_output=True, timeout=120)
    return {"args": args, "code": result.returncode, "stdout": result.stdout, "stderr": result.stderr}


def successful_tools(frames):
    """Receiving-side fixture: valid arguments alone never authorize execution."""
    calls = {}
    finished = False
    terminal = False
    failed = False
    for frame in frames:
        if frame == "[DONE]":
            if not finished or failed:
                return []
            terminal = True
            continue
        if terminal or not isinstance(frame, dict) or frame.get("error"):
            return []
        for choice in frame.get("choices", []):
            reason = choice.get("finish_reason")
            if reason is not None:
                if finished or reason != "tool_calls":
                    return []
                finished = True
            for delta in choice.get("delta", {}).get("tool_calls", []):
                if finished:
                    return []
                current = calls.setdefault(delta["index"], {"id": "", "name": "", "arguments": ""})
                current["id"] += delta.get("id", "")
                function = delta.get("function", {})
                current["name"] += function.get("name", "")
                current["arguments"] += function.get("arguments", "")
    if not terminal or not finished or failed:
        return []
    result = []
    try:
        for call in calls.values():
            args = json.loads(call["arguments"])
            if not call["id"] or not call["name"] or not isinstance(args, dict):
                return []
            result.append({**call, "arguments": args})
    except (ValueError, TypeError):
        return []
    return result


def check(binary):
    evidence, assertions = [], []

    def expect(name, condition, detail=None):
        assertions.append({"name": name, "passed": bool(condition), "detail": detail if not condition else None})

    fixture = json.loads((ROOT / "Tools/fixtures/context-default-v1.json").read_text())
    help_result = run(binary, ["context-check", "--help"])
    evidence.append(help_result)
    help_text = help_result["stdout"]
    for flag, default in [("--reply-tokens", "16"), ("--wall-seconds", "7200.0")]:
        expect(f"diagnostic {flag} default is explicit", bool(re.search(
            re.escape(flag) + r"(?:(?!\n  --).)*\(default: " + re.escape(default) + r"\)", help_text, re.S)), help_text)
    fields = fixture["projection_fields"]
    additions = set(fixture["allowed_additions"])
    for tier in fixture["tiers"]:
        repeats = [run(binary, tier["args"]) for _ in range(2)]
        evidence.extend(repeats)
        values = [json.loads(r["stdout"]) for r in repeats]
        projected = [{k: d[k] for k in fields if k in d} for d in values]
        expect(f"default {tier['tier']} preserved", projected[0] == projected[1] == tier["expected"], projected)
        for d in values:
            expect(f"default {tier['tier']} additions declared", set(d) <= set(fields) | additions, sorted(d))
            expect(f"default {tier['tier']} ledger agrees", abs(d["expected_peak_gb"] - d["memory_ledger"]["expected_peak_bytes"] / 1e9) <= .051)
            expect(f"default {tier['tier']} wait policy", d["max_prefill_wait_minutes"] == 30 and d["prefill_wait_scope"] == "accepted_request_to_first_model_token")

    for start in [0, 1, 32768, 65535, 128256, 131071, 262079, 262143]:
        result = run(binary, ["prefill-schedule", "--tokens", str(262144 - start), "--from", str(start), "--chunk", "4096", "--json"])
        evidence.append(result)
        d = json.loads(result["stdout"])
        pos = start
        bounded = True
        for count in d["passes"]:
            bounded &= count > 0 and count * (pos + count) <= 4096 * 8016
            pos += count
        expect(f"full schedule from {start}", bounded and pos == 262144, d)
        expect(f"uncalibrated schedule from {start} labeled unknown", d["est_seconds"] is None)

    for surface in ["serve", "run", "doctor"]:
        for args in [["--max-context", "0"], ["--max-context", "262145"],
                     ["--max-prefill-wait", "nan"], ["--max-prefill-wait", "inf"],
                     ["--max-prefill-wait", "-1"], ["--max-prefill-wait", "1e300"]]:
            result = run(binary, [surface, *args, "--model", "/nonexistent/context-gate-no-model"])
            evidence.append(result)
            expect(f"{surface} rejects {args}", result["code"] != 0 and "engine ready" not in result["stderr"], result)
            expect(f"{surface} validates policy before weights {args}", "still to download" not in result["stderr"] and "no model at" not in result["stderr"], result)
    for args in [["--tokens", "262144"], ["--tokens", "-1"],
                 ["--tokens", "9223372036854775807"], ["--reply-tokens", "9223372036854775807"],
                 ["--reply-tokens", "0"], ["--wall-seconds", "nan"]]:
        result = run(binary, ["context-check", *args, "--model", "/nonexistent/context-gate-no-model"])
        evidence.append(result)
        expect(f"diagnostic rejects before allocation {args}", result["code"] != 0 and "engine ready" not in result["stderr"], result)

    tool = {"choices": [{"delta": {"tool_calls": [{"index": 0, "id": "call_1", "function": {"name": "lookup", "arguments": '{"key":"a"}'}}]}, "finish_reason": None}]}
    finish = {"choices": [{"delta": {}, "finish_reason": "tool_calls"}]}
    expect("successful tool turn is deliverable", len(successful_tools([tool, finish, "[DONE]"])) == 1)
    for suffix in [[], [{"error": {"code": "insufficient_memory"}}],
                   [{"error": {"code": "prefill_deadline_exceeded"}}],
                   [{"choices": [{"delta": {}, "finish_reason": "length"}]}, "[DONE]"],
                   [finish], [finish, {"error": {"code": "inference_error"}}, "[DONE]"]]:
        expect(f"failed/incomplete tool turn is inert {suffix}", successful_tools([tool, *suffix]) == [])
    return {"passed": all(a["passed"] for a in assertions), "assertions": assertions, "commands": evidence}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--binary", type=Path, default=ROOT / ".build/release/slotstream")
    p.add_argument("--report", type=Path, required=True)
    a = p.parse_args()
    result = check(a.binary.resolve())
    a.report.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"passed": result["passed"], "assertions": len(result["assertions"]),
                      "failures": [v for v in result["assertions"] if not v["passed"]]}))
    return 0 if result["passed"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
