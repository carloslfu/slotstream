# slotstream

Run **Qwen3.8-Flash-Next** (125B-A6B + 51B n-gram store, 4-bit) on any Apple Silicon Mac —
SSD-streamed experts and PLE/n-gram rows, with RAM **cache slots** as the memory↔speed
knob. MLX + Swift, single binary, Ollama-compatible API.

The whole plan — design, byte math, tiers, milestones, test matrix, status — lives in one
file: **[PLAN.md](PLAN.md)**.

Status: planning (M0 not started). Numbers in the plan marked *est.* are pending
measurement; the preset table is the living tracker.
