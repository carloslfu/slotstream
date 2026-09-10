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
    for frame in frames:
        if terminal:
            return []
        if frame == "[DONE]":
            if not finished:
                return []
            terminal = True
            continue
        if not isinstance(frame, dict) or "error" in frame:
            return []
        choices = frame.get("choices")
        if not isinstance(choices, list) or len(choices) > 1:
            return []
        for choice in choices:
            if not isinstance(choice, dict) or not isinstance(choice.get("delta"), dict):
                return []
            reason = choice.get("finish_reason")
            if reason is not None:
                if finished or reason != "tool_calls":
                    return []
                finished = True
            deltas = choice["delta"].get("tool_calls", [])
            if not isinstance(deltas, list):
                return []
            for delta in deltas:
                if finished or not isinstance(delta, dict) or type(delta.get("index")) is not int or delta["index"] < 0:
                    return []
                function = delta.get("function", {})
                if not isinstance(function, dict) or any(not isinstance(v, str) for v in
                        (delta.get("id", ""), function.get("name", ""), function.get("arguments", ""))):
                    return []
                current = calls.setdefault(delta["index"], {"id": "", "name": "", "arguments": ""})
                current["id"] += delta.get("id", "")
                current["name"] += function.get("name", "")
                current["arguments"] += function.get("arguments", "")
    if not terminal or not finished:
        return []
    result = []
    try:
        for call in calls.values():
            def invalid_constant(value):
                raise ValueError('non-JSON number: ' + value)
            args = json.loads(call["arguments"], parse_constant=invalid_constant)
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
        bounded &= len(d["passes"]) == len(d["compute_query_rows"]) == len(d["compute_key_extents"])
        for count, queries, extent in zip(d["passes"], d["compute_query_rows"], d["compute_key_extents"]):
            bounded &= count > 0 and queries >= count and extent >= pos + count and queries * extent <= 4096 * 8016
            pos += count
        expect(f"full schedule from {start}", bounded and pos == 262144, d)
        expect(f"uncalibrated schedule from {start} labeled unknown", d["est_seconds"] is None)

    result = run(binary, ["prefill-schedule", "--tokens", "512", "--from", "200000", "--chunk", "4095", "--json"])
    evidence.append(result)
    d = json.loads(result["stdout"])
    expect("odd late diagnostic reports actual canonical runtime passes", d["passes"] == [64]*8, d)
    expect("odd late diagnostic includes masked key columns", d["compute_key_extents"] == [200256]*4+[200512]*4, d)

    for args in [["--slots", "0"], ["--slots", "-1"], ["--slots", "9223372036854775807"],
                 ["--max-memory-gb", "nan"], ["--max-memory-gb", "inf"],
                 ["--max-memory-gb", "0"], ["--max-memory-gb", "27"]]:
        result = run(binary, ["elastic-drill", *args, "--model", "/nonexistent/context-gate-no-model"])
        evidence.append(result)
        expect(f"elastic drill refuses invalid limits before load {args}", result["code"] != 0
               and "engine ready" not in result["stderr"] and "no model at" not in result["stderr"], result)
    result = run(binary, ["elastic-drill", "--slots", "1000", "--max-memory-gb", "10",
                          "--model", "/nonexistent/context-gate-no-model"])
    evidence.append(result)
    expect("elastic drill cannot silently enlarge the ordinary test budget", result["code"] != 0
           and "above --max-memory-gb 10.000" in result["stderr"] and "engine ready" not in result["stderr"], result)

    for surface in ["mtp-accept", "mtp-bench", "mtp-check", "mtp-passcost"]:
        result = run(binary, [surface, "--mtp", "off", "--memory-gb", "10", "--model", "/nonexistent/context-gate-no-model"])
        evidence.append(result)
        expect(f"{surface} rejects an unpriced mandatory draft before loading", result["code"] != 0
               and "requires the MTP draft head" in result["stderr"] and "engine ready" not in result["stderr"], result)

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
                 ["--reply-tokens", "0"], ["--wall-seconds", "nan"],
                 ["--warm-conversations", "5"], ["--warm-conversations", "-1"],
                 ["--warm-conversations", "4", "--warm-tokens", "9223372036854775807"],
                 ["--warm-conversations", "4", "--ladder"],
                 ["--tokens", "16", "--warm-conversations", "4", "--warm-tokens", "32"]]:
        result = run(binary, ["context-check", *args, "--model", "/nonexistent/context-gate-no-model"])
        evidence.append(result)
        expect(f"diagnostic rejects before allocation {args}", result["code"] != 0 and "engine ready" not in result["stderr"], result)

    # This reads pinned headers and prices a plan; it must never construct an
    # Engine or turn a predicted fit into qualification evidence.
    result = run(binary, ["context-check", "--tokens", "4096", "--reply-tokens", "16",
                          "--memory-gb", "8.1", "--mtp", "off", "--vision", "off", "--plan-only"])
    evidence.append(result)
    try:
        planned = json.loads(result["stdout"])
    except ValueError:
        planned = {}
    expect("plan-only does not allocate or qualify an Engine", result["code"] == 0
           and planned.get("kind") == "unqualified-context-plan" and planned.get("qualified") is False
           and "fits" not in planned and "engine ready" not in result["stderr"], result)
    expect("plan-only binds configured context and exact runtime controls",
           planned.get("plan", {}).get("max_context_tokens") == 4112
           and bool(planned.get("optimizations")) and bool(planned.get("model_revision")), planned)

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
