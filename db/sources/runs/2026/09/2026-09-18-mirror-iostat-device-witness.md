---
type: run
id: 01m2s4e4fsed6wzjz8g8nsy5xb
created: 2026-09-18T05:25:00.000000+00:00
updated: 2026-09-18T05:25:00.000000+00:00
summary: One mirrored decode with two witnesses, the engine's own mirror-split readout and iostat on both devices
binary: aa895c41274f5ac972712fa26c15ff8ded06db6654f1f729898f17f1804bfd24
captured_at: 2026-09-18
command: iostat -d -w 1 -c 90 disk0 disk4 & .build/release/slotstream run --model /Volumes/llm/models/qwen38-flash-next-mlx-4bit --mirror /Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit --experts-per-layer 118 --max-context 8192 --mtp on --max-tokens 200 --greedy --seed 1 --prompt "<the MoE explanation prompt>"
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Mirrored decode with an iostat device witness
tool: slotstream run and iostat
---
One mirrored decode run with two independent witnesses, on binary
aa895c41274f5ac972712fa26c15ff8ded06db6654f1f729898f17f1804bfd24, which is
built from the committed tree at `62454db`. The engine reports the split it
believes it produced, and `iostat` reports the split the two devices actually
saw. A mirror is only working when the two agree, because the engine's counter
would also look healthy if the kernel were serving one side from cache.

The engine's report and `iostat`'s samples measure different things and their
totals are not comparable. The engine divides bytes by the seconds it spent
inside its I/O phase, while `iostat` averages over whole wall-clock seconds
that also contain compute, so `iostat`'s total is necessarily the lower number.
What `iostat` establishes here is the ratio between the two devices and the
fact that both are genuinely busy.

The harness redirects the generated tokens to `/tmp/verify.log` and the report
to `/tmp/verify.err`, because the report goes to stderr and interleaves
byte-wise inside a streamed line on stdout, which makes the generated text
impossible to compare if the two streams are merged.

The harness still sets , which the development
build honoured with a per-20,000-claim router trace. That trace was removed
before the commit, so on this binary the variable does nothing and the
harness prints an empty trace section. The trace itself is kept in
[[sources/runs/2026/09/2026-09-18-mirror-router-trace-development-build]].

## The harness

```bash
#!/bin/bash
# One run, two witnesses. The router reports the split it believes it produced
# and iostat reports the split the devices actually saw; a mirror is only
# working when both agree. The router's trace goes to stderr and is kept in its
# own file, because it interleaves byte-wise with the streamed tokens on stdout
# and would otherwise make the generated text impossible to compare.
set -u
BIN=/Volumes/llm/src/slotstream/.build/release/slotstream
EXT=/Volumes/llm/models/qwen38-flash-next-mlx-4bit
INT=/Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit
PROMPT="请用中文解释什么是混合专家模型（Mixture of Experts），以及它在推理时为什么需要从存储中反复读取专家权重。请展开讲解，不要只写提纲。"

iostat -d -w 1 -c 90 disk0 disk4 > /tmp/iostat-verify.log 2>&1 &
witness=$!
SLOTSTREAM_MIRROR_DEBUG=1 "$BIN" run --model "$EXT" --mirror "$INT" \
  --experts-per-layer 118 --max-context 8192 --mtp on \
  --max-tokens 200 --greedy --seed 1 --prompt "$PROMPT" \
  > /tmp/verify.log 2> /tmp/verify.err
kill "$witness" 2>/dev/null; wait "$witness" 2>/dev/null

echo "=== router trace ==="
grep "^mirror claims" /tmp/verify.err
echo "=== timings ==="
grep -E "^-- (prefill|decode)" /tmp/verify.log /tmp/verify.err | sed 's|^/tmp/[a-z.]*:||'
echo "=== devices ==="
awk 'NF == 6 && $3 + $6 > 200 { d0 += $3; d4 += $6; n++ }
     END { if (n) printf "sustained over %d s: disk0 %.0f MB/s, disk4 %.0f MB/s, total %.2f GB/s, split disk4 %.1f%% / disk0 %.1f%%\n",
                 n, d0/n, d4/n, (d0+d4)/n/1000, 100*d4/(d0+d4), 100*d0/(d0+d4)
           else print "no sustained read samples" }' /tmp/iostat-verify.log
echo "=== generated text digest (A/B baseline is 0e6bb58bd963501f1f512ecc498ab9c0) ==="
awk '/^prompt tokens:/{flag=1;next} /^-- prefill [0-9]/{flag=0} flag' /tmp/verify.log | md5 -q
```

## The engine report (stderr)

```text
-- prefill 47 tok in 5.66s (8.3 tok/s)
-- prefill split: io 3.85s + scatter 0.01s | 6539 records (18.1 GB, 4.7 GB/s)
-- decode 200 tok in 26.86s (7.45 tok/s)
-- decode split: io 7.50s + scatter 0.09s | 8346 records | mtp 105/190 drafts accepted (55%), 95 verify passes
-- mirror split: --model 61.01 GB (70.5%), --mirror #1 25.50 GB (29.5%) over the whole run
-- expert cache ~118/512 experts per layer, hit rate 0.825 | ngram rows 464h/4096m | lifetime footprint peak 20.904 GB, current footprint 20.880 GB | total 32.6s
```

## iostat, both devices, one sample per second

```text
              disk0               disk4 
    KB/t  tps  MB/s     KB/t  tps  MB/s 
  244.16  277 66.03   151.49  149 22.09 
   46.93  126  5.79    13.00   12  0.15 
  128.21 1733 217.00   164.12 3287 526.88 
  194.25 5676 1076.65   409.90 5435 2175.79 
  208.40 5370 1092.77   403.40 5420 2135.26 
  196.91 5494 1056.49   416.05 5225 2122.98 
  201.40 5323 1046.87   405.73 5423 2148.65 
  198.31 5390 1043.83   410.18 5371 2151.49 
  199.53 4837 942.61   385.11 5344 2009.77 
  196.24 3778 724.09   373.78 4544 1658.77 
  200.66 4100 803.38   363.99 5136 1825.55 
  194.76 4331 823.73   357.29 5389 1880.21 
  196.13 4584 877.92   373.02 5289 1926.82 
  203.15 4666 925.74   372.36 5237 1904.30 
  202.32 4233 836.37   373.85 5180 1891.30 
  195.47 3809 727.16   354.97 5049 1750.38 
  194.17 4184 793.41   356.37 5400 1879.22 
  200.16 4692 917.06   370.54 5517 1996.47 
  191.42 3506 655.33   364.98 4463 1590.76 
  185.82 3422 620.92   349.54 4699 1604.11 
              disk0               disk4 
    KB/t  tps  MB/s     KB/t  tps  MB/s 
  191.88 4244 795.21   371.46 5043 1829.48 
  202.18 4621 912.47   370.41 5427 1963.21 
  176.37 2765 476.30   342.03 3949 1319.04 
  203.12 4742 940.63   368.49 5640 2029.65 
  189.32 3353 619.85   359.76 4432 1557.19 
  195.52 3779 721.49   357.65 5074 1772.25 
  191.51 4007 749.33   360.04 5165 1815.86 
  194.79 3567 678.60   369.03 4563 1644.56 
  191.01 3277 611.35   351.40 4768 1636.16 
  185.63 3104 562.62   342.99 4569 1530.29 
  195.45 3716 709.25   349.62 5069 1730.77 
  195.13 3923 747.64   361.16 5245 1849.83 
  197.98 4206 813.20   371.51 5272 1912.59 
  198.17 4164 805.88   367.50 5125 1839.20 
  199.89 4469 872.37   386.41 5068 1912.53 
```

## The summary the harness computed from those samples

```text
sustained samples: 33
mean while reading: disk0 794 MB/s, disk4 1804 MB/s, total 2.60 GB/s, split disk4 69.4% / disk0 30.6%
peak second:       disk0 1077 MB/s, disk4 2176 MB/s, total 3.25 GB/s
```
