---
type: run
id: 01m1rf7aebpydpnqvcqj0yck4w
created: 2026-09-05T09:43:32.043357+00:00
updated: 2026-09-05T09:45:12.650114+00:00
summary: Bounded vision attention padding numerical and component probe
binary: Python MLX 0.31.1; source and helper hashes in body
captured_at: 2026-09-05
command: .venv31/bin/python .build/optimization/vision-padding-python-v25/probe.py
discard_reason: Exploratory fixed-input timings lack thermal observations and full request/tower qualification; numerical evidence retained
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Bounded vision attention padding numerical and component probe
tool: Pinned Python MLX 0.31.1, NumPy float64 oracle and actual dependency dispatch source
---
# Bounded 72-wide vision attention padding probe

This pinned MLX 0.31.1 prototype tests zero padding to 80 and 128 channels while keeping the scale at 1/sqrt(72), then crops the output back to 72. The actual pinned Metal dispatch source supports full attention at widths 64, 80 and 128; it falls back for 72. Its NAX dispatch explicitly excludes width 80. That source evidence explains a plausible hardware tradeoff; it is not an event-level measurement of which instructions executed.

All 60 fixed-input numerical checks pass against an independent NumPy float64 softmax oracle, across lengths 1/8/9/64/256, FP32/BF16 and random/zero-query/saturated patterns. The frozen source records the exact tolerance: FP32 max error <=max(3*reference error,1e-5), BF16 <=max(3*reference error,0.01). Saturated inputs can make the reference error large; this component band does not certify model quality. No full-tower golden was regenerated or numerical gate relaxed.

The exploratory component timing uses actual 16-head/72-wide BF16 geometry and five interleaved rounds of five completed calls per arm. All five rounds per shape had unchanged global swap counters. At 1,024 and 2,048 patches the 128-wide candidate's median paired reductions are about 28.40% and 24.94%; padding to 80 is slower by about 10.84% and 20.95%. At 256 patches the 128-wide result is noisy/small; do not infer a universal win. These runs did not record instantaneous thermal state or establish request benefit, and do not qualify a production speed claim. Full Swift component, full-tower parity, changed-input/task quality, request latency, memory and prefix identity gates remain required.

The candidate inference implementation retains padding off by default, binds any enabled numerical image path to its prefix-cache preparation identity, and preserves the public unpadded tower methods. No new GPU shader or upstream dependency upgrade is included.

## .build/optimization/vision-padding-python-v25/prefill_bench.py

SHA-256: `0661085989282cccdbcc54645f4f751dc8cd8e50c4de3b8bf21eb047bc65628e`; 16770 bytes.

```
#!/usr/bin/env python3
"""Paired inference experiments with raw results and exact token identities.

Repeat --arm NAME=EXECUTABLE for AB/BA order. A fresh process means empty
expert/prefix caches, not cold SSD: OS file cache is explicitly uncontrolled.
Failed, incomplete, and swapping runs are preserved and excluded.
"""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import statistics
import struct
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "Tools/fixtures/optimization"


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""): h.update(part)
    return h.hexdigest()


def vm_snapshot(raw=None):
    raw = raw if raw is not None else subprocess.check_output(["vm_stat"], text=True)
    size = re.search(r"page size of (\d+) bytes", raw)
    if not size: raise ValueError("vm_stat page size missing")
    pages = {k.strip('"'): int(v) for k, v in re.findall(r'^([^:\n]+):\s+(\d+)\.', raw, re.M)}
    required = ("Pages free", "Pages purgeable", "File-backed pages", "Swapins", "Swapouts")
    if any(k not in pages for k in required): raise ValueError("vm_stat counters missing")
    return {"page_bytes": int(size[1]), "reclaimable_bytes": sum(pages[k] for k in required[:3]) * int(size[1]),
            "swapins": pages["Swapins"], "swapouts": pages["Swapouts"], "raw": raw}


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise RuntimeError(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    return state


def host_conditions():
    """Read-only observations outside timed intervals; unavailable is explicit.

    pmset's warning history is not an instantaneous thermal sensor. Preserve
    that distinction and do not infer energy or thermal headroom from it.
    """
    result = {"load_average_1_5_15_minutes": list(os.getloadavg()),
              "observed_at_unix_seconds": time.time(),
              "thermal_limit": "pmset warning/status history, not continuous temperature",
              "energy_joules": None}
    for key, command in [("power_source", ["pmset", "-g", "batt"]),
                         ("power_configuration", ["pmset", "-g", "custom"]),
                         ("thermal_status", ["pmset", "-g", "therm"])]:
        try:
            output = subprocess.run(command, capture_output=True, text=True, timeout=5)
            result[key] = {"exit_code": output.returncode, "stdout": output.stdout, "stderr": output.stderr}
        except (OSError, subprocess.TimeoutExpired) as e:
            result[key] = {"unavailable": f"{type(e).__name__}: {e}"}
    return result


def validate_metrics(d):
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if not isinstance(s.get(k), (int, float)) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] <= 0 or s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
    if sum(s["prefillPasses"]) != s["prefillTokens"]: raise ValueError("pass/token mismatch")
    if len(d["prompt_ids"]) != s["promptTokens"] or len(d["output_ids"]) != s["decodeTokens"]:
        raise ValueError("token identity/count mismatch")
    return s


def capture_sources(dest):
    files = sorted([*ROOT.glob("Sources/**/*.swift"), ROOT/"Package.swift", ROOT/"Package.resolved", ROOT/"Makefile"])
    with tarfile.open(dest/"source.tar.gz", "w:gz") as archive:
        for p in files: archive.add(p, arcname=str(p.relative_to(ROOT)))
    return {str(p.relative_to(ROOT)): digest(p) for p in files}


def model_identity(model):
    # This identifies headers/stat metadata, NOT full payload verification.
    result = {}
    for p in sorted(model.iterdir()):
        if p.suffix not in (".json", ".jinja", ".safetensors"): continue
        info = {"bytes": p.stat().st_size, "mtime_ns": p.stat().st_mtime_ns}
        if p.suffix == ".safetensors":
            with p.open("rb") as f:
                n = struct.unpack("<Q", f.read(8))[0]
                if n > 64*1024*1024 or n+8 > info["bytes"]: raise ValueError(f"invalid header: {p.name}")
                info["header_sha256"] = hashlib.sha256(f.read(n)).hexdigest()
        else: info["sha256"] = digest(p)
        result[p.name] = info
    if "config.json" not in result: raise ValueError("model config missing")
    return result


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None:
                os.killpg(child.pid, signal.SIGTERM)
                try: child.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    os.killpg(child.pid, signal.SIGKILL); child.wait()


def paired_summary(rows, reference):
    groups = {}
    for row in rows:
        groups.setdefault((row["prompt"], row["chunk"], row["round"]), {})[row["arm"]] = row
    by_arm = {}
    for (prompt, chunk, round_number), arms in groups.items():
        for name, candidate in arms.items():
            if name == reference: continue
            result = by_arm.setdefault((prompt, chunk, name), {"pairs": [], "excluded_rounds": []})
            control = arms.get(reference)
            if not control or not control["valid"] or not candidate["valid"]:
                result["excluded_rounds"].append(round_number); continue
            a, b = control["metrics"], candidate["metrics"]
            if a["prompt_ids"] != b["prompt_ids"] or a["effective_pool_slots"] != b["effective_pool_slots"] or a.get("effective_mtp") != b.get("effective_mtp"):
                result["excluded_rounds"].append(round_number); continue
            result["pairs"].append({"round": round_number,
                "request_reduction_fraction": 1 - b["stats"]["requestSeconds"] / a["stats"]["requestSeconds"],
                "request_saved_seconds": a["stats"]["requestSeconds"] - b["stats"]["requestSeconds"],
                "output_ids_equal": a["output_ids"] == b["output_ids"]})
    result = []
    for (prompt, chunk, name), entry in sorted(by_arm.items()):
        pairs = entry["pairs"]
        result.append({"prompt": prompt, "chunk": chunk, "reference": reference, "candidate": name, **entry,
            "median_request_reduction_fraction": statistics.median(p["request_reduction_fraction"] for p in pairs) if pairs else None})
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--arm", action="append", help="NAME=EXECUTABLE (repeatable)")
    p.add_argument("--arm-env", action="append", default=[], help='NAME={"SLOTSTREAM_...":"value"}')
    p.add_argument("--arm-chunk", action="append", default=[], help="NAME=256..4096, explicit per-arm compute-pass override")
    p.add_argument("--label", default="baseline")
    p.add_argument("--mtp", choices=("off", "on"), default="off")
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--chunks", default="256")
    p.add_argument("--prompts", default="short,prose")
    p.add_argument("--memory-gb", type=float, default=8.1)
    p.add_argument("--max-tokens", type=int, default=16)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--sampled", action="store_true")
    p.add_argument("--sample-footprint", action="store_true")
    p.add_argument("--observe-arm", action="append", default=[], help="Enable footprint sampling only for this arm")
    p.add_argument("--model", type=Path, default=Path.home()/".slotstream/models/qwen38-flash-next-mlx-4bit")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--timeout", type=int, default=1800)
    p.add_argument("--prepare-only", action="store_true")
    a = p.parse_args()
    if not (8.1 <= a.memory_gb <= 10 and a.rounds > 0 and a.max_tokens > 0 and a.timeout > 0):
        p.error("use an 8.1–10 GB target and positive rounds/output/timeout")
    chunks = [int(c) for c in a.chunks.split(",")]
    if any(c < 256 or c > 4096 for c in chunks): p.error("chunks must be within 256..4096")
    if len(chunks) != len(set(chunks)): p.error("chunks must be unique")
    arms = {}
    for arm in a.arm or [f"{a.label}=.build/release/slotstream"]:
        name, path = arm.split("=", 1)
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name) or name in arms: p.error("unique safe arm names required")
        arms[name] = Path(path).resolve()
    if any(name not in arms for name in a.observe_arm): p.error("observe-arm must name an arm")
    arm_chunks = {}
    for item in a.arm_chunk:
        name, value = item.split("=", 1)
        if name not in arms or name in arm_chunks or not value.isdecimal() or not 256 <= int(value) <= 4096:
            p.error("arm-chunk requires a unique arm and a 256..4096 integer")
        arm_chunks[name] = int(value)
    envs = {n: {} for n in arms}
    for item in a.arm_env:
        name, value = item.split("=", 1); values = json.loads(value)
        if name not in arms or not isinstance(values, dict) or any(not k.startswith("SLOTSTREAM_") or not isinstance(v, str) for k,v in values.items()):
            p.error("arm-env requires an arm and string SLOTSTREAM_ overrides")
        envs[name].update(values)
    prompts = {}
    for name in a.prompts.split(","):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name): p.error("invalid fixture name")
        prompts[name] = FIXTURES/f"{name}.txt"
        if not prompts[name].is_file(): p.error(f"missing immutable fixture {name}")
    a.out = a.out.resolve(); a.out.mkdir(parents=True, exist_ok=False)
    # Preserve fixture bytes as well as hashes; a future source edit must not
    # make an old benchmark impossible to reconstruct.
    (a.out / "fixtures").mkdir()
    import shutil
    for name, fixture in list(prompts.items()):
        shutil.copyfile(fixture, a.out / "fixtures" / fixture.name)
        prompts[name] = a.out / "fixtures" / fixture.name
    identities = {}
    for name, binary in arms.items():
        identity_file = binary.parent / "build-identity.json"
        source_file = binary.parent / "build-source.tar.gz"
        identity = json.loads(identity_file.read_text())
        if identity["binary_sha256"] != digest(binary) or identity["metallib_sha256"] != digest(binary.parent / "mlx.metallib"):
            raise ValueError(f"{name}: executable/metallib does not match build identity")
        if identity["source_archive_sha256"] != digest(source_file):
            raise ValueError(f"{name}: source archive does not match build identity")
        shutil.copyfile(source_file, a.out / f"{name}-source.tar.gz")
        identities[name] = identity
    base_env = {k:v for k,v in os.environ.items() if not k.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
    manifest = {"schema_version": 1, "head": subprocess.check_output(["git","rev-parse","HEAD"], cwd=ROOT, text=True).strip(),
                "worktree_source": capture_sources(a.out), "build_identities": identities, "model": model_identity(a.model),
                "arms": {n:{"binary":str(b),"sha256":digest(b),"metallib_sha256":digest(b.parent/"mlx.metallib"),"env":envs[n]} for n,b in arms.items()},
                "fixtures": {n:{"path":str(f),"sha256":digest(f)} for n,f in prompts.items()},
                "conditions": {"filesystem_cache":"uncontrolled; no purge","expert_cache":"empty per process","prefix_cache":"empty per process","mtp":a.mtp == "on"},
                "arguments": {k:str(v) if isinstance(v,Path) else v for k,v in vars(a).items()}}
    (a.out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    if a.prepare_only: print(json.dumps({"prepared":str(a.out)})); return
    rows = []
    for ri in range(a.rounds):
        order = list(arms) if ri%2 == 0 else list(reversed(arms))
        for pname,fixture in prompts.items():
            for chunk in chunks:
                for name in order:
                    cell = a.out/f"{ri+1}-{pname}-{chunk}-{name}"; cell.mkdir()
                    row = {"round":ri+1,"prompt":pname,"chunk":chunk,"arm":name,"valid":False}
                    effective_chunk = arm_chunks.get(name, chunk)
                    row["requested_effective_chunk"] = effective_chunk
                    env = base_env | envs[name] | {"SLOTSTREAM_PREFILL_CHUNK":str(effective_chunk)}
                    command = [str(arms[name]),"run","--raw","--prompt-file",str(fixture),"--model",str(a.model),
                               "--memory-gb",str(a.memory_gb),"--mtp",a.mtp,"--seed",str(a.seed),
                               "--max-tokens",str(a.max_tokens),"--stats-json",str(cell/"metrics.json")]
                    if not a.sampled: command.append("--greedy")
                    if a.sample_footprint or name in a.observe_arm: command.append("--sample-footprint")
                    row["command"] = command
                    row["environment"] = {k:v for k,v in env.items() if k.startswith("SLOTSTREAM_")}
                    try:
                        extra = max(0, (effective_chunk - 256) * 1.30e-3)
                        if env.get("SLOTSTREAM_OPT_LAYER_WORKSPACE") == "1": extra += 2.0
                        scope = int(env.get("SLOTSTREAM_OPT_READ_SCOPE", "0"))
                        if scope > 0: extra += max(0, scope - effective_chunk) * 1.30e-3 + 0.12
                        row["override_extra_allowance_gb"] = extra
                        row["host_before"] = host_conditions()
                        row["before"] = preflight(a.memory_gb+extra+3)
                        start = time.monotonic()
                        row["exit_code"] = run_child(command,env,cell,a.timeout)
                        row["wall_seconds"] = time.monotonic()-start; row["after"] = vm_snapshot()
                        row["host_after"] = host_conditions()
                        if row["exit_code"] != 0: raise ValueError(f"child exit {row['exit_code']}")
                        d = json.loads((cell/"metrics.json").read_text()); validate_metrics(d)
                        if d["effective_prefill_chunk"] != effective_chunk or d["effective_mtp"] != (a.mtp == "on"): raise ValueError("effective configuration differs")
                        row["metrics"] = d
                        if any(row["after"][k] != row["before"][k] for k in ("swapins","swapouts")):
                            raise ValueError("swap activity during cell; timing excluded")
                        row["valid"] = True
                    except (OSError,ValueError,KeyError,RuntimeError,subprocess.TimeoutExpired) as e: row["exclusion"] = str(e)
                    (cell/"result.json").write_text(json.dumps(row,indent=2)+"\n")
                    with (a.out/"results.jsonl").open("a") as f: f.write(json.dumps(row)+"\n")
                    rows.append(row)
                    print(json.dumps({k:v for k,v in row.items() if k not in ("metrics","before","after","command","environment","host_before","host_after")}),flush=True)
    groups = {}
    for row in rows:
        if row["valid"]: groups.setdefault((row["prompt"],row["chunk"],row["arm"]),[]).append(row)
    summary = [{"prompt":k[0],"chunk":k[1],"arm":k[2],"valid_rounds":len(rs),
                "median_prefill_seconds":statistics.median(r["metrics"]["stats"]["prefillSeconds"] for r in rs),
                "median_request_seconds":statistics.median(r["metrics"]["stats"]["requestSeconds"] for r in rs),
                "prefill_records":[r["metrics"]["stats"]["prefillRecords"] for r in rs]} for k,rs in sorted(groups.items())]
    (a.out/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    (a.out/"paired-summary.json").write_text(json.dumps(paired_summary(rows, next(iter(arms))), indent=2)+"\n")
    if not all(r["valid"] for r in rows): raise SystemExit(1)


if __name__ == "__main__": main()

```

## .build/optimization/vision-padding-python-v25/probe.py

SHA-256: `1575d36927dba5f4ff52d1549a96d93e7c6c190c2c5e8d94644628c672fbe346`; 4338 bytes.

```
#!/usr/bin/env python3
"""Bounded 72-wide vision attention padding experiment, pinned MLX 0.31.1.
Fixed-input evidence only; full-tower, task quality and request gates are separate.
"""
import hashlib
import importlib.metadata
import json
from pathlib import Path
import statistics
import time
import mlx.core as mx
import numpy as np
from prefill_bench import preflight, vm_snapshot


def attention(q, k, v, padded):
    original = q.shape[-1]
    if padded:
        widths = [(0, 0)] * (q.ndim - 1) + [(0, padded - original)]
        q, k, v = [mx.pad(x, widths) for x in [q, k, v]]
    out = mx.fast.scaled_dot_product_attention(q, k, v, scale=original ** -.5)
    return out[..., :original]


def main():
    version = importlib.metadata.version('mlx')
    if version != '0.31.1': raise ValueError('probe requires pinned MLX 0.31.1')
    record = {'classification': 'fixed-input numerical and exploratory component performance only',
              'mlx': version, 'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              'before': preflight(7), 'checks': [], 'timings': [],
              'contract': 'CPU float64 softmax oracle. Float32 max error <=max(3*unpadded error,1e-5); BF16 <=max(3*unpadded error,0.01). Every output finite. Scale remains 1/sqrt(72). Five AB/BA rounds per shape, five completed calls per arm; any global swap excludes the whole round. No inference adoption.'}
    mx.set_cache_limit(128 << 20)
    rng = np.random.default_rng(17029)
    for n in [1, 8, 9, 64, 256]:
        for dtype in [mx.float32, mx.bfloat16]:
            for kind in ['random', 'zero-query', 'saturated']:
                raw = [rng.standard_normal((1, 2, n, 72)).astype(np.float32) for _ in range(3)]
                if kind == 'zero-query': raw[0].fill(0)
                if kind == 'saturated': raw[0] *= 32; raw[1] *= 32
                arrays = [mx.array(x).astype(dtype) for x in raw]; mx.eval(arrays)
                q, k, v = [np.array(x.astype(mx.float32)).astype(np.float64) for x in arrays]
                scores = (q @ k.swapaxes(-1, -2)) / np.sqrt(72)
                probs = np.exp(scores - scores.max(axis=-1, keepdims=True)); probs /= probs.sum(axis=-1, keepdims=True)
                oracle = probs @ v
                baseline = np.array(attention(*arrays, 0).astype(mx.float32))
                error = float(np.max(np.abs(baseline - oracle)))
                for padded in [80, 128]:
                    out = np.array(attention(*arrays, padded).astype(mx.float32))
                    changed = float(np.max(np.abs(out - oracle)))
                    limit = max(3 * error, 1e-5 if dtype == mx.float32 else .01)
                    record['checks'].append({'n': n, 'dtype': str(dtype), 'kind': kind, 'padding': padded,
                        'reference_max_error': error, 'candidate_max_error': changed, 'limit': limit,
                        'passed': bool(np.isfinite(out).all() and changed <= limit)})
    for n in [256, 1024, 2048]:
        arrays = [mx.array(rng.standard_normal((1, 16, n, 72)).astype(np.float32)).astype(mx.bfloat16) for _ in range(3)]
        mx.eval(arrays)
        for p in [0, 80, 128]:
            for _ in range(2): mx.eval(attention(*arrays, p))
        rounds = []
        for r in range(5):
            cells = []
            for p in ([0, 80, 128] if r % 2 == 0 else [128, 80, 0]):
                before = vm_snapshot(); mx.reset_peak_memory(); start = time.monotonic()
                for _ in range(5): mx.eval(attention(*arrays, p))
                elapsed = (time.monotonic() - start) / 5
                after = vm_snapshot()
                cells.append({'padding': p, 'seconds': elapsed,
                              'mlx_peak_bytes': max(mx.get_peak_memory(), mx.get_active_memory()),
                              'swap_delta': {k: after[k] - before[k] for k in ['swapins', 'swapouts']}})
            rounds.append({'round': r + 1, 'cells': cells,
                'valid': all(not any(c['swap_delta'].values()) for c in cells)})
        record['timings'].append({'n': n, 'heads': 16, 'rounds': rounds})
    record['passed'] = all(c['passed'] for c in record['checks'])
    record['after'] = vm_snapshot()
    print(json.dumps(record, indent=2))
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())

```

## .build/optimization/vision-padding-python-v25/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/vision-padding-python-v25/stdout.json

SHA-256: `715be24364e8e0a3f9f02c1e323b092e998d4d9ba497b8c616758914c5fc9cbb`; 33188 bytes.

```
{
  "classification": "fixed-input numerical and exploratory component performance only",
  "mlx": "0.31.1",
  "source_sha256": "1575d36927dba5f4ff52d1549a96d93e7c6c190c2c5e8d94644628c672fbe346",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31914442752,
    "swapins": 41703925,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   244360.\nPages active:                                1095476.\nPages inactive:                               783469.\nPages speculative:                            352854.\nPages throttled:                                   0.\nPages wired down:                             217004.\nPages purgeable:                                2690.\n\"Translation faults\":                    13771351562.\nPages copy-on-write:                       626548271.\nPages zero filled:                       15308671225.\nPages reactivated:                        2265033402.\nPages purged:                               61627186.\nFile-backed pages:                           1700853.\nAnonymous pages:                              530946.\nPages stored in compressor:                  1354928.\nPages occupied by compressor:                 389062.\nDecompressions:                            962284887.\nCompressions:                             1256148906.\nPageins:                                  5820831745.\nPageouts:                                   10625472.\nSwapins:                                    41703925.\nSwapouts:                                   69922789.\nPages tagged:                                 177566.\nPages tagged resident:                        133145.\nPages tagged compressed:                       44421.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         3397.\nPages tag-storage non-tag pageable:            88013.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7224960.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651385.\n"
  },
  "checks": [
    {
      "n": 1,
      "dtype": "mlx.core.float32",
      "kind": "random",
      "padding": 80,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 1e-05,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.float32",
      "kind": "random",
      "padding": 128,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 1e-05,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.float32",
      "kind": "zero-query",
      "padding": 80,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 1e-05,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.float32",
      "kind": "zero-query",
      "padding": 128,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 1e-05,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.float32",
      "kind": "saturated",
      "padding": 80,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 1e-05,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.float32",
      "kind": "saturated",
      "padding": 128,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 1e-05,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.bfloat16",
      "kind": "random",
      "padding": 80,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.bfloat16",
      "kind": "random",
      "padding": 128,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.bfloat16",
      "kind": "zero-query",
      "padding": 80,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.bfloat16",
      "kind": "zero-query",
      "padding": 128,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.bfloat16",
      "kind": "saturated",
      "padding": 80,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 1,
      "dtype": "mlx.core.bfloat16",
      "kind": "saturated",
      "padding": 128,
      "reference_max_error": 0.0,
      "candidate_max_error": 0.0,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.float32",
      "kind": "random",
      "padding": 80,
      "reference_max_error": 0.0020633303862331864,
      "candidate_max_error": 0.0020633303862331864,
      "limit": 0.006189991158699559,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.float32",
      "kind": "random",
      "padding": 128,
      "reference_max_error": 0.0020633303862331864,
      "candidate_max_error": 2.0451564397561128e-07,
      "limit": 0.006189991158699559,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.float32",
      "kind": "zero-query",
      "padding": 80,
      "reference_max_error": 0.00035886652767658234,
      "candidate_max_error": 0.00035886652767658234,
      "limit": 0.001076599583029747,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.float32",
      "kind": "zero-query",
      "padding": 128,
      "reference_max_error": 0.00035886652767658234,
      "candidate_max_error": 4.819594323635101e-08,
      "limit": 0.001076599583029747,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.float32",
      "kind": "saturated",
      "padding": 80,
      "reference_max_error": 0.0025401561963325214,
      "candidate_max_error": 0.0025401561963325214,
      "limit": 0.007620468588997564,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.float32",
      "kind": "saturated",
      "padding": 128,
      "reference_max_error": 0.0025401561963325214,
      "candidate_max_error": 1.6371332822728846e-07,
      "limit": 0.007620468588997564,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.bfloat16",
      "kind": "random",
      "padding": 80,
      "reference_max_error": 0.005745029780200306,
      "candidate_max_error": 0.005745029780200306,
      "limit": 0.017235089340600918,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.bfloat16",
      "kind": "random",
      "padding": 128,
      "reference_max_error": 0.005745029780200306,
      "candidate_max_error": 0.0038709163089993837,
      "limit": 0.017235089340600918,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.bfloat16",
      "kind": "zero-query",
      "padding": 80,
      "reference_max_error": 0.001953125,
      "candidate_max_error": 0.001953125,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.bfloat16",
      "kind": "zero-query",
      "padding": 128,
      "reference_max_error": 0.001953125,
      "candidate_max_error": 0.001953125,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.bfloat16",
      "kind": "saturated",
      "padding": 80,
      "reference_max_error": 6.582001610411226e-11,
      "candidate_max_error": 6.582001610411226e-11,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 8,
      "dtype": "mlx.core.bfloat16",
      "kind": "saturated",
      "padding": 128,
      "reference_max_error": 6.582001610411226e-11,
      "candidate_max_error": 6.582001610411226e-11,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.float32",
      "kind": "random",
      "padding": 80,
      "reference_max_error": 0.0032910005172650525,
      "candidate_max_error": 4.0733370110235256e-07,
      "limit": 0.009873001551795157,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.float32",
      "kind": "random",
      "padding": 128,
      "reference_max_error": 0.0032910005172650525,
      "candidate_max_error": 0.002270568998710365,
      "limit": 0.009873001551795157,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.float32",
      "kind": "zero-query",
      "padding": 80,
      "reference_max_error": 0.0005677557653851473,
      "candidate_max_error": 1.407331891023489e-07,
      "limit": 0.0017032672961554418,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.float32",
      "kind": "zero-query",
      "padding": 128,
      "reference_max_error": 0.0005677557653851473,
      "candidate_max_error": 0.00039013889100802945,
      "limit": 0.0017032672961554418,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.float32",
      "kind": "saturated",
      "padding": 80,
      "reference_max_error": 0.0019261837005615234,
      "candidate_max_error": 1.0301059760742248e-07,
      "limit": 0.00577855110168457,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.float32",
      "kind": "saturated",
      "padding": 128,
      "reference_max_error": 0.0019261837005615234,
      "candidate_max_error": 0.0019261837005615234,
      "limit": 0.00577855110168457,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.bfloat16",
      "kind": "random",
      "padding": 80,
      "reference_max_error": 0.011781157049636448,
      "candidate_max_error": 0.003843842950363552,
      "limit": 0.035343471148909344,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.bfloat16",
      "kind": "random",
      "padding": 128,
      "reference_max_error": 0.011781157049636448,
      "candidate_max_error": 0.003843842950363552,
      "limit": 0.035343471148909344,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.bfloat16",
      "kind": "zero-query",
      "padding": 80,
      "reference_max_error": 0.003038194444444531,
      "candidate_max_error": 0.001953125,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.bfloat16",
      "kind": "zero-query",
      "padding": 128,
      "reference_max_error": 0.003038194444444531,
      "candidate_max_error": 0.001953125,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.bfloat16",
      "kind": "saturated",
      "padding": 80,
      "reference_max_error": 1.955478314408232e-05,
      "candidate_max_error": 1.955478314408232e-05,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 9,
      "dtype": "mlx.core.bfloat16",
      "kind": "saturated",
      "padding": 128,
      "reference_max_error": 1.955478314408232e-05,
      "candidate_max_error": 1.955478314408232e-05,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.float32",
      "kind": "random",
      "padding": 80,
      "reference_max_error": 0.0017552358913908161,
      "candidate_max_error": 4.7509030476344805e-07,
      "limit": 0.0052657076741724484,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.float32",
      "kind": "random",
      "padding": 128,
      "reference_max_error": 0.0017552358913908161,
      "candidate_max_error": 0.001468083680650989,
      "limit": 0.0052657076741724484,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.float32",
      "kind": "zero-query",
      "padding": 80,
      "reference_max_error": 0.00016767921624705195,
      "candidate_max_error": 9.601353667676449e-08,
      "limit": 0.0005030376487411559,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.float32",
      "kind": "zero-query",
      "padding": 128,
      "reference_max_error": 0.00016767921624705195,
      "candidate_max_error": 0.00016767921624705195,
      "limit": 0.0005030376487411559,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.float32",
      "kind": "saturated",
      "padding": 80,
      "reference_max_error": 0.12224818004358395,
      "candidate_max_error": 8.416904199703978e-05,
      "limit": 0.36674454013075186,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.float32",
      "kind": "saturated",
      "padding": 128,
      "reference_max_error": 0.12224818004358395,
      "candidate_max_error": 0.17180121673334225,
      "limit": 0.36674454013075186,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.bfloat16",
      "kind": "random",
      "padding": 80,
      "reference_max_error": 0.00516558751423668,
      "candidate_max_error": 0.0019312446280483897,
      "limit": 0.01549676254271004,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.bfloat16",
      "kind": "random",
      "padding": 128,
      "reference_max_error": 0.00516558751423668,
      "candidate_max_error": 0.002036864458446086,
      "limit": 0.01549676254271004,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.bfloat16",
      "kind": "zero-query",
      "padding": 80,
      "reference_max_error": 0.0009717941284179688,
      "candidate_max_error": 0.0009717941284179688,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.bfloat16",
      "kind": "zero-query",
      "padding": 128,
      "reference_max_error": 0.0009717941284179688,
      "candidate_max_error": 0.0009717941284179688,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.bfloat16",
      "kind": "saturated",
      "padding": 80,
      "reference_max_error": 1.4542541791339703,
      "candidate_max_error": 0.00714365522688265,
      "limit": 4.362762537401911,
      "passed": true
    },
    {
      "n": 64,
      "dtype": "mlx.core.bfloat16",
      "kind": "saturated",
      "padding": 128,
      "reference_max_error": 1.4542541791339703,
      "candidate_max_error": 0.00714365522688265,
      "limit": 4.362762537401911,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.float32",
      "kind": "random",
      "padding": 80,
      "reference_max_error": 0.0021805628061859483,
      "candidate_max_error": 5.583870966163751e-07,
      "limit": 0.006541688418557845,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.float32",
      "kind": "random",
      "padding": 128,
      "reference_max_error": 0.0021805628061859483,
      "candidate_max_error": 0.001981840920504796,
      "limit": 0.006541688418557845,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.float32",
      "kind": "zero-query",
      "padding": 80,
      "reference_max_error": 7.18014464382577e-05,
      "candidate_max_error": 4.4257262743485626e-08,
      "limit": 0.0002154043393147731,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.float32",
      "kind": "zero-query",
      "padding": 128,
      "reference_max_error": 7.18014464382577e-05,
      "candidate_max_error": 7.18014464382577e-05,
      "limit": 0.0002154043393147731,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.float32",
      "kind": "saturated",
      "padding": 80,
      "reference_max_error": 0.5327879168436322,
      "candidate_max_error": 0.0008149125025067594,
      "limit": 1.5983637505308967,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.float32",
      "kind": "saturated",
      "padding": 128,
      "reference_max_error": 0.5327879168436322,
      "candidate_max_error": 0.532951710407475,
      "limit": 1.5983637505308967,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.bfloat16",
      "kind": "random",
      "padding": 80,
      "reference_max_error": 0.005858802424366372,
      "candidate_max_error": 0.0009704273699873145,
      "limit": 0.017576407273099115,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.bfloat16",
      "kind": "random",
      "padding": 128,
      "reference_max_error": 0.005858802424366372,
      "candidate_max_error": 0.0010697440231735023,
      "limit": 0.017576407273099115,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.bfloat16",
      "kind": "zero-query",
      "padding": 80,
      "reference_max_error": 0.0004241466522216797,
      "candidate_max_error": 0.0004241466522216797,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.bfloat16",
      "kind": "zero-query",
      "padding": 128,
      "reference_max_error": 0.0004241466522216797,
      "candidate_max_error": 0.0004241466522216797,
      "limit": 0.01,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.bfloat16",
      "kind": "saturated",
      "padding": 80,
      "reference_max_error": 2.1767360277572942,
      "candidate_max_error": 0.0078022847462979605,
      "limit": 6.530208083271883,
      "passed": true
    },
    {
      "n": 256,
      "dtype": "mlx.core.bfloat16",
      "kind": "saturated",
      "padding": 128,
      "reference_max_error": 2.1767360277572942,
      "candidate_max_error": 0.0078022847462979605,
      "limit": 6.530208083271883,
      "passed": true
    }
  ],
  "timings": [
    {
      "n": 256,
      "heads": 16,
      "rounds": [
        {
          "round": 1,
          "cells": [
            {
              "padding": 0,
              "seconds": 0.000480858376249671,
              "mlx_peak_bytes": 5046284,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.0003546668216586113,
              "mlx_peak_bytes": 4390946,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 128,
              "seconds": 0.00034641679376363755,
              "mlx_peak_bytes": 5963810,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 2,
          "cells": [
            {
              "padding": 128,
              "seconds": 0.0003471418283879757,
              "mlx_peak_bytes": 5963810,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.00039754160679876803,
              "mlx_peak_bytes": 4390950,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 0,
              "seconds": 0.0003174083773046732,
              "mlx_peak_bytes": 5046284,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 3,
          "cells": [
            {
              "padding": 0,
              "seconds": 0.0003312834072858095,
              "mlx_peak_bytes": 5046284,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.00037920819595456124,
              "mlx_peak_bytes": 4390950,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 128,
              "seconds": 0.00031771659851074217,
              "mlx_peak_bytes": 5963810,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 4,
          "cells": [
            {
              "padding": 128,
              "seconds": 0.0003398918081074953,
              "mlx_peak_bytes": 5963816,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.0003732083830982447,
              "mlx_peak_bytes": 4390954,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 0,
              "seconds": 0.00044694999232888224,
              "mlx_peak_bytes": 5046284,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 5,
          "cells": [
            {
              "padding": 0,
              "seconds": 0.00033339159563183784,
              "mlx_peak_bytes": 5046284,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.0003815833944827318,
              "mlx_peak_bytes": 4390952,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 128,
              "seconds": 0.00035271658562123774,
              "mlx_peak_bytes": 5963810,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        }
      ]
    },
    {
      "n": 1024,
      "heads": 16,
      "rounds": [
        {
          "round": 1,
          "cells": [
            {
              "padding": 0,
              "seconds": 0.0009795581921935082,
              "mlx_peak_bytes": 45350924,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.0010969499591737986,
              "mlx_peak_bytes": 17563686,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 128,
              "seconds": 0.0006919668056070804,
              "mlx_peak_bytes": 23855142,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 2,
          "cells": [
            {
              "padding": 128,
              "seconds": 0.0007021834142506122,
              "mlx_peak_bytes": 23855142,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.0010757916141301393,
              "mlx_peak_bytes": 17563686,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 0,
              "seconds": 0.00097853341139853,
              "mlx_peak_bytes": 45350924,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 3,
          "cells": [
            {
              "padding": 0,
              "seconds": 0.0009885584004223347,
              "mlx_peak_bytes": 45350924,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.0010957166086882353,
              "mlx_peak_bytes": 17563686,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 128,
              "seconds": 0.0007077750284224749,
              "mlx_peak_bytes": 23855142,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 4,
          "cells": [
            {
              "padding": 128,
              "seconds": 0.0007156583946198225,
              "mlx_peak_bytes": 23855142,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.0012471918016672134,
              "mlx_peak_bytes": 17563686,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 0,
              "seconds": 0.001155975041911006,
              "mlx_peak_bytes": 45350924,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 5,
          "cells": [
            {
              "padding": 0,
              "seconds": 0.0009563665837049485,
              "mlx_peak_bytes": 45350924,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.0011093918234109878,
              "mlx_peak_bytes": 17563686,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 128,
              "seconds": 0.0008233332075178624,
              "mlx_peak_bytes": 23855142,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        }
      ]
    },
    {
      "n": 2048,
      "heads": 16,
      "rounds": [
        {
          "round": 1,
          "cells": [
            {
              "padding": 0,
              "seconds": 0.0033285249955952168,
              "mlx_peak_bytes": 157810698,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.0039306000340729955,
              "mlx_peak_bytes": 35127326,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 128,
              "seconds": 0.002418099995702505,
              "mlx_peak_bytes": 47710246,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 2,
          "cells": [
            {
              "padding": 128,
              "seconds": 0.0024042500182986258,
              "mlx_peak_bytes": 47710246,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.003866324992850423,
              "mlx_peak_bytes": 35127334,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 0,
              "seconds": 0.003158466564491391,
              "mlx_peak_bytes": 157810698,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 3,
          "cells": [
            {
              "padding": 0,
              "seconds": 0.0031838499940931796,
              "mlx_peak_bytes": 157810698,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.0038510250393301248,
              "mlx_peak_bytes": 35127330,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 128,
              "seconds": 0.0023896665778011085,
              "mlx_peak_bytes": 47710242,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 4,
          "cells": [
            {
              "padding": 128,
              "seconds": 0.0023806582204997538,
              "mlx_peak_bytes": 47710246,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.003900941601023078,
              "mlx_peak_bytes": 35127334,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 0,
              "seconds": 0.0032683916389942167,
              "mlx_peak_bytes": 157810698,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        },
        {
          "round": 5,
          "cells": [
            {
              "padding": 0,
              "seconds": 0.0031455999705940485,
              "mlx_peak_bytes": 157810698,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 80,
              "seconds": 0.003902266779914498,
              "mlx_peak_bytes": 35127330,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "padding": 128,
              "seconds": 0.0024119081906974317,
              "mlx_peak_bytes": 47710242,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true
        }
      ]
    }
  ],
  "contract": "CPU float64 softmax oracle. Float32 max error <=max(3*unpadded error,1e-5); BF16 <=max(3*unpadded error,0.01). Every output finite. Scale remains 1/sqrt(72). Five AB/BA rounds per shape, five completed calls per arm; any global swap excludes the whole round. No inference adoption.",
  "passed": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31166513152,
    "swapins": 41703929,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   198684.\nPages active:                                1109674.\nPages inactive:                               784341.\nPages speculative:                            353000.\nPages throttled:                                   0.\nPages wired down:                             247506.\nPages purgeable:                                2241.\n\"Translation faults\":                    13771451550.\nPages copy-on-write:                       626563708.\nPages zero filled:                       15308836658.\nPages reactivated:                        2265033406.\nPages purged:                               61627186.\nFile-backed pages:                           1701328.\nAnonymous pages:                              545687.\nPages stored in compressor:                  1354916.\nPages occupied by compressor:                 389065.\nDecompressions:                            962284899.\nCompressions:                             1256148906.\nPageins:                                  5820832239.\nPageouts:                                   10625472.\nSwapins:                                    41703929.\nSwapouts:                                   69922789.\nPages tagged:                                 179641.\nPages tagged resident:                        135221.\nPages tagged compressed:                       44420.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         3339.\nPages tag-storage non-tag pageable:            88071.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7224832.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651386.\n"
  }
}

```

## Pinned dispatch source

File SHA-256: `4d36489d2f2eadabed1ba275f392f40ed49256b8a7f951c779bbaf8bdd7f125f`

```cpp
    const array& q,
    const array& k,
    const array& v,
    const float scale,
    array& o,
    bool do_causal_,
    const std::optional<array>& mask,
    const std::optional<array>& sinks) {
  if (metal::is_nax_available() && q.shape(3) != 80 &&
      (env::enable_tf32() || q.dtype() != float32)) {
    return sdpa_full_self_attention_nax(
        /* const Stream& s = */ s,
        /* metal::Device& d = */ d,
        /* const array& q = */ q,
        /* const array& k = */ k,
        /* const array& v = */ v,
        /* const float scale = */ scale,
  const int query_head_dim = q.shape(-1);
  const int query_sequence_length = q.shape(2);
  const int key_sequence_length = k.shape(2);
  const int num_query_heads = q.shape(1);
  const int num_kv_heads = k.shape(1);
  const int gqa_factor = num_query_heads / num_kv_heads;

  const bool sdpa_vector_supported_head_dim =
      query_head_dim == value_head_dim &&
      (query_head_dim == 64 || query_head_dim == 96 || query_head_dim == 128 ||
       query_head_dim == 256);
  const bool sdpa_full_supported_head_dim = query_head_dim == value_head_dim &&
      (query_head_dim == 64 || query_head_dim == 80 || query_head_dim == 128);

  const bool sdpa_full_supported_mask = !has_mask || has_arr_mask ||
      (query_sequence_length <= key_sequence_length && do_causal);

  const bool supports_sdpa_full = query_sequence_length > 8 &&
      sdpa_full_supported_mask && sdpa_full_supported_head_dim;

  const bool supports_sdpa_vector = (query_sequence_length <= 8) &&
      (query_sequence_length <= key_sequence_length) &&
      sdpa_vector_supported_head_dim &&
      (query_sequence_length * gqa_factor) <= 32;

  return !(supports_sdpa_full || supports_sdpa_vector);
}

```
