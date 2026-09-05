# Measured on real Macs

Results measured on real Macs are listed below with the version, settings,
and reporter. Compare these with the README's estimates: chip and SSD speed
can make a large difference even at the same memory target.

To add your Mac, follow [How to measure](#how-to-measure) and open a
[measurement report](https://github.com/carloslfu/slotstream/issues/new?template=measurement-report.yml).
Published rows are credited to the reporter.

<a id="rows"></a>

## Results

| Mac | Memory | SSD | macOS | slotstream | Plan | Warm decode | Long prompt | Peak | Reported by |
|---|---|---|---|---|---|---|---|---|---|
| MacBook Pro, M5 Pro | 48 GB | internal, 2 TB | 26.6 | 0.2.3 | auto: 33 GB target, ~152 experts/layer | ~12 tok/s; 12.8 with `--mtp` at a 28 GB target | ~220 tok/s at a 4096-token pass (est.) | 32 GB | [@carloslfu](https://github.com/carloslfu), 2026-09-02 |
| Mac mini, M2 | 16 GB | internal, 256 GB | 26.6.2 | 0.2.2 | auto: 10.2 GB target, ~21 experts/layer | **1.41 tok/s** | not measured — `context-check` postdates 0.2.2 | 6.1 GB | [@flol](https://github.com/flol), 2026-09-02 |
| MacBook Pro 16", M5 Max | 128 GB | internal, 2 TB | 26.6.2 | 0.2.1 | auto: 34.6 GB target, ~152 experts/layer | ~19–21 tok/s with `--mtp` | not measured — `context-check` postdates 0.2.1 | not measured — server path only | [@waterliu1981](https://github.com/waterliu1981), 2026-09-02 |

The 8, 24, and 32 GB tiers still need measurements. The 16 GB M2 result is
below the planner's estimate; the 128 GB M5 Max result is above it. The
planner uses the M5 Pro curve and doesn't model either difference.

A 16 GB Mac with a fast SSD would help separate disk speed from memory
capacity: the existing 16 GB and 48 GB machines differ in both. Older chips,
fanless Airs, and external SSDs would also help test the estimates.

The 48 GB and 16 GB rows' full method and history are in
[MEASUREMENTS.md](../MEASUREMENTS.md): the 48 GB machine throughout, and the
16 GB machine in "C1", which is also where the bandwidth arithmetic behind
its 1.41 tok/s is worked out.

## What the columns mean

- **Plan**: the target and cache size `slotstream doctor` prints with nothing
  else running. Auto sizes down while other apps hold memory, so say what was
  open.
- **Warm decode**: tokens per second on the third identical request to a
  running server, once the expert cache has warmed up. The first generation
  in a fresh process is colder and slower; report it too.
- **Long prompt**: prefill tokens per second from `context-check`, which
  reads a synthetic prompt through the real engine and stops before the
  machine swaps.
- **Peak**: the highest resident memory used by the process (RSS), printed
  by `run` and `context-check`. This is measured separately from the plan's
  estimate.

## How to measure

Allow about ten minutes once the weights are downloaded. Close other
memory-heavy apps and check that the Mac is not swapping. Run one model
process at a time.

1. Install or upgrade, then record the version:

   ```bash
   curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
   slotstream --version
   ```

2. Print the plan. Copy the whole `slotstream memory plan` block; it carries
   the device line, the target, and the cache size:

   ```bash
   slotstream doctor
   ```

3. One cold generation. This offers the download on first use. When it
   finishes, `run` prints `--` lines to stderr: prefill, decode, and the
   expert-cache line that ends with the peak. Copy all of them.

   ```bash
   slotstream run --greedy --max-tokens 128 --prompt "Explain how a hash map works, in about 200 words."
   ```

4. Warm decode. Start the server in one terminal:

   ```bash
   slotstream serve
   ```

   In another, send the same request three times and keep all three
   results. The third is the warm number. If you would rather not run the
   Python one-liner, the JSON carries `eval_count` and `eval_duration` in
   nanoseconds; decode tok/s is the first divided by the second, times a
   billion.

   ```bash
   for i in 1 2 3; do
     curl -s localhost:11434/api/generate -d '{
       "model": "qwen3.8-flash-next:4bit",
       "prompt": "Explain how a hash map works, in about 200 words.",
       "stream": false,
       "options": {"temperature": 0, "num_predict": 128}
     }' | python3 -c 'import json,sys; d=json.load(sys.stdin); print("decode %.2f tok/s, prefill %.1f tok/s" % (d["eval_count"]/d["eval_duration"]*1e9, d["prompt_eval_count"]/d["prompt_eval_duration"]*1e9))'
   done
   ```

   Press **Ctrl+C** in the server terminal before the next step.

5. Measure a long prompt. It reports time, speed, and peak memory, checking
   available memory between passes. Use 4096 tokens on a small Mac.

   ```bash
   slotstream context-check --tokens 8192
   ```

6. Open a [measurement report](https://github.com/carloslfu/slotstream/issues/new?template=measurement-report.yml)
   and paste the raw output from steps 1 to 5, plus the Mac model, the SSD,
   the macOS version, what else was open, and whether the fans ran or the
   machine throttled.

Single runs vary by 15% or more on a loaded machine. If two runs disagree by
that much, say so rather than picking the better one.
