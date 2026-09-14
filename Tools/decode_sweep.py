#!/usr/bin/env python3
"""N-way exploration sweep over decode configurations.

Ranks configurations by measured decode throughput on the same requests, using
the bench's preflight, model lock, arm timeout and swap accounting. This is an
EXPLORATION instrument: it reports unpaired medians so several configurations
can be ranked in one pass. Anything that will be claimed is re-measured as a
paired arm under the frozen eligibility rule and the plan's gate.

Greedy speculative decoding is exact regardless of draft depth, so every
configuration's output ids must match the reference configuration's. A mismatch
is a correctness failure of that configuration, reported and never averaged.
"""
import argparse
import json
import statistics
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import expert_lookahead as xla  # noqa: E402
from expert_lookahead_bench import run_arm, rule_of, PAGEIN_RULE  # noqa: E402


def cell_metrics(record):
    if "result" not in record:
        return None
    m = record["result"]["measured"]["stats"]
    return dict(
        tps=(m["decodeTokens"] / m["decodeSeconds"]) if m["decodeSeconds"] else 0.0,
        decode_seconds=m["decodeSeconds"], decode_tokens=m["decodeTokens"],
        request_seconds=m["requestSeconds"], prefill_seconds=m["prefillSeconds"],
        ttft=m.get("firstTokenSeconds"),
        accepted=m["acceptedDrafts"], drafted=m["draftedTokens"], verify_passes=m["verifyPasses"],
        decode_records=m["decodeRecords"], decode_read_bytes=m["decodeReadBytes"],
        hit_rate=m["expertHitRate"], peak_gb=m["peakMemoryGB"],
        output_ids=record["result"]["measured"]["output_ids"],
    )


def clean(record, threshold):
    """A cell is clean when it completed, did not stall, saw no host swap-outs
    and stayed inside the process page-in threshold. Unclean cells are kept and
    reported, never averaged."""
    if record.get("stalled") or record.get("exit") != 0 or "result" not in record:
        return False, "did not complete"
    if record["swap_delta"]["swapouts"] != 0:
        return False, "host swap-outs during the arm"
    pageins = record.get("pageins_delta")
    if pageins is not None and pageins > threshold:
        return False, f"engine page-ins {pageins} over {threshold}"
    if not record.get("thermal_after", True):
        return False, "thermal not nominal after"
    return True, ""


def main():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--protocol", required=True)
    p.add_argument("--out", required=True)
    p.add_argument("--configs", required=True, help="JSON list of {name, env, memory_gb?}")
    p.add_argument("--requests", required=True, help="comma-separated request ids")
    p.add_argument("--rounds", type=int, default=2)
    p.add_argument("--max-tokens", type=int, default=256)
    p.add_argument("--warmup-tokens", type=int, default=128)
    p.add_argument("--reference", default=None,
                   help="config name whose outputs define exactness (default: first)")
    args = p.parse_args()

    proto = xla.read_json(args.protocol)
    proto["_path"] = args.protocol
    configs = xla.read_json(args.configs)
    assert configs, "at least one configuration"
    reference = args.reference or configs[0]["name"]
    out = Path(args.out)
    (out / "arms").mkdir(parents=True, exist_ok=True)
    manifest = xla.corpus_manifest()
    ids = [r.strip() for r in args.requests.split(",") if r.strip()]
    needed_gb = max(c.get("memory_gb", proto["memory_gb"]) for c in configs) + xla.PREFLIGHT_MARGIN_GB
    rule, threshold = rule_of(proto)

    cells_path = out / "cells.jsonl"
    done = set()
    if cells_path.exists():
        for line in open(cells_path):
            if line.strip():
                c = json.loads(line)
                done.add((c["request_id"], c["round"], c["config"]))

    schedule = []
    for rnd in range(args.rounds):
        for ri, rid in enumerate(ids):
            # Rotate configuration order every cell so slow drift cannot favour
            # whichever configuration would otherwise always run first.
            shift = (rnd + ri) % len(configs)
            schedule.append((rnd, rid, configs[shift:] + configs[:shift]))

    total = sum(len(c) for _, _, c in schedule)
    xla.log(f"{total} cells scheduled ({len(configs)} configs x {len(ids)} requests x {args.rounds} rounds), "
            f"{len(done)} already done")

    for rnd, rid, order in schedule:
        payload = xla.request_payload(manifest, [rid])[0]
        request_path = out / "arms" / f"{rid}.json"
        xla.write_json(request_path, payload)
        for cfg in order:
            if (rid, rnd, cfg["name"]) in done:
                continue
            out_path = out / "arms" / f"{rid}-r{rnd}-{cfg['name']}.json"
            # A configuration may name its own protocol when it changes a value
            # the protocol pins (draft depth is pinned, and the engine refuses a
            # process whose env disagrees with it).
            cfg_proto = proto
            if cfg.get("protocol"):
                cfg_proto = xla.read_json(cfg["protocol"])
                cfg_proto["_path"] = cfg["protocol"]
            rec = run_arm(cfg_proto, cfg, request_path, out_path, args.warmup_tokens,
                          args.max_tokens, needed_gb, out / "arms")
            ok, why = clean(rec, threshold)
            metrics = cell_metrics(rec)
            row = dict(request_id=rid, round=rnd, config=cfg["name"], kind=payload["kind"],
                       clean=ok, reason=why, rule=rule, stalled=rec.get("stalled", False),
                       exit=rec["exit"], seconds=rec["seconds"], swap_delta=rec["swap_delta"],
                       pageins_delta=rec.get("pageins_delta"), metrics=metrics)
            with open(cells_path, "a") as f:
                f.write(json.dumps(row, sort_keys=True) + "\n")
            tps = round(metrics["tps"], 2) if metrics else None
            xla.log(f"{rid} r{rnd} {cfg['name']}: tps={tps} clean={ok} {why}")

    report(cells_path, configs, reference, out)


def report(cells_path, configs, reference, out):
    rows = [json.loads(l) for l in open(cells_path) if l.strip()]
    by_cfg = {}
    for r in rows:
        by_cfg.setdefault(r["config"], []).append(r)

    # Exactness: every configuration must reproduce the reference outputs on the
    # same request. Greedy speculative decoding is exact at any draft depth, so a
    # mismatch is a real defect, not a tolerance question.
    ref_outputs = {}
    for r in by_cfg.get(reference, []):
        if r["clean"] and r["metrics"]:
            ref_outputs.setdefault(r["request_id"], r["metrics"]["output_ids"])

    summary = {}
    for name, rs in by_cfg.items():
        cleans = [r for r in rs if r["clean"] and r["metrics"]]
        mismatches = [r["request_id"] for r in cleans
                      if r["request_id"] in ref_outputs
                      and r["metrics"]["output_ids"] != ref_outputs[r["request_id"]]]
        tps = sorted(r["metrics"]["tps"] for r in cleans)
        def med(key):
            vals = sorted(r["metrics"][key] for r in cleans if r["metrics"].get(key) is not None)
            return statistics.median(vals) if vals else None
        drafted = sum(r["metrics"]["drafted"] for r in cleans)
        accepted = sum(r["metrics"]["accepted"] for r in cleans)
        tokens = sum(r["metrics"]["decode_tokens"] for r in cleans)
        passes = sum(r["metrics"]["verify_passes"] for r in cleans)
        summary[name] = dict(
            cells=len(rs), clean=len(cleans), excluded=len(rs) - len(cleans),
            exact=not mismatches, mismatched_requests=sorted(set(mismatches)),
            median_tps=(statistics.median(tps) if tps else None),
            min_tps=(tps[0] if tps else None), max_tps=(tps[-1] if tps else None),
            median_decode_seconds=med("decode_seconds"),
            median_records=med("decode_records"), median_read_bytes=med("decode_read_bytes"),
            median_hit_rate=med("hit_rate"), median_ttft=med("ttft"),
            acceptance=(accepted / drafted if drafted else None),
            tokens_per_verify_pass=(tokens / passes if passes else None),
        )

    # Paired ratios: same request, same round. A ratio of medians across requests
    # of different intrinsic speed reports the prompt mix, not the change.
    tps_by = {}
    for r in rows:
        if r["clean"] and r["metrics"]:
            tps_by.setdefault(r["config"], {})[(r["request_id"], r["round"])] = r["metrics"]["tps"]
    base_cells = tps_by.get(reference, {})
    for name, s in summary.items():
        pairs = [tps_by[name][k] / base_cells[k]
                 for k in base_cells if name in tps_by and k in tps_by[name]]
        if pairs:
            s["ratio_to_reference"] = statistics.geometric_mean(pairs)
            s["paired_n"] = len(pairs)
            s["all_pairs_positive"] = min(pairs) > 1.0
        else:
            s["ratio_to_reference"] = 1.0 if name == reference else None

    result = dict(schema="decode-sweep-v1", reference=reference,
                  configs=[c["name"] for c in configs], summary=summary)
    xla.write_json(out / "report.json", result)

    order = sorted(summary, key=lambda n: -(summary[n]["ratio_to_reference"] or 0))
    width = max(len(n) for n in summary)
    print(f"\nreference: {reference}\n")
    print(f"{'config'.ljust(width)}  {'tps':>7} {'ratio':>7} {'clean':>6} {'accept':>7} {'tok/pass':>8} "
          f"{'records':>9} {'exact':>6}")
    for name in order:
        s = summary[name]
        print(f"{name.ljust(width)}  {s['median_tps'] or 0:7.2f} {s['ratio_to_reference'] or 0:7.3f} "
              f"{s['clean']:>3}/{s['cells']:<2} {s['acceptance'] or 0:7.3f} {s['tokens_per_verify_pass'] or 0:8.2f} "
              f"{s['median_records'] or 0:9.0f} {'yes' if s['exact'] else 'NO':>6}")
    bad = [n for n, s in summary.items() if not s["exact"]]
    if bad:
        print(f"\nEXACTNESS FAILURES (not a tolerance question): {', '.join(bad)}")


if __name__ == "__main__":
    main()
