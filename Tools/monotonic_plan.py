#!/usr/bin/env python3
"""More memory must never plan a slower machine.

The prefill pass steps in powers of two, and a step can cost more pool than the
caller just added. Under the old "biggest pass fitting in a quarter of the
budget" rule, --memory-gb 26 planned a smaller expert cache than 25 (116
against 128 per layer) and estimated a slower decode: giving slotstream more
memory made it worse. Planner.prefillChunkFor now scores passes by the time a
representative request takes, prompt and reply together, which prices the trade
in the one unit that matters.

Reads `doctor --json`, not the banner: the banner rounds tok/s to whole numbers,
so two plans either side of a rounding boundary look like a step that is not
there -- an earlier version of this check reported exactly that phantom.
Components may still trade against each other (a bigger pass buying prefill
with cache the decode plateau cannot use is correct), so the total request time
is asserted, not either half.
"""
import json
import os
import subprocess
import sys

BIN = os.environ.get("BIN", ".build/release/slotstream")
PROMPT, REPLY = 2000.0, 400.0


def plan(mem):
    r = subprocess.run(
        [BIN, "doctor", "--sim-ram", "137.4", "--sim-available", "130",
         "--memory-gb", str(mem), "--json"],
        capture_output=True, text=True)
    return json.loads(r.stdout) if r.returncode == 0 else None


def main():
    if plan(40) is None:
        print("FAIL  doctor --json did not run")
        return 1
    prev = prev_mem = None
    for mem in range(7, 91):
        d = plan(mem)
        if d is None:
            continue          # below the floor: refused, not a plan
        secs = PROMPT / d["est_prefill_tok_s"] + REPLY / d["est_warm_tok_s"]
        if prev is not None and secs > prev + 1e-9:
            print(f"FAIL  {mem} GB plans a slower request than {prev_mem} GB: "
                  f"{prev:.3f}s -> {secs:.3f}s "
                  f"({d['experts_per_layer_cached']}/layer, "
                  f"{d['prefill_chunk']}-token pass)")
            return 1
        prev, prev_mem = secs, mem
    return 0


sys.exit(main())
