#!/usr/bin/env python3
"""Expert Lookahead: dataset index, trainer, offline evaluation, replay and export.

Registered into Tools/expert_lookahead.py as `train`, `evaluate`, `export` and `replay`.
Everything here consumes shards written by the native collector; the teacher is never loaded.
"""
import hashlib
import json
import math
import os
import random
import resource
import struct
import sys
import time
from pathlib import Path

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parent))
import expert_lookahead as xla  # noqa: E402

LAYERS, EXPERTS, TOPK, HIDDEN, HC = xla.LAYERS, xla.EXPERTS, xla.TOPK, xla.HIDDEN, xla.HC
CONTEXT = HC * HIDDEN
INPUT = CONTEXT + HIDDEN
OUTPUT = LAYERS * EXPERTS
RECORD_BYTES = xla.RECORD_BYTES
NORM_EPS = 1e-6
HORIZONS = [1, 2, 4, 8]


def bf16_to_f32(bits):
    return (bits.astype(np.uint32) << 16).view(np.float32)


def rms_normalize(x, eps=NORM_EPS):
    scale = np.sqrt(np.mean(np.square(x), axis=-1, keepdims=True) + eps)
    return x / scale


# ---------------------------------------------------------------- dataset index

class Dataset:
    """Verify-pass positions with their start features, per-layer labels and lazy x2 offsets.

    features: uint16 [N, INPUT] BF16 bits (context then embedding)
    labels:   uint16 [N, LAYERS, TOPK] ordered router IDs
    meta:     list of dict(request, pass_id, position, kept)
    x2_index: list of (shard_path, [offset per layer]) per pass, plus per-position row
    """

    def __init__(self, run_dir, request_ids=None, want_x2=False, limit=0):
        self.run_dir = Path(run_dir)
        rows = [r for r in xla.load_requests_jsonl(self.run_dir) if r.get("complete")]
        if request_ids is not None:
            keep = set(request_ids)
            rows = [r for r in rows if r["id"] in keep]
        if limit:
            rows = rows[:limit]
        features, labels, meta = [], [], []
        self.passes = []   # per verify pass: dict(request, pass_id, rows, shard, x2_offsets, positions(row indices), routes[48][rows,10])
        self.requests = {}
        for row in rows:
            demand_events, residency, admissions, pass_info = [], None, [], {}
            for shard in row["capture"]["shards"]:
                path = self.run_dir / "shards" / shard["path"]
                data = np.memmap(path, dtype=np.uint8, mode="r")
                view = memoryview(data)
                version, header_len = struct.unpack_from("<II", view, 4)
                offset = 12 + header_len
                total = len(view)
                while offset < total:
                    kind, length = struct.unpack_from("<II", view, offset)
                    payload = view[offset + 8: offset + 8 + length]
                    rec = xla.parse_record(kind, payload)
                    if kind == 1:
                        pass_info[rec["pass_id"]] = dict(request=row["id"], pass_id=rec["pass_id"], phase=rec["phase"],
                                                         tokens=rec["tokens"].tolist(), features={}, routes={},
                                                         x2=[None] * LAYERS, layer_nanos=[0] * LAYERS, kept=None,
                                                         begin=rec["nanos"], end=None, shard=str(path))
                    elif kind == 2:
                        pass_info[rec["pass_id"]]["features"][rec["position"]] = np.concatenate([rec["context"], rec["embedding"]])
                    elif kind == 3:
                        pass_info[rec["pass_id"]]["routes"][rec["layer"]] = rec["ids"].reshape(rec["rows"], rec["topk"])
                    elif kind == 4:
                        p = pass_info[rec["pass_id"]]
                        p["layer_nanos"][rec["layer"]] = rec["nanos"]
                        if rec["width"]:
                            p["x2"][rec["layer"]] = (offset + 8 + 24, rec["rows"], rec["width"])
                    elif kind == 5:
                        demand_events.append(rec)
                    elif kind == 6:
                        admissions.append(rec)
                    elif kind == 7:
                        residency = rec
                    elif kind == 8:
                        pass_info[rec["pass_id"]]["kept"] = rec["kept"]
                    elif kind == 9:
                        pass_info[rec["pass_id"]]["end"] = rec["nanos"]
                    offset += 8 + length
            self.requests[row["id"]] = dict(row=row, demand=demand_events, residency=residency, admissions=admissions,
                                            passes=pass_info)
            for pid in sorted(pass_info):
                p = pass_info[pid]
                if p["phase"] != 1 or len(p["routes"]) != LAYERS:
                    continue
                n = len(p["tokens"])
                positions = []
                for i in range(n):
                    if i not in p["features"]:
                        continue
                    positions.append(len(features))
                    features.append(p["features"][i])
                    labels.append(np.stack([p["routes"][l][i] for l in range(LAYERS)]))
                    meta.append(dict(request=row["id"], pass_id=pid, position=i, kept=p["kept"] is not None and i < p["kept"]))
                self.passes.append(dict(request=row["id"], pass_id=pid, rows=n, positions=positions,
                                        routes=p["routes"], x2=p["x2"] if want_x2 else None, shard=p["shard"],
                                        layer_nanos=p["layer_nanos"], begin=p["begin"], end=p["end"], kept=p["kept"]))
        self.features = np.stack(features).astype(np.uint16) if features else np.zeros((0, INPUT), np.uint16)
        self.labels = np.stack(labels).astype(np.uint16) if labels else np.zeros((0, LAYERS, TOPK), np.uint16)
        self.meta = meta
        self.want_x2 = want_x2
        self._maps = {}

    def __len__(self):
        return len(self.meta)

    def x2_rows(self, pass_entry, layer):
        """float32 [rows, HIDDEN] x2 of a completed layer, read lazily from the shard."""
        entry = pass_entry["x2"][layer]
        if entry is None:
            return None
        offset, rows, width = entry
        path = pass_entry["shard"]
        if path not in self._maps:
            self._maps[path] = np.memmap(path, dtype=np.uint8, mode="r")
        raw = np.frombuffer(self._maps[path], dtype="<u2", count=rows * width, offset=offset)
        return bf16_to_f32(raw.reshape(rows, width))

    def dense_targets(self, idx):
        """float32 [len(idx), LAYERS, EXPERTS] multi-hot from ordered IDs."""
        out = np.zeros((len(idx), LAYERS, EXPERTS), np.float32)
        lab = self.labels[idx]
        for j in range(len(idx)):
            out[j, np.arange(LAYERS)[:, None], lab[j].astype(np.int64)] = 1.0
        return out

    def summary(self):
        kept = sum(1 for m in self.meta if m["kept"])
        return dict(positions=len(self.meta), passes=len(self.passes), requests=len(self.requests), kept_positions=kept,
                    feature_bytes=int(self.features.nbytes))


# ---------------------------------------------------------------- models (MLX)

def mlx():
    import mlx.core as mx
    import mlx.nn as nn
    import mlx.optimizers as optim
    return mx, nn, optim


class GlobalModel:
    """12,800 -> width -> 24,576 with SiLU, biases and a per-position hidden bias."""

    def __init__(self, width, positions=3, seed=0):
        mx, _, _ = mlx()
        key = mx.random.key(seed)
        k1, k2 = mx.random.split(key)
        self.width = width
        self.params = {
            "w1": mx.random.normal((width, INPUT), key=k1) * (1.0 / math.sqrt(INPUT)),
            "b1": mx.zeros((width,)),
            "w2": mx.random.normal((OUTPUT, width), key=k2) * (1.0 / math.sqrt(width)),
            "b2": mx.zeros((OUTPUT,)),
            "position_bias": mx.zeros((positions, width)),
        }

    @staticmethod
    def forward(params, x, position):
        mx, _, _ = mlx()
        ctx = mx.fast.rms_norm(x[:, :CONTEXT], mx.ones((CONTEXT,)), NORM_EPS)
        emb = mx.fast.rms_norm(x[:, CONTEXT:], mx.ones((HIDDEN,)), NORM_EPS)
        h = mx.concatenate([ctx, emb], axis=1) @ params["w1"].T + params["b1"] + params["position_bias"][position]
        h = h * mx.sigmoid(h)
        return h @ params["w2"].T + params["b2"]

    def count(self):
        return sum(int(np.prod(v.shape)) for v in self.params.values())


class LayerModel:
    """Normalized x2 of completed layer L plus layer/horizon embeddings -> 128 -> 512 scores for layer L+d."""

    def __init__(self, width=128, embed=16, seed=0):
        mx, _, _ = mlx()
        key = mx.random.key(seed)
        k1, k2, k3, k4 = mx.random.split(key, 4)
        self.width, self.embed = width, embed
        self.params = {
            "w1": mx.random.normal((width, HIDDEN + 2 * embed), key=k1) * (1.0 / math.sqrt(HIDDEN + 2 * embed)),
            "b1": mx.zeros((width,)),
            "w2": mx.random.normal((EXPERTS, width), key=k2) * (1.0 / math.sqrt(width)),
            "b2": mx.zeros((EXPERTS,)),
            "layer_embedding": mx.random.normal((LAYERS, embed), key=k3) * 0.1,
            "horizon_embedding": mx.random.normal((len(HORIZONS), embed), key=k4) * 0.1,
        }

    @staticmethod
    def forward(params, x2, layer, horizon):
        mx, _, _ = mlx()
        x = mx.fast.rms_norm(x2, mx.ones((HIDDEN,)), NORM_EPS)
        h = mx.concatenate([x, params["layer_embedding"][layer], params["horizon_embedding"][horizon]], axis=1)
        h = h @ params["w1"].T + params["b1"]
        h = h * mx.sigmoid(h)
        return h @ params["w2"].T + params["b2"]

    def count(self):
        return sum(int(np.prod(v.shape)) for v in self.params.values())


def balanced_bce(logits, targets, groups):
    """Balanced multilabel BCE: per (example, group) the positives and negatives average separately.

    logits/targets: [B, groups*EXPERTS]. Selected experts weigh 0.5/K, the rest 0.5/(E-K).
    """
    mx, _, _ = mlx()
    logits = logits.reshape(-1, groups, EXPERTS)
    targets = targets.reshape(-1, groups, EXPERTS)
    positives = targets.sum(axis=-1, keepdims=True)
    negatives = EXPERTS - positives
    weights = targets * (0.5 / mx.maximum(positives, 1)) + (1 - targets) * (0.5 / mx.maximum(negatives, 1))
    per = mx.logaddexp(0.0, logits) - logits * targets   # BCE with logits
    return (per * weights).sum(axis=-1).mean()


def phys_footprint_gb():
    """macOS physical footprint (anonymous + compressed), the working-set number the plan's 8 GB
    ceiling means. RSS would also count clean file-backed pages of the memory-mapped shards."""
    import ctypes
    import ctypes.util
    try:
        libproc = ctypes.CDLL(ctypes.util.find_library("proc"))
        buf = ctypes.create_string_buffer(16 + 10 * 8)
        if libproc.proc_pid_rusage(os.getpid(), 0, buf) == 0:
            return int.from_bytes(buf.raw[72:80], "little") / 1e9
    except Exception:  # noqa: BLE001 - fall back to RSS below
        pass
    return resource.getrusage(resource.RUSAGE_SELF).ru_maxrss / 1e9


_peak_footprint = [0.0]


def peak_rss_gb():
    """Running maximum of the physical footprint sampled at each call."""
    _peak_footprint[0] = max(_peak_footprint[0], phys_footprint_gb())
    return _peak_footprint[0]


def recall_at_k(scores, labels, ks=(10, 16, 24, 32)):
    """scores: float [N, LAYERS, EXPERTS]; labels: uint16 [N, LAYERS, TOPK]. Returns {k: mean recall}."""
    out = {}
    n = scores.shape[0]
    for k in ks:
        top = np.argpartition(-scores, k - 1, axis=-1)[:, :, :k]
        hits = 0
        for i in range(n):
            for l in range(LAYERS):
                hits += len(set(top[i, l].tolist()) & set(labels[i, l].tolist()))
        out[k] = hits / (n * LAYERS * TOPK) if n else 0.0
    return out


# ---------------------------------------------------------------- train

def train_global(args, train_set, val_set, width, seed, out_dir):
    mx, nn, optim = mlx()
    mx.random.seed(seed)
    rng = np.random.default_rng(seed)
    model = GlobalModel(width, seed=seed)
    opt = optim.AdamW(learning_rate=args.lr, weight_decay=args.weight_decay)
    params = model.params
    state = opt.state
    batch = args.batch
    n = len(train_set)
    positions_np = np.array([m["position"] for m in train_set.meta], np.int32)
    val_positions = np.array([m["position"] for m in val_set.meta], np.int32)

    def loss_fn(p, x, pos, y):
        return balanced_bce(GlobalModel.forward(p, x, pos), y, LAYERS)

    grad_fn = mx.value_and_grad(loss_fn)
    log = dict(width=width, seed=seed, examples=n, validation=len(val_set), params=model.count(), epochs=[], batch=batch,
               lr=args.lr, weight_decay=args.weight_decay, clip=args.clip)
    best, best_epoch, patience = None, -1, 0
    started = time.time()
    steps = 0
    for epoch in range(args.epochs):
        order = rng.permutation(n)
        total, count = 0.0, 0
        for lo in range(0, n, batch):
            idx = order[lo: lo + batch]
            x = mx.array(bf16_to_f32(train_set.features[idx]))
            y = mx.array(train_set.dense_targets(idx).reshape(len(idx), -1))
            pos = mx.array(positions_np[idx])
            loss, grads = grad_fn(params, x, pos, y)
            grads, _ = optim.clip_grad_norm(grads, args.clip)
            params = opt.apply_gradients(grads, params)
            mx.eval(params, opt.state)
            total += float(loss) * len(idx)
            count += len(idx)
            steps += 1
            if args.max_steps and steps >= args.max_steps:
                break
        val_loss, val_recall = evaluate_global(params, val_set, val_positions, batch)
        entry = dict(epoch=epoch, train_loss=total / max(count, 1), val_loss=val_loss, recall=val_recall, steps=steps,
                     elapsed=time.time() - started, peak_rss_gb=peak_rss_gb())
        log["epochs"].append(entry)
        xla.log(f"G{width} seed {seed} epoch {epoch}: train {entry['train_loss']:.4f} val {val_loss:.4f} "
                f"recall@16 {val_recall[16]:.3f} ({entry['elapsed']:.0f} s, rss {entry['peak_rss_gb']:.2f} GB)")
        # Early stopping on validation loss (the balanced objective); recall is reported alongside.
        score = -val_loss
        if best is None or score > best + 1e-5:
            best, best_epoch, patience = score, epoch, 0
            save_global(params, width, out_dir / f"g{width}-s{seed}-best.npz")
        else:
            patience += 1
            if patience >= args.patience:
                break
        if peak_rss_gb() > args.rss_ceiling_gb:
            log["stopped"] = f"peak RSS {peak_rss_gb():.2f} GB exceeded the {args.rss_ceiling_gb} GB ceiling"
            break
        if args.max_steps and steps >= args.max_steps:
            break
    log["best_epoch"], log["best_val_loss"], log["elapsed"] = best_epoch, (-best if best is not None else None), time.time() - started
    log["best_recall16"] = log["epochs"][best_epoch]["recall"][16] if log["epochs"] else None
    return log


def evaluate_global(params, dataset, positions, batch):
    mx, _, _ = mlx()
    losses, scores = [], []
    for lo in range(0, len(dataset), batch):
        idx = np.arange(lo, min(lo + batch, len(dataset)))
        x = mx.array(bf16_to_f32(dataset.features[idx]))
        y = mx.array(dataset.dense_targets(idx).reshape(len(idx), -1))
        logits = GlobalModel.forward(params, x, mx.array(positions[idx]))
        losses.append(float(balanced_bce(logits, y, LAYERS)) * len(idx))
        scores.append(np.array(logits).reshape(len(idx), LAYERS, EXPERTS))
    if not scores:
        return 0.0, {k: 0.0 for k in (10, 16, 24, 32)}
    scores = np.concatenate(scores)
    return sum(losses) / len(dataset), recall_at_k(scores, dataset.labels)


def save_global(params, width, path):
    np.savez(path, **{k: np.array(v) for k, v in params.items()}, width=np.array(width))


def load_global(path):
    mx, _, _ = mlx()
    z = np.load(path)
    return {k: mx.array(z[k]) for k in ("w1", "b1", "w2", "b2", "position_bias")}, int(z["width"])


def layer_batches(dataset, rng, batch, shuffle=True, max_passes=0):
    """Stream (x2 rows, source layer, horizon index, labels) batches pass by pass from the shards.

    Every (pass, completed layer, horizon) pair is one example per evaluated row; nothing is held
    in memory beyond one pass and the accumulating batch, so the trainer stays inside its ceiling."""
    passes = [p for p in dataset.passes if p["x2"] is not None]
    if max_passes:
        passes = passes[:max_passes]
    order = rng.permutation(len(passes)) if shuffle else np.arange(len(passes))
    xs, ls, hs, ys = [], [], [], []
    count = 0
    for pi in order:
        p = passes[pi]
        for l in range(LAYERS):
            rows = dataset.x2_rows(p, l)
            if rows is None:
                continue
            for hi, d in enumerate(HORIZONS):
                tgt = l + d
                if tgt >= LAYERS:
                    continue
                xs.append(rows); ls.append(np.full(rows.shape[0], l, np.int32))
                hs.append(np.full(rows.shape[0], hi, np.int32)); ys.append(p["routes"][tgt])
                count += rows.shape[0]
                if count >= batch:
                    yield np.concatenate(xs), np.concatenate(ls), np.concatenate(hs), np.concatenate(ys)
                    xs, ls, hs, ys = [], [], [], []
                    count = 0
    if xs:
        yield np.concatenate(xs), np.concatenate(ls), np.concatenate(hs), np.concatenate(ys)


def train_layer(args, train_set, val_set, seed, out_dir):
    mx, nn, optim = mlx()
    mx.random.seed(seed)
    rng = np.random.default_rng(seed)
    if not any(p["x2"] is not None for p in train_set.passes) or not any(p["x2"] is not None for p in val_set.passes):
        return dict(skipped="no x2 features captured")
    model = LayerModel(seed=seed)
    opt = optim.AdamW(learning_rate=args.lr, weight_decay=args.weight_decay)
    params = model.params
    batch = args.batch

    def dense(y):
        out = np.zeros((len(y), EXPERTS), np.float32)
        out[np.arange(len(y))[:, None], y.astype(np.int64)] = 1.0
        return out

    def loss_fn(p, x, l, h, y):
        return balanced_bce(LayerModel.forward(p, x, l, h), y, 1)

    grad_fn = mx.value_and_grad(loss_fn)
    log = dict(model="L128", seed=seed, params=model.count(), epochs=[], batch=batch, lr=args.lr)
    best, patience, started, steps = None, 0, time.time(), 0
    for epoch in range(args.epochs):
        total, count = 0.0, 0
        for x, l, h, y in layer_batches(train_set, rng, batch):
            loss, grads = grad_fn(params, mx.array(x), mx.array(l), mx.array(h), mx.array(dense(y)))
            grads, _ = optim.clip_grad_norm(grads, args.clip)
            params = opt.apply_gradients(grads, params)
            mx.eval(params, opt.state)
            total += float(loss) * len(y); count += len(y)
            steps += 1
            if args.max_steps and steps >= args.max_steps:
                break
        hits = {d: 0 for d in HORIZONS}; n = {d: 0 for d in HORIZONS}
        for x, l, h, y in layer_batches(val_set, rng, batch, shuffle=False):
            logits = np.array(LayerModel.forward(params, mx.array(x), mx.array(l), mx.array(h)))
            top = np.argpartition(-logits, 15, axis=-1)[:, :16]
            for j in range(len(y)):
                d = HORIZONS[int(h[j])]
                hits[d] += len(set(top[j].tolist()) & set(y[j].tolist())); n[d] += TOPK
        recall = {d: (hits[d] / n[d] if n[d] else 0.0) for d in HORIZONS}
        entry = dict(epoch=epoch, train_loss=total / max(count, 1), examples=count, recall16_by_horizon=recall, steps=steps,
                     elapsed=time.time() - started, peak_rss_gb=peak_rss_gb())
        log["epochs"].append(entry)
        xla.log(f"L128 seed {seed} epoch {epoch}: train {entry['train_loss']:.4f} over {count} rows, recall@16 by horizon "
                + ", ".join(f"{d}:{r:.3f}" for d, r in recall.items()) + f" (rss {entry['peak_rss_gb']:.2f} GB)")
        score = recall[1]
        if best is None or score > best + 1e-4:
            best, patience = score, 0
            np.savez(out_dir / f"l128-s{seed}-best.npz", **{k: np.array(v) for k, v in params.items()})
        else:
            patience += 1
            if patience >= args.patience:
                break
        if peak_rss_gb() > args.rss_ceiling_gb:
            log["stopped"] = f"peak RSS {peak_rss_gb():.2f} GB exceeded the {args.rss_ceiling_gb} GB ceiling"
            break
        if args.max_steps and steps >= args.max_steps:
            break
    log["best_recall16_h1"], log["elapsed"] = best, time.time() - started
    return log


def cmd_train(args):
    proto = xla.read_json(args.protocol)
    run_dir = Path(args.run)
    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)
    have = xla.reclaimable_gb()
    if have < args.min_reclaimable_gb:
        raise SystemExit(f"{have:.1f} GB reclaimable, need {args.min_reclaimable_gb} GB before training")
    manifest = xla.corpus_manifest()
    split_of = {r["id"]: r["split"] for r in manifest["requests"]}
    rows = [r for r in xla.load_requests_jsonl(run_dir) if r.get("complete")]
    train_ids = [r["id"] for r in rows if split_of[r["id"]] == "train"]
    val_ids = [r["id"] for r in rows if split_of[r["id"]] == "validation"]
    if args.train_prefix:
        train_ids = train_ids[:args.train_prefix]
    if args.smoke:
        # Loop check only: trains on the validation shards. Never an evaluation.
        train_ids = train_ids or val_ids
    xla.log(f"loading {len(train_ids)} train and {len(val_ids)} validation requests from {run_dir}")
    want_x2 = "l128" in args.models
    train_set = Dataset(run_dir, train_ids, want_x2=want_x2)
    val_set = Dataset(run_dir, val_ids, want_x2=want_x2)
    xla.log(f"train {train_set.summary()} validation {val_set.summary()}")
    report = dict(schema="expert-lookahead-train-v1", run=str(run_dir), protocol=proto["run_id"],
                  train=train_set.summary(), validation=val_set.summary(), train_ids=train_ids, val_ids=val_ids,
                  models={}, started=time.strftime("%Y-%m-%dT%H:%M:%S"), packages=xla.package_versions())
    for spec in args.models.split(","):
        for seed in [int(s) for s in args.seeds.split(",")]:
            key = f"{spec}-s{seed}"
            if spec.startswith("g"):
                report["models"][key] = train_global(args, train_set, val_set, int(spec[1:]), seed, out_dir)
            elif spec == "l128":
                report["models"][key] = train_layer(args, train_set, val_set, seed, out_dir)
            else:
                raise SystemExit(f"unknown model {spec}")
            xla.write_json(out_dir / "train.json", report)
    report["finished"] = time.strftime("%Y-%m-%dT%H:%M:%S")
    report["peak_rss_gb"] = peak_rss_gb()
    xla.write_json(out_dir / "train.json", report)
    xla.log(f"training report written to {out_dir / 'train.json'}")


# ---------------------------------------------------------------- CLOCK replay reference

class ClockPool:
    """Replay of SlotPool.ensureCore's CLOCK: keys per slot, reference bits, hand, per-call pins."""

    def __init__(self, keys, bits, hand):
        self.keys = [int(k) for k in keys]
        self.bits = [bool(b) for b in bits]
        self.hand = int(hand)
        self.capacity = len(self.keys)
        self.map = {k: s for s, k in enumerate(self.keys) if k >= 0}

    def victim(self, pins):
        scanned = 0
        while True:
            s = self.hand
            self.hand = (self.hand + 1) % self.capacity
            if s in pins:
                scanned += 1
                if scanned >= 3 * self.capacity:
                    raise RuntimeError("pool exhausted in replay")
                continue
            if self.bits[s]:
                self.bits[s] = False
                scanned += 1
                continue
            return s

    def ensure(self, keys):
        """Returns (hits, misses, victims) in the native order; installs misses."""
        hits, miss_keys, pins = [], [], set()
        seen = set()
        for k in keys:
            if k in seen:
                continue
            seen.add(k)
            s = self.map.get(k)
            if s is not None:
                hits.append(k)
                pins.add(s)
            else:
                miss_keys.append(k)
        for s in pins:
            self.bits[s] = True
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
            self.bits[s] = True
        return hits, miss_keys, victims

    def admit(self, keys):
        for k in keys:
            s = self.map.get(k)
            if s is not None:
                self.bits[s] = True
                continue
            s = self.victim(set())
            old = self.keys[s]
            if old >= 0:
                self.map.pop(old, None)
            self.keys[s] = k
            self.map[k] = s
            self.bits[s] = True


def replay_request(entry, report_mismatches=8):
    """Replay a request's decode demand events from its residency snapshot; count native agreement."""
    res = entry["residency"]
    if res is None:
        return dict(skipped="no residency snapshot")
    pool = ClockPool(res["keys"], res["bits"], res["hand"])
    after = res["after"]
    if after < 0:
        # Early captures stamped -1: the snapshot follows the last prefill pass.
        prefill = [pid for pid, p in entry["passes"].items() if p["phase"] == 0]
        after = max(prefill) if prefill else -1
    events = [e for e in entry["demand"] if e["pass_id"] > after]
    ok, total, mismatches = 0, 0, []
    native_misses, native_hits = 0, 0
    for e in events:
        keys = [int(e["layer"]) * EXPERTS + int(x) for x in e["unique"]]
        hits, misses, victims = pool.ensure(keys)
        native_hits += len(e["hit"])
        native_misses += len(e["miss"])
        total += 1
        expected_miss = [int(e["layer"]) * EXPERTS + int(x) for x in e["miss"]]
        if misses == expected_miss and victims == [int(v) for v in e["victims"]]:
            ok += 1
        elif len(mismatches) < report_mismatches:
            mismatches.append(dict(pass_id=int(e["pass_id"]), layer=int(e["layer"]), expected_miss=len(expected_miss),
                                   got_miss=len(misses), expected_victims=[int(v) for v in e["victims"]][:6],
                                   got_victims=victims[:6]))
    return dict(events=total, exact=ok, native_hits=native_hits, native_misses=native_misses, mismatches=mismatches)


def cmd_replay(args):
    run_dir = Path(args.run)
    ds = Dataset(run_dir, limit=args.limit)
    results = {}
    exact = total = 0
    for rid, entry in ds.requests.items():
        r = replay_request(entry)
        results[rid] = r
        if "events" in r:
            exact += r["exact"]
            total += r["events"]
    report = dict(requests=len(results), events=total, exact=exact, fraction=(exact / total if total else None),
                  per_request={k: {kk: vv for kk, vv in v.items() if kk != "mismatches"} for k, v in results.items()},
                  sample_mismatches=[m for v in results.values() for m in v.get("mismatches", [])][:20])
    xla.write_json(run_dir / "replay.json", report)
    print(json.dumps({k: v for k, v in report.items() if k not in ("per_request",)}, indent=1)[:4000])
    if total and exact != total:
        print("REPLAY MISMATCH")
        raise SystemExit(2)
    print("REPLAY PASS: CLOCK replay reproduces every native miss list and victim choice")


# ---------------------------------------------------------------- offline evaluation

def frequency_table(dataset):
    counts = np.zeros((LAYERS, EXPERTS), np.float64)
    for l in range(LAYERS):
        np.add.at(counts[l], dataset.labels[:, l, :].reshape(-1).astype(np.int64), 1)
    return counts / max(len(dataset), 1)


class BoundedScheduler:
    """Offline twin of ExpertPrefetchScheduler under the recorded pass timeline.

    Reads are issued per layer window at the completed-layer ticks recorded natively (layer_nanos),
    served by `lanes` parallel lanes at `service_ns` per piece-set (one record), and become usable
    when complete before the layer's demand start. Bytes stay charged until the layer they target
    completes. This is the scheduler's own arithmetic, not a native measurement.
    """

    def __init__(self, cap_records=32, lanes=8, window=4, top=16, service_ns=None):
        self.cap, self.lanes, self.window, self.top = cap_records, lanes, window, top
        self.service_ns = service_ns

    def run(self, candidates, pass_timeline, resident, demand):
        """candidates: [LAYERS] lists of expert ids; pass_timeline: dict(begin, layer_nanos[48], demand_start[48]);
        resident: set of keys resident at pass start; demand: [LAYERS] set of expert ids actually missed.
        Returns per-layer (timely, issued, wasted) counts and the issued keys."""
        lane_free = [pass_timeline["begin"]] * self.lanes
        live = []   # (target_layer, key, done_at)
        timely = np.zeros(LAYERS, int); issued = np.zeros(LAYERS, int); wasted = np.zeros(LAYERS, int)
        issued_keys = set()
        issued_through = -1

        def issue(up_to, now):
            nonlocal issued_through
            layer = issued_through + 1
            while layer <= up_to:
                for e in candidates[layer]:
                    key = layer * EXPERTS + int(e)
                    if key in resident or key in issued_keys:
                        continue
                    if len(live) >= self.cap:
                        return
                    lane = int(np.argmin(lane_free))
                    start = max(lane_free[lane], now)
                    done = start + self.service_ns
                    lane_free[lane] = done
                    live.append((layer, key, done))
                    issued_keys.add(key)
                    issued[layer] += 1
                issued_through = layer
                layer += 1

        issue(min(LAYERS - 1, self.window - 1), pass_timeline["begin"])
        for layer in range(LAYERS):
            deadline = pass_timeline["demand_start"][layer]
            for (target, key, done) in [x for x in live if x[0] == layer]:
                e = key - layer * EXPERTS
                if e in demand[layer] and done <= deadline:
                    timely[layer] += 1
                else:
                    wasted[layer] += 1
            live[:] = [x for x in live if x[0] > layer]
            issue(min(LAYERS - 1, layer + self.window), pass_timeline["layer_nanos"][layer])
        return timely, issued, wasted


def pass_timeline(entry, pass_entry, demand_by_pass):
    """Demand start per layer from recorded demand events; begin from the pass record."""
    starts = [0] * LAYERS
    for e in demand_by_pass.get(pass_entry["pass_id"], []):
        if 0 <= e["layer"] < LAYERS:
            starts[e["layer"]] = e["start"]
    for l in range(LAYERS):
        if starts[l] == 0:
            starts[l] = pass_entry["layer_nanos"][l - 1] if l else pass_entry["begin"]
    return dict(begin=pass_entry["begin"], layer_nanos=pass_entry["layer_nanos"], demand_start=starts)


def cmd_evaluate(args):
    """Offline pilot evaluation: recall, then timely coverage / precision / amplification for every
    policy under the bounded scheduler on the recorded pass timelines, sweeping the per-layer
    candidate count (and, for packs, a score threshold) to calibrate admission on validation."""
    mx, _, _ = mlx()
    run_dir = Path(args.run)
    manifest = xla.corpus_manifest()
    split_of = {r["id"]: r["split"] for r in manifest["requests"]}
    rows = [r for r in xla.load_requests_jsonl(run_dir) if r.get("complete")]
    val_ids = [r["id"] for r in rows if split_of[r["id"]] == "validation"]
    train_ids = [r["id"] for r in rows if split_of[r["id"]] == "train"]
    if args.limit:
        val_ids = val_ids[:args.limit]
    xla.log(f"evaluating on {len(val_ids)} validation requests")
    layer_packs = {}
    for spec in (args.layer_packs.split(",") if args.layer_packs else []):
        z = np.load(spec)
        layer_packs[Path(spec).stem] = {k: mx.array(z[k]) for k in ("w1", "b1", "w2", "b2", "layer_embedding", "horizon_embedding")}
    val = Dataset(run_dir, val_ids, want_x2=bool(layer_packs))
    freq = frequency_table(Dataset(run_dir, train_ids)) if train_ids else np.zeros((LAYERS, EXPERTS))
    packs = {}
    for spec in (args.packs.split(",") if args.packs else []):
        params, width = load_global(spec)
        packs[Path(spec).stem] = (params, width)
    tops = [int(x) for x in args.tops.split(",")]
    horizon_index = HORIZONS.index(args.layer_horizon)
    service_samples = []
    for rid in val_ids:
        for e in val.requests[rid]["demand"]:
            n = len(e["miss"])
            if n and e["read"] > e["start"]:
                service_samples.append((e["read"] - e["start"]) / n)
    service_ns = float(np.median(service_samples)) if service_samples else 2_000_000.0
    xla.log(f"median demand service {service_ns/1e6:.3f} ms per record from {len(service_samples)} events")
    # Pass-level inputs, computed once.
    passes = []
    prev_routes = {}
    recall = {name: [] for name in list(packs) + ["frequency"]}
    for p in val.passes:
        entry = val.requests[p["request"]]
        demand_by_pass = {}
        for e in entry["demand"]:
            demand_by_pass.setdefault(e["pass_id"], []).append(e)
        events = demand_by_pass.get(p["pass_id"], [])
        actual = [sorted(set(p["routes"][l].reshape(-1).tolist())) for l in range(LAYERS)]
        previous = prev_routes.get(p["request"])
        merged = []
        for l in range(LAYERS):
            ordered = list(actual[l])
            if previous:
                ordered += [e for e in previous[l] if e not in set(actual[l])]
            merged.append(ordered)
        prev_routes[p["request"]] = merged
        if len(events) < LAYERS:
            continue
        misses = [set() for _ in range(LAYERS)]
        resident = set()
        for e in events:
            misses[e["layer"]] = set(int(x) for x in e["miss"])
            for h in e["hit"]:
                resident.add(e["layer"] * EXPERTS + int(h))
        item = dict(timeline=pass_timeline(entry, p, demand_by_pass), resident=resident, misses=misses, actual=actual,
                    recent=previous, scores={})
        if p["positions"]:
            idx = np.array(p["positions"])
            x = mx.array(bf16_to_f32(val.features[idx]))
            pos = mx.array(np.array([val.meta[i]["position"] for i in idx], np.int32))
            for name, (params, width) in packs.items():
                scores = np.array(GlobalModel.forward(params, x, pos)).reshape(len(idx), LAYERS, EXPERTS)
                recall[name].append(recall_at_k(scores, val.labels[idx]))
                item["scores"][name] = scores.max(axis=0)
            recall["frequency"].append(recall_at_k(np.broadcast_to(freq, (len(idx), LAYERS, EXPERTS)), val.labels[idx]))
        for name, lp in layer_packs.items():
            xs, ls = [], []
            for l in range(LAYERS - args.layer_horizon):
                x2rows = val.x2_rows(p, l)
                if x2rows is None:
                    continue
                xs.append(x2rows); ls.append(np.full(x2rows.shape[0], l, np.int32))
            if not xs:
                continue
            x = np.concatenate(xs); layer_ids = np.concatenate(ls)
            logits = np.array(LayerModel.forward(lp, mx.array(x), mx.array(layer_ids),
                                                 mx.array(np.full(len(layer_ids), horizon_index, np.int32))))
            target_scores = np.full((LAYERS, EXPERTS), -np.inf, np.float32)
            for l in range(LAYERS - args.layer_horizon):
                sel = layer_ids == l
                if sel.any():
                    target_scores[l + args.layer_horizon] = logits[sel].max(axis=0)
            item["scores"][name] = target_scores
        passes.append(item)
    xla.log(f"{len(passes)} complete verification passes with demand events")

    def run_policy(candidates_of, top, factor=1.0):
        totals = dict(timely=0, issued=0, wasted=0, misses=0, passes=0)
        for item in passes:
            sched = BoundedScheduler(cap_records=args.cap, lanes=args.lanes, window=args.window, top=top,
                                     service_ns=service_ns * factor)
            timely, issued, wasted = sched.run(candidates_of(item, top), item["timeline"], item["resident"], item["misses"])
            totals["timely"] += int(timely.sum()); totals["issued"] += int(issued.sum()); totals["wasted"] += int(wasted.sum())
            totals["misses"] += sum(len(m) for m in item["misses"]); totals["passes"] += 1
        m = totals["misses"] or 1
        totals.update(timely_coverage=totals["timely"] / m, precision=(totals["timely"] / totals["issued"] if totals["issued"] else 0.0),
                      traffic_amplification=(m + totals["issued"] - totals["timely"]) / m)
        return totals

    def oracle(item, top):
        return [[e for e in item["actual"][l] if e in item["misses"][l]] for l in range(LAYERS)]

    def frequency(item, top):
        return [np.argsort(-freq[l])[:top].tolist() for l in range(LAYERS)]

    def recent(item, top):
        return [(item["recent"][l][:top] if item["recent"] else []) for l in range(LAYERS)]

    def pack_policy(name, threshold):
        def inner(item, top):
            s = item["scores"].get(name)
            if s is None:
                return [[] for _ in range(LAYERS)]
            out = []
            for l in range(LAYERS):
                order = np.argsort(-s[l])[:top]
                out.append([int(e) for e in order if s[l][e] >= threshold])
            return out
        return inner

    io = sum(r["stats"]["decodeIOSeconds"] for r in rows if r["id"] in set(val_ids))
    decode = sum(r["stats"]["decodeSeconds"] for r in rows if r["id"] in set(val_ids))

    def projected(cov):
        return decode / max(decode - cov * io, 1e-9)

    summary = {}
    summary["oracle"] = run_policy(oracle, 512)
    summary["oracle"]["coverage_by_service_factor"] = {str(f): run_policy(oracle, 512, f)["timely_coverage"] for f in (1.5, 2.0)}
    sweeps = {}
    for name, fn in [("frequency", frequency), ("recent", recent)]:
        sweeps[name] = {str(top): run_policy(fn, top) for top in tops}
    for gname in packs:
        for lname in layer_packs:
            combo = f"{gname}+{lname}"
            for item in passes:
                if gname in item["scores"] and lname in item["scores"]:
                    merged = item["scores"][lname].copy()
                    missing = ~np.isfinite(merged).any(axis=1)
                    merged[missing] = item["scores"][gname][missing]
                    item["scores"][combo] = merged
    for name in list(packs) + list(layer_packs) + [f"{g}+{l}" for g in packs for l in layer_packs]:
        stacked = [item["scores"][name] for item in passes if name in item["scores"]]
        if not stacked:
            continue
        all_scores = np.stack(stacked)
        all_scores = all_scores[np.isfinite(all_scores)]
        quantiles = {"none": -np.inf}
        for q in (0.90, 0.95, 0.98, 0.99):
            quantiles[f"q{q:.2f}"] = float(np.quantile(all_scores, q))
        sweeps[name] = {}
        for top in tops:
            for qname, thr in quantiles.items():
                sweeps[name][f"top{top}-{qname}"] = dict(run_policy(pack_policy(name, thr), top), threshold=(None if thr == -np.inf else thr))
    chosen = {}
    for name, table in sweeps.items():
        best = None
        for key, r in table.items():
            r["projected_throughput_ratio"] = projected(r["timely_coverage"])
            if r["traffic_amplification"] <= args.amplification_bound and (best is None or r["timely_coverage"] > table[best]["timely_coverage"]):
                best = key
        chosen[name] = dict(setting=best, **(table[best] if best else {}))
        summary[name] = dict(sweep=table, chosen=chosen[name])
    summary["oracle"]["projected_throughput_ratio"] = projected(summary["oracle"]["timely_coverage"])
    for name, lst in recall.items():
        if lst:
            summary.setdefault(name, {})["recall"] = {k: float(np.mean([d[k] for d in lst])) for k in (10, 16, 24, 32)}
    report = dict(schema="expert-lookahead-evaluate-v2", run=str(run_dir), validation_requests=val_ids, policies=summary,
                  scheduler=dict(cap=args.cap, lanes=args.lanes, window=args.window, tops=tops, service_ns=service_ns,
                                 amplification_bound=args.amplification_bound),
                  baseline=dict(decode_seconds=decode, decode_io_seconds=io, io_fraction=(io / decode if decode else None),
                                passes=len(passes)))
    xla.write_json(Path(args.out), report)
    print(json.dumps({"baseline": report["baseline"], "oracle": {k: summary["oracle"][k] for k in ("timely_coverage", "projected_throughput_ratio", "coverage_by_service_factor")},
                      "chosen": chosen, "recall": {k: v.get("recall") for k, v in summary.items() if isinstance(v, dict) and "recall" in v}},
                     indent=1, default=float))


# ---------------------------------------------------------------- export

def cmd_export(args):
    from safetensors.numpy import save_file
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    if args.kind == "mlp":
        z = np.load(args.weights)
        width = int(z["width"])
        tensors = {k: z[k].astype(np.float32 if args.dtype == "float32" else np.float16)
                   for k in ("w1", "b1", "w2", "b2", "position_bias")}
        description = dict(schema="expert-lookahead-pack-v1", kind="mlp", width=width, input=INPUT, output=OUTPUT,
                           positions=int(tensors["position_bias"].shape[0]))
    elif args.kind == "table":
        z = np.load(args.weights)
        scores = z["scores"].astype(np.float32)
        tensors = {"scores": scores}
        description = dict(schema="expert-lookahead-pack-v1", kind="table", input=INPUT, output=OUTPUT)
    else:
        raise SystemExit("kind must be mlp or table")
    for k, v in tensors.items():
        if not np.all(np.isfinite(v)):
            raise SystemExit(f"tensor {k} is not finite")
    save_file(tensors, str(out / "tensors.safetensors"))
    description.update(dict(layers=LAYERS, experts=EXPERTS, context=CONTEXT, embedding=HIDDEN, normEps=NORM_EPS,
                            dtype=args.dtype, tensors="tensors.safetensors",
                            tensorsSha256=hashlib.sha256((out / "tensors.safetensors").read_bytes()).hexdigest(),
                            checkpointIdentity=args.checkpoint_identity or "", training={"source": str(args.weights)}))
    xla.write_json(out / "pack.json", description)
    xla.log(f"pack written to {out} ({description['tensorsSha256'][:12]})")
    print(json.dumps(description, indent=1))


def cmd_fixture(args):
    """C10 fixture: validation feature rows plus Python scores for the native parity command."""
    from safetensors.numpy import save_file
    run_dir = Path(args.run)
    ds = Dataset(run_dir, limit=args.limit)
    if not len(ds):
        raise SystemExit("no features")
    params, width = load_global(args.weights)
    mx, _, _ = mlx()
    idx = np.arange(min(args.rows, len(ds)))
    positions = np.array([ds.meta[i]["position"] for i in idx], np.int32)
    x = bf16_to_f32(ds.features[idx])
    scores = np.array(GlobalModel.forward(params, mx.array(x), mx.array(positions))).astype(np.float32)
    save_file({"features": ds.features[idx].astype(np.uint16), "positions": positions, "scores": scores}, args.out)
    xla.log(f"fixture with {len(idx)} rows written to {args.out}")


def register(sub):
    p = sub.add_parser("train", help="Train G64/G128/L128 from shards")
    p.add_argument("--protocol", required=True); p.add_argument("--run", required=True); p.add_argument("--out", required=True)
    p.add_argument("--models", default="g128"); p.add_argument("--seeds", default="17")
    p.add_argument("--batch", type=int, default=512); p.add_argument("--lr", type=float, default=3e-4)
    p.add_argument("--weight-decay", type=float, default=1e-4); p.add_argument("--clip", type=float, default=1.0)
    p.add_argument("--epochs", type=int, default=20); p.add_argument("--patience", type=int, default=3)
    p.add_argument("--max-steps", type=int, default=0); p.add_argument("--train-prefix", type=int, default=0)
    p.add_argument("--rss-ceiling-gb", type=float, default=8.0); p.add_argument("--min-reclaimable-gb", type=float, default=12.0)
    p.add_argument("--smoke", action="store_true", help="loop check on validation shards; not an evaluation")
    p.set_defaults(func=cmd_train)
    p = sub.add_parser("replay", help="CLOCK replay reference against native miss lists")
    p.add_argument("--run", required=True); p.add_argument("--limit", type=int, default=0)
    p.set_defaults(func=cmd_replay)
    p = sub.add_parser("evaluate", help="Offline coverage/precision/amplification under the bounded scheduler")
    p.add_argument("--run", required=True); p.add_argument("--out", required=True); p.add_argument("--packs", default="")
    p.add_argument("--cap", type=int, default=32); p.add_argument("--lanes", type=int, default=8)
    p.add_argument("--window", type=int, default=4); p.add_argument("--tops", default="2,4,8,16")
    p.add_argument("--amplification-bound", type=float, default=1.20); p.add_argument("--limit", type=int, default=0)
    p.add_argument("--layer-packs", default="", help="L128 npz weights, evaluated at --layer-horizon")
    p.add_argument("--layer-horizon", type=int, default=4)
    p.set_defaults(func=cmd_evaluate)
    p = sub.add_parser("export", help="Write a native prediction pack")
    p.add_argument("--weights", required=True); p.add_argument("--out", required=True); p.add_argument("--kind", default="mlp")
    p.add_argument("--dtype", default="float32"); p.add_argument("--checkpoint-identity", default="")
    p.set_defaults(func=cmd_export)
    p = sub.add_parser("fixture", help="C10 parity fixture from validation features")
    p.add_argument("--run", required=True); p.add_argument("--weights", required=True); p.add_argument("--out", required=True)
    p.add_argument("--rows", type=int, default=64); p.add_argument("--limit", type=int, default=4)
    p.set_defaults(func=cmd_fixture)
