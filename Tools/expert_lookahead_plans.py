#!/usr/bin/env python3
"""Write the frozen B0/B1/B2 bench plans for a candidate pack.

  python3 Tools/expert_lookahead_plans.py --protocol P --pack DIR --out DIR [--screen]

B0 (headline): off = current deployment at the target (full ordinary cache); on = prefetch with the
charged 128 MiB reserve at the same target. B1 (mechanism): both arms charge the reserve, prefetch off
versus on. B2 (overhead): both charge the reserve, shadow forecasts (no reads) versus the reserve-only
control. `--screen` uses the validation screen prompts (2 per family for code/reasoning/prose, 2 rounds,
128 outputs); otherwise the sealed B0 cohort (6 families x 2 prompts x 3 rounds, 512 outputs).
"""
import argparse
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import expert_lookahead as xla  # noqa: E402


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--protocol", required=True); ap.add_argument("--pack", default=None); ap.add_argument("--out", required=True)
    ap.add_argument("--screen", action="store_true"); ap.add_argument("--reserve-mib", default="128")
    ap.add_argument("--cap", default="32"); ap.add_argument("--top", default="16"); ap.add_argument("--window", default="4")
    ap.add_argument("--lanes", default="8"); ap.add_argument("--device", default="gpu"); ap.add_argument("--policy", default="pack")
    ap.add_argument("--strides", default="2,1"); ap.add_argument("--issue-cap", default="32"); ap.add_argument("--threshold", default=None)
    ap.add_argument("--adopt", default=None, choices=["staging", "slot"]); ap.add_argument("--slot-cap", default=None)
    ap.add_argument("--memo-layers", default="0")
    ap.add_argument("--replacement", default=None, help="SLOTSTREAM_EXPERT_REPLACEMENT policy for the R1/B0 arms (W5)")
    args = ap.parse_args()
    proto = xla.read_json(args.protocol)
    reserve = {"SLOTSTREAM_EXPERT_LOOKAHEAD_RESERVE_MIB": args.reserve_mib}
    knobs = {"SLOTSTREAM_EXPERT_PREFETCH_CAP": args.cap, "SLOTSTREAM_EXPERT_PREFETCH_TOP": args.top,
             "SLOTSTREAM_EXPERT_PREFETCH_WINDOW": args.window, "SLOTSTREAM_EXPERT_PREFETCH_LANES": args.lanes,
             "SLOTSTREAM_EXPERT_PREFETCH_DEVICE": args.device, "SLOTSTREAM_EXPERT_PREFETCH_POLICY": args.policy}
    if args.policy == "router":
        knobs.update({"SLOTSTREAM_EXPERT_PREFETCH_STRIDES": args.strides, "SLOTSTREAM_EXPERT_PREFETCH_ISSUE_CAP": args.issue_cap,
                      "SLOTSTREAM_EXPERT_PREFETCH_MEMO_LAYERS": args.memo_layers})
        if args.threshold is not None:
            knobs["SLOTSTREAM_EXPERT_PREFETCH_THRESHOLD"] = args.threshold
        if args.adopt:
            knobs["SLOTSTREAM_EXPERT_PREFETCH_ADOPT"] = args.adopt
        if args.slot_cap:
            knobs["SLOTSTREAM_EXPERT_PREFETCH_SLOT_CAP"] = args.slot_cap
        pack = None
        packenv = {}
    else:
        if not args.pack:
            raise SystemExit("--pack is required for the pack policy")
        pack = str(Path(args.pack).resolve())
        packenv = {"SLOTSTREAM_EXPERT_PACK": pack}
    replacement = {"SLOTSTREAM_EXPERT_REPLACEMENT": args.replacement} if args.replacement else {}
    on = dict(reserve, SLOTSTREAM_OPT_EXPERT_PREFETCH="1", **packenv, **knobs, **replacement)
    shadow = dict(reserve, SLOTSTREAM_OPT_EXPERT_PREFETCH_SHADOW="1", **packenv, **knobs)
    if args.screen:
        prompts, rounds, max_tokens = proto["screen_prompt_ids"], proto["screen_rounds"], proto["screen_max_tokens"]
    else:
        prompts, rounds, max_tokens = proto["b0_prompt_ids"], proto["b0_rounds"], proto["b0_max_tokens"]
    common = dict(prompts=prompts, rounds=rounds, warmup_tokens=proto["b0_warmup_tokens"], max_tokens=max_tokens, pack=pack)
    plans = {
        "b0": dict(comparison="B0", arms=[dict(name="off", env={}), dict(name="on", env=on)], **common),
        "b1": dict(comparison="B1", arms=[dict(name="off-reserve", env=reserve), dict(name="on", env=on)], **common),
        "b2": dict(comparison="B2", arms=[dict(name="off-reserve", env=reserve), dict(name="shadow", env=shadow)], **common),
    }
    if replacement:
        # R1: CLOCK versus the ported policy at the same slot count and budget, no prefetch in either arm.
        plans["r1"] = dict(comparison="R1", arms=[dict(name="clock", env={}), dict(name="policy", env=replacement)], **common)
    out = Path(args.out); out.mkdir(parents=True, exist_ok=True)
    for name, plan in plans.items():
        xla.write_json(out / f"plan-{name}{'-screen' if args.screen else ''}.json", plan)
    print(json.dumps({k: [a["name"] for a in v["arms"]] for k, v in plans.items()}), "written to", out)


if __name__ == "__main__":
    main()
