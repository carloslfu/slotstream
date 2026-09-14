#!/usr/bin/env python3
"""Expert Lookahead paired benchmark orchestration (B0/B1/B2) and reporting.

Each arm is a fresh `slotstream expert-lookahead-bench` process: same-prompt warmup, then one measured
request. Readiness before every arm: thermal nominal, low power off, stable swap counters over a
120 s sampled interval, and the plan's preflight. Arm order alternates by prompt and round; family
order rotates. Pairs are eligible only when both arms complete with exact output IDs and router
digests, no swap deltas and nominal conditions. Excluded rows are preserved.
"""
import json
import math
import os
import random
import statistics
import subprocess
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import expert_lookahead as xla  # noqa: E402
from prefill_bench import vm_snapshot, host_conditions  # noqa: E402

READINESS_SECONDS = 120
READINESS_LIMIT = 600
# Successor protocol rule (Section 8 of the Expert Lookahead 2 plan): readiness samples swap-outs
# only, over 30 s; a pair is timing-eligible when no swap-out happened during either arm and the
# engine's own page-ins grew by at most the frozen threshold. Both verdicts are always recorded.
PAGEIN_RULE = "process-pageins-v1"
PAGEIN_READINESS_SECONDS = 30


def rule_of(proto):
    rule = proto.get("eligibility_rule") or {}
    return rule.get("name", "swap-stable-120s"), int(rule.get("page_in_threshold_pages", 4096))


def thermal_nominal():
    out = subprocess.run(["pmset", "-g", "therm"], capture_output=True, text=True).stdout
    return ("No thermal warning level has been recorded" in out or "CPU_Scheduler_Limit \t= 100" in out), out


def low_power_off():
    out = subprocess.run(["pmset", "-g"], capture_output=True, text=True).stdout
    for line in out.splitlines():
        if "lowpowermode" in line:
            return line.strip().endswith("0"), line.strip()
    return True, "lowpowermode not reported"


def wait_ready(needed_gb, rule="swap-stable-120s"):
    """Sampled readiness: swap counters stable over the rule's interval, at most READINESS_LIMIT waiting."""
    deadline = time.monotonic() + READINESS_LIMIT
    interval = PAGEIN_READINESS_SECONDS if rule == PAGEIN_RULE else READINESS_SECONDS
    while True:
        ok_t, therm = thermal_nominal()
        ok_p, power = low_power_off()
        a = vm_snapshot()
        time.sleep(interval if os.environ.get("XLA_FAST_READINESS") is None else 2)
        b = vm_snapshot()
        if rule == PAGEIN_RULE:
            stable = a["swapouts"] == b["swapouts"]
        else:
            stable = a["swapins"] == b["swapins"] and a["swapouts"] == b["swapouts"]
        enough = b["reclaimable_bytes"] >= needed_gb * 1e9
        if ok_t and ok_p and stable and enough:
            return dict(thermal=therm.strip().splitlines()[-1] if therm.strip() else "", power=power,
                        reclaimable_gb=b["reclaimable_bytes"] / 1e9, swapins=b["swapins"], swapouts=b["swapouts"],
                        rule=rule, interval_seconds=interval, swapins_delta=b["swapins"] - a["swapins"])
        if time.monotonic() > deadline:
            raise SystemExit(f"readiness not reached: thermal {ok_t}, power {ok_p}, swap stable {stable}, "
                             f"reclaimable {b['reclaimable_bytes']/1e9:.1f} GB")
        xla.log(f"not ready (thermal {ok_t}, power {ok_p}, swap stable {stable}, reclaimable {b['reclaimable_bytes']/1e9:.1f} GB); waiting")


def arm_env(proto, arm):
    return xla.run_env(proto, arm.get("env", {}))


# An arm that produces nothing for this long is stalled (a 512-output arm takes about two
# minutes); it is killed, recorded as a stall and its pair is ineligible.
ARM_TIMEOUT_SECONDS = int(os.environ.get("XLA_ARM_TIMEOUT_SECONDS", "1200"))
DEFAULT_MODEL_LOCK = f"/tmp/slotstream-model-{os.getuid()}.lock"
STALL_STATE = {"lock_path": os.environ.get("SLOTSTREAM_MODEL_LOCK_PATH") or DEFAULT_MODEL_LOCK, "stalls": 0}


def live_model_processes():
    """Live slotstream engine processes (resident memory above 100 MB); a stuck-exiting zombie has none."""
    out = subprocess.run(["ps", "-axo", "pid=,rss=,stat=,command="], capture_output=True, text=True).stdout
    live = []
    for line in out.splitlines():
        parts = line.split(None, 3)
        if len(parts) < 4 or "slotstream" not in parts[3] or "expert_lookahead" in parts[3]:
            continue
        try:
            rss_kb = int(parts[1])
        except ValueError:
            continue
        if rss_kb > 100 * 1024 and "E" not in parts[2]:
            live.append(line.strip()[:120])
    return live


def model_lock_free(path):
    import fcntl
    with open(path, "a") as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
            return True
        except BlockingIOError:
            return False


def preflight_lock(needed_gb):
    """The one-process rule: the default lock must be free, or, when a previous stalled child of this
    bench still holds it while stuck exiting, an override path is used only after verifying that no
    live model process exists. Headroom is checked the same way as prefill_bench.preflight."""
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise RuntimeError(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    path = STALL_STATE["lock_path"]
    if model_lock_free(DEFAULT_MODEL_LOCK):
        STALL_STATE["lock_path"] = DEFAULT_MODEL_LOCK
        return DEFAULT_MODEL_LOCK
    live = live_model_processes()
    if live:
        raise RuntimeError("another model process holds the lock: " + "; ".join(live))
    if path == DEFAULT_MODEL_LOCK or not model_lock_free(path):
        path = f"{DEFAULT_MODEL_LOCK}.{os.getpid()}.{STALL_STATE['stalls']}"
        STALL_STATE["lock_path"] = path
    xla.log(f"default model lock held by a stuck-exiting process with no live model process; using {path}")
    return path


def run_arm(proto, arm, request_path, out_path, warmup, max_tokens, needed_gb, log_dir):
    readiness = wait_ready(needed_gb, rule_of(proto)[0])
    lock_path = preflight_lock(needed_gb)
    command = [proto["binary"], "expert-lookahead-bench", "--protocol", proto["_path"], "--request", str(request_path),
               "--out", str(out_path), "--memory-gb", str(arm.get("memory_gb", proto["memory_gb"])), "--mtp", "on",
               "--warmup-tokens", str(warmup), "--max-tokens", str(max_tokens)]
    env = arm_env(proto, arm)
    if lock_path != DEFAULT_MODEL_LOCK:
        env["SLOTSTREAM_MODEL_LOCK_PATH"] = lock_path
    before = vm_snapshot()
    started = time.time()
    stalled = False
    with open(log_dir / (out_path.stem + ".log"), "w") as logfile:
        logfile.write(json.dumps({"command": command, "env": {k: v for k, v in env.items() if k.startswith("SLOTSTREAM_")},
                                  "readiness": readiness, "lock_path": lock_path}) + "\n")
        logfile.flush()
        child = subprocess.Popen(command, env=env, stdout=logfile, stderr=subprocess.STDOUT, cwd=xla.ROOT)
        try:
            code = child.wait(timeout=ARM_TIMEOUT_SECONDS)
        except subprocess.TimeoutExpired:
            stalled = True
            STALL_STATE["stalls"] += 1
            child.kill()
            try:
                code = child.wait(timeout=30)
            except subprocess.TimeoutExpired:
                code = -9
            logfile.write(f"\n[bench] arm stalled: no exit after {ARM_TIMEOUT_SECONDS} s; killed (pid {child.pid})\n")
            xla.log(f"arm {arm['name']} stalled after {ARM_TIMEOUT_SECONDS} s; killed pid {child.pid}")
    after = vm_snapshot()
    record = dict(arm=arm["name"], exit=code, seconds=time.time() - started, readiness=readiness, stalled=stalled,
                  lock_path=lock_path,
                  swap_delta=dict(swapins=after["swapins"] - before["swapins"], swapouts=after["swapouts"] - before["swapouts"]),
                  thermal_after=thermal_nominal()[0], out=str(out_path))
    if code == 0 and out_path.exists() and not stalled:
        record["result"] = xla.read_json(out_path)
        record["pageins_delta"] = record["result"].get("measured", {}).get("pageins_delta")
    return record


def pair_eligible(a, b, rule="swap-stable-120s", pagein_threshold=4096):
    """Both verdicts: the previous host-swap rule and the process-attributed page-in rule.
    Correctness reasons (output or digest mismatch) apply to both and are never a timing exclusion only."""
    common, old, new = [], [], []
    for r in (a, b):
        if r.get("stalled"):
            common.append(f"{r['arm']} stalled (killed after the arm timeout)")
        elif r["exit"] != 0 or "result" not in r:
            common.append(f"{r['arm']} failed")
        if not r["thermal_after"]:
            common.append(f"{r['arm']} thermal not nominal")
        if r["swap_delta"]["swapins"] or r["swap_delta"]["swapouts"]:
            old.append(f"{r['arm']} swap changed")
        if r["swap_delta"]["swapouts"]:
            new.append(f"{r['arm']} swap-outs during the arm")
        delta = r.get("pageins_delta")
        if delta is None:
            new.append(f"{r['arm']} page-in counter unavailable")
        elif delta > pagein_threshold:
            new.append(f"{r['arm']} page-ins {delta} > {pagein_threshold}")
    if "result" in a and "result" in b:
        ma, mb = a["result"]["measured"], b["result"]["measured"]
        if ma["output_ids"] != mb["output_ids"]:
            common.append("output IDs differ (correctness failure)")
        if ma["router_sha256"] != mb["router_sha256"]:
            common.append("router digests differ (correctness failure)")
        if ma["stats"]["finishReason"] != mb["stats"]["finishReason"]:
            common.append("finish reasons differ")
    verdicts = {"swap-stable-120s": (not (common + old), common + old), PAGEIN_RULE: (not (common + new), common + new)}
    eligible, reasons = verdicts.get(rule, verdicts["swap-stable-120s"])
    return eligible, reasons, verdicts


def cmd_bench(args):
    proto = xla.read_json(args.protocol)
    proto["_path"] = args.protocol
    plan = xla.read_json(args.plan)
    out = Path(args.out)
    (out / "arms").mkdir(parents=True, exist_ok=True)
    manifest = xla.corpus_manifest()
    arms = plan["arms"]                       # list of {name, env, memory_gb?}
    assert len(arms) == 2, "a comparison has exactly two arms"
    prompts = plan["prompts"]                 # {family: [request ids]}
    rounds = plan["rounds"]
    warmup = plan.get("warmup_tokens", proto["b0_warmup_tokens"])
    max_tokens = plan.get("max_tokens", proto["b0_max_tokens"])
    needed_gb = max(a.get("memory_gb", proto["memory_gb"]) for a in arms) + xla.PREFLIGHT_MARGIN_GB
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
                first = (rnd + fi + pi) % 2
                schedule.append((rnd, family, rid, first))
    xla.log(f"{len(schedule)} pairs scheduled, {len(done)} already done")
    for rnd, family, rid, first in schedule:
        if (rid, rnd) in done:
            continue
        payload = xla.request_payload(manifest, [rid])[0]
        request_path = out / "arms" / f"{rid}.json"
        xla.write_json(request_path, payload)
        order = [arms[first], arms[1 - first]]
        results = []
        for arm in order:
            out_path = out / "arms" / f"{rid}-r{rnd}-{arm['name']}.json"
            results.append(run_arm(proto, arm, request_path, out_path, warmup, max_tokens, needed_gb, out / "arms"))
        by_name = {r["arm"]: r for r in results}
        a, b = by_name[arms[0]["name"]], by_name[arms[1]["name"]]
        rule, threshold = rule_of(proto)
        eligible, reasons, verdicts = pair_eligible(a, b, rule, threshold)
        row = dict(request_id=rid, family=family, kind=payload["kind"], round=rnd, order=[o["name"] for o in order],
                   eligible=eligible, reasons=reasons, rule=rule,
                   verdicts={k: dict(eligible=v[0], reasons=v[1]) for k, v in verdicts.items()}, arms={})
        for r in results:
            entry = dict(exit=r["exit"], seconds=r["seconds"], swap_delta=r["swap_delta"], thermal_after=r["thermal_after"],
                         readiness=r["readiness"], out=r["out"], pageins_delta=r.get("pageins_delta"))
            if "result" in r:
                m = r["result"]["measured"]["stats"]
                inter = sorted(m.get("interTokenSeconds", []))
                entry.update(dict(decode_tokens=m["decodeTokens"], decode_seconds=m["decodeSeconds"],
                                  tps=(m["decodeTokens"] / m["decodeSeconds"] if m["decodeSeconds"] else 0.0),
                                  prefill_seconds=m["prefillSeconds"], request_seconds=m["requestSeconds"],
                                  ttft=m.get("firstTokenSeconds"), finish=m["finishReason"],
                                  p95_inter_token=(inter[int(0.95 * (len(inter) - 1))] if inter else None),
                                  decode_records=m["decodeRecords"], decode_read_bytes=m["decodeReadBytes"],
                                  hit_rate=m["expertHitRate"], accepted=m["acceptedDrafts"], drafted=m["draftedTokens"],
                                  verify_passes=m["verifyPasses"], peak_gb=m["peakMemoryGB"],
                                  prefetch=m.get("expertPrefetch"), pool_slots=r["result"]["pool_slots"],
                                  output_count=len(r["result"]["measured"]["output_ids"])))
            row["arms"][r["arm"]] = entry
        with open(pairs_path, "a") as f:
            f.write(json.dumps(row, sort_keys=True) + "\n")
        tps = {k: round(v.get("tps", 0), 2) for k, v in row["arms"].items()}
        xla.log(f"pair {rid} round {rnd} {family}: {tps} eligible={eligible} {reasons}")
    report(args.protocol, out, arms, prompts)


def bootstrap(ratios_by_family, draws, seed):
    """ratios_by_family: {family: {prompt: [eligible pair ratios]}}; equal family weight, geometric mean."""
    rng = random.Random(seed)
    fams = [f for f in ratios_by_family if ratios_by_family[f]]
    values = []
    for _ in range(draws):
        logs = []
        for f in fams:
            prompts = list(ratios_by_family[f])
            picked = [prompts[rng.randrange(len(prompts))] for _ in prompts]
            per_prompt = []
            for p in picked:
                rounds = ratios_by_family[f][p]
                sample = [rounds[rng.randrange(len(rounds))] for _ in rounds]
                per_prompt.append(statistics.median(sample))
            logs.append(sum(math.log(x) for x in per_prompt) / len(per_prompt))
        values.append(math.exp(sum(logs) / len(logs)))
    values.sort()
    return dict(draws=draws, seed=seed, p2_5=values[int(0.025 * draws)], p97_5=values[int(0.975 * draws) - 1],
                median=statistics.median(values))


def report(protocol_path, out, arms, prompts):
    proto = xla.read_json(protocol_path)
    on, off = arms[1]["name"], arms[0]["name"]
    rows = [json.loads(l) for l in open(Path(out) / "pairs.jsonl") if l.strip()]
    by_family = {}
    excluded = []
    for r in rows:
        if not r["eligible"]:
            excluded.append(r)
            continue
        a, b = r["arms"][on], r["arms"][off]
        by_family.setdefault(r["family"], {}).setdefault(r["request_id"], []).append(
            dict(tps=a["tps"] / b["tps"], duration=a["request_seconds"] / b["request_seconds"],
                 ttft=(a["ttft"] / b["ttft"]) if a.get("ttft") and b.get("ttft") else None, round=r["round"]))
    families = {}
    for family, per_prompt in by_family.items():
        prompt_medians = []
        for rid, pairs in per_prompt.items():
            # A true median: with an even count, the mean of the two middle
            # values. Report v1 took the upper one, which biased every prompt
            # with two clean pairs and every two-prompt family upward.
            prompt_medians.append(dict(request_id=rid, pairs=len(pairs),
                                       tps_ratio=statistics.median(p["tps"] for p in pairs),
                                       duration_ratio=statistics.median(p["duration"] for p in pairs),
                                       insufficient=len(pairs) < proto["arithmetic"]["gates"]["min_clean_pairs_per_prompt"]))
        # A family is the geometric mean of its prompt medians, the statistic
        # the registered bootstrap resamples, so the point estimate is that
        # bootstrap's own value on the observed data.
        families[family] = dict(prompts=prompt_medians,
                                tps_ratio=math.exp(sum(math.log(p["tps_ratio"]) for p in prompt_medians) / len(prompt_medians)),
                                duration_ratio=math.exp(sum(math.log(p["duration_ratio"]) for p in prompt_medians) / len(prompt_medians)))
    if families:
        aggregate = math.exp(sum(math.log(f["tps_ratio"]) for f in families.values()) / len(families))
        boot = bootstrap({f: {p: [x["tps"] for x in pairs] for p, pairs in per.items()} for f, per in by_family.items()},
                         xla.BOOTSTRAP_DRAWS, xla.BOOTSTRAP_SEED)
    else:
        aggregate, boot = None, None
    gates = proto["arithmetic"]["gates"]
    verdict = None
    if families:
        insufficient = any(p["insufficient"] for f in families.values() for p in f["prompts"]) or \
            any(len(prompts[f]) != len(families.get(f, {}).get("prompts", [])) for f in prompts)
        verdict = dict(
            aggregate_ratio=aggregate,
            lower_bound=boot["p2_5"], upper_bound=boot["p97_5"],
            family_floor_ok=all(f["tps_ratio"] >= gates["family_floor"] for f in families.values()),
            duration_ok=all(f["duration_ratio"] <= 1 + gates["duration_regression"] for f in families.values()),
            evidence_sufficient=not insufficient,
            success=(aggregate >= gates["aggregate_ratio"] and boot["p2_5"] > gates["lower_bound"]
                     and all(f["tps_ratio"] >= gates["family_floor"] for f in families.values())
                     and all(f["duration_ratio"] <= 1 + gates["duration_regression"] for f in families.values())
                     and not insufficient),
        )
    absolute = {}
    for name in (on, off):
        vals = [r["arms"][name]["tps"] for r in rows if r["eligible"]]
        absolute[name] = dict(pairs=len(vals), median_tps=(statistics.median(vals) if vals else None),
                              mean_tps=(sum(vals) / len(vals) if vals else None))
    summary = dict(schema="expert-lookahead-bench-report-v2", arms=[a["name"] for a in arms], pairs=len(rows),
                   eligible=sum(1 for r in rows if r["eligible"]), excluded=[dict(request_id=r["request_id"], round=r["round"], reasons=r["reasons"]) for r in excluded],
                   rule=rule_of(proto)[0], pagein_threshold_pages=rule_of(proto)[1],
                   verdict_counts={name: sum(1 for r in rows if r.get("verdicts", {}).get(name, {}).get("eligible")) for name in ("swap-stable-120s", PAGEIN_RULE)},
                   families=families, aggregate_tps_ratio=aggregate, bootstrap=boot, verdict=verdict, absolute=absolute,
                   gates=gates, host=host_conditions())
    xla.write_json(Path(out) / "report.json", summary)
    print(json.dumps({k: v for k, v in summary.items() if k not in ("families", "host")}, indent=1))
    for f, v in families.items():
        print(f"  {f}: tps x{v['tps_ratio']:.3f} duration x{v['duration_ratio']:.3f} "
              + " ".join(f"{p['request_id']}={p['tps_ratio']:.3f}({p['pairs']})" for p in v["prompts"]))


def cmd_report(args):
    plan = xla.read_json(args.plan)
    report(args.protocol, Path(args.out), plan["arms"], plan["prompts"])


def register(sub):
    p = sub.add_parser("bench", help="Paired fresh-process benchmark arms")
    p.add_argument("--protocol", required=True); p.add_argument("--plan", required=True); p.add_argument("--out", required=True)
    p.set_defaults(func=cmd_bench)
    p = sub.add_parser("report", help="Recompute the paired report for a bench directory")
    p.add_argument("--protocol", required=True); p.add_argument("--plan", required=True); p.add_argument("--out", required=True)
    p.set_defaults(func=cmd_report)
