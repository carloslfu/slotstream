#!/usr/bin/env python3
"""Expert Lookahead experiment driver (plan record expert-lookahead-local-experiment-2026-09-10).

Subcommands, in dependency order:
  prepare        freeze protocol.json: identities, pinned flags, memory profile, arithmetic, fixtures
  requests       materialize a request list for the native capture command
  capture        drive `slotstream expert-lookahead-capture` with preflight, resume and logging
  validate-data  C03 shard integrity plus C02 feature/label joins and the router digest cross-check
  parity         C01 capture-on versus capture-off exact outputs and router digests
  replay         no-prefetch CLOCK replay reproducing native hit/miss counts from the shards
  train          MLX Python trainer for G64/G128 and L128 from shards
  evaluate       recall, calibrated replay coverage, cheap baselines and the bounded oracle
  export         write a native prediction pack (safetensors + pack.json)
  bench          paired fresh-process arms (B0/B1/B2) with readiness checks
  report         paired summaries with the frozen bootstrap

Every JSON it writes is append-only per run directory; a failed run is preserved, never edited.
"""
import argparse
import hashlib
import json
import math
import os
import platform
import random
import shutil
import struct
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "Tools"))
import expert_lookahead_corpus as corpus  # noqa: E402
from prefill_bench import vm_snapshot, model_identity, digest, host_conditions  # noqa: E402

RUNS = ROOT / ".build/expert-lookahead"
CORPUS = ROOT / "Tools/fixtures/expert-lookahead/corpus.json"
MODEL = Path.home() / ".slotstream/models/qwen38-flash-next-mlx-4bit"
LAYERS, EXPERTS, TOPK, HIDDEN, HC = 48, 512, 10, 2560, 4
RECORD_BYTES = 2_764_800
PINNED_ENV = {
    "SLOTSTREAM_DRAFT_DEPTH": "2",
    "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
    "SLOTSTREAM_OPT_MTP_TAIL": "0",
    "SLOTSTREAM_PREFILL_CHUNK": "256",
    "SLOTSTREAM_PREFIX_CACHE": "0",
}
MEMORY_PROFILES = [24.0, 20.0, 16.0]   # plan: 24 GB primary, lower profiles are separate frozen experiments
PREFLIGHT_MARGIN_GB = 5.0
BOOTSTRAP_DRAWS, BOOTSTRAP_SEED = 10_000, 1729


def log(msg):
    print(f"[{time.strftime('%H:%M:%S')}] {msg}", flush=True)


def sha256_bytes(data):
    return hashlib.sha256(data).hexdigest()


def read_json(path):
    with open(path) as f:
        return json.load(f)


def write_json(path, payload):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_suffix(path.suffix + ".tmp")
    with open(tmp, "w") as f:
        json.dump(payload, f, indent=1, sort_keys=True)
    os.replace(tmp, path)


def git_head():
    return subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()


def git_dirty():
    return subprocess.check_output(["git", "status", "--porcelain"], cwd=ROOT, text=True).strip().splitlines()


def build_identity(binary):
    path = Path(binary).resolve().parent / "build-identity.json"
    return read_json(path) if path.exists() else None


def reclaimable_gb():
    return vm_snapshot()["reclaimable_bytes"] / 1e9


def choose_memory_profile(explicit=None):
    """The largest frozen profile whose preflight (target + margin) is reclaimable now."""
    have = reclaimable_gb()
    candidates = [explicit] if explicit else MEMORY_PROFILES
    for target in candidates:
        if have >= target + PREFLIGHT_MARGIN_GB:
            return target, have
    raise SystemExit(f"no memory profile fits: {have:.2f} GB reclaimable, smallest profile needs "
                     f"{min(candidates) + PREFLIGHT_MARGIN_GB:.1f} GB")


def preflight_or_wait(needed_gb, max_wait=600, interval=15):
    """Model lock free and reclaimable memory above the need, waiting up to the plan's 600 s."""
    from prefill_bench import preflight, InsufficientHeadroom
    deadline = time.monotonic() + max_wait
    while True:
        try:
            return preflight(needed_gb)
        except InsufficientHeadroom as e:
            if time.monotonic() >= deadline:
                raise SystemExit(f"preflight failed after {max_wait}s: {e}")
            log(f"waiting for headroom: {e}")
            time.sleep(interval)


def run_env(proto, extra=None):
    env = dict(os.environ)
    for k in list(env):
        if k.startswith("SLOTSTREAM_"):
            del env[k]
    env.update(proto["env"])
    if extra:
        env.update(extra)
    return env


def corpus_manifest():
    manifest = read_json(CORPUS)
    manifest["_sha256"] = sha256_bytes(CORPUS.read_bytes())
    return manifest


def request_payload(manifest, ids):
    by_id = {r["id"]: r for r in manifest["requests"]}
    out = []
    for rid in ids:
        r = by_id[rid]
        messages = [{"role": m["role"], "content": m["content"]} for m in corpus.materialize(r)]
        out.append({"id": rid, "family": r["family"], "split": r["split"], "kind": r["kind"],
                    "messages": messages, "max_tokens": r["cap"],
                    "prompt_sha256": request_digest(messages), "corpus_prompt_sha256": r["prompt_sha256"]})
    return out


def request_digest(messages):
    """The digest the native capture/bench commands recompute: role and content, newline-joined."""
    return sha256_bytes("\n".join(f"{m['role']}\n{m['content']}" for m in messages).encode())


# ---------------------------------------------------------------- prepare

ELIGIBILITY_RULES = {
    "swap-stable-120s": {
        "name": "swap-stable-120s",
        "readiness": "thermal nominal, low power off, reclaimable memory at or above the preflight, host swap-in and "
                     "swap-out counters unchanged over a 120 s sample (at most 600 s waiting)",
        "eligible": "both arms complete with exact output IDs and router digests, no host swap-in or swap-out delta "
                    "during either arm, thermal nominal afterwards",
    },
    "process-pageins-v1": {
        "name": "process-pageins-v1",
        "readiness": "thermal nominal, low power off, reclaimable memory at or above the preflight, host swap-out "
                     "counter unchanged over a 30 s sample (at most 600 s waiting); swap-ins are not a readiness input",
        "eligible": "both arms complete with exact output IDs and router digests, no host swap-out delta during either "
                    "arm, the engine process's own page-ins (proc_pid_rusage ri_pageins, which also counts file-backed "
                    "faults) grow by at most page_in_threshold_pages during the measured request, thermal nominal afterwards",
        "page_in_threshold_pages": 4096,
        "page_in_threshold_status": "placeholder until the W0 pre-measurement of a clean 512-output request",
        "page_bytes": 16384,
        "both_verdicts_recorded": True,
        "headline_uses": "process-pageins-v1",
    },
}


def successor_fields(args):
    """Protocol v2 additions: predecessor dataset identity re-verified byte by byte, tool hashes and
    the frozen timing-eligibility rule. Everything here is read-only."""
    out = {"tools_sha256": {str(p.relative_to(ROOT)): digest(p) for p in sorted(ROOT.glob("Tools/expert_lookahead*.py"))}}
    rule = getattr(args, "eligibility", None)
    if rule:
        if rule not in ELIGIBILITY_RULES:
            raise SystemExit(f"unknown eligibility rule {rule}; known: {sorted(ELIGIBILITY_RULES)}")
        out["eligibility_rule"] = dict(ELIGIBILITY_RULES[rule])
        if getattr(args, "eligibility_approval", None):
            out["eligibility_rule"]["approval"] = args.eligibility_approval
    pred = getattr(args, "successor_of", None)
    if pred:
        pred_dir = Path(pred).resolve()
        pred_proto = read_json(pred_dir / "protocol.json")
        capture_dir = pred_dir / (getattr(args, "successor_capture", None) or "pilot")
        header = read_json(capture_dir / "run.json")
        rows = load_requests_jsonl(capture_dir)
        shards, total_bytes, problems = [], 0, []
        for row in rows:
            if not row.get("complete"):
                continue
            for shard in row["capture"]["shards"]:
                path = capture_dir / "shards" / shard["path"]
                if not path.exists():
                    problems.append(f"{shard['path']}: missing")
                    continue
                size = path.stat().st_size
                sha = digest(path)
                if size != shard["bytes"] or sha != shard["sha256"]:
                    problems.append(f"{shard['path']}: size {size} sha {sha[:12]} != recorded {shard['bytes']} {shard['sha256'][:12]}")
                shards.append(dict(request=row["id"], path=shard["path"], bytes=size, sha256=sha, records=shard.get("records")))
                total_bytes += size
        if problems:
            raise SystemExit("predecessor shards altered or missing (recapture required):\n  " + "\n  ".join(problems))
        out["schema"] = "expert-lookahead-protocol-v2"
        out["predecessor"] = dict(
            run_id=pred_proto["run_id"], protocol=str(pred_dir / "protocol.json"),
            protocol_sha256=digest(pred_dir / "protocol.json"), capture_dir=str(capture_dir),
            run_json_sha256=digest(capture_dir / "run.json"), requests_jsonl_sha256=digest(capture_dir / "requests.jsonl"),
            capture_executable_sha256=header.get("executable_sha256"), capture_build_identity=header.get("build_identity"),
            capture_model_dir=header.get("model_dir"), capture_pool_slots=header.get("pool_slots"),
            capture_schema=header.get("schema"), capture_version=header.get("version"),
            complete_requests=sum(1 for r in rows if r.get("complete")), rows=len(rows),
            shards=len(shards), shard_bytes=total_bytes, shards_verified=True, shard_list=shards,
            corpus_sha256=pred_proto["corpus_sha256"], memory_gb=pred_proto["memory_gb"])
        if pred_proto["corpus_sha256"] != corpus_manifest()["_sha256"]:
            raise SystemExit("corpus manifest changed since the predecessor protocol; the split is not the same")
    return out


def cmd_prepare(args):
    binary = Path(args.binary).resolve()
    if not binary.exists():
        raise SystemExit(f"binary missing: {binary}")
    manifest = corpus_manifest()
    if getattr(args, "allow_insufficient_preflight", False):
        # The successor protocol fixes the profile its evidence was measured in; the native
        # packages re-run the real preflight at every launch. This records, never simulates.
        if not args.memory_gb:
            raise SystemExit("--allow-insufficient-preflight requires an explicit --memory-gb profile")
        target, have = float(args.memory_gb), reclaimable_gb()
    else:
        target, have = choose_memory_profile(args.memory_gb)
    run_id = args.run_id or time.strftime("xla-%Y%m%d-%H%M%S")
    run_dir = RUNS / run_id
    if run_dir.exists():
        raise SystemExit(f"run directory exists: {run_dir}")
    rng = random.Random(BOOTSTRAP_SEED)
    pilot = corpus.select_pilot(manifest, random.Random(manifest["seed"]))
    by_id = {r["id"]: r for r in manifest["requests"]}
    # Small correctness corpus: one validation request per kind, shortest prompts first.
    correctness = []
    for kind in corpus.KINDS:
        rows = sorted((r for r in manifest["requests"] if r["split"] == "validation" and r["kind"] == kind),
                      key=lambda r: r.get("prompt_tokens_estimate", 0))
        correctness.append(rows[0]["id"])
    b0 = {}
    for kind in corpus.KINDS:
        rows = [r for r in manifest["requests"] if r["split"] == "test" and r["kind"] == kind]
        rng.shuffle(rows)
        chosen = rows[:2]
        for r in chosen:
            assert manifest["families"][r["family"]] == "test"
        b0[kind] = [r["id"] for r in chosen]
    screen = {kind: [r["id"] for r in sorted((r for r in manifest["requests"] if r["split"] == "validation" and r["kind"] == kind),
                                             key=lambda r: r["id"])[:2]] for kind in ["code", "reasoning", "prose"]}
    proto = {
        "schema": "expert-lookahead-protocol-v1",
        "run_id": run_id,
        "created": time.strftime("%Y-%m-%dT%H:%M:%S%z"),
        "git_head": git_head(),
        "git_dirty_paths": git_dirty(),
        "binary": str(binary),
        "binary_sha256": digest(binary),
        "metallib_sha256": digest(binary.parent / "mlx.metallib") if (binary.parent / "mlx.metallib").exists() else None,
        "build_identity": build_identity(binary),
        "model_dir": str(MODEL),
        "model_identity": model_identity(MODEL),
        "python": platform.python_version(),
        "python_executable": sys.executable,
        "packages": package_versions(),
        "corpus_path": str(CORPUS.relative_to(ROOT)),
        "corpus_sha256": manifest["_sha256"],
        "corpus_git_head": manifest["git_head"],
        "env": dict(PINNED_ENV),
        "draft_depth": 2,
        "prefill_chunk": 256,
        "memory_gb": target,
        "memory_profiles_considered": MEMORY_PROFILES,
        "preflight_margin_gb": PREFLIGHT_MARGIN_GB,
        "reclaimable_gb_at_freeze": round(have, 3),
        "max_context": 32768,
        "mtp": "on",
        "seed": 42,
        "thinking": False,
        "greedy": True,
        "pilot_request_ids": pilot,
        "correctness_request_ids": correctness,
        "screen_prompt_ids": screen,
        "b0_prompt_ids": b0,
        "b0_rounds": 3,
        "b0_warmup_tokens": 128,
        "b0_max_tokens": 512,
        "screen_rounds": 2,
        "screen_max_tokens": 128,
        "arithmetic": {
            "B0": "TPS_on/TPS_off per prompt (median over eligible paired rounds), equal family weight, geometric mean across families; on = prefetch with charged reserve at the same total target, off = current deployment at the same target",
            "B1": "same reduced slot count in both arms (both charge the reserve), prefetch off versus on",
            "B2": "shadow mode (forecast, no reads) versus the no-predictor reserve control",
            "bootstrap": {"draws": BOOTSTRAP_DRAWS, "seed": BOOTSTRAP_SEED, "resample": "prompts within family, eligible rounds within prompt"},
            "gates": {"aggregate_ratio": 1.10, "lower_bound": 1.00, "family_floor": 0.95, "duration_regression": 0.05,
                      "min_clean_pairs_per_prompt": 2},
            "eligibility": "both arms complete, exact output IDs and router digests match, no swap delta, nominal thermal, within budget",
        },
        "artifact_root": str(run_dir),
        "host_conditions": host_conditions(),
    }
    proto["preflight_satisfied_at_freeze"] = bool(have >= target + PREFLIGHT_MARGIN_GB)
    proto.update(successor_fields(args))
    run_dir.mkdir(parents=True)
    write_json(run_dir / "protocol.json", proto)
    log(f"frozen {run_dir / 'protocol.json'}: memory {target} GB (reclaimable {have:.1f} GB), "
        f"pilot {len(pilot)} requests, correctness {correctness}")
    print(json.dumps({"run_id": run_id, "protocol": str(run_dir / "protocol.json"), "memory_gb": target}))


def package_versions():
    out = {}
    for name in ["mlx", "numpy", "safetensors", "tokenizers"]:
        try:
            mod = __import__(name)
            out[name] = getattr(mod, "__version__", "unknown")
        except Exception as e:  # noqa: BLE001
            out[name] = f"unavailable: {e}"
    return out


# ---------------------------------------------------------------- requests

def cmd_requests(args):
    manifest = corpus_manifest()
    proto = read_json(args.protocol)
    if args.ids:
        ids = args.ids.split(",")
    elif args.selection == "pilot":
        ids = proto["pilot_request_ids"]
    elif args.selection == "correctness":
        ids = proto["correctness_request_ids"]
    elif args.selection in ("train", "validation", "test"):
        ids = [r["id"] for r in manifest["requests"] if r["split"] == args.selection]
    else:
        raise SystemExit("unknown selection")
    if args.limit:
        ids = ids[:args.limit]
    payload = request_payload(manifest, ids)
    write_json(args.out, payload)
    log(f"wrote {len(payload)} requests to {args.out}")


# ---------------------------------------------------------------- capture

def cmd_capture(args):
    proto = read_json(args.protocol)
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    needed = proto["memory_gb"] + PREFLIGHT_MARGIN_GB
    state = preflight_or_wait(needed)
    log(f"preflight ok: {state['reclaimable_bytes']/1e9:.1f} GB reclaimable for a {proto['memory_gb']} GB target")
    command = [proto["binary"], "expert-lookahead-capture", "--protocol", args.protocol, "--out", str(out),
               "--requests", args.requests, "--memory-gb", str(proto["memory_gb"]), "--mtp", "on",
               "--features", args.features, "--x2", args.x2, "--capture", args.capture]
    if args.limit:
        command += ["--limit", str(args.limit)]
    if args.resume:
        command.append("--resume")
    if getattr(args, "forecast_strides", ""):
        command += ["--forecast-strides", args.forecast_strides]
    if getattr(args, "forecast_selfcheck", "off") == "on":
        command += ["--forecast-selfcheck", "on"]
    if getattr(args, "forecast_inputs", "off") == "on":
        command += ["--forecast-inputs", "on"]
    extra = dict(item.split("=", 1) for item in (args.env or []))
    env = run_env(proto, extra)
    started = time.time()
    with open(out / f"capture-{time.strftime('%Y%m%d-%H%M%S')}.log", "w") as logfile:
        logfile.write(json.dumps({"command": command, "env": {k: v for k, v in env.items() if k.startswith("SLOTSTREAM_")},
                                  "vm_before": {k: v for k, v in state.items() if k != "raw"}}) + "\n")
        logfile.flush()
        child = subprocess.Popen(command, env=env, stdout=logfile, stderr=subprocess.STDOUT, cwd=ROOT)
        code = child.wait()
        logfile.write(json.dumps({"exit": code, "seconds": time.time() - started,
                                  "vm_after": {k: v for k, v in vm_snapshot().items() if k != "raw"}}) + "\n")
    log(f"capture exited {code} after {time.time() - started:.0f} s")
    if code != 0:
        raise SystemExit(code)


# ---------------------------------------------------------------- shard reader

KINDS = {1: "pass_begin", 2: "feature", 3: "routes", 4: "layer_done", 5: "demand", 6: "admissions",
         7: "residency", 8: "reconciled", 9: "pass_end", 10: "forecast"}


def iter_records(path):
    """Yield (kind, payload memoryview) with framing checks; raises on corruption."""
    import numpy as np
    data = np.memmap(path, dtype=np.uint8, mode="r")
    view = memoryview(data)
    if bytes(view[:4]) != b"XLA1":
        raise ValueError(f"{path}: bad magic")
    version, header_len = struct.unpack_from("<II", view, 4)
    if version not in (1, 2):
        raise ValueError(f"{path}: unsupported version {version}")
    header = json.loads(bytes(view[12:12 + header_len]))
    offset = 12 + header_len
    yield 0, header
    total = len(view)
    while offset < total:
        if offset + 8 > total:
            raise ValueError(f"{path}: truncated record header at {offset}")
        kind, length = struct.unpack_from("<II", view, offset)
        if kind not in KINDS:
            raise ValueError(f"{path}: unknown record kind {kind} at {offset}")
        if offset + 8 + length > total:
            raise ValueError(f"{path}: truncated record payload at {offset}")
        yield kind, view[offset + 8: offset + 8 + length]
        offset += 8 + length


def parse_int32s(view, offset):
    import numpy as np
    (n,) = struct.unpack_from("<I", view, offset)
    arr = np.frombuffer(view, dtype="<i4", count=n, offset=offset + 4)
    return arr, offset + 4 + 4 * n


def parse_record(kind, view):
    import numpy as np
    if kind == 1:
        pass_id, phase, nfeat, ntok, nanos = struct.unpack_from("<IBBHQ", view, 0)
        tokens, _ = parse_int32s(view, 16)
        return dict(pass_id=pass_id, phase=phase, features=nfeat, tokens=tokens, nanos=nanos)
    if kind == 2:
        pass_id, pos, token, clen, elen = struct.unpack_from("<IIiII", view, 0)
        ctx = np.frombuffer(view, dtype="<u2", count=clen, offset=20)
        emb = np.frombuffer(view, dtype="<u2", count=elen, offset=20 + 2 * clen)
        return dict(pass_id=pass_id, position=pos, token=token, context=ctx, embedding=emb)
    if kind == 3:
        pass_id, layer, rows, topk = struct.unpack_from("<IIII", view, 0)
        ids = np.frombuffer(view, dtype="<u2", count=rows * topk, offset=16)
        return dict(pass_id=pass_id, layer=layer, rows=rows, topk=topk, ids=ids)
    if kind == 4:
        pass_id, layer, nanos, rows, width = struct.unpack_from("<IIQII", view, 0)
        x2 = np.frombuffer(view, dtype="<u2", count=rows * width, offset=24)
        return dict(pass_id=pass_id, layer=layer, nanos=nanos, rows=rows, width=width, x2=x2)
    if kind == 5:
        pass_id, layer, mixed = struct.unpack_from("<iiB", view, 0)
        start, read, adopt, end = struct.unpack_from("<QQQQ", view, 12)
        off = 44
        arrays = []
        for _ in range(6):
            arr, off = parse_int32s(view, off)
            arrays.append(arr)
        unique, hit, miss, victims, adopted, promoted = arrays
        return dict(pass_id=pass_id, layer=layer, mixed=bool(mixed), start=start, read=read, adopt=adopt, end=end,
                    unique=unique, hit=hit, miss=miss, victims=victims, adopted=adopted, promoted=promoted)
    if kind == 6:
        pass_id, layer = struct.unpack_from("<iI", view, 0)
        experts, _ = parse_int32s(view, 8)
        return dict(pass_id=pass_id, layer=layer, experts=experts)
    if kind == 7:
        (after,) = struct.unpack_from("<i", view, 0)
        keys, off = parse_int32s(view, 4)
        (n,) = struct.unpack_from("<I", view, off)
        bits = np.frombuffer(view, dtype=np.uint8, count=n, offset=off + 4)
        (hand,) = struct.unpack_from("<i", view, off + 4 + n)
        return dict(after=after, keys=keys, bits=bits, hand=hand)
    if kind == 8:
        pass_id, kept = struct.unpack_from("<II", view, 0)
        return dict(pass_id=pass_id, kept=kept)
    if kind == 9:
        pass_id, nanos, aborted = struct.unpack_from("<IQB", view, 0)
        return dict(pass_id=pass_id, nanos=nanos, aborted=bool(aborted))
    if kind == 10:
        pass_id, source, target, rows, per_row, width = struct.unpack_from("<IIIIII", view, 0)
        n = rows * per_row
        ids = np.frombuffer(view, dtype="<u2", count=n, offset=24)
        margins = np.frombuffer(view, dtype="<f4", count=n, offset=24 + 2 * n)
        inputs = np.frombuffer(view, dtype="<u2", count=rows * width, offset=24 + 6 * n) if width else None
        return dict(pass_id=pass_id, source=source, target=target, rows=rows, per_row=per_row, width=width,
                    ids=ids.reshape(rows, per_row) if rows else ids, margins=margins.reshape(rows, per_row) if rows else margins,
                    inputs=inputs.reshape(rows, width) if width else None)
    raise ValueError(kind)


def bf16_is_finite(bits):
    import numpy as np
    exp = (bits.astype(np.uint16) >> 7) & 0xFF
    return bool(np.all(exp != 0xFF))


def load_requests_jsonl(run_dir):
    rows = []
    path = Path(run_dir) / "requests.jsonl"
    if not path.exists():
        return rows
    with open(path) as f:
        for line in f:
            line = line.strip()
            if line:
                rows.append(json.loads(line))
    return rows


# ---------------------------------------------------------------- validate-data

def validate_request(run_dir, row, header_expected, want_x2):
    """Return (ok, problems, summary) for one request's shards."""
    import numpy as np
    problems = []
    summary = dict(passes=0, verify=0, plain=0, prefill=0, features=0, layers=0, routes=0, demands=0, x2_bytes=0,
                   verify_tokens=0, kept=0, hits=0, misses=0, adopted=0, residency=0)
    passes = {}
    hasher = hashlib.sha256()
    for shard in row.get("capture", {}).get("shards", []):
        path = Path(run_dir) / "shards" / shard["path"]
        if not path.exists():
            problems.append(f"missing shard {shard['path']}")
            continue
        if path.stat().st_size != shard["bytes"]:
            problems.append(f"shard {shard['path']} size {path.stat().st_size} != {shard['bytes']}")
        if digest(path) != shard["sha256"]:
            problems.append(f"shard {shard['path']} sha256 mismatch")
        count = 0
        try:
            for kind, payload in iter_records(path):
                if kind == 0:
                    for key in ("run_id", "draft_depth", "prefill_chunk", "pool_slots", "model_dir"):
                        if payload.get(key) != header_expected.get(key):
                            problems.append(f"header {key} {payload.get(key)!r} != run {header_expected.get(key)!r}")
                    summary.setdefault("executables", set()).add(payload.get("executable_sha256"))
                    continue
                count += 1
                rec = parse_record(kind, payload)
                if kind == 1:
                    if rec["pass_id"] in passes:
                        problems.append(f"duplicate pass {rec['pass_id']}")
                    passes[rec["pass_id"]] = dict(phase=rec["phase"], tokens=rec["tokens"], features=[], routes={}, layers={},
                                                  kept=None, ended=False, aborted=False, demands=0)
                    summary["passes"] += 1
                    summary[["prefill", "verify", "plain"][rec["phase"]]] += 1
                    if rec["phase"] == 1:
                        summary["verify_tokens"] += len(rec["tokens"])
                elif kind == 2:
                    p = passes.get(rec["pass_id"])
                    if p is None:
                        problems.append(f"feature for unknown pass {rec['pass_id']}")
                        continue
                    if len(rec["context"]) != HC * HIDDEN or len(rec["embedding"]) != HIDDEN:
                        problems.append(f"pass {rec['pass_id']} feature geometry {len(rec['context'])}/{len(rec['embedding'])}")
                    if not (bf16_is_finite(rec["context"]) and bf16_is_finite(rec["embedding"])):
                        problems.append(f"pass {rec['pass_id']} feature not finite")
                    if rec["position"] >= len(p["tokens"]) or p["tokens"][rec["position"]] != rec["token"]:
                        problems.append(f"pass {rec['pass_id']} feature position/token mismatch")
                    p["features"].append(rec["position"])
                    summary["features"] += 1
                elif kind == 3:
                    p = passes.get(rec["pass_id"])
                    if p is None:
                        problems.append(f"routes for unknown pass {rec['pass_id']}")
                        continue
                    if rec["topk"] != TOPK or rec["rows"] != len(p["tokens"]):
                        problems.append(f"pass {rec['pass_id']} layer {rec['layer']} routes rows {rec['rows']} topk {rec['topk']} for {len(p['tokens'])} tokens")
                    if rec["layer"] in p["routes"]:
                        problems.append(f"pass {rec['pass_id']} duplicate routes for layer {rec['layer']}")
                    if np.any(rec["ids"] >= EXPERTS):
                        problems.append(f"pass {rec['pass_id']} layer {rec['layer']} expert id out of range")
                    p["routes"][rec["layer"]] = rec["ids"]
                    hasher.update(struct.pack("<I", rec["layer"]))
                    hasher.update(rec["ids"].astype("<i4").tobytes())
                    summary["routes"] += 1
                elif kind == 4:
                    p = passes.get(rec["pass_id"])
                    if p is None:
                        problems.append(f"layer for unknown pass {rec['pass_id']}")
                        continue
                    if rec["layer"] in p["layers"]:
                        problems.append(f"pass {rec['pass_id']} duplicate layer {rec['layer']}")
                    if p["phase"] == 1 and want_x2:
                        if rec["rows"] != len(p["tokens"]) or rec["width"] != HIDDEN:
                            problems.append(f"pass {rec['pass_id']} layer {rec['layer']} x2 {rec['rows']}x{rec['width']}")
                        elif not bf16_is_finite(rec["x2"]):
                            problems.append(f"pass {rec['pass_id']} layer {rec['layer']} x2 not finite")
                        summary["x2_bytes"] += 2 * len(rec["x2"])
                    p["layers"][rec["layer"]] = rec["nanos"]
                    summary["layers"] += 1
                elif kind == 5:
                    summary["demands"] += 1
                    summary["hits"] += len(rec["hit"])
                    summary["misses"] += len(rec["miss"])
                    summary["adopted"] += len(rec["adopted"])
                    if rec["pass_id"] in passes:
                        passes[rec["pass_id"]]["demands"] += 1
                    if len(set(rec["unique"].tolist())) != len(rec["unique"]):
                        problems.append(f"pass {rec['pass_id']} layer {rec['layer']} demand keys not unique")
                elif kind == 7:
                    summary["residency"] += 1
                    if len(rec["keys"]) != header_expected.get("pool_slots") or len(rec["bits"]) != len(rec["keys"]):
                        problems.append("residency snapshot size does not match the pool")
                elif kind == 8:
                    p = passes.get(rec["pass_id"])
                    if p is None or rec["kept"] < 1 or rec["kept"] > len(p["tokens"]):
                        problems.append(f"pass {rec['pass_id']} kept {rec['kept']} invalid")
                    else:
                        p["kept"] = rec["kept"]
                        summary["kept"] += rec["kept"]
                elif kind == 9:
                    p = passes.get(rec["pass_id"])
                    if p is None:
                        problems.append(f"end for unknown pass {rec['pass_id']}")
                        continue
                    p["ended"] = True
                    p["aborted"] = rec["aborted"]
                elif kind == 10:
                    p = passes.get(rec["pass_id"])
                    if p is None:
                        problems.append(f"forecast for unknown pass {rec['pass_id']}")
                        continue
                    summary["forecasts"] = summary.get("forecasts", 0) + 1
                    if rec["rows"] != len(p["tokens"]) or rec["target"] < rec["source"] or rec["target"] >= LAYERS:
                        problems.append(f"pass {rec['pass_id']} forecast {rec['source']}->{rec['target']} rows {rec['rows']} for {len(p['tokens'])} tokens")
                    if rec["rows"] and (np.any(rec["ids"] >= EXPERTS) or not np.all(np.isfinite(rec["margins"]))):
                        problems.append(f"pass {rec['pass_id']} forecast {rec['source']}->{rec['target']} ids or margins invalid")
                    if rec["inputs"] is not None and (rec["width"] != HIDDEN or not bf16_is_finite(rec["inputs"])):
                        problems.append(f"pass {rec['pass_id']} forecast inputs {rec['width']} wide or not finite")
        except ValueError as e:
            problems.append(str(e))
        if count != shard["records"]:
            problems.append(f"shard {shard['path']} records {count} != {shard['records']}")
    for pid, p in passes.items():
        if not p["ended"]:
            problems.append(f"pass {pid} never ended (partial pass)")
        if p["aborted"]:
            problems.append(f"pass {pid} aborted")
        if p["phase"] in (1, 2):
            if len(p["routes"]) != LAYERS:
                problems.append(f"pass {pid} has routes for {len(p['routes'])} layers")
            if len(p["layers"]) != LAYERS:
                problems.append(f"pass {pid} completed {len(p['layers'])} layers")
        if p["phase"] == 1:
            if header_expected.get("capture", {}).get("features") and sorted(p["features"]) != list(range(len(p["tokens"]))):
                problems.append(f"pass {pid} features {sorted(p['features'])} for {len(p['tokens'])} tokens")
            if p["kept"] is None:
                problems.append(f"pass {pid} has no reconciliation")
    if row.get("router_sha256") and hasher.hexdigest() != row["router_sha256"]:
        problems.append("router digest recomputed from shard routes differs from the native digest")
    return not problems, problems, summary


def cmd_validate_data(args):
    run_dir = Path(args.run)
    header = read_json(run_dir / "run.json")
    rows = load_requests_jsonl(run_dir)
    if args.limit:
        rows = rows[:args.limit]
    ok_rows, totals, failures = 0, {}, []
    for row in rows:
        if not row.get("complete"):
            failures.append((row["id"], ["request incomplete"]))
            continue
        ok, problems, summary = validate_request(run_dir, row, header, header.get("capture", {}).get("x2", True))
        executables = summary.pop("executables", set())
        totals["executables"] = sorted(set(totals.get("executables", [])) | executables)
        for k, v in summary.items():
            totals[k] = totals.get(k, 0) + v
        if ok:
            ok_rows += 1
        else:
            failures.append((row["id"], problems[:8]))
    incomplete = [r["id"] for r in rows if not r.get("complete")]
    failures = [(i, p) for i, p in failures if i not in incomplete]
    report = {"run": str(run_dir), "requests": len(rows), "valid": ok_rows, "incomplete": incomplete, "totals": totals,
              "failures": [{"id": i, "problems": p} for i, p in failures],
              "bytes": sum(s["bytes"] for r in rows for s in r.get("capture", {}).get("shards", []))}
    write_json(run_dir / "validate-data.json", report)
    print(json.dumps({k: v for k, v in report.items() if k != "failures"}, indent=1))
    for i, p in failures[:20]:
        print("FAIL", i, p)
    if failures:
        raise SystemExit(2)
    print("VALIDATE-DATA PASS")


# ---------------------------------------------------------------- parity (C01)

def cmd_parity(args):
    a = {r["id"]: r for r in load_requests_jsonl(args.on)}
    b = {r["id"]: r for r in load_requests_jsonl(args.off)}
    ids = sorted(set(a) & set(b))
    if not ids:
        raise SystemExit("no common requests")
    mismatches = []
    overhead = []
    for rid in ids:
        x, y = a[rid], b[rid]
        same = x["output_ids"] == y["output_ids"] and x["router_sha256"] == y["router_sha256"] \
            and x["finish_reason"] == y["finish_reason"] and x["router_layers"] == y["router_layers"]
        if not same:
            mismatches.append(rid)
        sx, sy = x["stats"], y["stats"]
        overhead.append(dict(id=rid, on_wall=x["wall_seconds"], off_wall=y["wall_seconds"],
                             on_decode=sx["decodeSeconds"], off_decode=sy["decodeSeconds"],
                             on_prefill=sx["prefillSeconds"], off_prefill=sy["prefillSeconds"],
                             outputs=len(x["output_ids"]), bytes=x.get("capture", {}).get("totalBytes", 0)))
    wall_on = sum(o["on_wall"] for o in overhead)
    wall_off = sum(o["off_wall"] for o in overhead)
    report = {"requests": len(ids), "mismatches": mismatches, "wall_on": wall_on, "wall_off": wall_off,
              "capture_overhead": (wall_on / wall_off - 1) if wall_off else None, "rows": overhead,
              "capture_bytes": sum(o["bytes"] for o in overhead),
              "outputs": sum(o["outputs"] for o in overhead)}
    write_json(Path(args.on) / "parity.json", report)
    print(json.dumps({k: v for k, v in report.items() if k != "rows"}, indent=1))
    if mismatches:
        print("PARITY FAIL")
        raise SystemExit(2)
    print("PARITY PASS: exact output IDs, router digests and finish reasons on", len(ids), "requests")


# ---------------------------------------------------------------- continuation rules

def cmd_continuation(args):
    """P3a offline rule: oracle >= 1.10x projected, some candidate >= 1.05x projected; a learned
    candidate must add 5 pp timely coverage over the best cheap policy, else the cheap policy is the
    candidate. Prints the decision and writes it next to the evaluation."""
    ev = read_json(args.evaluate)
    pol = ev["policies"]
    oracle = pol["oracle"]["projected_throughput_ratio"]
    chosen = {name: v["chosen"] for name, v in pol.items() if isinstance(v, dict) and "chosen" in v and v["chosen"].get("setting")}
    cheap = {n: c for n, c in chosen.items() if n in ("frequency", "recent")}
    learned = {n: c for n, c in chosen.items() if n not in ("frequency", "recent")}
    best_cheap = max(cheap.items(), key=lambda kv: kv[1]["timely_coverage"], default=(None, None))
    best_learned = max(learned.items(), key=lambda kv: kv[1]["timely_coverage"], default=(None, None))
    decision = dict(oracle_projected=oracle, oracle_ok=oracle >= 1.10,
                    best_cheap=best_cheap[0], best_cheap_coverage=(best_cheap[1] or {}).get("timely_coverage"),
                    best_cheap_projected=(best_cheap[1] or {}).get("projected_throughput_ratio"),
                    best_learned=best_learned[0], best_learned_coverage=(best_learned[1] or {}).get("timely_coverage"),
                    best_learned_projected=(best_learned[1] or {}).get("projected_throughput_ratio"))
    candidates = [(n, c) for n, c in chosen.items() if c["projected_throughput_ratio"] >= 1.05]
    if not decision["oracle_ok"]:
        decision["outcome"] = "stop: even a perfect forecast projects under 1.10x"
    elif not candidates:
        decision["outcome"] = "stop: no policy projects at least 1.05x under the traffic bound"
    else:
        margin = (decision["best_learned_coverage"] or 0) - (decision["best_cheap_coverage"] or 0)
        decision["learned_margin_pp"] = 100 * margin
        if best_learned[0] and margin >= 0.05 and best_learned[1]["projected_throughput_ratio"] >= 1.05:
            decision["outcome"] = f"continue with learned candidate {best_learned[0]} ({best_learned[1]['setting']})"
            decision["candidate"] = dict(name=best_learned[0], **best_learned[1])
        elif best_cheap[0] and best_cheap[1]["projected_throughput_ratio"] >= 1.05:
            decision["outcome"] = f"continue with cheap policy {best_cheap[0]} ({best_cheap[1]['setting']}); training stops"
            decision["candidate"] = dict(name=best_cheap[0], **best_cheap[1])
        else:
            decision["outcome"] = "stop: candidates reach 1.05x only without the coverage margin"
    write_json(Path(args.evaluate).with_name("continuation.json"), decision)
    print(json.dumps(decision, indent=1, default=float))


# ---------------------------------------------------------------- main

def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)
    p = sub.add_parser("prepare"); p.add_argument("--binary", default=str(ROOT / ".build/release/slotstream"))
    p.add_argument("--memory-gb", type=float, default=None); p.add_argument("--run-id", default=None)
    p.add_argument("--successor-of", default=None, help="predecessor run directory whose capture this protocol reuses")
    p.add_argument("--successor-capture", default="pilot", help="capture subdirectory of the predecessor run")
    p.add_argument("--eligibility", default=None, help="timing-eligibility rule name to freeze")
    p.add_argument("--eligibility-approval", default=None, help="who approved the rule, when and how")
    p.add_argument("--allow-insufficient-preflight", action="store_true",
                   help="freeze a fixed profile even if the preflight is not reclaimable now (recorded, not simulated)")
    p.set_defaults(func=cmd_prepare)
    p = sub.add_parser("requests"); p.add_argument("--protocol", required=True); p.add_argument("--out", required=True)
    p.add_argument("--selection", default="pilot"); p.add_argument("--ids", default=None); p.add_argument("--limit", type=int, default=0)
    p.set_defaults(func=cmd_requests)
    p = sub.add_parser("capture"); p.add_argument("--protocol", required=True); p.add_argument("--out", required=True)
    p.add_argument("--requests", required=True); p.add_argument("--features", default="on"); p.add_argument("--x2", default="on")
    p.add_argument("--capture", default="on"); p.add_argument("--limit", type=int, default=0); p.add_argument("--resume", action="store_true")
    p.add_argument("--env", action="append", help="extra KEY=VALUE for the child (repeatable), e.g. a prefetch arm")
    p.add_argument("--forecast-strides", default="", help="observer-only router-reuse strides to record without a scheduler")
    p.add_argument("--forecast-selfcheck", default="off", help="record the stride-0 self-check forecast (C12): on | off")
    p.add_argument("--forecast-inputs", default="off", help="record forecast input rows for the offline C12 recomputation: on | off")
    p.set_defaults(func=cmd_capture)
    p = sub.add_parser("validate-data"); p.add_argument("--run", required=True); p.add_argument("--limit", type=int, default=0)
    p.set_defaults(func=cmd_validate_data)
    p = sub.add_parser("parity"); p.add_argument("--on", required=True); p.add_argument("--off", required=True)
    p.set_defaults(func=cmd_parity)
    p = sub.add_parser("continuation"); p.add_argument("--evaluate", required=True)
    p.set_defaults(func=cmd_continuation)
    try:
        from expert_lookahead_train import register as register_train
        register_train(sub)
    except ImportError as e:  # noqa: BLE001
        sub.add_parser("train", help=f"unavailable: {e}")
    try:
        from expert_lookahead_bench import register as register_bench
        register_bench(sub)
    except ImportError as e:  # noqa: BLE001
        sub.add_parser("bench", help=f"unavailable: {e}")
    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
