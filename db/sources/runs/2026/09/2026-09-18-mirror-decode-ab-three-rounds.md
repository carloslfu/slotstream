---
type: run
id: 01m2s4wp2k7kx57debgdjn3gvy
created: 2026-09-18T05:50:00.000000+00:00
updated: 2026-09-18T05:50:00.000000+00:00
summary: Three paired rounds of single-disk against mirrored decode on the committed build, with a generated-text digest across all six runs
binary: aa895c41274f5ac972712fa26c15ff8ded06db6654f1f729898f17f1804bfd24
captured_at: 2026-09-18
command: the harness reproduced below — six invocations of `.build/release/slotstream run --model /Volumes/llm/models/qwen38-flash-next-mlx-4bit [--mirror /Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit] --experts-per-layer 118 --max-context 8192 --mtp on --max-tokens 200 --greedy --seed 1 --stats-json <out>.json --prompt "<the MoE explanation prompt>"`, the full script reproduced below
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Mirror against single disk, three paired decode rounds
tool: slotstream run
---
The measurement behind [[records/measurements/mirror-reads-across-two-disks-2026-09-18]].
Three rounds, each one single-disk run followed by one mirrored run, on binary
aa895c41274f5ac972712fa26c15ff8ded06db6654f1f729898f17f1804bfd24, which is
built from the tree at commit `62454db` with no source file newer than the
binary. The commit that adds this record changes only comments, the `--mirror`
help text and the store itself, so the behaviour these runs measured is the
behaviour that ships.

Both arms keep the draft head and therefore the expert lookahead, because the
lookahead is what puts several record reads in flight at once and the mirror
only pays at that concurrency. Each run waits until reclaimable memory
(free plus purgeable plus file-backed pages) has been at least 28 GB across
three consecutive readings, because that total dips well below its settled
value for a while after a model process exits and an arm started during the dip
would be measuring reclaim, not disks.

The digest check hashes the token stream on stdout rather than the run log. The
report goes to stderr, and a stderr line lands inside a streamed stdout line
rather than between two lines, so a merged stream cannot be compared byte for
byte. An earlier version of this harness hashed a range of the merged log and
reported six distinct digests for runs that were in fact identical.

## The harness

```bash
#!/bin/bash
# Prices the checkpoint mirror on a real decode: does routing weight reads
# across two disks move tokens per second, and not merely bytes per second?
#
# Both arms keep the draft head and therefore the expert lookahead, because the
# lookahead is what puts several record reads in flight at once and the mirror
# only pays at that concurrency. Rounds alternate the arms and the verdict is
# the median of the paired rounds, because single runs on this machine vary by
# more than the effect being measured.
set -u

BIN=/Volumes/llm/src/slotstream/.build/release/slotstream
EXT=/Volumes/llm/models/qwen38-flash-next-mlx-4bit
INT=/Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit
OUT=/tmp/mirror_rounds_final
rm -rf "$OUT"; mkdir -p "$OUT"
ROUNDS=3
PROMPT="请用中文解释什么是混合专家模型（Mixture of Experts），以及它在推理时为什么需要从存储中反复读取专家权重。请展开讲解，不要只写提纲。"

# The admission gate reads free + purgeable + file-backed pages, and that total
# dips well below its settled value for a while after a model process exits, so
# require the threshold to hold across consecutive readings before starting.
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
  local name=$1; shift
  wait_for_memory 28
  "$BIN" run --model "$EXT" "$@" \
    --experts-per-layer 118 --max-context 8192 --mtp on \
    --max-tokens 200 --greedy --seed 1 \
    --stats-json "$OUT/$name.json" \
    --prompt "$PROMPT" > "$OUT/$name.txt" 2> "$OUT/$name.log"
  echo "[$name] exit $? — $(grep -o 'decode 200 tok in .*' "$OUT/$name.log" | head -1)"
}

for r in $(seq 1 $ROUNDS); do
  echo "=== round $r ==="
  run "r${r}_single"
  run "r${r}_mirror" --mirror "$INT"
done

echo
python3 - "$OUT" "$ROUNDS" <<'PY'
import hashlib, json, pathlib, statistics, sys

out, rounds = pathlib.Path(sys.argv[1]), int(sys.argv[2])
metrics = ("tok/s", "io s", "read GB", "GB/s", "records", "io share")
arms = ("single", "mirror")


def row(name):
    p = out / f"{name}.json"
    if not p.exists():
        return None
    st = json.load(p.open())["stats"]
    io = st.get("decodeIOSeconds", 0.0)
    gb = st.get("decodeReadBytes", 0) / 1e9
    sec = st.get("decodeSeconds") or st.get("decodeWallSeconds") or 0.0
    toks = st.get("decodeTokens") or st.get("generatedTokens") or 0
    return {"tok/s": toks / sec if sec else 0, "io s": io, "read GB": gb,
            "GB/s": gb / io if io else 0, "records": st.get("decodeRecords", 0),
            "io share": 100 * io / sec if sec else 0}


print(f"{'round':<8}{'arm':<8}" + "".join(f"{m:>10}" for m in metrics))
print("-" * (16 + 10 * len(metrics)))
collected = {a: [] for a in arms}
for r in range(1, rounds + 1):
    for arm in arms:
        v = row(f"r{r}_{arm}")
        if v is None:
            print(f"{r:<8}{arm:<8}{'(run failed)':>20}")
            continue
        collected[arm].append(v)
        print(f"{r:<8}{arm:<8}" + "".join(f"{v[m]:>10.2f}" for m in metrics))

print()
print(f"{'median':<8}{'arm':<8}" + "".join(f"{m:>10}" for m in metrics))
print("-" * (16 + 10 * len(metrics)))
med = {}
for arm in arms:
    if not collected[arm]:
        continue
    med[arm] = {m: statistics.median(v[m] for v in collected[arm]) for m in metrics}
    print(f"{'':<8}{arm:<8}" + "".join(f"{med[arm][m]:>10.2f}" for m in metrics))
if len(med) == 2:
    print()
    for m in metrics:
        a, b = med["single"][m], med["mirror"][m]
        print(f"  {m:<10} mirror / single = {b / a:.3f}" if a else f"  {m:<10} n/a")

# Routing must not change what the model produces: identical greedy output is
# the check that the two disks really do hold the same weights. It compares
# the token stream on stdout, not the log, because the log carries timings
# that differ between runs by design.
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

## Output

```text
=== round 1 ===
  (reclaimable 28.95 GB, stable across 3 readings)
[r1_single] exit 0 — decode 200 tok in 33.11s (6.04 tok/s)
  (reclaimable 28.98 GB, stable across 3 readings)
[r1_mirror] exit 0 — decode 200 tok in 27.49s (7.28 tok/s)
=== round 2 ===
  (reclaimable 28.93 GB, stable across 3 readings)
[r2_single] exit 0 — decode 200 tok in 32.71s (6.11 tok/s)
  (reclaimable 29.00 GB, stable across 3 readings)
[r2_mirror] exit 0 — decode 200 tok in 27.00s (7.41 tok/s)
=== round 3 ===
  (reclaimable 28.99 GB, stable across 3 readings)
[r3_single] exit 0 — decode 200 tok in 32.31s (6.19 tok/s)
  (reclaimable 28.96 GB, stable across 3 readings)
[r3_mirror] exit 0 — decode 200 tok in 27.22s (7.35 tok/s)

round   arm          tok/s      io s   read GB      GB/s   records  io share
----------------------------------------------------------------------------
1       single        6.04     10.35     23.13      2.23   8366.00     31.26
1       mirror        7.28      7.51     23.08      3.08   8349.00     27.31
2       single        6.11     10.48     23.13      2.21   8366.00     32.03
2       mirror        7.41      7.40     23.09      3.12   8352.00     27.42
3       single        6.19     10.43     23.15      2.22   8374.00     32.28
3       mirror        7.35      7.65     23.08      3.02   8349.00     28.10

median  arm          tok/s      io s   read GB      GB/s   records  io share
----------------------------------------------------------------------------
        single        6.11     10.43     23.13      2.22   8366.00     32.03
        mirror        7.35      7.51     23.08      3.08   8349.00     27.42

  tok/s      mirror / single = 1.202
  io s       mirror / single = 0.720
  read GB    mirror / single = 0.998
  GB/s       mirror / single = 1.386
  records    mirror / single = 0.998
  io share   mirror / single = 0.856

distinct generated-text digests across all runs: 1 (must be 1)
```

## Prefill and mirror-split lines from the six run logs

```text
r1_mirror
-- prefill 47 tok in 5.71s (8.2 tok/s)
-- prefill split: io 4.07s + scatter 0.01s | 6539 records (18.1 GB, 4.4 GB/s)
-- decode 200 tok in 27.49s (7.28 tok/s)
-- decode split: io 7.51s + scatter 0.10s | 8349 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 61.80 GB (71.4%), --mirror #1 24.70 GB (28.6%) over the whole run
r1_single
-- prefill 47 tok in 7.29s (6.4 tok/s)
-- prefill split: io 5.56s + scatter 0.01s | 6539 records (18.1 GB, 3.3 GB/s)
-- decode 200 tok in 33.11s (6.04 tok/s)
-- decode split: io 10.35s + scatter 0.09s | 8366 records | mtp 105/190 drafts accepted (55%), 95 verify passes
r2_mirror
-- prefill 47 tok in 5.41s (8.7 tok/s)
-- prefill split: io 3.81s + scatter 0.01s | 6539 records (18.1 GB, 4.7 GB/s)
-- decode 200 tok in 27.00s (7.41 tok/s)
-- decode split: io 7.40s + scatter 0.10s | 8352 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 60.91 GB (70.4%), --mirror #1 25.62 GB (29.6%) over the whole run
r2_single
-- prefill 47 tok in 7.30s (6.4 tok/s)
-- prefill split: io 5.58s + scatter 0.01s | 6539 records (18.1 GB, 3.2 GB/s)
-- decode 200 tok in 32.71s (6.11 tok/s)
-- decode split: io 10.48s + scatter 0.09s | 8366 records | mtp 105/190 drafts accepted (55%), 95 verify passes
r3_mirror
-- prefill 47 tok in 5.74s (8.2 tok/s)
-- prefill split: io 4.08s + scatter 0.01s | 6539 records (18.1 GB, 4.4 GB/s)
-- decode 200 tok in 27.22s (7.35 tok/s)
-- decode split: io 7.65s + scatter 0.10s | 8349 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 62.08 GB (71.8%), --mirror #1 24.43 GB (28.2%) over the whole run
r3_single
-- prefill 47 tok in 7.33s (6.4 tok/s)
-- prefill split: io 5.57s + scatter 0.01s | 6539 records (18.1 GB, 3.2 GB/s)
-- decode 200 tok in 32.31s (6.19 tok/s)
-- decode split: io 10.43s + scatter 0.09s | 8374 records | mtp 105/190 drafts accepted (55%), 95 verify passes
```
