"""Plan the real and simulated Mac tiers with two binaries, and regenerate the frozen fixtures.

Usage: python3 pr145_tiers.py <main binary> <pr binary> <src tree> <out dir>
"""
import json, subprocess, sys
from pathlib import Path

main_bin, pr_bin, src, out = sys.argv[1], sys.argv[2], Path(sys.argv[3]), Path(sys.argv[4])
out.mkdir(parents=True, exist_ok=True)
head = out / "mtpdir"
head.mkdir(exist_ok=True)
(head / "mtp.safetensors").touch()
real = {16: ["17.2", "11.8", "12.5"], 24: ["25.8", "18", "21"], 32: ["34.4", "25.8", "29"], 48: ["51.5", "40.2", "44"]}

def doctor(binary, args):
    r = subprocess.run([binary, "doctor", *args, "--json"], capture_output=True, text=True)
    return json.loads(r.stdout)

rows = []
for build, binary in (("main", main_bin), ("pr", pr_bin)):
    for tier, (ram, ws, avail) in real.items():
        for kind, mach in (("real", ["--sim-ram", ram, "--sim-working-set", ws, "--sim-available", avail]),
                           ("simulated", ["--sim-ram", str(tier)])):
            for head_mode, model in (("head", ["--model", str(head)]),
                                     ("off", ["--model", "/nonexistent/context-gate-no-model", "--mtp", "off", "--vision", "off"])):
                d = doctor(binary, [*model, *mach])
                cands = d.get("automatic_context_window", {}).get("candidates", [])
                rows.append(dict(build=build, tier=tier, machine=kind, args=mach, draft_head=head_mode,
                    window=d.get("max_context_tokens"), source=d.get("context_window_source"),
                    experts_per_layer=d.get("experts_per_layer_cached"), target_gb=d.get("target_gb"),
                    mtp=d.get("mtp"), mtp_streamed=d.get("mtp_streamed_experts"),
                    candidates=[(c.get("window"), c.get("accepted"), c.get("reason"),
                                 (c.get("plan") or {}).get("experts_per_layer_cached")) for c in cands]))
(out / "tiers.json").write_text(json.dumps(rows, indent=1) + "\n")

v3 = json.loads((src / "Tools/fixtures/context-default-v3.json").read_text())
fields = v3["projection_fields"]
for tier in v3["tiers"]:
    d = json.loads(subprocess.run([pr_bin, *tier["args"]], capture_output=True, text=True).stdout)
    tier["expected"] = {k: d[k] for k in fields if k in d}
(out / "default-expected.json").write_text(json.dumps(v3["tiers"], indent=2) + "\n")
a2 = json.loads((src / "Tools/fixtures/context-automatic-v2.json").read_text())
auto = []
for tier in a2["tiers"]:
    d = json.loads(subprocess.run([pr_bin, *tier["args"]], capture_output=True, text=True).stdout)
    auto.append(dict(tier=tier["tier"], old=tier["expected_window"], new=d["max_context_tokens"],
                     prefix_cache_max_tokens=d["prefix_cache_max_tokens"]))
(out / "automatic-expected.json").write_text(json.dumps(auto, indent=1) + "\n")
print("TIERS_DONE", flush=True)
