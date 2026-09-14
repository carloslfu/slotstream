#!/usr/bin/env python3
"""Expert Lookahead 2, W1c: the conditional learned reuse-distance evictor.

Entered only because no implementable policy reached 0.85x native misses on validation. A logistic
scorer over per-key features (passes since last use, uses in the last 8, 32 and 128 passes, layer
group, expert frequency rank, used in the current pass) predicts reuse within the next 16 passes;
the twin evicts, among the next K unpinned slots from the hand, the key with the lowest predicted
reuse. Trained in minutes on the train split's shards; scored exactly on validation like every other
policy. Port threshold: at most 0.85x native misses on validation and at least three hit-rate points
over the best implementable policy.

  python3 Tools/expert_lookahead_evictor.py train --run DIR --out FILE [--window 16 --sample 16 --stride 4]
  python3 Tools/expert_lookahead_evictor.py evaluate --run DIR --weights FILE --cost-model FILE --out FILE
"""
import argparse
import json
import multiprocessing as mp
import sys
import time
from collections import defaultdict, deque
from pathlib import Path

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parent))
import expert_lookahead as xla  # noqa: E402
import expert_lookahead_replacement as rl  # noqa: E402

LAYERS, EXPERTS = xla.LAYERS, xla.EXPERTS
FEATURES = ["log_passes_since_use", "uses_8", "uses_32", "uses_128", "log_freq_rank", "used_this_pass",
            "group0", "group1", "group2", "group3", "group4", "group5", "bias"]


def log(msg):
    print(f"[{time.strftime('%H:%M:%S')}] {msg}", flush=True)


class KeyHistory:
    """Per-key use history over decode passes (pass index, not pass id) for the scorer's features."""

    def __init__(self, freq_rank):
        self.last = {}
        self.uses = defaultdict(deque)
        self.freq_rank = freq_rank

    def touch(self, key, pass_index):
        self.last[key] = pass_index
        d = self.uses[key]
        d.append(pass_index)
        while d and d[0] < pass_index - 128:
            d.popleft()

    def features(self, key, pass_index, out):
        last = self.last.get(key, pass_index - 129)
        d = self.uses.get(key)
        u8 = u32 = u128 = 0
        if d:
            for t in reversed(d):
                age = pass_index - t
                if age >= 128:
                    break
                u128 += 1
                if age < 32:
                    u32 += 1
                    if age < 8:
                        u8 += 1
        out[0] = np.log1p(max(0, pass_index - last))
        out[1] = u8; out[2] = u32; out[3] = u128
        out[4] = np.log1p(self.freq_rank[key % EXPERTS + (key // EXPERTS) * EXPERTS])
        out[5] = 1.0 if last == pass_index else 0.0
        g = (key // EXPERTS) // 8
        out[6:12] = 0.0
        out[6 + g] = 1.0
        out[12] = 1.0
        return out


def frequency_rank(run_dir, train_ids):
    """Global expert frequency rank per key from the train split's decode demand streams."""
    counts = np.zeros(LAYERS * EXPERTS, np.float64)
    for rid in train_ids:
        s = rl.STREAMS[rid]
        for keys in s["ev_keys"]:
            np.add.at(counts, keys, 1)
    rank = np.zeros_like(counts)
    for l in range(LAYERS):
        seg = counts[l * EXPERTS:(l + 1) * EXPERTS]
        order = np.argsort(-seg, kind="stable")
        rank[l * EXPERTS + order] = np.arange(EXPERTS)
    return rank


class LearnedEvictor:
    """CLOCK-shaped slot pool whose victim is chosen by the scorer among K unpinned slots at the hand."""

    def __init__(self, capacity, weights, mean, std, freq_rank, sample=16, window=16, stream=None, collect=None, stride=1):
        self.capacity = capacity
        self.keys = [-1] * capacity
        self.map = {}
        self.hand = 0
        self.w, self.mean, self.std = weights, mean, std
        self.history = KeyHistory(freq_rank)
        self.sample = sample
        self.window = window
        self.pass_index = -1
        self.current_pass = None
        self.buf = np.zeros(len(FEATURES))
        self.collect = collect      # list to append (features, key, pass_index) rows for training
        self.stride = stride
        self.decisions = 0
        self.stream = stream

    def seed_native(self, stream):
        n = min(self.capacity, len(stream["initial_keys"]))
        for s in range(n):
            k = stream["initial_keys"][s]
            self.keys[s] = k
            if k >= 0:
                self.map[k] = s
                self.history.touch(k, -1 if not stream["initial_bits"][s] else 0)
        self.hand = stream["hand"] % self.capacity

    def score(self, key):
        x = (self.history.features(key, self.pass_index, self.buf) - self.mean) / self.std
        return float(x @ self.w)

    def victim(self, pins):
        cands = []
        s = self.hand
        scanned = 0
        while len(cands) < self.sample and scanned < self.capacity:
            if s not in pins:
                cands.append(s)
            s = (s + 1) % self.capacity
            scanned += 1
        if not cands:
            raise RuntimeError("learned evictor: pool exhausted")
        self.decisions += 1
        if self.w is None:
            best = cands[0]
        else:
            best = min(cands, key=lambda slot: (self.score(self.keys[slot]) if self.keys[slot] >= 0 else -1e9, slot))
        if self.collect is not None and self.decisions % self.stride == 0:
            for slot in cands:
                k = self.keys[slot]
                if k >= 0:
                    self.collect.append((self.history.features(k, self.pass_index, self.buf).copy(), k, self.pass_index))
        self.hand = (self.hand + 1) % self.capacity
        return best

    def batch(self, pass_id, keys):
        if pass_id != self.current_pass:
            self.current_pass = pass_id
            self.pass_index += 1
        pins, miss_keys = set(), []
        for k in keys.tolist():
            self.history.touch(k, self.pass_index)
            s = self.map.get(k)
            if s is not None:
                pins.add(s)
            else:
                miss_keys.append(k)
        victims = []
        for k in miss_keys:
            s = self.victim(pins)
            pins.add(s)
            victims.append(s)
        for k, s in zip(miss_keys, victims):
            old = self.keys[s]
            if old >= 0:
                self.map.pop(old, None)
            self.keys[s] = k
            self.map[k] = s
        return len(miss_keys)


def next_use_table(stream):
    """For every (event index, key) the pass index of the key's next use; used for labels."""
    pass_index_of = {}
    idx = -1
    ev_pass_index = []
    for pid in stream["ev_pass"].tolist():
        if pid not in pass_index_of:
            idx += 1
            pass_index_of[pid] = idx
        ev_pass_index.append(idx)
    uses = defaultdict(list)
    for i, keys in enumerate(stream["ev_keys"]):
        for k in keys.tolist():
            uses[k].append(ev_pass_index[i])
    return uses, ev_pass_index


def collect_task(args):
    rid, freq_rank, sample, stride, window = args
    s = rl.STREAMS[rid]
    rows = []
    pol = LearnedEvictor(s["capacity"], None, None, None, freq_rank, sample=sample, collect=rows, stride=stride)
    pol.seed_native(s)
    for pid, keys in zip(s["ev_pass"].tolist(), s["ev_keys"]):
        pol.batch(pid, keys)
    uses, _ = next_use_table(s)
    X = np.zeros((len(rows), len(FEATURES)), np.float32)
    y = np.zeros(len(rows), np.float32)
    import bisect
    for i, (f, k, p) in enumerate(rows):
        X[i] = f
        lst = uses.get(k, [])
        j = bisect.bisect_right(lst, p)
        y[i] = 1.0 if j < len(lst) and lst[j] <= p + window else 0.0
    return rid, X, y


def train_logistic(X, y, epochs=30, lr=0.1, l2=1e-4, seed=17):
    rng = np.random.default_rng(seed)
    mean = X.mean(axis=0); std = X.std(axis=0); std[std < 1e-6] = 1.0
    mean[-1] = 0.0; std[-1] = 1.0
    Xn = (X - mean) / std
    w = np.zeros(X.shape[1])
    n = len(y)
    batch = 65536
    for epoch in range(epochs):
        order = rng.permutation(n)
        for lo in range(0, n, batch):
            idx = order[lo:lo + batch]
            z = Xn[idx] @ w
            p = 1 / (1 + np.exp(-z))
            g = Xn[idx].T @ (p - y[idx]) / len(idx) + l2 * w
            w -= lr * g
        lr *= 0.95
    z = Xn @ w
    p = 1 / (1 + np.exp(-z))
    loss = float(-np.mean(y * np.log(p + 1e-9) + (1 - y) * np.log(1 - p + 1e-9)))
    auc = rank_auc(p, y)
    return w, mean, std, loss, auc


def rank_auc(p, y):
    order = np.argsort(p)
    ranks = np.empty(len(p)); ranks[order] = np.arange(1, len(p) + 1)
    pos = y > 0.5
    n1, n0 = pos.sum(), (~pos).sum()
    if n1 == 0 or n0 == 0:
        return None
    return float((ranks[pos].sum() - n1 * (n1 + 1) / 2) / (n1 * n0))


def load_streams(run_dir, split=None):
    manifest = xla.corpus_manifest()
    split_of = {r["id"]: r["split"] for r in manifest["requests"]}
    rows = [r for r in xla.load_requests_jsonl(run_dir) if r.get("complete")]
    for r in rows:
        r["split"] = split_of[r["id"]]
    for r in rows:
        s = rl.load_stream(run_dir, r)
        if s is not None:
            rl.STREAMS[r["id"]] = s
    train_ids = [r["id"] for r in rows if r["split"] == "train" and r["id"] in rl.STREAMS]
    val_ids = [r["id"] for r in rows if r["split"] == "validation" and r["id"] in rl.STREAMS]
    return train_ids, val_ids, manifest["_sha256"]


def cmd_train(args):
    run_dir = Path(args.run)
    train_ids, val_ids, corpus_sha = load_streams(run_dir)
    freq_rank = frequency_rank(run_dir, train_ids)
    t0 = time.time()
    tasks = [(rid, freq_rank, args.sample, args.stride, args.window) for rid in train_ids]
    Xs, ys = [], []
    with mp.get_context("fork").Pool(args.workers) as pool:
        for rid, X, y in pool.imap_unordered(collect_task, tasks):
            Xs.append(X); ys.append(y)
            log(f"{rid}: {len(y)} rows, positive {y.mean():.3f}")
    X = np.concatenate(Xs); y = np.concatenate(ys)
    log(f"{len(y)} training rows in {time.time() - t0:.0f} s, positive rate {y.mean():.3f}")
    w, mean, std, loss, auc = train_logistic(X, y, epochs=args.epochs)
    report = dict(schema="expert-lookahead-evictor-v1", run=str(run_dir), corpus_sha256=corpus_sha, train_requests=train_ids,
                  features=FEATURES, rows=int(len(y)), positive_rate=float(y.mean()), window_passes=args.window,
                  sample_slots=args.sample, decision_stride=args.stride, epochs=args.epochs, train_loss=loss, train_auc=auc,
                  weights=w.tolist(), mean=mean.tolist(), std=std.tolist(), seconds=time.time() - t0)
    np.savez(Path(args.out).with_suffix(".npz"), weights=w, mean=mean, std=std, freq_rank=freq_rank)
    xla.write_json(Path(args.out), report)
    print(json.dumps({k: v for k, v in report.items() if k not in ("train_requests", "mean", "std")}, indent=1))


def eval_task(args):
    rid, weights_path, sample, cost = args
    z = np.load(weights_path)
    s = rl.STREAMS[rid]
    pol = LearnedEvictor(s["capacity"], z["weights"], z["mean"], z["std"], z["freq_rank"], sample=sample)
    pol.seed_native(s)
    per_event = [pol.batch(pid, keys) for pid, keys in zip(s["ev_pass"].tolist(), s["ev_keys"])]
    return rid, rl.score(s, per_event, cost)


def cmd_evaluate(args):
    run_dir = Path(args.run)
    train_ids, val_ids, corpus_sha = load_streams(run_dir)
    cost_report = xla.read_json(args.cost_model)
    cost = (float(cost_report["read_cost_model"]["intercept_ms"]), float(cost_report["read_cost_model"]["slope_ms_per_record"]))
    weights_path = str(Path(args.weights).with_suffix(".npz"))
    report = dict(schema="expert-lookahead-evictor-evaluate-v1", run=str(run_dir), weights=weights_path, samples={})
    for sample in [int(x) for x in args.samples.split(",")]:
        entry = {}
        for split, ids in (("validation", val_ids), ("train", train_ids if args.train else [])):
            if not ids:
                continue
            tasks = [(rid, weights_path, sample, cost) for rid in ids]
            with mp.get_context("fork").Pool(args.workers) as pool:
                rows = list(pool.imap_unordered(eval_task, tasks))
            native = rl.aggregate([(rid, rl.score(rl.STREAMS[rid], rl.STREAMS[rid]["ev_native_miss"].tolist(), cost)) for rid in ids], rl.STREAMS)
            entry[split] = rl.add_projection(rl.aggregate(rows, rl.STREAMS), native)
            log(f"sample {sample} {split}: misses x{entry[split]['misses_vs_native']:.4f} hit {entry[split]['hit_rate']:.4f} "
                f"read x{entry[split]['read_vs_native']:.4f} projected {entry[split]['projected_ratio']:.4f}")
        report["samples"][str(sample)] = entry
    xla.write_json(Path(args.out), report)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("train")
    p.add_argument("--run", required=True); p.add_argument("--out", required=True)
    p.add_argument("--window", type=int, default=16); p.add_argument("--sample", type=int, default=16); p.add_argument("--stride", type=int, default=4)
    p.add_argument("--epochs", type=int, default=30); p.add_argument("--workers", type=int, default=8)
    p.set_defaults(fn=cmd_train)
    p = sub.add_parser("evaluate")
    p.add_argument("--run", required=True); p.add_argument("--weights", required=True); p.add_argument("--cost-model", required=True)
    p.add_argument("--out", required=True); p.add_argument("--samples", default="8,16,32"); p.add_argument("--train", action="store_true")
    p.add_argument("--workers", type=int, default=8)
    p.set_defaults(fn=cmd_evaluate)
    args = ap.parse_args()
    args.fn(args)


if __name__ == "__main__":
    main()
