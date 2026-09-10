---
type: run
id: 01m1w8cjhv1ws8re84a158fwsd
created: 2026-09-06T21:01:01.882488+00:00
updated: 2026-09-06T21:01:02.462019+00:00
summary: Existing native regression passes through MTP parity; mandatory MTP diagnostic stopped on unpriced head
binary: ee9f87581d78a7df38f18748556ebbf8587224df5b093017b0f8dba629e217ad
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Existing native regression passes through MTP parity; mandatory MTP diagnostic stopped on unpriced head
tool: Native Swift diagnostics and Python CLI gates
---
# Existing native regression and preserved MTP planning counterexample

The identified build19 passes the sampler/NumPy and governor gate, n-gram
and template goldens, the fixed two-layer parity gate, exact24-token output
across8.1GB and10GB cache plans, the960-slot live grow/shrink/regrow check,
prefix reuse, sweep correctness and MTP-head parity. These are the existing
criteria and frozen references; no tolerance or golden changed.

The next `mtp-check --memory-gb 10` was intentionally stopped with SIGTERM
before completing. Its startup banner declares no resident MTP head, because
its `auto` choice is off at this target. Source review then found that the
legacy diagnostic calls `model.enableMTP` after Engine construction, loading
the1.6GB head outside that announced plan; its later image leg can add a tower.
The same pattern appears in four MTP diagnostic commands. This is a planning
counterexample, not a numerical failure or a completed MTP gate. The stopped
raw output and identified binary remain evidence.

The prospective correction routes mandatory MTP through the startup planner,
rejects an incompatible explicit `--mtp off`, and makes an explicit vision-off
leg selectable. Combined image/MTP acceptance will use its own correctly
priced12GB target and15GB real preflight in a clean interval. That correction
is unbuilt at this capture and does not inherit build19 acceptance.

This455.65-second bounded correctness group used the canonical NumPy2.5.2 /
MLX0.31.1 interpreter, exact build19 binary, real reclaimable preflight and the
shared process lock. All owned children exited; the lock was verified free
before the slot was explicitly returned. Concurrent download excludes all
capacity and timing interpretations. C21 full MTP/vision/governor acceptance,
P5's262144-token capacity matrix, release, installed acceptance and rollback
remain open. Default32768 and public65536 are unchanged.

## Frozen build identity

```json
{
  "binary_sha256": "ee9f87581d78a7df38f18748556ebbf8587224df5b093017b0f8dba629e217ad",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "d47f3059f298de5e82261882e6b49485ea20ecaf3e2ef6ce41ddc360c9a5bceb"
}
```

## c21-native-19b/public-result.json

SHA-256 `4f815d789735b5ab8125661cb8d0884d4003f8b628c01ea181fccd0a9e26e20b`; 2758 bytes.

````text
{
  "source": "Exact identified build19 C21 raw files; public projection replaces only absolute command paths with basenames.",
  "raw_manifest_sha256": "60450612133b39de1af144bb68da0ea5beebf590e18e33f79b6738b4f69c4862",
  "passed": false,
  "classification": "bounded correctness; overlapping timing and capacity excluded",
  "cases": [
    {
      "name": "sampler",
      "passed": true,
      "exit": 0,
      "command": [
        "bash",
        "Tools/sampler_gates.sh"
      ]
    },
    {
      "name": "ngram",
      "passed": true,
      "exit": 0,
      "command": [
        "slotstream",
        "ngram-golden",
        "--tokens",
        "9707,11,1246,525,498,30"
      ]
    },
    {
      "name": "template",
      "passed": true,
      "exit": 0,
      "command": [
        "slotstream",
        "template-check"
      ]
    },
    {
      "name": "parity",
      "passed": true,
      "exit": 0,
      "command": [
        "slotstream",
        "parity",
        "--tokens",
        "9707,11,1246,525,498,30",
        "--layers",
        "2",
        "--compare",
        "bench/parity31"
      ]
    },
    {
      "name": "cache10",
      "passed": true,
      "exit": 0,
      "command": [
        "slotstream",
        "run",
        "--prompt",
        "Why is the sky blue?",
        "--max-tokens",
        "24",
        "--greedy",
        "--memory-gb",
        "10"
      ]
    },
    {
      "name": "cache81",
      "passed": true,
      "exit": 0,
      "command": [
        "slotstream",
        "run",
        "--prompt",
        "Why is the sky blue?",
        "--max-tokens",
        "24",
        "--greedy",
        "--memory-gb",
        "8.1"
      ]
    },
    {
      "name": "elastic-check",
      "passed": true,
      "exit": 0,
      "command": [
        "slotstream",
        "elastic-check",
        "--big-slots",
        "960"
      ]
    },
    {
      "name": "prefix",
      "passed": true,
      "exit": 0,
      "command": [
        "slotstream",
        "prefix-check"
      ]
    },
    {
      "name": "sweep",
      "passed": true,
      "exit": 0,
      "command": [
        "slotstream",
        "sweep-check"
      ]
    },
    {
      "name": "mtp-parity",
      "passed": true,
      "exit": 0,
      "command": [
        "slotstream",
        "mtp-parity"
      ]
    },
    {
      "name": "mtp-check",
      "passed": false,
      "exit": -15,
      "command": [
        "slotstream",
        "mtp-check",
        "--memory-gb",
        "10"
      ]
    }
  ],
  "manual_stop_reason": "The final MTPCheck command announced mtp=false in its10GBplan, then directly enabled the draft head outside that ledger. It was stopped with SIGTERM before completion, not scored as a numerical failure."
}

````

## c21-native-19b/cache10/stderr.txt

SHA-256 `fede14e261d585e1d8e6e2554df695cf21961982202ea40732e54b37975a66bf`; 1526 bytes.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (29.9 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 18 (~0 s to the first token at this plan)

-- prefill 18 tok in 1.16s (15.5 tok/s)
-- prefill split: io 0.71s + scatter 0.00s | 3420 records (9.5 GB, 13.4 GB/s)
-- decode 24 tok in 3.53s (6.79 tok/s)
-- decode split: io 1.66s + scatter 0.02s | 6552 records
-- expert cache ~20/512 experts per layer, hit rate 0.431 | ngram rows 0h/384m | RSS high-water 3.530 GB, current footprint 6.398 GB | total 4.7s

````

## c21-native-19b/cache10/stdout.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`; 116 bytes.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## c21-native-19b/cache81/stderr.txt

SHA-256 `4b87529131557b1ebb1a974142fe9cb2f9523d26ec5a59d087282deab3548ae6`; 1524 bytes.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (29.8 GB reclaimable now), 40.2 GB Metal working set
  target: 8.1 GB total for this process
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 6510 tokens across 4 conversations (~0.5 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
prompt tokens: 18 (~0 s to the first token at this plan)

-- prefill 18 tok in 1.16s (15.5 tok/s)
-- prefill split: io 0.70s + scatter 0.00s | 3420 records (9.5 GB, 13.5 GB/s)
-- decode 24 tok in 3.96s (6.06 tok/s)
-- decode split: io 1.93s + scatter 0.02s | 7861 records
-- expert cache ~13/512 experts per layer, hit rate 0.318 | ngram rows 0h/384m | RSS high-water 3.531 GB, current footprint 5.510 GB | total 5.1s

````

## c21-native-19b/cache81/stdout.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`; 116 bytes.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## c21-native-19b/elastic-check/stderr.txt

SHA-256 `4b2d38172a57b9d0712c9d2d500cc52c2daefe0f0338f5200e705fedad18ccda`; 235 bytes.

````text
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  baseline     (640 slots): 5.1s
  after grow   (960 slots): 4.7s
  after shrink (640 slots): 5.2s
  after regrow (800 slots): 5.7s

````

## c21-native-19b/elastic-check/stdout.txt

SHA-256 `7b27bfa7aa5a3a43fcd36549cc7968bdde2aa1a3d4c126d359b44dfedb297d04`; 88 bytes.

````text
ELASTIC CHECK PASS: 4 generations byte-identical across 13→20→13→16 experts/layer

````

## c21-native-19b/mtp-check/stderr.txt

SHA-256 `ec350ca706df7a3c120f97bd99d4c2c361129fc14fc7581db1a0df36a7a6192a`; 1108 bytes.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (32.7 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.9s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]

````

## c21-native-19b/mtp-check/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## c21-native-19b/mtp-parity/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## c21-native-19b/mtp-parity/stdout.txt

SHA-256 `6baff6abfec4abcd9c1eef27f79e5c7faa4128be16bf78fc4b1a590a47329f7f`; 208 bytes.

````text
prefill sample: max abs 0.00000  rel 0.00000  OK
prefill multi: max abs 0.00000  rel 0.00000  OK
decode sample: max abs 0.00000  rel 0.00000  OK
decode multi: max abs 0.00000  rel 0.00000  OK
MTP PARITY PASS

````

## c21-native-19b/ngram/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## c21-native-19b/ngram/stdout.txt

SHA-256 `6c60ce178189e9757f67dc7dff544f45c9128fc98ced3ff662473ead5e69ba49`; 965 bytes.

````text
pos0: 16410909,39682429,55103279,60931720,87006904,116506179,131512017,152932897,169641436,182022480,209277433,237891023,256841529,277007269,290665954,300984276
pos1: 18158303,36390029,45652312,70783524,98191154,114024957,127804916,159566246,175132467,192583600,217919476,237199054,259336807,261799367,289359313,307699687
pos2: 14018266,20311704,43480436,63941281,95787780,113074662,139009389,153597172,176521398,195310421,213995347,230817794,250415398,270032340,289909058,309324234
pos3: 19328306,31622976,57795084,66463709,93919746,116410415,120151274,145148395,173389511,188877183,200309508,238866090,246672398,274484811,290423659,310127336
pos4: 5058702,22280190,50893597,78955315,97296665,116744385,125916430,144813497,168457659,191037312,207392458,222765427,244080806,265398615,299171972,308041519
pos5: 12491660,20431478,44408400,65983911,98770238,116367196,122763968,157962372,172188198,192734484,216716967,225308066,255605896,265905913,289339931,306513116

````

## c21-native-19b/parity/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## c21-native-19b/parity/stdout.txt

SHA-256 `b9dab3a5133fb14f3e97731237db677055386e4c87d01d44c01adc1c7194c657`; 98 bytes.

````text
layer  0: max abs 0.00000, rel 0.00000  OK
layer  1: max abs 0.00000, rel 0.00000  OK
PARITY PASS

````

## c21-native-19b/prefix/stderr.txt

SHA-256 `8f4b83ff4e8e49129c72c7921cfd2e5a31efd40445ecdd32370554b6297fb6d9`; 686 bytes.

````text
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  equivalence at 28 tokens: reuse 1.992% vs prefill-rechunk control 3.416% of logit spread, top-1 same
  equivalence at 100 tokens: reuse 4.374% vs prefill-rechunk control 4.478% of logit spread, top-1 same
  equivalence at 196 tokens: reuse 3.628% vs prefill-rechunk control 5.896% of logit spread, top-1 differs
  shed: retained 24 tokens, dropped, next turn rebuilt 49
  turn 1: 22 prompt tok, 0 reused, prefill 1.26s -> Mars
  turn 2: 49 prompt tok, 24 reused, prefill 1.42s -> No
  turn 3: 70 prompt tok, 50 reused, prefill 1.17s -> Mars has a smaller diameter and mass than Ea

````

## c21-native-19b/prefix/stdout.txt

SHA-256 `93be80d0d2b429c88d1e4e5fa4b0c8aabb11dca085bbe4cb7c9ddccacec7678a`; 267 bytes.

````text
PREFIX CHECK PASS: reuse moves logits 4.37% vs 5.90% for the prefill-rechunk control, flat with depth, top-1 2/3; 2 of 2 turns reused a prefix; cached and edited-history runs deterministic; follow-up prefill 4.27s -> 2.59s (0 of 3 replies differ from a cold rebuild)

````

## c21-native-19b/sampler/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## c21-native-19b/sampler/stdout.txt

SHA-256 `3c3c6f05ea83e169d7c650a80e30a1314e0e8a941dac4411824765dbf36add99`; 998 bytes.

````text
PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)
PASS  sampler == numpy reference: greedy (temperature 0)
PASS  sampler == numpy reference: pure sampling, no filters
PASS  sampler == numpy reference: top-k 1 (degenerate)
PASS  sampler == numpy reference: tight nucleus (top-p 0.1)
PASS  sampler == numpy reference: min-p 0.3
PASS  sampler == numpy reference: presence penalty, accumulating
PASS  sampler == numpy reference: greedy + penalty (API temp-0)
PASS  sampler == numpy reference: vocab 4096
PASS  sampler == numpy reference: real vocab (248,320)
PASS  sampler == numpy reference: top-p 0 (sanitizer)
PASS  sampler == numpy reference: min-p 5 (sanitizer)
PASS  sampler == numpy reference: seed 0 (remapped)
PASS  sampler == numpy reference: exact zero RNG draw skips removed tokens
PASS  sampler == numpy reference: high temp, large vocab
PASS  seeded sampling is reproducible and seed-sensitive
PASS  elastic governor policy (26 branches)
sampler + governor: passed 17, failed 0

````

## c21-native-19b/sweep/stderr.txt

SHA-256 `c496ac9f3fbf096e49b50b22754a4a7bfedfff52280214532696c6a7cc6399d1`; 516 bytes.

````text
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  sweep on a cold pool, run twice: identical
  sweep vs pool path: 3.320% of logit spread (prefill-rechunk control 5.089%, bound 15.268%), top-1 same
  sweep whole vs sweep in 256-token passes: 3.145% of spread
  sweep on the warm pool (638 experts copied out of it): identical to the cold sweep
  after a generate that admitted the prompt's hot experts (prefill 549 tokens): pool path identical, sweep identical

````

## c21-native-19b/sweep/stdout.txt

SHA-256 `f0df1d138927498afc15aa198c18c34a8a7b80fb5c3e550656141b30b22b45e7`; 183 bytes.

````text
SWEEP CHECK PASS: deterministic; 3.320% of spread vs the pool path inside the 15.268% prefill-rechunk bound; identical on a cold and a warm pool; admission leaves the pool consistent

````

## c21-native-19b/template/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## c21-native-19b/template/stdout.txt

SHA-256 `26d2ee92078f26e53dca40b5452ebfb9ec687cae916c931e8c21d2f48aa2bc9c`; 121 bytes.

````text
248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271

````
