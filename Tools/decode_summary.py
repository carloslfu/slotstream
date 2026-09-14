#!/usr/bin/env python3
"""Per-item gains across the decode sweeps, with the counters that moved.

Reads each sweep's cells.jsonl for timing and the retained per-arm result JSONs
for the full engine counters (including the expert-prefetch observation, which
carries layer-completeness). Reports each configuration against its sweep's
reference, so a gain is always relative to a stated baseline.
"""
import argparse
import json
import statistics
from pathlib import Path


def arm_counters(cell_row, sweep_dir):
    """Full engine stats for one cell, from the retained arm JSON."""
    rid, rnd, cfg = cell_row["request_id"], cell_row["round"], cell_row["config"]
    p = Path(sweep_dir) / "arms" / f"{rid}-r{rnd}-{cfg}.json"
    if not p.exists():
        return {}
    try:
        return json.loads(p.read_text()).get("measured", {}).get("stats", {})
    except Exception:
        return {}


def summarize(sweep_dir, reference=None):
    sweep_dir = Path(sweep_dir)
    cells_path = sweep_dir / "cells.jsonl"
    if not cells_path.exists():
        return None
    rows = [json.loads(l) for l in open(cells_path) if l.strip()]
    if not rows:
        return None
    report_path = sweep_dir / "report.json"
    if reference is None and report_path.exists():
        reference = json.loads(report_path.read_text()).get("reference")

    by_cfg = {}
    for r in rows:
        by_cfg.setdefault(r["config"], []).append(r)

    out = {}
    for cfg, rs in by_cfg.items():
        clean = [r for r in rs if r["clean"] and r["metrics"]]
        if not clean:
            out[cfg] = dict(clean=0, cells=len(rs))
            continue
        tps = sorted(r["metrics"]["tps"] for r in clean)
        stats = [arm_counters(r, sweep_dir) for r in clean]
        pf = [s.get("expertPrefetch") or {} for s in stats]

        def msum(key, src):
            vals = [s.get(key) for s in src if isinstance(s.get(key), (int, float))]
            return sum(vals) if vals else None

        def mmed(key, src):
            vals = sorted(s[key] for s in src if isinstance(s.get(key), (int, float)))
            return statistics.median(vals) if vals else None

        complete = msum("layersComplete", pf)
        withmiss = msum("layersWithMisses", pf)
        rec_reads = msum("recordReads", pf)
        piece_reads = msum("pieceModeReads", pf)
        adopted, issued = msum("adopted", pf), msum("issued", pf)
        out[cfg] = dict(
            clean=len(clean), cells=len(rs),
            median_tps=statistics.median(tps),
            spread=(tps[-1] - tps[0]) / statistics.median(tps) if statistics.median(tps) else None,
            median_records=mmed("decodeRecords", stats),
            median_read_bytes=mmed("decodeReadBytes", stats),
            median_hit_rate=mmed("expertHitRate", stats),
            tokens_per_pass=(msum("decodeTokens", stats) / msum("verifyPasses", stats)
                             if msum("verifyPasses", stats) else None),
            acceptance=(msum("acceptedDrafts", stats) / msum("draftedTokens", stats)
                        if msum("draftedTokens", stats) else None),
            layers_complete_frac=(complete / (complete + withmiss)
                                  if complete is not None and withmiss is not None
                                  and (complete + withmiss) else None),
            precision=(adopted / issued if adopted is not None and issued else None),
            record_reads=rec_reads, piece_reads=piece_reads,
            read_shape=(pf[0].get("readShape") if pf else None),
            exact=None,
        )

    # Exactness against the reference configuration, per request.
    ref_out = {}
    for r in by_cfg.get(reference, []):
        if r["clean"] and r["metrics"]:
            ref_out.setdefault(r["request_id"], r["metrics"]["output_ids"])
    for cfg, rs in by_cfg.items():
        bad = [r["request_id"] for r in rs if r["clean"] and r["metrics"]
               and r["request_id"] in ref_out
               and r["metrics"]["output_ids"] != ref_out[r["request_id"]]]
        if cfg in out and out[cfg].get("clean"):
            out[cfg]["exact"] = not bad
            out[cfg]["mismatched"] = sorted(set(bad))

    # Ratios are PAIRED: same request, same round, reference versus candidate,
    # then a geometric mean over pairs. A ratio of medians across requests is
    # wrong here, because the exploration prompts run at different intrinsic
    # speeds and the median then reports which request happened to be fast.
    tps_by = {}
    for r in rows:
        if r["clean"] and r["metrics"]:
            tps_by.setdefault(r["config"], {})[(r["request_id"], r["round"])] = r["metrics"]["tps"]
    base_cells = tps_by.get(reference, {})
    for cfg, s in out.items():
        pairs = [tps_by[cfg][k] / base_cells[k]
                 for k in base_cells if cfg in tps_by and k in tps_by[cfg]]
        if pairs:
            s["ratio"] = statistics.geometric_mean(pairs)
            s["pairs"] = len(pairs)
            s["ratio_min"], s["ratio_max"] = min(pairs), max(pairs)
            s["all_pairs_positive"] = min(pairs) > 1.0
        else:
            s["ratio"] = 1.0 if cfg == reference else None
            s["pairs"] = 0
    return dict(reference=reference, configs=out)


def render(name, res):
    if not res:
        print(f"\n### {name}: no cells yet")
        return
    cfgs, ref = res["configs"], res["reference"]
    print(f"\n### {name}   (reference: {ref})")
    order = sorted(cfgs, key=lambda c: -(cfgs[c].get("ratio") or 0))
    w = max(len(c) for c in cfgs)
    print(f"{'config'.ljust(w)} {'tps':>6} {'ratio':>6} {'clean':>6} {'records':>8} "
          f"{'GB read':>8} {'hit':>6} {'tok/pass':>8} {'accept':>7} {'layers':>7} {'exact':>6}")
    for c in order:
        s = cfgs[c]
        if not s.get("clean"):
            print(f"{c.ljust(w)} {'-':>6} {'-':>6} {0:>3}/{s['cells']:<2}  (no clean cells)")
            continue
        gb = (s["median_read_bytes"] or 0) / 1e9
        lc = s.get("layers_complete_frac")
        flag = "*" if s.get("all_pairs_positive") else " "
        print(f"{c.ljust(w)} {s['median_tps']:6.2f} {s['ratio'] or 0:6.3f}{flag}{s['clean']:>3}/{s['cells']:<2} "
              f"{s['median_records'] or 0:8.0f} {gb:8.2f} {s['median_hit_rate'] or 0:6.3f} "
              f"{s['tokens_per_pass'] or 0:8.2f} {s['acceptance'] or 0:7.3f} "
              f"{(f'{lc:.3f}' if lc is not None else '-'):>7} "
              f"{('yes' if s['exact'] else 'NO' if s['exact'] is False else '-'):>6}")
    bad = [c for c, s in cfgs.items() if s.get("exact") is False]
    if bad:
        print(f"  EXACTNESS FAILURES: {', '.join(bad)}")


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--root", default=".build/decode-cpu")
    ap.add_argument("--sweeps", default="sweep-read,sweep-barrier,sweep-depth,sweep-flags")
    args = ap.parse_args()
    root = Path(args.root)
    for name in args.sweeps.split(","):
        render(name, summarize(root / name))


if __name__ == "__main__":
    main()
