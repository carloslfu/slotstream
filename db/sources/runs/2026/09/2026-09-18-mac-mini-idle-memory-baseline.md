---
type: run
id: 01m2t41pnbe98r7fy9ys567e58
created: 2026-09-18T11:30:00+00:00
updated: 2026-09-19T15:15:18.724862503+00:00
summary: Idle memory baseline on the Mac mini with nothing loaded, alongside the two different availability readings that disagree by the speculative page count
binary: system vm_stat and slotstream doctor; executable hashes not recorded
captured_at: 2026-09-18
command: bash /tmp/memsnap.sh
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Idle memory baseline and the two availability readings
tool: mem, vm_stat, sysctl, slotstream doctor
---
Captured after the machine had been left alone, with no slotstream process
running, to give the `insufficient reclaimable memory` refusals a baseline to
be read against. The refusal at the end of
[[sources/runs/2026/09/2026-09-18-decode-queue-depth-and-prefetch-lanes]] had
no such baseline, so it could not be told apart from a machine that is simply
too small.

`~/.local/bin/mem` is a one-shot readout kept outside this repository. Its
`avail` is `free + purgeable + file-backed` from `vm_stat`.

## Script

```bash
#!/bin/bash
# Idle memory baseline for the Mac mini, captured with nothing else running.
set -u
echo "=== date ==="
date -u '+%Y-%m-%dT%H:%M:%SZ'
echo "=== uptime / load ==="
uptime
echo "=== slotstream processes ==="
ps -axo pid,rss,comm | grep -i slotstream | grep -v grep || echo "none"
echo "=== sysctl ==="
sysctl hw.memsize hw.pagesize iogpu.wired_limit_mb
echo "=== ~/.local/bin/mem ==="
~/.local/bin/mem
echo "=== vm_stat ==="
vm_stat | grep -E 'page size|Pages free|Pages active|Pages inactive|Pages speculative|Pages wired|Pages purgeable|File-backed|Anonymous|occupied by compressor'
echo "=== slotstream doctor --json (memory fields) ==="
cd /Volumes/llm/src/slotstream && .build/release/slotstream doctor --json 2>&1 \
  | python3 -c 'import sys,json; d=json.load(sys.stdin); print(json.dumps({k:d[k] for k in ("device_ram_gb","device_available_gb","availability_clamped","max_ram_percent","memory_ledger") if k in d}, indent=2))'
```

## Output

```text
=== date ===
2026-09-18T11:22:06Z
=== uptime / load ===
13:22  up 2 days, 19:43, 3 users, load averages: 1.41 1.51 1.46
=== slotstream processes ===
none
=== sysctl ===
hw.memsize: 34359738368
hw.pagesize: 16384
iogpu.wired_limit_mb: 28700
=== ~/.local/bin/mem ===
RAM 34.36 GB | used 5.54 (16%) | avail 28.82 (84%) | swap 0.21/1.07 GB
  used  = app 2.08 + wired 2.01 + compressed 0.88 + other 0.57
  avail = free 20.10 + cache 8.71 (file cache, dropped on demand)
=== vm_stat ===
Mach Virtual Memory Statistics: (page size of 16384 bytes)
Pages free:                             1227333.
Pages active:                            318868.
Pages inactive:                          275382.
Pages speculative:                        64675.
Pages wired down:                        122638.
Pages purgeable:                          10025.
File-backed pages:                       521703.
Anonymous pages:                         137222.
Pages occupied by compressor:             53650.
=== slotstream doctor --json (memory fields) ===
{
  "device_ram_gb": 34.4,
  "device_available_gb": 29.9,
  "availability_clamped": false,
  "max_ram_percent": 70,
  "memory_ledger": {
    "active_capacity_bytes": 1962934272,
    "additional_active_bytes": 981467136,
    "expected_peak_bytes": 23049635072,
    "fixed_bytes": 5300000000,
    "long_context_reserve_bytes": 981467136,
    "lookahead_reserve_bytes": 391118848,
    "mtp_resident_bytes": 1600000000,
    "planning_margin_bytes": 1000000000,
    "pool_bytes": 10312704000,
    "prefill_bytes": 1331200000,
    "retained_capacity_bytes": 1811939328,
    "retained_recurrent_bytes": 339738624,
    "version": 1,
    "vision_resident_bytes": 0
  }
}
```

## Arithmetic

The two availability readings disagree, and the difference is exactly the
speculative pages. The page size is 16,384 bytes.

```text
mem:        free 1,227,333 + purgeable 10,025 + file-backed 521,703
            = 1,759,061 pages = 28.82 GB          (matches its own printout)

doctor:     free_count already includes speculative, so
            (1,227,333 + 64,675) + 10,025 + 521,703
            = 1,823,736 pages = 29.88 GB          (doctor prints 29.9)

difference: 64,675 speculative pages = 1.06 GB
```

`Plan.availabilitySlackGB(ramGB:)` is `max(1.5, 0.05 x ramGB)` = 1.72 GB here,
and this plan's `expected_peak_bytes` is 23.05 GB, so a run of it needs about
24.77 GB against the 29.9 GB doctor reports: roughly 5 GB of headroom when the
machine is idle. The ledger above is the default plan, not the
`--experts-per-layer 118 --mtp on` plan the A/B runs used.
