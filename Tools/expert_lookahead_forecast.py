#!/usr/bin/env python3
"""Expert Lookahead 2: forecast audit (W2), router-prefetch twin calibration (W3) and the token memo probe.

Registered into Tools/expert_lookahead_probes.py as `forecast-audit`, `prefetch-calibration` and `memo`.
All three read shards and write one JSON report; none runs the engine.

  forecast-audit        native router-reuse forecasts (record kind 10) against true routes, misses and
                        residency: agreement, recall, miss coverage, non-resident precision, lead; the C12
                        self-check (stride 0) and the optional offline recomputation from captured inputs
  prefetch-calibration  the bounded twin fed by native (or offline x2) forecasts: per-row candidates,
                        margin threshold, per-target issue cap, strides and global cap, exact pass-start
                        residency, late-correct tickets separate from wasted ones, read-cost projection,
                        service-time and advanced-deadline sensitivities, optional token memo
  memo                  offline early-layer token memo: coverage, precision and amplification per layer
"""
import json
import multiprocessing as mp
import time
from collections import defaultdict
from pathlib import Path

import numpy as np

import expert_lookahead as xla
import expert_lookahead_train as xt

LAYERS, EXPERTS, TOPK, HIDDEN = xt.LAYERS, xt.EXPERTS, xt.TOPK, xt.HIDDEN


def log(msg):
    print(f"[{time.strftime('%H:%M:%S')}] {msg}", flush=True)


# ---------------------------------------------------------------- loading

def load_request(run_dir, row, want_inputs=False, want_x2=False):
    """Per request: passes (phase, tokens, begin, end, routes, layer nanos, demand events, forecasts),
    the residency snapshot and the decode demand events after it."""
    passes, demand, residency = {}, [], None
    for shard in row["capture"]["shards"]:
        path = Path(run_dir) / "shards" / shard["path"]
        for kind, payload in xla.iter_records(path):
            if kind == 0 or kind in (2, 6, 8):
                continue
            rec = xla.parse_record(kind, payload)
            if kind == 1:
                passes[rec["pass_id"]] = dict(pass_id=rec["pass_id"], phase=rec["phase"], tokens=rec["tokens"].tolist(),
                                              begin=rec["nanos"], end=None, routes={}, layer_nanos=[0] * LAYERS,
                                              demand={}, forecasts={}, x2={}, shard=str(path))
            elif kind == 3:
                passes[rec["pass_id"]]["routes"][rec["layer"]] = rec["ids"].reshape(rec["rows"], rec["topk"])
            elif kind == 4:
                p = passes[rec["pass_id"]]
                p["layer_nanos"][rec["layer"]] = rec["nanos"]
                if want_x2 and rec["width"]:
                    p["x2"][rec["layer"]] = xt.bf16_to_f32(np.array(rec["x2"])).reshape(rec["rows"], rec["width"])
            elif kind == 5:
                demand.append(rec)
                if rec["pass_id"] in passes:
                    passes[rec["pass_id"]]["demand"][rec["layer"]] = rec
            elif kind == 7:
                residency = rec
            elif kind == 9:
                passes[rec["pass_id"]]["end"] = rec["nanos"]
            elif kind == 10:
                p = passes.get(rec["pass_id"])
                if p is None:
                    continue
                entry = dict(ids=np.array(rec["ids"]), margins=np.array(rec["margins"]), rows=rec["rows"], per_row=rec["per_row"])
                if want_inputs and rec["inputs"] is not None:
                    entry["inputs"] = xt.bf16_to_f32(np.array(rec["inputs"]))
                p["forecasts"][(rec["source"], rec["target"])] = entry
    if residency is None:
        return None
    after = residency["after"]
    if after < 0:
        prefill = [pid for pid, p in passes.items() if p["phase"] == 0]
        after = max(prefill) if prefill else -1
    events = sorted([e for e in demand if e["pass_id"] > after], key=lambda e: (e["pass_id"], e["layer"]))
    return dict(id=row["id"], passes=passes, residency=residency, events=events, stats=row["stats"])


def resident_at_pass_start(req):
    """Exact CLOCK residency (set of layer*512+expert) at the start of every decode pass."""
    res = req["residency"]
    pool = xt.ClockPool(res["keys"], res["bits"], res["hand"])
    out = {}
    current = None
    for e in req["events"]:
        if e["pass_id"] != current:
            current = e["pass_id"]
            out[current] = set(k for k in pool.keys if k >= 0)
        pool.ensure([int(e["layer"]) * EXPERTS + int(x) for x in e["unique"]])
    return out


def complete_verify_passes(req):
    for pid in sorted(req["passes"]):
        p = req["passes"][pid]
        if p["phase"] != 1 or len(p["routes"]) != LAYERS or len(p["demand"]) < LAYERS or p["end"] is None:
            continue
        yield p


def timeline(p):
    starts = [p["demand"][l]["start"] if l in p["demand"] else 0 for l in range(LAYERS)]
    for l in range(LAYERS):
        if starts[l] == 0:
            starts[l] = p["layer_nanos"][l - 1] if l else p["begin"]
    return dict(begin=p["begin"], layer_nanos=p["layer_nanos"], demand_start=starts)


def miss_sets(p):
    return [set(int(x) for x in p["demand"][l]["miss"]) for l in range(LAYERS)]


def hit_sets(p):
    return [set(int(x) for x in p["demand"][l]["hit"]) for l in range(LAYERS)]


# ---------------------------------------------------------------- forecast audit (W2)

def cmd_forecast_audit(args):
    run_dir = Path(args.run)
    rows = [r for r in xla.load_requests_jsonl(run_dir) if r.get("complete")]
    if args.ids:
        keep = set(args.ids.split(","))
        rows = [r for r in rows if r["id"] in keep]
    gates = None
    agree = defaultdict(lambda: np.zeros(LAYERS)); agree_n = defaultdict(lambda: np.zeros(LAYERS))
    exact = defaultdict(int); exact_n = defaultdict(int)
    recall16 = defaultdict(float); recall16_n = defaultdict(int)
    cover = defaultdict(lambda: np.zeros(LAYERS)); miss_by_layer = np.zeros(LAYERS)
    issued_nonres = defaultdict(lambda: np.zeros(LAYERS)); useful_nonres = defaultdict(lambda: np.zeros(LAYERS))
    lead = defaultdict(list)
    recomputed = dict(rows=0, exact_sets=0, mismatched_rows=0, max_boundary_gap=0.0, near_tie_rows=0)
    per_request = []
    passes_used = total_misses = 0
    strides_seen = set()
    for row in rows:
        req = load_request(run_dir, row, want_inputs=True)
        if req is None:
            continue
        rq = dict(id=row["id"], passes=0, forecasts=0, stats=dict(decode_seconds=row["stats"]["decodeSeconds"],
                  forecast_seconds=(row["stats"].get("expertPrefetch") or {}).get("forecastSeconds"),
                  schedule_seconds=(row["stats"].get("expertPrefetch") or {}).get("scheduleSeconds")))
        for p in complete_verify_passes(req):
            if not p["forecasts"]:
                continue
            passes_used += 1; rq["passes"] += 1
            misses, hits = miss_sets(p), hit_sets(p)
            tl = timeline(p)
            for l in range(LAYERS):
                total_misses += len(misses[l]); miss_by_layer[l] += len(misses[l])
            for (src, tgt), f in p["forecasts"].items():
                s = tgt - src
                strides_seen.add(s)
                rq["forecasts"] += 1
                routes = p["routes"][tgt]
                r = min(f["rows"], routes.shape[0])
                ids = f["ids"][:r]
                for i in range(r):
                    top10 = set(ids[i][:TOPK].tolist()); real = set(routes[i].tolist())
                    agree[s][tgt] += len(top10 & real) / TOPK; agree_n[s][tgt] += 1
                    exact_n[s] += 1; exact[s] += (top10 == real)
                    if f["per_row"] >= 16:
                        recall16[s] += len(set(ids[i][:16].tolist()) & real) / TOPK; recall16_n[s] += 1
                if s == 0:
                    if "inputs" in f:
                        if gates is None:
                            from expert_lookahead_probes import load_gates
                            gates = load_gates(args.model)
                        logits = f["inputs"][:r] @ gates[tgt].T
                        for i in range(r):
                            order = np.argsort(-logits[i], kind="stable")
                            recomputed["rows"] += 1
                            mine = set(order[:f["per_row"]].tolist()); theirs = set(ids[i].tolist())
                            if mine == theirs:
                                recomputed["exact_sets"] += 1
                            else:
                                recomputed["mismatched_rows"] += 1
                                gap = float(logits[i][order[f["per_row"] - 1]] - logits[i][order[f["per_row"]]]) if f["per_row"] < EXPERTS else 0.0
                                recomputed["max_boundary_gap"] = max(recomputed["max_boundary_gap"], gap)
                                if gap < 1e-2:
                                    recomputed["near_tie_rows"] += 1
                    continue
                union10 = set(ids[:, :TOPK].reshape(-1).tolist())
                cover[s][tgt] += len(union10 & misses[tgt])
                nonres = union10 - hits[tgt]
                issued_nonres[s][tgt] += len(nonres); useful_nonres[s][tgt] += len(nonres & misses[tgt])
                lead[s].append((tl["demand_start"][tgt] - p["layer_nanos"][src]) / 1e6)
        per_request.append(rq)
        log(f"{row['id']}: {rq['passes']} passes, {rq['forecasts']} forecasts")
    groups = list(range(0, LAYERS, 8))

    def by_group(vec, denom):
        return {f"{g}-{g+7}": float(vec[g:g + 8].sum() / max(denom[g:g + 8].sum(), 1e-9)) for g in groups}

    strides = sorted(strides_seen)
    report = dict(schema="expert-lookahead-forecast-audit-v1", run=str(run_dir), requests=[r["id"] for r in per_request],
                  passes=passes_used, misses=total_misses, strides=strides,
                  top10_agreement_by_stride={str(s): float(agree[s].sum() / max(agree_n[s].sum(), 1)) for s in strides},
                  exact_top10_by_stride={str(s): (exact[s] / exact_n[s] if exact_n[s] else None) for s in strides},
                  exact_rows_by_stride={str(s): dict(exact=exact[s], rows=exact_n[s]) for s in strides},
                  recall16_by_stride={str(s): (recall16[s] / recall16_n[s] if recall16_n[s] else None) for s in strides},
                  miss_coverage_top10_by_stride={str(s): float(cover[s].sum() / max(total_misses, 1)) for s in strides if s > 0},
                  nonresident_precision_top10_by_stride={str(s): float(useful_nonres[s].sum() / max(issued_nonres[s].sum(), 1)) for s in strides if s > 0},
                  lead_ms_by_stride={str(s): dict(median=float(np.median(v)), p10=float(np.percentile(v, 10))) for s, v in lead.items() if v},
                  by_layer_group={str(s): dict(agreement=by_group(agree[s], agree_n[s]),
                                               miss_coverage_top10=by_group(cover[s], miss_by_layer),
                                               nonresident_precision_top10=by_group(useful_nonres[s], issued_nonres[s])) for s in strides},
                  c12_selfcheck=dict(rows=exact_n.get(0, 0), exact=exact.get(0, 0),
                                     fraction=(exact[0] / exact_n[0]) if exact_n.get(0) else None),
                  c12_offline_recomputation=recomputed, per_request=per_request)
    xla.write_json(Path(args.out), report)
    print(json.dumps({k: v for k, v in report.items() if k not in ("per_request", "by_layer_group", "requests")}, indent=1))


# ---------------------------------------------------------------- twin (W3)

class RouterTwin:
    """Offline twin of the router-policy scheduler on one recorded pass.

    Candidates for target T arrive at the completed-layer tick of source T - s (recorded layer nanos),
    ranked per row; those with margin at or above the threshold are merged in rank order across rows,
    deduplicated against pass-start residency and live or issued tickets, and issued up to the
    per-target cap while the global record cap has room. Reads run on `lanes` lanes at `service_ns`
    each. A ticket is timely when complete before its layer's demand start and its key is demanded,
    late-correct when demanded but incomplete at demand start (the native runtime promotes and joins
    it), and wasted otherwise. Bytes stay charged until the target layer completes. Memo candidates,
    when given, issue at pass begin in layer order under their own share of the cap.
    """

    def __init__(self, cap, lanes, service_ns, issue_cap, strides, per_row, threshold, cost, memo_cap=0):
        self.cap, self.lanes, self.service_ns, self.issue_cap = cap, lanes, service_ns, issue_cap
        self.strides, self.per_row, self.threshold, self.cost, self.memo_cap = strides, per_row, threshold, cost, memo_cap

    def candidates(self, forecast):
        ids, margins = forecast["ids"][:, :self.per_row], forecast["margins"][:, :self.per_row]
        out, seen = [], set()
        rows, c = ids.shape
        for rank in range(c):
            for i in range(rows):
                if margins[i, rank] >= self.threshold:
                    e = int(ids[i, rank])
                    if e not in seen:
                        seen.add(e); out.append(e)
        return out

    def run(self, forecasts, tl, resident, misses, memo_candidates=None, advance=False, service_factor=1.0):
        fixed_ms, marginal_ms = self.cost
        service = self.service_ns * service_factor
        lane_free = [tl["begin"]] * self.lanes
        live = []   # [target, key, done]
        issued_keys = set()
        issued_per_target = [0] * LAYERS
        timely = np.zeros(LAYERS, int); late = np.zeros(LAYERS, int); wasted = np.zeros(LAYERS, int); issued = np.zeros(LAYERS, int)
        late_credit_ms = 0.0
        saved_ms = 0.0; saved_fixed_ms = 0.0
        shift = 0

        def issue(target, keys, now, cap_limit):
            nonlocal live
            for e in keys:
                key = target * EXPERTS + e
                if key in resident or key in issued_keys:
                    continue
                if issued_per_target[target] >= self.issue_cap:
                    return
                if len(live) >= cap_limit:
                    return
                lane = int(np.argmin(lane_free))
                start = max(lane_free[lane], now)
                done = start + service
                lane_free[lane] = done
                live.append([target, key, done])
                issued_keys.add(key)
                issued_per_target[target] += 1
                issued[target] += 1

        if memo_candidates:
            for target in sorted(memo_candidates):
                issue(target, memo_candidates[target], tl["begin"], min(self.cap, self.memo_cap))
        for l in range(LAYERS):
            deadline = tl["demand_start"][l] - shift
            n_miss = len(misses[l])
            for target, key, done in live:
                if target != l:
                    continue
                e = key - l * EXPERTS
                if e in misses[l]:
                    if done <= deadline:
                        timely[l] += 1
                    else:
                        late[l] += 1
                        late_credit_ms += max(0.0, marginal_ms - (done - deadline) / 1e6)
                else:
                    wasted[l] += 1
            live = [x for x in live if x[0] > l]
            layer_saved = marginal_ms * timely[l]
            if n_miss and timely[l] == n_miss:
                saved_fixed_ms += fixed_ms
                layer_saved += fixed_ms
            saved_ms += marginal_ms * timely[l]
            if advance:
                shift += int(layer_saved * 1e6)
            now = tl["layer_nanos"][l] - shift
            for s in self.strides:
                t = l + s
                if t >= LAYERS:
                    continue
                f = forecasts.get((l, t))
                if f is None:
                    continue
                issue(t, self.candidates(f), now, self.cap)
        return dict(timely=int(timely.sum()), late=int(late.sum()), wasted=int(wasted.sum()), issued=int(issued.sum()),
                    saved_ms=saved_ms, saved_fixed_ms=saved_fixed_ms, late_credit_ms=late_credit_ms,
                    timely_by_layer=timely, misses=sum(len(m) for m in misses))


PASSES = []


def offline_forecasts(p, gates, strides, per_row):
    """Stand-in for native forecasts: layer T's router applied to the captured x2 of layer T - s."""
    out = {}
    for s in strides:
        for t in range(s, LAYERS):
            src = p["x2"].get(t - s)
            if src is None:
                continue
            logits = src @ gates[t].T
            order = np.argsort(-logits, axis=-1, kind="stable")[:, :per_row]
            tenth = np.take_along_axis(logits, order[:, TOPK - 1:TOPK] if per_row >= TOPK else order[:, -1:], axis=-1)
            vals = np.take_along_axis(logits, order, axis=-1)
            out[(t - s, t)] = dict(ids=order.astype(np.int64), margins=(vals - tenth).astype(np.float32), rows=logits.shape[0], per_row=per_row)
    return out


def twin_task(task):
    setting, service_factor, advance, memo_layers = task
    twin = RouterTwin(cap=setting["cap"], lanes=setting["lanes"], service_ns=setting["service_ns"], issue_cap=setting["issue_cap"],
                      strides=setting["strides"], per_row=setting["per_row"], threshold=setting["threshold"],
                      cost=(setting["fixed_ms"], setting["marginal_ms"]), memo_cap=setting["cap"] // 2)
    totals = defaultdict(float)
    decode_ns = 0
    for item in PASSES:
        memo = item["memo"] if memo_layers else None
        if memo is not None:
            memo = {l: c for l, c in memo.items() if l < memo_layers}
        r = twin.run(item["forecasts"], item["timeline"], item["resident"], item["misses"], memo_candidates=memo,
                     advance=advance, service_factor=service_factor)
        for k in ("timely", "late", "wasted", "issued", "saved_ms", "saved_fixed_ms", "late_credit_ms", "misses"):
            totals[k] += r[k]
        decode_ns += item["decode_ns"]
    m = totals["misses"] or 1
    decode_s = decode_ns / 1e9
    out = dict(totals)
    out.update(timely_coverage=totals["timely"] / m, late_correct_fraction=totals["late"] / m,
               precision=(totals["timely"] / totals["issued"] if totals["issued"] else 0.0),
               precision_with_late=((totals["timely"] + totals["late"]) / totals["issued"] if totals["issued"] else 0.0),
               traffic_amplification=(m + totals["wasted"]) / m,
               projected_ratio=decode_s / max(decode_s - totals["saved_ms"] / 1000, 1e-9),
               projected_ratio_with_fixed=decode_s / max(decode_s - (totals["saved_ms"] + totals["saved_fixed_ms"]) / 1000, 1e-9),
               projected_ratio_with_late_credit=decode_s / max(decode_s - (totals["saved_ms"] + totals["late_credit_ms"]) / 1000, 1e-9),
               decode_seconds=decode_s)
    return (json.dumps(setting, sort_keys=True), service_factor, advance, memo_layers), out


def build_memo_candidates(req, memo_layers):
    """Per verify pass: candidates per layer < memo_layers from the token memo built on earlier passes."""
    table = {}
    out = {}
    for p in complete_verify_passes(req):
        cands = {}
        for l in range(memo_layers):
            seen, ordered = set(), []
            for tok in p["tokens"]:
                for e in table.get(tok, {}).get(l, ()):
                    if e not in seen:
                        seen.add(e); ordered.append(e)
            if ordered:
                cands[l] = ordered
        out[p["pass_id"]] = cands
        for i, tok in enumerate(p["tokens"]):
            entry = table.setdefault(tok, {})
            for l in range(memo_layers):
                if p["routes"][l].shape[0] > i:
                    entry[l] = [int(x) for x in p["routes"][l][i]]
        if len(table) > 4096:
            for tok in list(table)[: len(table) - 4096]:
                del table[tok]
    return out


def transplant_forecasts(req, donor):
    """Join a donor capture's native forecasts onto this request's passes by verify-pass order.

    Both captures ran the same frozen request greedily, so their outputs, routing and pass structure
    are identical (the pool size never changes the math); the join is checked token by token."""
    mine = [p for p in sorted(req["passes"]) if req["passes"][p]["phase"] == 1]
    theirs = [p for p in sorted(donor["passes"]) if donor["passes"][p]["phase"] == 1]
    if len(mine) != len(theirs):
        raise SystemExit(f"{req['id']}: {len(mine)} verify passes here, {len(theirs)} in the donor capture")
    for a, b in zip(mine, theirs):
        pa, pb = req["passes"][a], donor["passes"][b]
        if pa["tokens"] != pb["tokens"]:
            raise SystemExit(f"{req['id']}: pass {a}/{b} tokens differ between captures")
        for l in range(LAYERS):
            if l in pa["routes"] and l in pb["routes"] and not np.array_equal(pa["routes"][l], pb["routes"][l]):
                raise SystemExit(f"{req['id']}: pass {a}/{b} layer {l} routes differ between captures")
        pa["forecasts"] = pb["forecasts"]
    return len(mine)


def cmd_prefetch_calibration(args):
    run_dir = Path(args.run)
    donor_rows = {}
    if args.forecast_run:
        donor_rows = {r["id"]: r for r in xla.load_requests_jsonl(args.forecast_run) if r.get("complete")}
    manifest = xla.corpus_manifest()
    split_of = {r["id"]: r["split"] for r in manifest["requests"]}
    rows = [r for r in xla.load_requests_jsonl(run_dir) if r.get("complete")]
    if args.ids:
        keep = set(args.ids.split(","))
        rows = [r for r in rows if r["id"] in keep]
    elif args.split:
        rows = [r for r in rows if split_of[r["id"]] == args.split]
    cost_report = xla.read_json(args.cost_model)
    cost = (float(cost_report["read_cost_model"]["intercept_ms"]), float(cost_report["read_cost_model"]["slope_ms_per_record"]))
    strides_all = [int(x) for x in args.strides.split(",")]
    per_row_max = args.per_row_max
    gates = None
    if args.source == "offline":
        from expert_lookahead_probes import load_gates
        gates = load_gates(args.model)
    service = []
    margins_all = []
    memo_layers_max = args.memo_layers_max
    joined_passes = 0
    for row in rows:
        req = load_request(run_dir, row, want_x2=(args.source == "offline"))
        if req is None:
            continue
        if args.forecast_run:
            if row["id"] not in donor_rows:
                log(f"{row['id']}: not in the forecast capture, skipped")
                continue
            donor = load_request(args.forecast_run, donor_rows[row["id"]])
            joined_passes += transplant_forecasts(req, donor)
        resident = resident_at_pass_start(req)
        memo = build_memo_candidates(req, memo_layers_max) if memo_layers_max else {}
        for e in req["events"]:
            n = len(e["miss"])
            if n and e["read"] > e["start"]:
                service.append((e["read"] - e["start"]) / n)
        for p in complete_verify_passes(req):
            forecasts = p["forecasts"] if args.source == "native" else offline_forecasts(p, gates, strides_all, per_row_max)
            forecasts = {k: v for k, v in forecasts.items() if k[1] > k[0]}
            if not forecasts or p["pass_id"] not in resident:
                continue
            for f in forecasts.values():
                margins_all.append(f["margins"][:, :TOPK].reshape(-1))
            PASSES.append(dict(forecasts=forecasts, timeline=timeline(p), resident=resident[p["pass_id"]], misses=miss_sets(p),
                               decode_ns=p["end"] - p["begin"], memo=memo.get(p["pass_id"], {})))
        log(f"{row['id']}: {len(PASSES)} passes so far")
    service_ns = float(np.median(service))
    margins_all = np.concatenate(margins_all) if margins_all else np.zeros(1)
    thresholds = {"none": -1e30}
    for q in (0.25, 0.5):
        thresholds[f"q{q:.2f}"] = float(np.quantile(margins_all, q))
    log(f"{len(PASSES)} passes, service {service_ns/1e6:.3f} ms/record, margin thresholds {thresholds}")
    per_rows = [c for c in (4, 6, 8, 10, 16) if c <= per_row_max]
    settings = []
    for strides in ([2], [1], [2, 1]):
        if any(s not in strides_all for s in strides):
            continue
        for c in per_rows:
            for tname, thr in thresholds.items():
                for issue_cap in (8, 16, 32):
                    for cap in (32, 16):
                        settings.append(dict(strides=strides, per_row=c, threshold=thr, threshold_name=tname, issue_cap=issue_cap,
                                             cap=cap, lanes=args.lanes, service_ns=service_ns, fixed_ms=cost[0], marginal_ms=cost[1]))
    tasks = [(s, 1.0, False, 0) for s in settings]
    with mp.get_context("fork").Pool(args.workers) as pool:
        results = dict(pool.imap_unordered(twin_task, tasks, chunksize=2))
    frontier = []
    for key, r in results.items():
        setting = json.loads(key[0])
        frontier.append(dict(setting={k: setting[k] for k in ("strides", "per_row", "threshold_name", "threshold", "issue_cap", "cap")}, **r))
    admissible = [f for f in frontier if f["traffic_amplification"] <= args.amplification_bound]
    best = max(admissible, key=lambda f: f["projected_ratio"]) if admissible else None
    chosen = None
    if best:
        # Smallest setting within 0.01 of the best: lower per-row candidates, then lower cap, then fewer strides.
        near = [f for f in admissible if f["projected_ratio"] >= best["projected_ratio"] - 0.01]
        chosen = min(near, key=lambda f: (f["setting"]["per_row"], f["setting"]["cap"], len(f["setting"]["strides"]), f["setting"]["issue_cap"]))
    sensitivities = {}
    if chosen:
        base = next(s for s in settings if all(s[k] == chosen["setting"][k] for k in ("strides", "per_row", "threshold", "issue_cap", "cap")))
        extra = [(base, 1.5, False, 0), (base, 2.0, False, 0), (base, 1.0, True, 0)]
        if memo_layers_max:
            extra += [(base, 1.0, False, memo_layers_max), (base, 1.0, True, memo_layers_max)]
        with mp.get_context("fork").Pool(min(args.workers, len(extra))) as pool:
            for key, r in pool.imap_unordered(twin_task, extra):
                sensitivities[f"service_x{key[1]}|advance={key[2]}|memo={key[3]}"] = r
        default_union = next((f for f in frontier if f["setting"]["strides"] == [2, 1] and f["setting"]["per_row"] == 10
                              and f["setting"]["threshold_name"] == "none" and f["setting"]["issue_cap"] == 32 and f["setting"]["cap"] == 32), None)
    else:
        default_union = None
    report = dict(schema="expert-lookahead-prefetch-calibration-v1", run=str(run_dir), source=args.source, requests=[r["id"] for r in rows],
                  forecast_run=args.forecast_run, joined_passes=joined_passes,
                  passes=len(PASSES), misses=int(sum(sum(len(m) for m in item["misses"]) for item in PASSES)),
                  decode_seconds=sum(item["decode_ns"] for item in PASSES) / 1e9, service_ms_per_record=service_ns / 1e6,
                  cost_model=dict(fixed_ms=cost[0], marginal_ms_per_record=cost[1]), thresholds=thresholds,
                  amplification_bound=args.amplification_bound, frontier=sorted(frontier, key=lambda f: -f["projected_ratio"]),
                  best_admissible=best, chosen=chosen, default_stride_union=default_union, sensitivities=sensitivities,
                  gate=dict(required_projected_ratio=1.10, passed=bool(chosen and chosen["projected_ratio"] >= 1.10)))
    xla.write_json(Path(args.out), report)
    print(json.dumps({k: v for k, v in report.items() if k not in ("frontier", "requests")}, indent=1, default=float))
    for f in report["frontier"][:12]:
        s = f["setting"]
        print(f"  strides {s['strides']} c {s['per_row']:2d} thr {s['threshold_name']:5s} issue {s['issue_cap']:2d} cap {s['cap']:2d}: "
              f"cov {f['timely_coverage']:.3f} late {f['late_correct_fraction']:.3f} prec {f['precision']:.3f} amp {f['traffic_amplification']:.2f} "
              f"ratio {f['projected_ratio']:.4f} (+fixed {f['projected_ratio_with_fixed']:.4f}, +late {f['projected_ratio_with_late_credit']:.4f})")


# ---------------------------------------------------------------- memo probe

def cmd_memo(args):
    run_dir = Path(args.run)
    manifest = xla.corpus_manifest()
    split_of = {r["id"]: r["split"] for r in manifest["requests"]}
    rows = [r for r in xla.load_requests_jsonl(run_dir) if r.get("complete") and split_of[r["id"]] == "validation"]
    cost_report = xla.read_json(args.cost_model)
    cost = (float(cost_report["read_cost_model"]["intercept_ms"]), float(cost_report["read_cost_model"]["slope_ms_per_record"]))
    M = args.memo_layers
    service = []
    covered = np.zeros(LAYERS); issued = np.zeros(LAYERS); useful = np.zeros(LAYERS); miss_by_layer = np.zeros(LAYERS)
    timely = np.zeros(LAYERS); wasted = np.zeros(LAYERS); late = np.zeros(LAYERS)
    seen_tokens = repeats = 0
    decode_ns = 0; passes_used = 0; saved_ms = 0.0
    for row in rows:
        req = load_request(run_dir, row)
        if req is None:
            continue
        resident = resident_at_pass_start(req)
        memo = build_memo_candidates(req, M)
        for e in req["events"]:
            n = len(e["miss"])
            if n and e["read"] > e["start"]:
                service.append((e["read"] - e["start"]) / n)
        service_ns = float(np.median(service)) if service else 270_000.0
        for p in complete_verify_passes(req):
            if p["pass_id"] not in resident:
                continue
            passes_used += 1
            decode_ns += p["end"] - p["begin"]
            misses = miss_sets(p)
            for l in range(LAYERS):
                miss_by_layer[l] += len(misses[l])
            cands = memo.get(p["pass_id"], {})
            res = resident[p["pass_id"]]
            for l, ids in cands.items():
                covered[l] += len(set(ids) & misses[l])
                nonres = [e for e in ids if l * EXPERTS + e not in res]
                issued[l] += len(nonres); useful[l] += len(set(nonres) & misses[l])
            # twin: issue in layer order at pass begin under half the cap, lanes
            twin = RouterTwin(cap=args.cap, lanes=args.lanes, service_ns=service_ns, issue_cap=512, strides=[], per_row=10,
                              threshold=-1e30, cost=cost, memo_cap=args.cap // 2)
            r = twin.run({}, timeline(p), res, misses, memo_candidates=cands)
            timely += r["timely_by_layer"]; saved_ms += r["saved_ms"]
            wasted[0] += r["wasted"]; late[0] += r["late"]
            seen_tokens += len(p["tokens"]); repeats += sum(1 for l, c in cands.items() if c and l == 0)
        log(f"{row['id']}: {passes_used} passes")
    total_misses = float(miss_by_layer.sum())
    decode_s = decode_ns / 1e9
    report = dict(schema="expert-lookahead-memo-probe-v1", run=str(run_dir), memo_layers=M, passes=passes_used, misses=int(total_misses),
                  coverage_all_misses=float(covered.sum() / max(total_misses, 1)),
                  coverage_memo_layers=float(covered[:M].sum() / max(miss_by_layer[:M].sum(), 1)),
                  nonresident_precision=float(useful.sum() / max(issued.sum(), 1)),
                  per_layer={str(l): dict(coverage=float(covered[l] / max(miss_by_layer[l], 1)), precision=float(useful[l] / max(issued[l], 1)),
                                          timely=int(timely[l]), misses=int(miss_by_layer[l])) for l in range(M)},
                  twin=dict(timely_coverage_all_misses=float(timely.sum() / max(total_misses, 1)), late=int(late.sum()), wasted=int(wasted.sum()),
                            traffic_amplification=float((total_misses + wasted.sum()) / max(total_misses, 1)),
                            projected_ratio=decode_s / max(decode_s - saved_ms / 1000, 1e-9)),
                  gate=dict(required_coverage=0.04, required_precision=0.30,
                            passed=bool(timely.sum() / max(total_misses, 1) >= 0.04 and useful.sum() / max(issued.sum(), 1) >= 0.30)))
    xla.write_json(Path(args.out), report)
    print(json.dumps(report, indent=1))


# ---------------------------------------------------------------- forecast-protected eviction (offline)

class ProtectedClock:
    """CLOCK exactly as SlotPool runs it (slots, reference bits, hand), with one addition: the victim
    scan skips slots whose key the forecast names for the next layer. Protection is advisory: a scan
    that passes the whole ring without a victim falls back to plain CLOCK so the pool never exhausts."""

    def __init__(self, keys, bits, hand):
        self.capacity = len(keys)
        self.keys = [int(k) for k in keys]
        self.bits = [bool(b) for b in bits]
        self.map = {k: s for s, k in enumerate(self.keys) if k >= 0}
        self.hand = int(hand) % self.capacity
        self.protected = set()
        self.saved = 0

    def _victim(self, pins, protect):
        scanned = 0
        skipped = 0
        while True:
            s = self.hand
            self.hand = (self.hand + 1) % self.capacity
            if s in pins:
                scanned += 1
                if scanned >= 3 * self.capacity:
                    raise RuntimeError("clock: pool exhausted")
                continue
            if self.bits[s]:
                self.bits[s] = False
                scanned += 1
                continue
            if protect and self.keys[s] in self.protected and skipped < self.capacity:
                skipped += 1
                scanned += 1
                self.saved += 1
                continue
            return s

    def batch(self, keys, protect=True):
        pins, miss_keys = set(), []
        for k in keys:
            s = self.map.get(k)
            if s is not None:
                pins.add(s)
                self.bits[s] = True
            else:
                miss_keys.append(k)
        victims = [self._victim(pins, protect) for _ in miss_keys]
        for s in victims:
            pins.add(s)
        for k, s in zip(miss_keys, victims):
            old = self.keys[s]
            if old >= 0:
                self.map.pop(old, None)
            self.keys[s] = k
            self.map[k] = s
            self.bits[s] = True
        return len(miss_keys)


def protected_replay(req, depth, per_row, threshold, source_stride):
    """Replay every decode demand event of one request with protection from the transplanted native
    forecasts: at layer L's batch the protected keys are the forecast for targets L+1..L+depth made
    from source layer (target - source_stride), when that source is below L (available at that time)."""
    res = req["residency"]
    pool = ProtectedClock(res["keys"], res["bits"], res["hand"])
    per_event = []
    protected_events = 0
    for e in req["events"]:
        pid, L = e["pass_id"], int(e["layer"])
        p = req["passes"].get(pid)
        protected = set()
        if p is not None and p.get("forecasts"):
            for t in range(L + 1, min(LAYERS, L + 1 + depth)):
                src = t - source_stride
                if src >= L:
                    continue
                f = p["forecasts"].get((src, t))
                if f is None:
                    continue
                ids = f["ids"].reshape(f["rows"], f["per_row"])[:, :per_row]
                margins = f["margins"].reshape(f["rows"], f["per_row"])[:, :per_row]
                keep = ids[margins >= threshold] if threshold is not None else ids
                protected.update(int(t) * EXPERTS + int(x) for x in keep.ravel())
        pool.protected = protected
        if protected:
            protected_events += 1
        keys = [int(L) * EXPERTS + int(x) for x in e["unique"]]
        per_event.append(pool.batch(keys, protect=bool(protected)))
    return per_event, pool.saved, protected_events


def cmd_protect_eviction(args):
    run_dir = Path(args.run)
    donor_rows = {r["id"]: r for r in xla.load_requests_jsonl(args.forecast_run) if r.get("complete")}
    manifest = xla.corpus_manifest()
    split_of = {r["id"]: r["split"] for r in manifest["requests"]}
    rows = [r for r in xla.load_requests_jsonl(run_dir) if r.get("complete") and r["id"] in donor_rows]
    if args.split:
        rows = [r for r in rows if split_of[r["id"]] == args.split]
    cost_report = xla.read_json(args.cost_model)
    fixed, per_record = (float(cost_report["read_cost_model"]["intercept_ms"]), float(cost_report["read_cost_model"]["slope_ms_per_record"]))
    variants = []
    for depth in [int(x) for x in args.depths.split(",")]:
        for per_row in [int(x) for x in args.per_rows.split(",")]:
            for thr_name, thr in [("none", None), ("q0.25", 0.062), ("q0.50", 0.214)]:
                variants.append(dict(depth=depth, per_row=per_row, threshold_name=thr_name, threshold=thr, source_stride=args.source_stride))
    totals = {json.dumps(v, sort_keys=True): dict(misses=0, events=0, miss_events=0, saved=0, protected_events=0) for v in variants}
    base = dict(misses=0, events=0, miss_events=0, native=0)
    decode = 0.0
    per_request = []
    skipped = []
    for row in rows:
        req = load_request(run_dir, row)
        donor = load_request(Path(args.forecast_run), donor_rows[row["id"]])
        if req is None or donor is None:
            continue
        transplant_forecasts(req, donor)
        decode += row["stats"]["decodeSeconds"]
        native = [len(e["miss"]) for e in req["events"]]
        plain, _, _ = protected_replay(req, 0, 1, None, args.source_stride)
        if plain != native:
            # A request whose capture does not replay exactly (a reset or resumed capture) is skipped, not fudged.
            log(f"{row['id']}: plain CLOCK replay does not reproduce the native misses; skipped")
            skipped.append(row["id"])
            continue
        base["misses"] += sum(plain); base["events"] += len(plain); base["miss_events"] += sum(1 for m in plain if m)
        line = dict(id=row["id"], native_misses=sum(native), events=len(plain))
        for v in variants:
            per_event, saved, pe = protected_replay(req, v["depth"], v["per_row"], v["threshold"], v["source_stride"])
            t = totals[json.dumps(v, sort_keys=True)]
            t["misses"] += sum(per_event); t["events"] += len(per_event); t["miss_events"] += sum(1 for m in per_event if m)
            t["saved"] += saved; t["protected_events"] += pe
            line[f"d{v['depth']}_c{v['per_row']}_{v['threshold_name']}"] = sum(per_event)
        per_request.append(line)
        log(f"{row['id']}: native {sum(native)} " + " ".join(f"{k}={val}" for k, val in line.items() if k.startswith("d")))
    def read_ms(miss_events, misses):
        return fixed * miss_events + per_record * misses
    base_ms = read_ms(base["miss_events"], base["misses"])
    out = dict(schema="expert-lookahead-protect-eviction-v1", run=str(run_dir), forecast_run=args.forecast_run,
               requests=[r["id"] for r in rows if r["id"] not in skipped], skipped=skipped, decode_seconds=decode, cost_model=dict(fixed_ms=fixed, marginal_ms_per_record=per_record),
               source_stride=args.source_stride, baseline=dict(base, read_ms=base_ms), variants=[])
    for v in variants:
        t = totals[json.dumps(v, sort_keys=True)]
        ms = read_ms(t["miss_events"], t["misses"])
        saved_ms = base_ms - ms
        ratio = decode * 1000 / (decode * 1000 - saved_ms) if decode * 1000 > saved_ms else float("inf")
        out["variants"].append(dict(setting=v, misses=t["misses"], misses_vs_native=t["misses"] / max(base["misses"], 1), miss_events=t["miss_events"],
                                    protected_skips=t["saved"], protected_events=t["protected_events"], read_ms=ms, saved_ms=saved_ms, projected_ratio=ratio))
    out["per_request"] = per_request
    xla.write_json(args.out, out)
    for v in sorted(out["variants"], key=lambda r: r["misses"]):
        s = v["setting"]
        log(f"depth {s['depth']} c {s['per_row']} thr {s['threshold_name']}: misses {v['misses_vs_native']:.4f}x native, skips {v['protected_skips']}, projected {v['projected_ratio']:.4f}")


def register(sub):
    p = sub.add_parser("forecast-audit")
    p.add_argument("--run", required=True); p.add_argument("--out", required=True); p.add_argument("--ids", default=None)
    p.add_argument("--model", default=str(xla.MODEL))
    p.set_defaults(fn=cmd_forecast_audit)
    p = sub.add_parser("prefetch-calibration")
    p.add_argument("--run", required=True); p.add_argument("--out", required=True); p.add_argument("--cost-model", required=True)
    p.add_argument("--source", default="native", choices=["native", "offline"]); p.add_argument("--model", default=str(xla.MODEL))
    p.add_argument("--ids", default=None); p.add_argument("--split", default="validation")
    p.add_argument("--strides", default="2,1"); p.add_argument("--per-row-max", type=int, default=16)
    p.add_argument("--lanes", type=int, default=8); p.add_argument("--amplification-bound", type=float, default=2.0)
    p.add_argument("--memo-layers-max", type=int, default=0); p.add_argument("--workers", type=int, default=8)
    p.add_argument("--forecast-run", default=None, help="capture whose native forecasts are joined onto --run's passes (same requests)")
    p.set_defaults(fn=cmd_prefetch_calibration)
    p = sub.add_parser("protect-eviction", help="offline: CLOCK victim scan skips keys the native forecast names for the next layers")
    p.add_argument("--run", required=True); p.add_argument("--out", required=True); p.add_argument("--cost-model", required=True)
    p.add_argument("--forecast-run", required=True); p.add_argument("--split", default="validation")
    p.add_argument("--depths", default="1"); p.add_argument("--per-rows", default="4,10,16"); p.add_argument("--source-stride", type=int, default=2)
    p.set_defaults(fn=cmd_protect_eviction)
    p = sub.add_parser("memo")
    p.add_argument("--run", required=True); p.add_argument("--out", required=True); p.add_argument("--cost-model", required=True)
    p.add_argument("--memo-layers", type=int, default=8); p.add_argument("--cap", type=int, default=32); p.add_argument("--lanes", type=int, default=8)
    p.set_defaults(fn=cmd_memo)
