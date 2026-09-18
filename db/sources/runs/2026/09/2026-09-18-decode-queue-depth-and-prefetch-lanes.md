---
type: run
id: 01m2swpp9hs2t2dhjxwr5p5v1j
created: 2026-09-18T08:10:00.000000+00:00
updated: 2026-09-18T08:10:00.000000+00:00
summary: Three mirrored arms differing only in pool queue depth or prefetch lanes, plus the two minimum-value controls
binary: aa895c41274f5ac972712fa26c15ff8ded06db6654f1f729898f17f1804bfd24
captured_at: 2026-09-18
command: /tmp/depth_ab.sh then /tmp/controls.sh
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Pool queue depth and prefetch lanes, raised and then crushed
tool: slotstream run
---
The same binary as
[[sources/runs/2026/09/2026-09-18-mirror-decode-ab-three-rounds]], so the `base`
arm here is directly comparable to that record's mirrored median of 7.35 tok/s.
The only sources newer than the binary are documentation comments and
`Tools/diskbench.c`, which is not linked into it.

Every arm passes `--mirror`; the arms differ only in one environment variable.
The controls exist because an unchanged result cannot distinguish "this knob
does not bind" from "this knob is not connected", so each variable is also
driven to its minimum, where a live knob must hurt.

## Scripts

```bash
#!/bin/bash
# Does decode's shortfall against the two-disk ceiling come from the demand
# queue being too shallow, or from the prefetch not being allowed to fill the
# gaps? Three arms, all mirrored, differing only in one environment variable.
#
# base : shipping defaults (pool queue depth 32, prefetch lanes 8)
# qd   : pool queue depth 128. The prediction is *no change*: a demand batch
#        holds about one record, so lanes = min(queueDepth, 9 * records) is
#        already decided by the record count, not by the setting.
# pf   : prefetch lanes 24. The prediction is a gain: 14,353 of 16,422
#        speculative tickets in the recorded run had to wait for a lane.
#
# Arms alternate inside a round and the verdict is the median of three rounds,
# because single runs on this machine vary by more than the effect measured.
set -u

BIN=/Volumes/llm/src/slotstream/.build/release/slotstream
EXT=/Volumes/llm/models/qwen38-flash-next-mlx-4bit
INT=/Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit
OUT=/tmp/depth_ab
rm -rf "$OUT"; mkdir -p "$OUT"
ROUNDS=3
PROMPT="请用中文解释什么是混合专家模型（Mixture of Experts），以及它在推理时为什么需要从存储中反复读取专家权重。请展开讲解，不要只写提纲。"

reclaimable_gb() {
  vm_stat | awk '
    /page size of/ { for (i = 1; i <= NF; i++) if ($i == "of") { psize = $(i+1); break } }
    /^Pages free:/ { free = $3 }
    /^Pages purgeable:/ { purge = $3 }
    /^File-backed pages:/ { ext = $3 }
    END { gsub(/\./, "", free); gsub(/\./, "", purge); gsub(/\./, "", ext)
          printf "%.2f", (free + purge + ext) * psize / 1e9 }'
}

wait_for_memory() {
  local want=$1 need=3 stable=0 tries=0 gb=
  while [ $tries -lt 60 ]; do
    gb=$(reclaimable_gb)
    if awk "BEGIN{exit !($gb >= $want)}"; then
      stable=$((stable + 1))
      [ $stable -ge $need ] && { echo "  (reclaimable ${gb} GB, stable across $need readings)"; sleep 10; return 0; }
    else
      stable=0
    fi
    sleep 10
    tries=$((tries + 1))
  done
  echo "  WARNING: reclaimable stalled at ${gb} GB, wanted ${want} GB"
}

run() {
  local name=$1 qd=$2 pf=$3
  wait_for_memory 28
  env SLOTSTREAM_POOL_QUEUE_DEPTH="$qd" SLOTSTREAM_EXPERT_PREFETCH_LANES="$pf" \
    "$BIN" run --model "$EXT" --mirror "$INT" \
    --experts-per-layer 118 --max-context 8192 --mtp on \
    --max-tokens 200 --greedy --seed 1 \
    --stats-json "$OUT/$name.json" \
    --prompt "$PROMPT" > "$OUT/$name.txt" 2> "$OUT/$name.log"
  echo "[$name qd=$qd pf=$pf] exit $? — $(grep -o 'decode 200 tok in .*' "$OUT/$name.log" | head -1)"
}

for r in $(seq 1 $ROUNDS); do
  echo "=== round $r ==="
  run "r${r}_base" 32 8
  run "r${r}_qd"  128 8
  run "r${r}_pf"   32 24
done

echo
echo "=== prefill and mirror-split lines ==="
for f in "$OUT"/*.log; do
  echo "$(basename "$f" .log)"
  grep -E '^-- (prefill|decode|mirror)' "$f"
done

echo
python3 - "$OUT" "$ROUNDS" <<'PY'
import hashlib, json, pathlib, statistics, sys

out, rounds = pathlib.Path(sys.argv[1]), int(sys.argv[2])
metrics = ("tok/s", "io s", "read GB", "GB/s", "records")
extra = ("issued", "adopted", "wastedGB", "deferred")
arms = ("base", "qd", "pf")


def row(name):
    p = out / f"{name}.json"
    if not p.exists():
        return None
    st = json.load(p.open())["stats"]
    io = st.get("decodeIOSeconds", 0.0)
    gb = st.get("decodeReadBytes", 0) / 1e9
    sec = st.get("decodeSeconds") or st.get("decodeWallSeconds") or 0.0
    toks = st.get("decodeTokens") or st.get("generatedTokens") or 0
    pf = st.get("expertPrefetch", {})
    return {"tok/s": toks / sec if sec else 0, "io s": io, "read GB": gb,
            "GB/s": gb / io if io else 0, "records": st.get("decodeRecords", 0),
            "issued": pf.get("issued", 0), "adopted": pf.get("adopted", 0),
            "wastedGB": pf.get("wastedBytes", 0) / 1e9,
            "deferred": pf.get("deferredLaneAcquisitions", 0)}


cols = metrics + extra
print(f"{'round':<7}{'arm':<7}" + "".join(f"{m:>10}" for m in cols))
print("-" * (14 + 10 * len(cols)))
collected = {a: [] for a in arms}
for r in range(1, rounds + 1):
    for arm in arms:
        v = row(f"r{r}_{arm}")
        if v is None:
            print(f"{r:<7}{arm:<7}{'(run failed)':>20}")
            continue
        collected[arm].append(v)
        print(f"{r:<7}{arm:<7}" + "".join(f"{v[m]:>10.2f}" for m in cols))

print()
print(f"{'median':<7}{'arm':<7}" + "".join(f"{m:>10}" for m in cols))
print("-" * (14 + 10 * len(cols)))
med = {}
for arm in arms:
    if collected[arm]:
        med[arm] = {m: statistics.median(v[m] for v in collected[arm]) for m in cols}
        print(f"{'':<7}{arm:<7}" + "".join(f"{med[arm][m]:>10.2f}" for m in cols))

print()
print("spread within each arm (max - min), to judge whether a difference is real")
for arm in arms:
    if collected[arm]:
        vals = [v["tok/s"] for v in collected[arm]]
        print(f"  {arm:<6} tok/s {min(vals):.2f} .. {max(vals):.2f}  (spread {max(vals)-min(vals):.2f})")

if "base" in med:
    print()
    for arm in ("qd", "pf"):
        if arm in med:
            print(f"  {arm} / base:  " + "  ".join(
                f"{m} {med[arm][m]/med['base'][m]:.3f}" for m in metrics if med["base"][m]))

print()
digests = set()
for r in range(1, rounds + 1):
    for arm in arms:
        p = out / f"r{r}_{arm}.txt"
        if p.exists():
            digests.add(hashlib.md5(p.read_bytes()).hexdigest())
print(f"distinct generated-text digests across all runs: {len(digests)} (must be 1)")
PY
```

```bash
#!/bin/bash
# Positive controls for the null result. A knob that changes nothing when
# raised might simply not be connected, so each is driven to its minimum
# instead: if decode is unaffected by one lane where it had eight, the
# variable is dead and the null result above says nothing.
set -u
BIN=/Volumes/llm/src/slotstream/.build/release/slotstream
EXT=/Volumes/llm/models/qwen38-flash-next-mlx-4bit
INT=/Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit
OUT=/tmp/depth_controls
rm -rf "$OUT"; mkdir -p "$OUT"
PROMPT="请用中文解释什么是混合专家模型（Mixture of Experts），以及它在推理时为什么需要从存储中反复读取专家权重。请展开讲解，不要只写提纲。"

reclaimable_gb() {
  vm_stat | awk '
    /page size of/ { for (i = 1; i <= NF; i++) if ($i == "of") { psize = $(i+1); break } }
    /^Pages free:/ { free = $3 } /^Pages purgeable:/ { purge = $3 } /^File-backed pages:/ { ext = $3 }
    END { gsub(/\./, "", free); gsub(/\./, "", purge); gsub(/\./, "", ext)
          printf "%.2f", (free + purge + ext) * psize / 1e9 }'
}
wait_for_memory() {
  local stable=0 tries=0 gb=
  while [ $tries -lt 60 ]; do
    gb=$(reclaimable_gb)
    if awk "BEGIN{exit !($gb >= 28)}"; then
      stable=$((stable + 1)); [ $stable -ge 3 ] && { sleep 10; return 0; }
    else stable=0; fi
    sleep 10; tries=$((tries + 1))
  done
  echo "  WARNING: reclaimable stalled at ${gb} GB"
}
run() {
  local name=$1 qd=$2 pf=$3
  wait_for_memory
  env SLOTSTREAM_POOL_QUEUE_DEPTH="$qd" SLOTSTREAM_EXPERT_PREFETCH_LANES="$pf" \
    "$BIN" run --model "$EXT" --mirror "$INT" \
    --experts-per-layer 118 --max-context 8192 --mtp on \
    --max-tokens 200 --greedy --seed 1 --stats-json "$OUT/$name.json" \
    --prompt "$PROMPT" > "$OUT/$name.txt" 2> "$OUT/$name.log"
  echo "[$name qd=$qd pf=$pf] exit $?"
}
run "lanes1" 32 1
run "qd1"     1 8

echo
echo "--- does an out-of-range value even reach the configuration? ---"
env SLOTSTREAM_EXPERT_PREFETCH_LANES=99 "$BIN" run --model "$EXT" \
  --max-tokens 1 --greedy --prompt hi > /dev/null 2> "$OUT/invalid.log"
echo "exit $?"; grep -iE 'lanes|error|must be' "$OUT/invalid.log" | head -3

echo
python3 - "$OUT" <<'PY'
import json, pathlib, sys
out = pathlib.Path(sys.argv[1])
print(f"{'run':<10}{'tok/s':>9}{'io s':>9}{'GB/s':>8}{'issued':>9}{'adopted':>9}{'deferred':>10}")
for name in ("lanes1", "qd1"):
    p = out / f"{name}.json"
    if not p.exists():
        print(f"{name:<10}{'(failed)':>9}"); continue
    st = json.load(p.open())["stats"]
    io = st.get("decodeIOSeconds", 0.0); gb = st.get("decodeReadBytes", 0) / 1e9
    sec = st.get("decodeSeconds") or st.get("decodeWallSeconds") or 0.0
    toks = st.get("decodeTokens") or st.get("generatedTokens") or 0
    pf = st.get("expertPrefetch", {})
    print(f"{name:<10}{toks/sec if sec else 0:>9.2f}{io:>9.2f}{gb/io if io else 0:>8.2f}"
          f"{pf.get('issued',0):>9}{pf.get('adopted',0):>9}{pf.get('deferredLaneAcquisitions',0):>10}")
print()
print("reference, medians of the three-round run above:")
print(f"{'base':<10}{7.31:>9.2f}{7.63:>9.2f}{3.02:>8.2f}{16423:>9}{8677:>9}{14247:>10}")
PY
```

## Three-arm output

```text
=== round 1 ===
  (reclaimable 28.08 GB, stable across 3 readings)
[r1_base qd=32 pf=8] exit 0 — decode 200 tok in 27.95s (7.16 tok/s)
  (reclaimable 29.42 GB, stable across 3 readings)
[r1_qd qd=128 pf=8] exit 0 — decode 200 tok in 27.04s (7.40 tok/s)
  (reclaimable 29.44 GB, stable across 3 readings)
[r1_pf qd=32 pf=24] exit 0 — decode 200 tok in 27.32s (7.32 tok/s)
=== round 2 ===
  (reclaimable 29.41 GB, stable across 3 readings)
[r2_base qd=32 pf=8] exit 0 — decode 200 tok in 27.36s (7.31 tok/s)
  (reclaimable 29.42 GB, stable across 3 readings)
[r2_qd qd=128 pf=8] exit 0 — decode 200 tok in 27.03s (7.40 tok/s)
  (reclaimable 29.42 GB, stable across 3 readings)
[r2_pf qd=32 pf=24] exit 0 — decode 200 tok in 27.04s (7.40 tok/s)
=== round 3 ===
  (reclaimable 29.36 GB, stable across 3 readings)
[r3_base qd=32 pf=8] exit 0 — decode 200 tok in 27.07s (7.39 tok/s)
  (reclaimable 29.42 GB, stable across 3 readings)
[r3_qd qd=128 pf=8] exit 0 — decode 200 tok in 26.97s (7.42 tok/s)
  (reclaimable 29.36 GB, stable across 3 readings)
[r3_pf qd=32 pf=24] exit 0 — decode 200 tok in 27.39s (7.30 tok/s)

=== prefill and mirror-split lines ===
r1_base
-- prefill 47 tok in 6.24s (7.5 tok/s)
-- prefill split: io 3.92s + scatter 0.01s | 6539 records (18.1 GB, 4.6 GB/s)
-- decode 200 tok in 27.95s (7.16 tok/s)
-- decode split: io 7.63s + scatter 0.10s | 8342 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 60.70 GB (70.2%), --mirror #1 25.83 GB (29.8%) over the whole run
r1_pf
-- prefill 47 tok in 5.59s (8.4 tok/s)
-- prefill split: io 3.83s + scatter 0.01s | 6539 records (18.1 GB, 4.7 GB/s)
-- decode 200 tok in 27.32s (7.32 tok/s)
-- decode split: io 7.74s + scatter 0.10s | 8350 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 59.94 GB (69.3%), --mirror #1 26.59 GB (30.7%) over the whole run
r1_qd
-- prefill 47 tok in 5.22s (9.0 tok/s)
-- prefill split: io 3.67s + scatter 0.01s | 6539 records (18.1 GB, 4.9 GB/s)
-- decode 200 tok in 27.04s (7.40 tok/s)
-- decode split: io 7.47s + scatter 0.09s | 8351 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 58.73 GB (67.9%), --mirror #1 27.76 GB (32.1%) over the whole run
r2_base
-- prefill 47 tok in 5.64s (8.3 tok/s)
-- prefill split: io 3.84s + scatter 0.01s | 6539 records (18.1 GB, 4.7 GB/s)
-- decode 200 tok in 27.36s (7.31 tok/s)
-- decode split: io 7.69s + scatter 0.10s | 8349 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 59.98 GB (69.3%), --mirror #1 26.51 GB (30.7%) over the whole run
r2_pf
-- prefill 47 tok in 5.63s (8.3 tok/s)
-- prefill split: io 3.87s + scatter 0.01s | 6539 records (18.1 GB, 4.7 GB/s)
-- decode 200 tok in 27.04s (7.40 tok/s)
-- decode split: io 7.62s + scatter 0.10s | 8350 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 60.18 GB (69.6%), --mirror #1 26.33 GB (30.4%) over the whole run
r2_qd
-- prefill 47 tok in 5.28s (8.9 tok/s)
-- prefill split: io 3.67s + scatter 0.01s | 6539 records (18.1 GB, 4.9 GB/s)
-- decode 200 tok in 27.03s (7.40 tok/s)
-- decode split: io 7.64s + scatter 0.10s | 8347 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 58.79 GB (68.0%), --mirror #1 27.72 GB (32.0%) over the whole run
r3_base
-- prefill 47 tok in 5.51s (8.5 tok/s)
-- prefill split: io 3.83s + scatter 0.01s | 6539 records (18.1 GB, 4.7 GB/s)
-- decode 200 tok in 27.07s (7.39 tok/s)
-- decode split: io 7.50s + scatter 0.10s | 8346 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 58.78 GB (67.9%), --mirror #1 27.73 GB (32.1%) over the whole run
r3_pf
-- prefill 47 tok in 5.49s (8.6 tok/s)
-- prefill split: io 3.81s + scatter 0.01s | 6539 records (18.1 GB, 4.7 GB/s)
-- decode 200 tok in 27.39s (7.30 tok/s)
-- decode split: io 7.67s + scatter 0.09s | 8348 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 58.98 GB (68.2%), --mirror #1 27.53 GB (31.8%) over the whole run
r3_qd
-- prefill 47 tok in 5.26s (8.9 tok/s)
-- prefill split: io 3.65s + scatter 0.01s | 6539 records (18.1 GB, 5.0 GB/s)
-- decode 200 tok in 26.97s (7.42 tok/s)
-- decode split: io 7.57s + scatter 0.10s | 8348 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 58.53 GB (67.7%), --mirror #1 27.98 GB (32.3%) over the whole run

round  arm         tok/s      io s   read GB      GB/s   records    issued   adopted  wastedGB  deferred
--------------------------------------------------------------------------------------------------------
1      base         7.16      7.63     23.06      3.02   8342.00  16421.00   8677.00     21.41  14043.00
1      qd           7.40      7.47     23.09      3.09   8351.00  16422.00   8673.00     21.41  14203.00
1      pf           7.32      7.74     23.09      2.98   8350.00  16429.00   8680.00     21.42  14266.00
2      base         7.31      7.69     23.08      3.00   8349.00  16424.00   8676.00     21.41  14247.00
2      qd           7.40      7.64     23.08      3.02   8347.00  16425.00   8679.00     21.41  14281.00
2      pf           7.40      7.62     23.09      3.03   8350.00  16421.00   8674.00     21.41  14324.00
3      base         7.39      7.50     23.08      3.08   8346.00  16423.00   8677.00     21.41  14275.00
3      qd           7.42      7.57     23.08      3.05   8348.00  16422.00   8675.00     21.41  14280.00
3      pf           7.30      7.67     23.08      3.01   8348.00  16422.00   8674.00     21.41  14212.00

median arm         tok/s      io s   read GB      GB/s   records    issued   adopted  wastedGB  deferred
--------------------------------------------------------------------------------------------------------
       base         7.31      7.63     23.08      3.02   8346.00  16423.00   8677.00     21.41  14247.00
       qd           7.40      7.57     23.08      3.05   8348.00  16422.00   8675.00     21.41  14280.00
       pf           7.32      7.67     23.09      3.01   8350.00  16422.00   8674.00     21.41  14266.00

spread within each arm (max - min), to judge whether a difference is real
  base   tok/s 7.16 .. 7.39  (spread 0.23)
  qd     tok/s 7.40 .. 7.42  (spread 0.02)
  pf     tok/s 7.30 .. 7.40  (spread 0.09)

  qd / base:  tok/s 1.012  io s 0.992  read GB 1.000  GB/s 1.008  records 1.000
  pf / base:  tok/s 1.001  io s 1.006  read GB 1.000  GB/s 0.994  records 1.000

distinct generated-text digests across all runs: 1 (must be 1)
```

## Control output

```text
[lanes1 qd=32 pf=1] exit 0
[qd1 qd=1 pf=8] exit 0

--- does an out-of-range value even reach the configuration? ---
exit 1
Error: insufficient reclaimable memory for model allocation and safety headroom; close other apps or lower the memory/context target

run           tok/s     io s    GB/s   issued  adopted  deferred
lanes1         7.31     7.68    3.01    16422     8671     14121
qd1            5.00    16.04    1.44    16422     8677     13317

reference, medians of the three-round run above:
base           7.31     7.63    3.02    16423     8677     14247
```

The out-of-range probe at the end of the control script is inconclusive: the
run was refused for insufficient reclaimable memory, because the control run's
model had not been reclaimed yet, so the configuration was never reached. The
two minimum-value arms carry the question instead.
