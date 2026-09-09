---
type: community-report
id: 01m21s4mt4vefegja2qyftn8jk
created: 2026-09-09T00:30:00.004691+00:00
updated: 2026-09-09T00:30:56.751208+00:00
summary: 'Measured: MacBook Pro 16", Apple M5 Max, 128 GB'
captured_at: 2026-09-08
machines: '[[records/machines/macbook-pro-m5-max-128gb]]'
reporter: waterliu1981
title: 'Measured: MacBook Pro 16", Apple M5 Max, 128 GB'
url: https://github.com/carloslfu/slotstream/issues/6
---
Issue opened 2026-09-03T04:02:05Z; captured 2026-09-08.

The following issue body and comments are preserved verbatim from the
GitHub response. Numbers and interpretations inside them are the authors' reports.

## Original issue body

A measured row for `docs/HARDWARE.md`. Hardware otherwise idle; fans inaudible (never spun up).

## Hardware row

| Mac | Memory | SSD | macOS | slotstream | Plan | Warm decode | Long prompt | Peak | Reported by |
|---|---|---|---|---|---|---|---|---|---|
| MacBook Pro 16" (Mac17,7), Apple M5 Max | 128 GB | internal, 2 TB | 26.6.2 | 0.2.1 | auto: 34.6 GB target, ~152 experts/layer | ~19–21 tok/s (with `--mtp`, draft head on) | ~125 tok/s at a 4096-token pass (est., from `doctor`) | est. 33.6 GB | [@waterliu1981](https://github.com/waterliu1981), 2026-09-02 |

## Model
- 48 layers × 512 experts, weights 103.8 GB at `~/.slotstream/models/qwen38-flash-next-mlx-4bit`
- slotstream **0.2.1** — `context-check` is not available in this version (added in 0.2.3), so the long-prompt figure is the prefill estimate `doctor` prints rather than a measured one.

## Memory plan (`slotstream doctor`, auto)

```
device: applegpu_g17s | 137 GB RAM (92.2 GB reclaimable), 115.4 GB Metal working set
target: 34.6 GB total for this process
cache:  ~152 of 512 experts per layer (7280 global slots = 20.1 GB pool)
expect: ~33.6 GB peak, ~12 tok/s warm decode (est. from M5 Pro anchors)
prefill: 4096 tokens per pass (~125 tok/s here)
mtp:    draft head on — speculative decode
```

## Warm decode (3 identical requests, 256 tokens, direct /v1/chat/completions)

```
pass 1: completion 256 tok in 14.50s = 17.65 tok/s
pass 2: completion 256 tok in 12.48s = 20.52 tok/s
pass 3: completion 256 tok in 13.48s = 18.99 tok/s   # 3rd (warm) ≈ 19 tok/s
```

Longer 500-token runs converged to ~20–21 tok/s once the expert cache fully warmed.

## Cache-size sweep (all with `--mtp` on)

| Config | experts/layer | cache pool | warm decode |
|---|---|---|---|
| auto (default, 34.6 GB) | 152 | 20.1 GB | ~20–21 tok/s |
| `--memory-gb 48` | 253 | 33.5 GB | ~24.4 tok/s |
| `--memory-gb 73` | 401 | 53.2 GB | ~25.6 tok/s |

## Notes
- The auto plan (~152 experts/layer) gives **~20 tok/s on the M5 Max**, well above the ~12 tok/s M5 Pro anchor that the plan's estimate is based on — the decode plateau sits higher on the M5 Max than the ~33 GB knee measured on the M5 Pro.
- Decode still flattens with cache size (~+22% for 2.6× the pool), tracking the repo's "cache changes speed, never output" curve but with a higher ceiling.
- Happy to add the row to `docs/HARDWARE.md` credited to this handle.

## Comment by @carloslfu

2026-09-03T04:26:12Z · https://github.com/carloslfu/slotstream/issues/6#issuecomment-5520336592

great! thanks @waterliu1981. this helps a ton! yes! please add it

## Comment by @waterliu1981

2026-09-03T04:43:16Z · https://github.com/carloslfu/slotstream/issues/6#issuecomment-5520489176

## Update: re-measured on **slotstream 0.2.3** (same machine, same method)

Upgraded 0.2.1 → 0.2.3 (binary swap, sha256 verified, weights unchanged). Waited for the expert cache to warm, then re-ran the same measurement.

### Warm decode, auto plan (~152 experts/layer, `--mtp` on)

**256-token × 3 (same as above):**
```
pass 1: 21.02 tok/s
pass 2: 21.53 tok/s
pass 3: 22.11 tok/s
```
**500-token (warm):** 22.83 / 22.10 tok/s

### Cache-size sweep
| Config | experts/layer | 0.2.1 warm | 0.2.3 warm | Δ |
|---|---|---|---|---|
| auto (34.6 GB) | 152 | ~19–20 tok/s | **~21–22 tok/s** | +~12% |
| `--memory-gb 48` | ~253 | ~24.4 | **~26.9** | +10% |
| `--memory-gb 73` | ~401–441 | ~25.6 | **~31.5** | +23% |

### Notes
- The speculative-decode gains in 0.2.2 show up clearly, and **more so at larger caches** (+23% at 73 GB), which matches the "×1.24 with one draft" headroom.
- Prefill also feels snappier (0.2.3's doubled prefill), beneficial for multi-turn chats.
- Same takeaway as before: on the M5 Max decode still climbs with cache size past the M5 Pro ~33 GB knee, and 0.2.3 widened that gap.
