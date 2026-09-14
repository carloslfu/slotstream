#!/usr/bin/env python3
"""Paired held-out cohort with per-arm protocols.

Same schedule, eligibility rule, report and gate as `expert_lookahead.py bench`,
with one difference: an arm may name its own protocol. A lever that changes a
pinned value (draft depth is pinned, and the engine refuses a process whose
environment disagrees with its protocol) can then be compared with the shipped
path inside one cohort. Gates, the eligibility rule and the report always come
from the base protocol, and a variant protocol may differ from the base only in
its pinned draft depth; anything else is refused before an arm runs.
"""
import argparse
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import expert_lookahead as xla  # noqa: E402
from expert_lookahead_bench import pair_eligible, report, rule_of, run_arm  # noqa: E402

DEPTH_KEY = "SLOTSTREAM_DRAFT_DEPTH"


def arm_protocol(base, arm):
    """The protocol an arm runs under, checked against the base."""
    if not arm.get("protocol"):
        return base
    variant = xla.read_json(arm["protocol"])
    variant["_path"] = arm["protocol"]
    top = sorted(k for k in set(variant) | set(base)
                 if k not in ("draft_depth", "env", "_path") and variant.get(k) != base.get(k))
    env = sorted(k for k in set(variant["env"]) | set(base["env"])
                 if k != DEPTH_KEY and variant["env"].get(k) != base["env"].get(k))
    if top or env:
        raise SystemExit(f"arm {arm['name']}: protocol differs from the base beyond draft depth: "
                         f"fields {top}, env {env}")
    return variant


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--protocol", required=True, help="base protocol: gates, eligibility rule, report")
    ap.add_argument("--plan", required=True, help="two arms {name, env, protocol?}, prompts, rounds")
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    base = xla.read_json(args.protocol)
    base["_path"] = args.protocol
    plan = xla.read_json(args.plan)
    out = Path(args.out)
    (out / "arms").mkdir(parents=True, exist_ok=True)
    arms = plan["arms"]
    assert len(arms) == 2, "a comparison has exactly two arms"
    protos = [arm_protocol(base, a) for a in arms]
    for a, p in zip(arms, protos):
        xla.log(f"arm {a['name']}: protocol {p['_path']} (draft depth {p.get('draft_depth')})")

    manifest = xla.corpus_manifest()
    prompts = plan["prompts"]
    rounds = plan["rounds"]
    warmup = plan.get("warmup_tokens", base["b0_warmup_tokens"])
    max_tokens = plan.get("max_tokens", base["b0_max_tokens"])
    needed_gb = max(a.get("memory_gb", base["memory_gb"]) for a in arms) + xla.PREFLIGHT_MARGIN_GB
    rule, threshold = rule_of(base)

    pairs_path = out / "pairs.jsonl"
    done = set()
    if pairs_path.exists():
        for line in open(pairs_path):
            if line.strip():
                p = json.loads(line)
                done.add((p["request_id"], p["round"]))

    families = list(prompts)
    schedule = []
    for rnd in range(rounds):
        rotated = families[rnd % len(families):] + families[:rnd % len(families)]
        for fi, family in enumerate(rotated):
            for pi, rid in enumerate(prompts[family]):
                schedule.append((rnd, family, rid, (rnd + fi + pi) % 2))
    xla.log(f"{len(schedule)} pairs scheduled, {len(done)} already done")

    for rnd, family, rid, first in schedule:
        if (rid, rnd) in done:
            continue
        payload = xla.request_payload(manifest, [rid])[0]
        request_path = out / "arms" / f"{rid}.json"
        xla.write_json(request_path, payload)
        results = []
        for idx in (first, 1 - first):
            arm = arms[idx]
            out_path = out / "arms" / f"{rid}-r{rnd}-{arm['name']}.json"
            results.append(run_arm(protos[idx], arm, request_path, out_path, warmup, max_tokens,
                                   needed_gb, out / "arms"))
        by_name = {r["arm"]: r for r in results}
        a, b = by_name[arms[0]["name"]], by_name[arms[1]["name"]]
        eligible, reasons, verdicts = pair_eligible(a, b, rule, threshold)
        row = dict(request_id=rid, family=family, kind=payload["kind"], round=rnd,
                   order=[arms[first]["name"], arms[1 - first]["name"]],
                   eligible=eligible, reasons=reasons, rule=rule,
                   verdicts={k: dict(eligible=v[0], reasons=v[1]) for k, v in verdicts.items()}, arms={},
                   protocols={arm["name"]: p["_path"] for arm, p in zip(arms, protos)})
        for r in results:
            entry = dict(exit=r["exit"], seconds=r["seconds"], swap_delta=r["swap_delta"],
                         thermal_after=r["thermal_after"], readiness=r["readiness"], out=r["out"],
                         pageins_delta=r.get("pageins_delta"))
            if "result" in r:
                m = r["result"]["measured"]["stats"]
                inter = sorted(m.get("interTokenSeconds", []))
                entry.update(dict(
                    decode_tokens=m["decodeTokens"], decode_seconds=m["decodeSeconds"],
                    tps=(m["decodeTokens"] / m["decodeSeconds"] if m["decodeSeconds"] else 0.0),
                    prefill_seconds=m["prefillSeconds"], request_seconds=m["requestSeconds"],
                    ttft=m.get("firstTokenSeconds"), finish=m["finishReason"],
                    p95_inter_token=(inter[int(0.95 * (len(inter) - 1))] if inter else None),
                    decode_records=m["decodeRecords"], decode_read_bytes=m["decodeReadBytes"],
                    hit_rate=m["expertHitRate"], accepted=m["acceptedDrafts"], drafted=m["draftedTokens"],
                    verify_passes=m["verifyPasses"], peak_gb=m["peakMemoryGB"],
                    prefetch=m.get("expertPrefetch"), pool_slots=r["result"]["pool_slots"],
                    output_count=len(r["result"]["measured"]["output_ids"]),
                    output_ids=r["result"]["measured"]["output_ids"]))
            row["arms"][r["arm"]] = entry
        # Greedy speculative decoding is exact at any draft depth, so the arms
        # must agree token for token; a mismatch is a correctness failure.
        ids = [row["arms"].get(arm["name"], {}).get("output_ids") for arm in arms]
        row["outputs_identical"] = (ids[0] is not None and ids[0] == ids[1])
        with open(pairs_path, "a") as f:
            f.write(json.dumps(row, sort_keys=True) + "\n")
        tps = {k: round(v.get("tps", 0), 2) for k, v in row["arms"].items()}
        xla.log(f"pair {rid} round {rnd} {family}: {tps} eligible={eligible} identical={row['outputs_identical']} {reasons}")

    rows = [json.loads(l) for l in open(pairs_path) if l.strip()]
    mismatched = [(r["request_id"], r["round"]) for r in rows if not r.get("outputs_identical")]
    if mismatched:
        xla.log(f"OUTPUT MISMATCH in {len(mismatched)} pairs: {mismatched[:6]}")
    report(args.protocol, out, arms, prompts)


if __name__ == "__main__":
    main()
