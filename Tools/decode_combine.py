#!/usr/bin/env python3
"""Pre-registered selection of the combined decode candidate.

Registered before rounds 3 to 5 produced results (round 2 was at 18 of 42 cells).
For each lever it reads the sweep, computes paired per-(request, round) ratios
against the sweep's reference and applies a fixed rule. A configuration
qualifies when its outputs are exact on every matched pair, it has at least
MIN_PAIRS pairs, its paired geometric mean is at least MIN_GAIN and at least
POSITIVE_SHARE of its pairs are above 1. The best qualifying configuration per
lever wins; within TIE of the best, the configuration listed earlier in the
sweep's config file (the simpler one) wins. Winners' environment overrides are
merged into one candidate. A key that two levers set differently is reported as
a conflict for the combination screen to resolve, never chosen silently.
"""
import argparse
import json
import math
import statistics
from pathlib import Path

MIN_PAIRS = 5
MIN_GAIN = 1.01
POSITIVE_SHARE = 0.8
TIE = 0.005

# Keys whose value equals the engine or protocol default describe the same base
# whether they are present or not (draft depth 2 is the protocol pin).
DEFAULTS = {"SLOTSTREAM_DRAFT_DEPTH": "2", "SLOTSTREAM_EXPERT_PREFETCH_READ": "piece",
            "SLOTSTREAM_DECODE_BARRIER_LAYERS": "1"}


def normalized(env):
    return {k: v for k, v in env.items() if DEFAULTS.get(k) != v}

CONFIGS = {
    "sweep-coverage": "configs-coverage.json", "sweep-combined": "configs-combined.json",
    "sweep-routing": "configs-routing.json",
    "sweep-depth2": "configs-depth2.json", "sweep-rw": "configs-rw.json",
    "sweep-barrier": "configs-barrier.json", "sweep-read": "configs-read.json",
    "sweep-flags": "configs-flags.json",
}
# Round 3b's routing-readback deferral replaced round 3's barrier-held forecasts
# in the binary, so the barrier lever comes from sweep-routing: a round 3 winner
# could no longer be built.
DEFAULT_LEVERS = "sweep-coverage:c10-s2,sweep-routing:k1-s2,sweep-depth2:d2-pf,sweep-rw:pf-base"


def lever_result(root, sweep, reference):
    cells_path, cfg_path = root / sweep / "cells.jsonl", root / CONFIGS[sweep]
    if not cells_path.exists():
        return dict(sweep=sweep, reference=reference, status="not run")
    configs = json.loads(cfg_path.read_text())
    order = [c["name"] for c in configs]
    env = {c["name"]: c["env"] for c in configs}
    proto = {c["name"]: c.get("protocol") for c in configs}
    cells = {}
    for line in open(cells_path):
        if not line.strip():
            continue
        r = json.loads(line)
        if r["clean"] and r["metrics"]:
            cells.setdefault(r["config"], {})[(r["request_id"], r["round"])] = r["metrics"]
    ref = cells.get(reference, {})
    evaluated = []
    for name in order:
        if name == reference or name not in cells:
            continue
        keys = [k for k in ref if k in cells[name]]
        if not keys:
            continue
        ratios = [cells[name][k]["tps"] / ref[k]["tps"] for k in keys]
        exact = all(cells[name][k]["output_ids"] == ref[k]["output_ids"] for k in keys)
        geo = statistics.geometric_mean(ratios)
        positive = sum(1 for x in ratios if x > 1.0)
        qualifies = (exact and len(ratios) >= MIN_PAIRS and geo >= MIN_GAIN
                     and positive >= math.ceil(POSITIVE_SHARE * len(ratios)))
        evaluated.append(dict(config=name, pairs=len(ratios), geo=round(geo, 4), positive=positive,
                              exact=exact, qualifies=qualifies))
    winner = None
    qualified = [e for e in evaluated if e["qualifies"]]
    if qualified:
        best = max(e["geo"] for e in qualified)
        winner = min((e for e in qualified if best - e["geo"] <= TIE), key=lambda e: order.index(e["config"]))["config"]
    ref_env = env.get(reference, {})
    overrides = {}
    if winner:
        overrides = {k: v for k, v in env[winner].items() if ref_env.get(k) != v}
        overrides.update({k: None for k in ref_env if k not in env[winner]})
    return dict(sweep=sweep, reference=reference, status="evaluated", configs=evaluated, winner=winner,
                overrides=overrides, protocol=proto.get(winner) if winner else None, reference_env=ref_env)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--root", default=".build/decode-cpu")
    ap.add_argument("--levers", default=DEFAULT_LEVERS, help="comma list of sweep:reference")
    ap.add_argument("--out", default=".build/decode-cpu/combination.json")
    args = ap.parse_args()
    root = Path(args.root)
    levers = [lever_result(root, *item.split(":")) for item in args.levers.split(",")]

    evaluated = [l for l in levers if l["status"] == "evaluated"]
    base, notes = {}, []
    for l in evaluated:
        for k, v in l["reference_env"].items():
            if k in base and base[k] != v:
                notes.append(f"reference environments disagree on {k}: {base[k]} vs {v} ({l['sweep']})")
            base.setdefault(k, v)
    # A reference missing keys the others set was measured under a different base
    # (for example prefetch off). Its winner cannot be merged on trust: it is
    # flagged and must be re-screened in the combination step.
    all_keys = set().union(*(set(normalized(l["reference_env"])) for l in evaluated)) if evaluated else set()
    for l in evaluated:
        missing = sorted(all_keys - set(normalized(l["reference_env"])))
        l["base_mismatch"] = bool(missing)
        if missing and l["winner"]:
            notes.append(f"{l['sweep']} reference lacks {len(missing)} keys other references set "
                         f"(e.g. {missing[:2]}); winner {l['winner']} was measured under a different base "
                         f"and needs a re-screen before it counts")
    combined, owner, conflicts = dict(base), {}, []
    protocol = None
    for l in evaluated:
        if l["protocol"]:
            protocol = l["protocol"]
        for k, v in l["overrides"].items():
            if k in owner and combined.get(k) != v:
                conflicts.append(dict(key=k, first=[owner[k], combined.get(k)], second=[l["sweep"], v]))
                continue
            owner[k] = l["sweep"]
            if v is None:
                combined.pop(k, None)
            else:
                combined[k] = v
    result = dict(schema="decode-combination-v1",
                  rule=dict(min_pairs=MIN_PAIRS, min_gain=MIN_GAIN, positive_share=POSITIVE_SHARE, tie=TIE),
                  levers=levers, combined_env=combined, combined_protocol=protocol,
                  conflicts=conflicts, notes=notes)
    Path(args.out).write_text(json.dumps(result, indent=1, sort_keys=True) + "\n")
    for l in levers:
        if l["status"] != "evaluated":
            print(f"{l['sweep']:16} {l['status']}")
            continue
        print(f"{l['sweep']:16} winner {l['winner']}  overrides {l['overrides']}")
        for e in l["configs"]:
            print(f"    {e['config']:14} geo {e['geo']:.4f}  pairs {e['pairs']}  positive {e['positive']}  "
                  f"exact {e['exact']}  {'QUALIFIES' if e['qualifies'] else ''}")
    print("combined overrides by lever:", {k: owner[k] for k in owner})
    for c in conflicts:
        print("CONFLICT:", c)
    for n in notes:
        print("note:", n)


if __name__ == "__main__":
    main()
