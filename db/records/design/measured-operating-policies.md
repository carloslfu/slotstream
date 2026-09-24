---
type: design
meta-type: conclusion
id: 01m246aw461nyrejaspmzhxkms
created: 2026-09-09T22:59:04.454986+00:00
updated: 2026-09-21T04:23:23.381617+00:00
summary: Measured operating policies and revision criteria
date: 2026-09-09
doc: plan
level: '2'
order: '145'
title: Measured operating policies and revision criteria
---
Maintaining good operating choices is part of the product: model selection, inference, context, memory, responsiveness and resource use must work together. A useful default saves users from repeating the engineering investigation. It may deliberately leave capacity unused when further allocation has no demonstrated benefit. Best means the best-supported tradeoff for the stated objective and evidence, not proof of a universal optimum.

## Classify the number before changing it

| Kind | Meaning and revision rule |
|---|---|
| Model or format fact | An exact dimension, byte count or format requirement. Verify against the pinned artifact; do not tune it independently. |
| Safety or correctness bound | Protects physical feasibility, numerical validity or ownership. A performance preference never overrides it. |
| Qualification limit | Marks the configuration actually validated. Expanding it requires the corresponding acceptance gates, not merely spare capacity. |
| Operating default | Chooses a practical resource/performance tradeoff. Retain a justified default until evidence or an explicit change of objective warrants revision. Document any supported override and its consequences. |
| Estimator bound | Limits what a prediction may claim. Holding an estimate flat outside its verified range does not establish a flat physical response. |

A value can serve several roles; state each one and separate their controls. A manual operating override does not waive a safety or qualification limit. Some legacy explicit paths warn rather than refuse, so describe their actual behavior instead of inventing protection.

## Record the reasoning where it is used

For each important new or materially revised tuning value, keep a named code constant and a nearby explanation linked to a canonical record. Record:

- Purpose and units, including whether a budget covers the whole process or one component.
- Kind of limit and evidence basis: measured observation, derived arithmetic, bounded estimate or provisional engineering choice.
- Tested model/revision, engine/backend, hardware and workload scope, with links to evidence and failed or excluded runs.
- The objective and tradeoff, including costs displaced elsewhere in the stack.
- Automatic behavior, allowed override and consequences for resizing, safety checks and user control.
- The condition that would justify revision and the gate that checks implementation behavior.

Keep this proportional to the decision; this does not require a separate record for every loop literal. Existing records can own a coherent family of constants. Examples include expert-cache targets, prefill candidates, draft activation thresholds, I/O concurrency, context qualification and allocator allowances. Preserve their distinct evidence rather than treating every number as one type of cap.

## Make the best supported choice with incomplete evidence

Use first principles to identify the bottleneck and feasible alternatives, then the available measurements to choose a conservative default. More RAM, larger batches or greater concurrency can displace useful resources or hit another bottleneck. Unavailable target hardware does not itself invalidate the existing choice or require automatic benchmarking on every user's machine.

When a revision is justified, compare configurations with matched work, controlled warm/cold state and relevant context/draft settings. Measure user-visible time and the full resource cost; fewer cache misses or a faster estimate alone is insufficient. Freeze meaningful comparison criteria before scored runs and retain failures. Change the default only within its proven safety and correctness envelope. A simpler measured profile may suffice; a live tuner needs evidence that its benefit repays its complexity and transition cost.

## Memory ceiling example and maintenance
The base automatic total-process ceiling remains 33 GB. The clean development-Mac cache ladder showed diminishing returns near 120 to 150 experts/layer, and the target accommodates the chosen prefill workspace. An enabled draft head adds its separately charged cost. RAM share, Metal limits and live availability may lower the target. The fixed-size CLI flags bypass the operating ceiling and pin the cache. The adaptive `--memory-limit-gb` override and the Mac app’s Custom limit instead preserve resizing within the selected ceiling and supported hardware budget. This also makes the first Custom selection inherit the current budget. See [[records/decisions/adaptive-memory-limits]].

The original larger-target sweep evaluated an already-bounded prediction curve. It cannot prove that all larger allocations have no benefit. The existing ceiling is still a defensible default; no allocation change is justified merely by that limitation in the evidence. See [[records/measurements/automatic-memory-default-evidence-scope-2026-09-09]], [[records/decisions/auto-target-is-the-33-gb-knee-not-70-percent-of-ram]] and [[records/claims/auto-memory-target-ceiling-33-gb]].

Keep code comments, CLI help/diagnostics, policy checks, canonical decisions/claims and relevant README/guides aligned. Regenerate PLAN.md, MEASUREMENTS.md and llms-full.txt from their declared sources. Preserve historical source bytes and annotate interpretations through records. This policy documents ongoing engineering responsibility; it does not claim a completed audit of every existing constant or authorize new benchmarks, spending, telemetry or background tuning.
## Functional memory acceptance and benchmark eligibility

Global macOS paging is diagnostic for ordinary correctness, context-capacity and process-budget acceptance. It cannot attribute system activity to Slotstream. Keep process ceilings, real headroom, OS pressure handling, allocation safeguards and complete numerical/work checks; report paging separately. Performance comparisons retain declared clean-interval rules, and historical frozen results stay unchanged. The controlling decision is [[records/decisions/global-paging-is-diagnostic]].

## Public claim review

Claim-text gates detect stale phrases, not unsupported implications. Review
supporting sources and supersession notes before changing a public claim's
scope. Keep hardware, release, workload, total-process target, measured
quantity and comparison baseline together. An estimate is labeled where it
appears, including a table cell; capped extrapolation does not establish a
physical plateau. Simulated capacity is not hardware qualification, a version
bump is not publication, and a cache-only equality test does not cover changed
prefill grouping or speculative decoding. Preserve legitimate historical
results with their dates and limits instead of discarding an entire record
when only one of its measurements was withdrawn.

The documented correction and its verification are in
[[records/measurements/public-documentation-evidence-audit-2026-09-13]].

Best-effort public estimates may combine incomplete evidence when useful to
users. Give their construction and assumptions, separate actual measurements,
and state when a configuration is transferred to unmeasured hardware. Do not
present an editorial range as a calibrated confidence interval or speed bound.
[[records/measurements/hardware-planning-ranges-2026-09-13]] records the memory
range example and its revision conditions.

## Persistent prefix cache defaults
`serve --prefix-cache-dir` is off unless a directory is named, so none of these values changes a default server. They are provisional engineering choices for an opt-in tier, not measured optima.

| Value | Kind | Purpose and tradeoff | Override and revision |
|---|---|---|---|
| 20 GB quota (`PersistentPrefixConfiguration.defaultMaxBytes`) | Operating default | Bounds every head and row segment in the directory, applied when the directory opens and before each write. When it is full, states nobody continued go first, then previous-turn states kept for regenerating, then continued conversations, then prefixes several conversations start from, least recently used first within each; files from other builds do not survive opening. A conversation costs one recurrent-state head per kept turn plus its rows once, so a larger quota keeps more long conversations at more disk. | `--prefix-cache-disk-gb`. Revise from measured restart hit rates and real conversation sizes. |
| 2,048-token minimum (`defaultMinimumTokens`) | Operating default | Every write stores the fixed recurrent state; a conversation's first write also stores every cached row, and later turns add only their new rows. Shorter conversations save less prefill for the same fixed write, and each write adds disk wear. | `--prefix-cache-min-tokens`. Revise from measured save cost against prefill time across hardware. |
| 30-day maximum age (`defaultMaxAgeDays`) | Operating default | Conversation contents should not stay on disk indefinitely just because the quota has room. A state neither written nor restored for this long is removed when the directory opens and before writes; a longer age keeps older conversations resumable. | `--prefix-cache-max-age-days`; `0` disables. Revise from how long real users return to conversations. |
| Previous turn kept, older turns removed | Operating default | The kept state restores a regenerated or edited last reply after a restart without re-reading the conversation, for one more recurrent-state head; earlier turns are rarely resumed. | None. Revise if measured use shows edits further back. |
| Shared prefixes kept once, never replaced (`PersistentPrefixEntry.shared`, `PersistentPrefixValue.shared`) | Operating default | A state written inside a prompt at a boundary other conversations start with, its system message or the head it shares with a kept state, is exempt from the ancestor removal a later save of an extending conversation performs, so it outlives every conversation that started from it, and goes after conversations when the quota needs room. A shared prefix nobody started from is one-off, and a reply two conversations continue counts as shared too: lineages decide, not the flag. | None. Revise if measured directories fill with prefixes nobody returns to; the maximum age already removes those. |
| 512-token minimum shared prefix (`Generator.sharedPrefixMinimumTokens`) | Operating default | A shared save costs a GPU synchronize, a fork into the memory tier and, with the disk tier, one head plus rows; below this length the prefill it saves a later conversation is small next to that cost. Memory keeps shared prefixes from 512 tokens; the disk tier applies its own minimum length. | Library: `Generator.sharedPrefixMinimumTokens`. Revise from measured save cost against prefill time. |
| Shared save point: the last existing pass end at or before the boundary (`PrefillSchedule.lastPassEnd`) | Correctness bound | A shared prefix is written where a prefill pass already ends, the 256-token grid by default, never by splitting or reshaping a pass, so every arithmetic shape and every output stays identical to a run without the save; the next conversation processes up to one pass of the system prompt again. | None. A save at the exact boundary would need the rechunking numerical contract re-qualified. |
| 32 segments per head (`PersistentPrefixCache.maximumSegments`) | Operating default | Bounds the files one restore reads and how long replaced rows stay referenced; past it a write stores every row again. | None. Revise from measured restore cost and disk use on long conversations. |
| 2 GB free-volume margin (`PersistentPrefixCache.minimumFreeBytes`) | Safety bound | A save is skipped rather than filling the volume. | None. Not a performance value. |
| Identity: executable image digest, config digest, first and last 4 MiB of every weight file, cache geometry, optimization settings | Correctness bound | A state is restored only by the computation that wrote it; sampled weight content survives a copied model but rejects a different checkpoint with the same file sizes. | None. A cheaper identity needs evidence that it still rejects every changed computation. |
| CRC-32 per payload and header, rename without fsync | Correctness bound | A torn or corrupted head or segment fails its checksum and is removed with every state that uses it; it is never restored. Durability after a crash is best effort. | None. |
| Rows reused only through lineage (`State.persistedLineage`) | Correctness bound | A write references earlier rows only when its state descends from that persisted head without a rewind below it. Equal token ids never qualify: a re-prefill of the same ids produces other bits. | None. |

## Coding agent defaults

These values connect coding agents to a server. The launch values apply only to `slotstream launch`; the serving values apply to every client of the endpoints named. The live runs behind them are in [[records/measurements/coding-agents-launch-2026-09-17]].

| Value | Kind | Purpose and tradeoff | Override and revision |
|---|---|---|---|
| Chat reply budget without a request limit: a quarter of the window, 256 to 8,192 tokens (`GatewayDialect.outputBudget`) | Operating default | `/v1/responses` and the fx endpoints already used it. Chat completions used 512 tokens, which cut agents' edits and summaries short. A longer reply holds its slot for more decode time. The Ollama endpoints keep 512. | Per request: `max_tokens` or `max_completion_tokens`. Revise if measured agent replies stop at the ceiling, or clients time out waiting for them. |
| Smallest served window the launch accepts: 32,768 tokens for Claude Code and Codex, 16,384 for Pi and opencode, 65,536 for Hermes (`CodingToolLaunch.Tool.minimumContext`) | Qualification limit | The opening prompt plus a full 8,192-token reply must fit, with room for a conversation. Opening prompts measured on 2026-09-17: about 15,300 to 15,500 tokens for Claude Code, 10,400 for Codex, 1,600 for Pi, 7,300 for opencode and 12,300 for Hermes. Hermes 0.21.1 itself refuses a window below 64,000 tokens. Below the limit the launch restarts a server it started itself and nothing uses, with that window; any other server is left running and the launch refuses, naming the `--max-context` to serve. | None in the launch; the guides still describe manual setup. Revise when a supported agent version changes its opening prompt. |
| 30-minute agent timeouts: Claude Code `API_TIMEOUT_MS` and `CLAUDE_STREAM_IDLE_TIMEOUT_MS` (`CodingToolLaunch.claudeDefaults`), Codex `stream_idle_timeout_ms`, Hermes's stream and side-task timeouts | Operating default | A cold prompt near the full window is read for minutes before its first token; the server estimated 8.8 minutes for 65,536 tokens at `--memory-gb 12`. Shorter agent limits abandon the request and send it again, which starts the read over. The cost is that a server that really stopped is noticed later. | Claude Code: an exported value or its own settings win. Codex and Hermes: their own configuration. Revise if measured cold reads on a supported plan approach 30 minutes. |
| Window of a server the launch starts: the automatic window, raised to the agent's minimum when that is larger (`CodingToolLaunch.BackgroundServer.window(for:automatic:)`); in practice 65,536 tokens only for Hermes below 36 GB | Operating default within the qualification limit above | `docs/CODING-AGENTS.md` recommended `--max-context 65536` for every agent. `slotstream doctor` on the development Mac showed what a fixed 65,536 costs on small targets: at `--memory-gb 12` it keeps whole conversations but pins the expert cache at about 13 experts per layer (1.8 GB) against about 31 (4.1 GB) at the automatic 32,768, and the plan's decode estimate falls from about 6 to about 3 tok/s; at 10 GB it keeps only 6,828 tokens of a conversation, so every turn is read again; at 9 GB the plan is refused (38,912 tokens at most). The automatic window is the one the planner qualifies for each Mac, with speculative decoding kept. Claude Code and Codex fit their opening prompt and a reply in 32,768 tokens; long sessions compact sooner. | Run the server yourself with `--max-context`; the launch then uses it as it is. Revise if the automatic policy changes, or an agent's opening prompt no longer fits the automatic window of the smallest supported target. |
| Lifetime of a server the launch starts: it runs while any process the launch registered runs, and stops 30 minutes after the last request ends and the last registered process exits (`CodingToolLaunch.BackgroundServer.defaultIdleMinutes`, `serve --idle-exit`); a sleeping Mac's time counts | Operating default | Starting the server takes seconds, but a session that finds no server in memory reads its agent's instructions from disk or, without a saved state, again for minutes (15,487 tokens in 158.41 s for Claude Code). A server that outlives each session keeps the model's expert cache warm between sessions and between a person's pauses. Ollama keeps a model loaded 5 minutes after the last request; a coding session pauses longer while a person reads a diff, and the registered agent keeps the server anyway while it runs, so the timer only matters after the last agent exits. The cost is the server's memory, up to its plan's target, for half an hour after work ends. | `slotstream launch --idle-exit <minutes>` (0 keeps it until `slotstream stop`, at most 10,080); `slotstream stop` ends it at once. Revise if people report servers that stop between sessions they consider one piece of work, or memory held after they finish. |
| Prompt caches on disk for a server the launch starts: `~/.slotstream/prefix-cache` with the `serve` quota (20 GB) and age limit (30 days) | Operating default | `serve` keeps the disk tier opt-in; a launched server exists to run agents, whose opening prompts repeat across sessions and restarts. With the directory, a new session after a restart restored Claude Code's 13,312-token shared prefix in 0.08 s instead of reading it. The cost is disk writes, about 470 MB for a 12,800-token shared prefix at this model, bounded by the quota. | Run the server yourself without `--prefix-cache-dir`; `slotstream prefix-cache --clear` empties the directory while no server holds it. Revise if the writes measurably slow sessions or wear matters more than the saved reads. |
| Which server the launch may stop: only the one it started, recognized by the process id and start time it recorded matching `/slotstream/status` and the running process, and only while it has no request running and no registered process; launches that may start a server take turns through a lock per port | Safety or correctness bound | A server someone started in a Terminal, or one another agent is using, belongs to that person or agent; restarting it would lose their work or their choice of window. A process id alone can be reused by a later process. Without the lock, two launches at once would each start a server; the second would fail on the port or the model lock, after overwriting the first one's record. `slotstream stop` is the explicit way to stop any server. | None. |
| A request that declares tools keeps its shared prefix like a conversation (`SharedPrefixRetention.conversation`, set by the server) | Operating default | An agent's instructions and tools open every later session, subagent and compaction request. Held as an optional snapshot, they were the first state other conversations displaced: in the first live pass, second sessions read their whole opening prompt again (Claude Code: 15,487 tokens, 158.41 s). Kept like a conversation, Claude Code's second session reused 13,312 tokens and took 48.89 s. The checkpoint now competes with conversations, least recently used first. Plain chat keeps `.optional`. | Library: `RequestControl.sharedPrefixRetention`. Revise if measured tool-free workloads lose conversations to agent checkpoints. |
| Retention kept once the vision tower loads: the largest that leaves the pool's slots and prefill pass as the ordinary re-plan sizes them (`Planner.loadingVision`) | Operating default | Applies only when the text plan retained a whole window. The ordinary re-plan fell back to the budget share, 10,807 tokens at a 12 GB target with a 65,536-token window, so every coding agent conversation after the first picture was read in full on each turn. For that case on a 48 GB Mac, `vision-check` sizes the graded retention at 43,882 tokens with the peak still within the target. In the last live pass the cache held 29,645 tokens after the picture turn, more than the old ceiling; that turn reused 15,587 of 16,332 tokens, and a later Codex turn 10,416 of 10,526. | `--memory-gb` and `--max-context` size the plan. Revise if measured image turns need more transient memory than the plan charges. |
