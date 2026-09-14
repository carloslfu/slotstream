#!/usr/bin/env python3
"""Expert Lookahead probes over captured shards (successor protocol evidence).

Offline, read-only, no engine and no model process. Every subcommand consumes the shards of one
capture run and the checkpoint's router weights, restricts itself to the corpus validation split,
and writes one JSON report.

  router-reuse  apply layer T's real router to the captured MoE input of layer T-k (k = strides),
                score routing agreement, miss coverage and issue precision under the bounded twin
  replacement   replay the decode demand stream under exact LRU, segmented LRU, decayed LFU and
                Belady's optimal policy at the native slot count, against native CLOCK
  structure     demand read cost versus miss count, same-token routing consistency per layer,
                per-layer miss profile and unique experts per pass
  forecast-audit, prefetch-calibration, memo: see Tools/expert_lookahead_forecast.py

Usage: Tools/expert_lookahead_probes.py <subcommand> --run DIR --out FILE [options]
"""
import argparse
import heapq
import json
import random
import struct
import sys
import time
from collections import OrderedDict, defaultdict
from pathlib import Path

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parent))
import expert_lookahead as xla  # noqa: E402
import expert_lookahead_train as xt  # noqa: E402

LAYERS, EXPERTS, TOPK, HIDDEN = xt.LAYERS, xt.EXPERTS, xt.TOPK, xt.HIDDEN
RECORD_MB = xla.RECORD_BYTES / 1e6


def log(msg):
    print(f"[{time.strftime('%H:%M:%S')}] {msg}", flush=True)


def validation_ids(run_dir):
    manifest = xla.corpus_manifest()
    split_of = {r["id"]: r["split"] for r in manifest["requests"]}
    rows = [r for r in xla.load_requests_jsonl(run_dir) if r.get("complete")]
    return [r["id"] for r in rows if split_of[r["id"]] == "validation"], manifest["_sha256"]


def load_gates(model_dir):
    """float32 [LAYERS, EXPERTS, HIDDEN] router weights read straight from the safetensors headers."""
    model_dir = Path(model_dir)
    idx = json.load(open(model_dir / "model.safetensors.index.json"))["weight_map"]
    gates = np.zeros((LAYERS, EXPERTS, HIDDEN), np.float32)
    byfile = {}
    for l in range(LAYERS):
        k = f"language_model.model.layers.{l}.mlp.gate.weight"
        byfile.setdefault(idx[k], []).append((l, k))
    for f, items in byfile.items():
        with open(model_dir / f, "rb") as fh:
            n = struct.unpack("<Q", fh.read(8))[0]
            header = json.loads(fh.read(n))
        mm = np.memmap(model_dir / f, dtype=np.uint8, mode="r")
        for l, k in items:
            e = header[k]
            if e["dtype"] != "BF16" or e["shape"] != [EXPERTS, HIDDEN]:
                raise SystemExit(f"{k}: unexpected {e['dtype']} {e['shape']}")
            a, b = e["data_offsets"]
            raw = np.frombuffer(mm, dtype="<u2", count=(b - a) // 2, offset=8 + n + a)
            gates[l] = xt.bf16_to_f32(raw).reshape(EXPERTS, HIDDEN)
    return gates


def topc(logits, c):
    return np.argpartition(-logits, c - 1, axis=-1)[..., :c]


def request_streams(ds, val_ids):
    """Per request: slot count, initial resident keys, decode demand batches (unique keys in native
    order), native miss count, and the exact CLOCK residency at every verify-pass start."""
    for rid in val_ids:
        entry = ds.requests[rid]
        res = entry["residency"]
        if res is None:
            continue
        after = res["after"]
        if after < 0:
            prefill = [pid for pid, p in entry["passes"].items() if p["phase"] == 0]
            after = max(prefill) if prefill else -1
        events = sorted([e for e in entry["demand"] if e["pass_id"] > after], key=lambda e: (e["pass_id"], e["layer"]))
        batches = [[int(e["layer"]) * EXPERTS + int(x) for x in e["unique"]] for e in events]
        yield dict(id=rid, capacity=len(res["keys"]), initial=[int(k) for k in res["keys"] if int(k) >= 0],
                   batches=batches, events=events, native_misses=sum(len(e["miss"]) for e in events), residency=res)


# ---------------------------------------------------------------- replacement policies

def opt_misses(capacity, initial, batches):
    """Belady's optimal replacement with batch pinning (a batch's keys are never evicted by each other)."""
    nxt = {}
    for i, b in enumerate(batches):
        for k in b:
            nxt.setdefault(k, []).append(i)
    ptr = {k: 0 for k in nxt}
    inf = 1 << 60

    def next_use(k, i):
        lst = nxt.get(k, [])
        p = ptr.get(k, 0)
        while p < len(lst) and lst[p] <= i:
            p += 1
        ptr[k] = p
        return lst[p] if p < len(lst) else inf

    resident = set(initial[:capacity])
    heap = [(-next_use(k, -1), k) for k in resident]
    heapq.heapify(heap)
    misses = 0
    for i, b in enumerate(batches):
        pinned = set(b)
        for k in b:
            if k in resident:
                continue
            misses += 1
            deferred = []
            while len(resident) >= capacity:
                nu, v = heapq.heappop(heap)
                if v not in resident:
                    continue
                current = next_use(v, i - 1)
                if -nu != current:
                    heapq.heappush(heap, (-current, v))
                    continue
                if v in pinned:
                    deferred.append((nu, v))
                    continue
                resident.remove(v)
                break
            for item in deferred:
                heapq.heappush(heap, item)
            resident.add(k)
        for k in b:
            heapq.heappush(heap, (-next_use(k, i), k))
    return misses


def opt_reference(capacity, initial, batches):
    resident = list(initial[:capacity])
    misses = 0

    def nxt(k, i):
        for j in range(i + 1, len(batches)):
            if k in batches[j]:
                return j
        return 1 << 60

    for i, b in enumerate(batches):
        for k in b:
            if k in resident:
                continue
            misses += 1
            if len(resident) >= capacity:
                victim = max([v for v in resident if v not in b], key=lambda v: nxt(v, i))
                resident.remove(victim)
            resident.append(k)
    return misses


def lru_misses(capacity, initial, batches):
    od = OrderedDict((k, None) for k in initial[:capacity])
    misses = 0
    for b in batches:
        for k in b:
            if k in od:
                od.move_to_end(k)
                continue
            misses += 1
            while len(od) >= capacity:
                victim = next(iter(od))
                if victim in b:
                    od.move_to_end(victim)
                    continue
                od.popitem(last=False)
            od[k] = None
    return misses


def slru_misses(capacity, initial, batches, protected_frac=0.8):
    prot_cap = int(capacity * protected_frac)
    prob, prot = OrderedDict(), OrderedDict()
    for k in initial[:capacity]:
        prob[k] = None
    misses = 0
    for b in batches:
        for k in b:
            if k in prot:
                prot.move_to_end(k)
                continue
            if k in prob:
                prob.pop(k)
                prot[k] = None
                while len(prot) > prot_cap:
                    d, _ = prot.popitem(last=False)
                    prob[d] = None
                continue
            misses += 1
            while len(prob) + len(prot) >= capacity:
                if prob:
                    v = next(iter(prob))
                    if v in b:
                        prob.move_to_end(v)
                        continue
                    prob.popitem(last=False)
                else:
                    prot.popitem(last=False)
            prob[k] = None
    return misses


def lfu_decay_misses(capacity, initial, batches, half_life_refs=200_000):
    import math
    lam = math.log(2) / half_life_refs
    score, stamp, resident, heap, t = {}, {}, set(), [], 0

    def bump(k):
        s = score.get(k, 0.0) * math.exp(-lam * (t - stamp.get(k, t))) + 1.0
        score[k], stamp[k] = s, t
        return s

    for k in initial[:capacity]:
        resident.add(k)
        score[k], stamp[k] = 1.0, 0
        heapq.heappush(heap, (1.0, k))
    misses = 0
    for b in batches:
        for k in b:
            t += 1
            if k in resident:
                heapq.heappush(heap, (bump(k), k))
                continue
            misses += 1
            deferred = []
            while len(resident) >= capacity:
                s, v = heapq.heappop(heap)
                if v not in resident or s != score[v]:
                    continue
                if v in b:
                    deferred.append((s, v))
                    continue
                resident.remove(v)
                break
            for item in deferred:
                heapq.heappush(heap, item)
            resident.add(k)
            heapq.heappush(heap, (bump(k), k))
    return misses


def cmd_replacement(args):
    run_dir = Path(args.run)
    val_ids, corpus_sha = validation_ids(run_dir)
    ds = xt.Dataset(run_dir, val_ids)
    rnd = random.Random(7)
    for trial in range(200):
        n_keys, cap = rnd.randint(6, 12), rnd.randint(4, 6)
        batches = [rnd.sample(range(n_keys), rnd.randint(1, 3)) for _ in range(rnd.randint(1, 25))]
        initial = rnd.sample(range(n_keys), min(cap, n_keys))
        a, b = opt_misses(cap, initial, batches), opt_reference(cap, initial, batches)
        if a != b:
            raise SystemExit(f"OPT self-check failed on trial {trial}: {a} != {b}")
    log("OPT verified against brute force on 200 random traces")
    factors = [float(x) for x in args.capacity_factors.split(",")]
    totals = defaultdict(int)
    per_request = []
    anatomy = dict(capacity=0, cold=0)
    for s in request_streams(ds, val_ids):
        refs = sum(len(b) for b in s["batches"])
        totals["refs"] += refs
        totals["native"] += s["native_misses"]
        ever = set(s["initial"])
        pool = xt.ClockPool(s["residency"]["keys"], s["residency"]["bits"], s["residency"]["hand"])
        for e in s["events"]:
            keys = [int(e["layer"]) * EXPERTS + int(x) for x in e["unique"]]
            _, misses, _ = pool.ensure(keys)
            for k in misses:
                if k in ever:
                    anatomy["capacity"] += 1
                else:
                    anatomy["cold"] += 1
                    ever.add(k)
        row = dict(id=s["id"], capacity=s["capacity"], refs=refs, native=s["native_misses"])
        for f in factors:
            c = int(s["capacity"] * f)
            for name, fn in (("opt", opt_misses), ("lru", lru_misses), ("slru", slru_misses), ("lfu_decay", lfu_decay_misses)):
                m = fn(c, s["initial"], s["batches"])
                totals[f"{name}@{f:.1f}x"] += m
                row[f"{name}@{f:.1f}x"] = m
        per_request.append(row)
        log(f"{s['id']}: {refs} references, {s['native_misses']} native misses")
    policies = {}
    for key, m in totals.items():
        if "@" in key:
            policies[key] = dict(misses=m, misses_vs_native=m / totals["native"], hit_rate=1 - m / totals["refs"])
    report = dict(schema="expert-lookahead-probe-replacement-v1", run=str(run_dir), corpus_sha256=corpus_sha,
                  validation_requests=val_ids, references=totals["refs"], native_misses=totals["native"],
                  native_hit_rate=1 - totals["native"] / totals["refs"], miss_anatomy=anatomy,
                  capacity_factors=factors, policies=policies, per_request=per_request)
    xla.write_json(Path(args.out), report)
    print(json.dumps({k: v for k, v in report.items() if k not in ("per_request", "validation_requests")}, indent=1))


# ---------------------------------------------------------------- router reuse

def cmd_router_reuse(args):
    run_dir = Path(args.run)
    val_ids, corpus_sha = validation_ids(run_dir)
    strides = [int(x) for x in args.strides.split(",")]
    tops = [int(x) for x in args.tops.split(",")]
    gates = load_gates(args.model)
    ds = xt.Dataset(run_dir, val_ids, want_x2=True)
    log(f"dataset {ds.summary()}")
    service = []
    for rid in val_ids:
        for e in ds.requests[rid]["demand"]:
            n = len(e["miss"])
            if n and e["read"] > e["start"]:
                service.append((e["read"] - e["start"]) / n)
    service_ns = float(np.median(service))
    resident_at_pass = {}
    for s in request_streams(ds, val_ids):
        pool = xt.ClockPool(s["residency"]["keys"], s["residency"]["bits"], s["residency"]["hand"])
        current = None
        for e in s["events"]:
            if e["pass_id"] != current:
                current = e["pass_id"]
                resident_at_pass[(s["id"], current)] = set(k for k in pool.keys if k >= 0)
            pool.ensure([int(e["layer"]) * EXPERTS + int(x) for x in e["unique"]])
    groups = list(range(0, LAYERS, 8))
    agree = {k: np.zeros(LAYERS) for k in [0] + strides}
    agree_n = {k: np.zeros(LAYERS) for k in [0] + strides}
    recall16 = {k: np.zeros(LAYERS) for k in strides}
    cover = {k: np.zeros(LAYERS) for k in strides}
    issued_nonres = {k: np.zeros(LAYERS) for k in strides}
    useful_nonres = {k: np.zeros(LAYERS) for k in strides}
    miss_by_layer = np.zeros(LAYERS)
    lead = {k: [] for k in strides}
    sched = {(k, c): dict(timely=0, issued=0, wasted=0) for k in strides for c in tops}
    sched_exact = {(k, c): dict(timely=0, issued=0, wasted=0) for k in strides for c in tops}
    read_by_n = defaultdict(list)
    total_misses = decode_ns = io_ns = passes_used = 0
    for p in ds.passes:
        entry = ds.requests[p["request"]]
        by_pass = {}
        for e in entry["demand"]:
            by_pass.setdefault(e["pass_id"], []).append(e)
        events = by_pass.get(p["pass_id"], [])
        if len(events) < LAYERS or p["end"] is None:
            continue
        x2 = [ds.x2_rows(p, l) for l in range(LAYERS)]
        if any(x is None for x in x2):
            continue
        ev = {e["layer"]: e for e in events}
        misses = [set(int(x) for x in ev[l]["miss"]) for l in range(LAYERS)]
        hits = [set(int(x) for x in ev[l]["hit"]) for l in range(LAYERS)]
        resident_hits = set(l * EXPERTS + h for l in range(LAYERS) for h in hits[l])
        timeline = xt.pass_timeline(entry, p, by_pass)
        passes_used += 1
        decode_ns += p["end"] - p["begin"]
        for l in range(LAYERS):
            e = ev[l]
            io_ns += max(0, e["end"] - e["start"])
            total_misses += len(misses[l])
            miss_by_layer[l] += len(misses[l])
            if misses[l] and e["read"] > e["start"]:
                read_by_n[len(misses[l])].append((e["read"] - e["start"]) / 1e6)
        for k in [0] + strides:
            per_target = [None] * LAYERS
            for T in range(k, LAYERS):
                src, routes = x2[T - k], p["routes"][T]
                r = min(src.shape[0], routes.shape[0])
                logits = src[:r] @ gates[T].T
                t10 = topc(logits, TOPK)
                agree[k][T] += sum(len(set(t10[i].tolist()) & set(routes[i].tolist())) / TOPK for i in range(r))
                agree_n[k][T] += r
                if not k:
                    continue
                t16 = topc(logits, 16)
                recall16[k][T] += sum(len(set(t16[i].tolist()) & set(routes[i].tolist())) / TOPK for i in range(r)) / r
                union10 = set(t10.reshape(-1).tolist())
                cover[k][T] += len(union10 & misses[T])
                nonres = union10 - hits[T]
                issued_nonres[k][T] += len(nonres)
                useful_nonres[k][T] += len(nonres & misses[T])
                lead[k].append((timeline["demand_start"][T] - p["layer_nanos"][T - k]) / 1e6)
                per_target[T] = {c: sorted(set(topc(logits, c).reshape(-1).tolist())) for c in tops}
            if not k:
                continue
            for c in tops:
                cands = [per_target[T][c] if per_target[T] else [] for T in range(LAYERS)]
                s = xt.BoundedScheduler(cap_records=args.cap, lanes=args.lanes, window=k, top=c, service_ns=service_ns)
                t, i, w = s.run(cands, timeline, resident_hits, misses)
                sched[(k, c)]["timely"] += int(t.sum()); sched[(k, c)]["issued"] += int(i.sum()); sched[(k, c)]["wasted"] += int(w.sum())
                rs = resident_at_pass.get((p["request"], p["pass_id"]))
                if rs is not None:
                    t, i, w = s.run(cands, timeline, rs, misses)
                    sched_exact[(k, c)]["timely"] += int(t.sum()); sched_exact[(k, c)]["issued"] += int(i.sum()); sched_exact[(k, c)]["wasted"] += int(w.sum())
        if passes_used % 100 == 0:
            log(f"{passes_used} passes")
    io_fraction = io_ns / decode_ns
    ns = sorted(n for n in read_by_n if len(read_by_n[n]) >= 20)
    medians = np.array([np.median(read_by_n[n]) for n in ns])
    weights = np.array([len(read_by_n[n]) for n in ns], float)
    slope, intercept = np.polyfit(np.array(ns, float), medians, 1, w=np.sqrt(weights))
    layer_events = passes_used * LAYERS

    def summarize(d):
        out = {}
        for (k, c), v in d.items():
            cov = v["timely"] / total_misses
            precision = v["timely"] / v["issued"] if v["issued"] else 0.0
            amplification = (total_misses + v["wasted"]) / total_misses
            saved_ns = slope * 1e6 * v["timely"]
            out[f"stride{k}-top{c}"] = dict(timely_coverage=cov, precision=precision, traffic_amplification=amplification,
                                            projected_ratio_plan_formula=1 / (1 - cov * io_fraction),
                                            projected_ratio_cost_model=decode_ns / (decode_ns - saved_ns), **v)
        return out

    def by_group(vec, denom):
        return {f"{g}-{g+7}": float(vec[g:g + 8].sum() / max(denom[g:g + 8].sum(), 1e-9)) for g in groups}

    report = dict(
        schema="expert-lookahead-probe-router-reuse-v1", run=str(run_dir), corpus_sha256=corpus_sha,
        model=str(args.model), validation_requests=val_ids, passes=passes_used, misses=total_misses,
        misses_per_layer_event=total_misses / layer_events, decode_seconds=decode_ns / 1e9, io_seconds=io_ns / 1e9,
        io_fraction=io_fraction, service_ms_per_record=service_ns / 1e6,
        read_cost_model=dict(intercept_ms=float(intercept), slope_ms_per_record=float(slope),
                             medians_ms={str(n): float(m) for n, m in zip(ns, medians)}),
        scheduler=dict(cap=args.cap, lanes=args.lanes, tops=tops, strides=strides),
        lead_ms_by_stride={str(k): dict(median=float(np.median(v)), p10=float(np.percentile(v, 10))) for k, v in lead.items()},
        top10_agreement_by_stride={str(k): float(agree[k].sum() / agree_n[k].sum()) for k in [0] + strides},
        top10_agreement_stride1_layers_1_to_3=float(agree[1][1:4].sum() / agree_n[1][1:4].sum()) if 1 in strides else None,
        recall16_by_stride={str(k): float(recall16[k][k:].sum() / (LAYERS - k) / passes_used) for k in strides},
        by_layer_group={str(k): dict(agreement=by_group(agree[k], agree_n[k]), miss_coverage_top10=by_group(cover[k], miss_by_layer),
                                     nonresident_precision_top10=by_group(useful_nonres[k], issued_nonres[k])) for k in strides},
        miss_share_by_layer_group={f"{g}-{g+7}": float(miss_by_layer[g:g + 8].sum() / total_misses) for g in groups},
        scheduler_plan_accounting=summarize(sched), scheduler_exact_residency=summarize(sched_exact))
    xla.write_json(Path(args.out), report)
    print(json.dumps({k: v for k, v in report.items() if k not in ("validation_requests", "by_layer_group", "scheduler_plan_accounting")}, indent=1))
    for key, v in report["scheduler_exact_residency"].items():
        print(f"  {key:16s} cov {v['timely_coverage']:.3f} prec {v['precision']:.3f} amp {v['traffic_amplification']:.2f} "
              f"plan {v['projected_ratio_plan_formula']:.3f} cost-model {v['projected_ratio_cost_model']:.3f}")


# ---------------------------------------------------------------- structure

def cmd_structure(args):
    run_dir = Path(args.run)
    val_ids, corpus_sha = validation_ids(run_dir)
    ds = xt.Dataset(run_dir, val_ids)
    overlap, base = np.zeros(LAYERS), np.zeros(LAYERS)
    repeats = baselines = positions = 0
    uniq = defaultdict(list)
    miss = defaultdict(list)
    zero = np.zeros(LAYERS); events = np.zeros(LAYERS); miss_layer = np.zeros(LAYERS)
    for rid in val_ids:
        last = {}
        prev = None
        passes = ds.requests[rid]["passes"]
        for pid in sorted(passes):
            p = passes[pid]
            if p["phase"] != 1 or len(p["routes"]) != LAYERS:
                continue
            for i in range(len(p["tokens"])):
                if any(p["routes"][l].shape[0] <= i for l in range(LAYERS)):
                    continue
                positions += 1
                cur = np.stack([p["routes"][l][i] for l in range(LAYERS)])
                tok = p["tokens"][i]
                if tok in last:
                    repeats += 1
                    for l in range(LAYERS):
                        overlap[l] += len(set(cur[l].tolist()) & set(last[tok][l].tolist())) / TOPK
                if prev is not None:
                    baselines += 1
                    for l in range(LAYERS):
                        base[l] += len(set(cur[l].tolist()) & set(prev[l].tolist())) / TOPK
                last[tok] = cur
                prev = cur
        for e in ds.requests[rid]["demand"]:
            p = passes.get(e["pass_id"])
            if not p or p["phase"] != 1:
                continue
            r = p["routes"].get(e["layer"])
            if r is None:
                continue
            uniq[r.shape[0]].append(len(e["unique"])); miss[r.shape[0]].append(len(e["miss"]))
            l = e["layer"]; events[l] += 1; zero[l] += (len(e["miss"]) == 0); miss_layer[l] += len(e["miss"])
    groups = list(range(0, LAYERS, 4))
    report = dict(
        schema="expert-lookahead-probe-structure-v1", run=str(run_dir), corpus_sha256=corpus_sha, validation_requests=val_ids,
        positions=positions, same_token_repeats=repeats, previous_position_pairs=baselines,
        same_token_overlap_by_layer_group={f"{g}-{g+3}": float(overlap[g:g + 4].sum() / (4 * repeats)) for g in groups},
        previous_position_overlap_by_layer_group={f"{g}-{g+3}": float(base[g:g + 4].sum() / (4 * baselines)) for g in groups},
        same_token_overlap_all_layers=float(overlap.sum() / (LAYERS * repeats)),
        previous_position_overlap_all_layers=float(base.sum() / (LAYERS * baselines)),
        unique_and_misses_by_positions={str(k): dict(unique=float(np.mean(uniq[k])), misses=float(np.mean(miss[k])), events=len(uniq[k])) for k in sorted(uniq)},
        zero_miss_layer_event_fraction=float(zero.sum() / events.sum()),
        miss_share_by_layer={str(l): float(miss_layer[l] / miss_layer.sum()) for l in range(LAYERS)},
        misses_per_event_by_layer_group={f"{g}-{g+7}": float(miss_layer[g:g + 8].sum() / events[g:g + 8].sum()) for g in range(0, LAYERS, 8)})
    xla.write_json(Path(args.out), report)
    print(json.dumps({k: v for k, v in report.items() if k not in ("validation_requests", "miss_share_by_layer")}, indent=1))


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name, fn in (("router-reuse", cmd_router_reuse), ("replacement", cmd_replacement), ("structure", cmd_structure)):
        s = sub.add_parser(name)
        s.add_argument("--run", required=True)
        s.add_argument("--out", required=True)
        s.set_defaults(fn=fn)
        if name == "router-reuse":
            s.add_argument("--model", default=str(xla.MODEL))
            s.add_argument("--strides", default="1,2,3,4")
            s.add_argument("--tops", default="10,16,24,32")
            s.add_argument("--cap", type=int, default=32)
            s.add_argument("--lanes", type=int, default=8)
        if name == "replacement":
            s.add_argument("--capacity-factors", default="1.0,1.2,1.5")
    import expert_lookahead_forecast as xf
    xf.register(sub)
    args = ap.parse_args()
    args.fn(args)


if __name__ == "__main__":
    main()
