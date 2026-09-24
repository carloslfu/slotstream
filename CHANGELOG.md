# Changelog

What each release changed, newest first. `curl | sh` installs the latest
release; anything under **Unreleased** is on `main` only.
Version headings can be prepared before publication. The
[Releases page](https://github.com/carloslfu/slotstream/releases/latest)
determines which version the installer downloads.

## Unreleased

- The prefix cache's disk tier now writes states from 1,024 tokens instead
  of 2,048 (`--prefix-cache-min-tokens`). After a restart, a 1,919-token
  conversation re-read its whole prompt in 45.5 s under the old default and
  resumed with 6.0 s of prefill under the new one. The servers `slotstream
  launch` starts and the development Mac app use this default, so Pi's
  opening prompt of about 1,600 tokens now reaches the disk. Each turn of a
  conversation between the two lengths now writes its state, about 120 to
  170 MB, within the same quota. Measured by
  [@jasen215](https://github.com/jasen215) in
  [#17](https://github.com/carloslfu/slotstream/issues/17).

## 0.2.25 - 2026-09-24

- The GPU stays awake while a request generates. Streamed decode leaves the
  GPU idle between short bursts of work, and an idle GPU lowers its clock and
  starts the next burst late; a one-thread kernel on its own command queue now
  keeps it busy, with outputs unchanged. It costs power, so
  `--gpu-keepalive auto`, the default, runs it only on AC power outside Low
  Power Mode; `on` and `off` override it, and `SLOTSTREAM_GPU_KEEPALIVE` sets
  the default. Saved statistics report `gpuKeptAwake`.
- Cache misses are read into host memory and copied straight into their cache
  slots instead of passing through staging arrays and a GPU scatter.
  `SLOTSTREAM_OPT_DIRECT_DEMAND=0` restores the previous path.
- Together, on the development Mac with identical output, the two made decode
  1.28x faster at a 10 GB target without the draft head and 1.22x faster at
  22 GB with it. `decode-overlap-check` compares both against the previous
  paths on a cold cache and covers the direct reads' failure recovery.
- The draft head can stream its experts. On a cache below 76 experts per
  layer after the head's full 1.6 GB charge, its 512 experts now stay on the
  SSD and pass through a 64-expert cache of their own, charged 0.4 GB, so the
  main cache keeps the other 1.2 GB; the output is the same. Automatic mode
  turns the head on from 28 experts per layer instead of 76, a 12 GB target,
  so 24 GB Macs now run speculative decoding. At a 12 GB target the head
  decoded 1.23x faster than plain decode with the lookahead.
  `SLOTSTREAM_MTP_EXPERTS=resident|streamed` forces a placement and
  `doctor --json` reports `mtp_streamed_experts`. The automatic context window
  never trades a resident head for a streamed one, so the draft-head tiers
  keep their windows; `--max-context 65536` on a 32 GB Mac now keeps
  speculative decoding with the head's experts streamed, and `--mtp on` fits
  from an 8.5 GB target.
- Without the draft head, the decode lookahead now runs in plain decode from
  20 experts per layer before its charge, including `--mtp off` and installs
  without the head's file. It made plain decode 1.11x faster at a 10 GB
  target with identical output. `SLOTSTREAM_OPT_EXPERT_PREFETCH=0` turns it
  off. Its 373 MiB moves a 48 GB Mac without the head from 152 to 149 experts
  per layer, inside the measured decode range, so that Mac's automatic window
  becomes 131,072 tokens.
- `draft-stream-check` compares a streamed head with a resident one and plain
  decode with and without the lookahead, and injects a failed draft read.

- The development Mac app attaches folders without a whole-tree scan or a
  file-count cap. Live directory browsing, filename search and scoped content
  search discover new and renamed files. Bounded continuations retain matches
  within a file, detect directory changes and expire under resource pressure.
  Reads can use a returned ID or a relative path inside the selected folder.
- Edits require a fresh read after an external file change. Attachment errors
  no longer offer the unrelated Home-reconciliation action, and the assistant
  is told how local folder access is granted.

- A shared system prompt kept on disk now survives when its save lands on
  the conversation's own checkpoint, which happens when the system prompt
  and the end of the prompt fall in the same prefill pass. The checkpoint
  was written first, the shared save found it and stopped, and a later turn
  removed it, so other conversations and restarts read the system prompt
  again. The head is now upgraded to shared, and a shared save that is
  skipped or fails is logged. Found and fixed by
  [@jasen215](https://github.com/jasen215) in
  [#27](https://github.com/carloslfu/slotstream/pull/27), for
  [#18](https://github.com/carloslfu/slotstream/issues/18).

- The development Mac app uses automatic speculative decoding when the draft
  head is available and fits the selected memory budget. Short conversations
  create earlier reusable checkpoints; longer prompts keep the engine's
  throughput schedule and all checkpoint provenance checks.
- Automatic readiness retains a loaded model while you read or compose in
  the foreground. Background inactivity, memory pressure, power saving and
  sleep still release it. Reloads within an app session reuse successful pinned
  verification only when APFS file identity and change timestamps still match.
  New app launches and changed files require fresh verification. Immediate
  reloads also wait for macOS's memory-statistics refresh before replanning,
  preventing stale readings from unnecessarily shrinking the cache.
- Growing the expert cache preserves slot positions and avoids gathering a
  second copy of the occupied cache. The live governor also checks temporary
  replacement memory against the process target and available system memory.
  When growth cannot fit, it keeps the current warm cache and retries later.
- The download `slotstream run` offers on first use and the development Mac
  app's model download now also fetch the 37.5 MB decode-forecast file 0.2.19
  added. Only `slotstream pull` did, so models downloaded the other ways
  decoded with the earlier, slower forecast. A model already downloaded
  without the file still needs one `slotstream pull`: `slotstream doctor` now
  says when the file is missing, and the engine's startup line names the
  command. Three community reports on 0.2.22 ran without the file. The
  library's `WeightStore.download(_:log:)` still fetches the weights only;
  the [library guide](docs/LIBRARY.md#check-and-download-weights) shows how
  to fetch the file with `TapCorrectionSidecar.ensure`.

## 0.2.24 - 2026-09-23

- Nullable string tool parameters declared with a JSON Schema type array now
  stream incrementally and preserve numeric-looking strings, like the equivalent
  scalar and `anyOf` forms. Truncated arguments retain the ordinary length
  termination behavior.
- Conversation splicing checks compatible branches in memory and on disk before
  choosing a retained transcript. A longer incompatible branch no longer hides
  a shorter matching conversation. Numerical checkpoint validation is unchanged.
- The native acceptance battery now runs the issue-21 streaming, branch-reuse
  and restart suite, including OpenAI compatibility checks.

## 0.2.23 - 2026-09-22

- Long prompts share expert reads across more existing compute passes, reducing
  repeated reads without changing those passes. The scheduler preserves
  checkpoint boundaries and chooses smaller groups when memory is tight.
  See the [read-group and reuse qualification](db/records/measurements/prompt-speed-qualification-2026-09-21.md).
- The Mac app can reuse compatible prompt checkpoints after a restart for
  ordinary conversations. Checkpoints record the producing pass size, and
  read groups stop at the checkpoint actually selected. Thinking and incognito
  conversations keep their inference state off disk; an unavailable cache
  falls back to ordinary inference.
- Thinking and answering continue one live generation session, including
  **Answer now**, natural completion and a reached thinking budget. The
  engine reads only the transition suffix instead of reprocessing the thought.
  [`Engine.generatePhased`](docs/LIBRARY.md#a-thinking-phase-followed-by-an-answer)
  exposes this behavior with separate sampling and output budgets for each phase.
- Automatically pair fused-workspace accounting with larger expert-read groups
  on the qualified M5 Pro text-prefill path, including MTP. Main and draft
  phases account for their overlapping hidden states. When smaller expert-buffer
  writes allow substantially larger groups, the engine selects them automatically.
  Groups adapt to the live memory budget and keep chronological compute passes;
  other execution paths retain their existing policy. Applications need no new
  setting. The [MTP measurements](db/records/measurements/mtp-prefill-policy-2026-09-21.md)
  record the paired gain, tested configuration, memory peaks and remaining limits.
- The engine and Mac app use the same pinned MLX backend and matching Metal
  libraries. The measured M5 Pro profile enables upstream fused D256 prefill
  attention with causal and sparse masks. Other profiles keep backend dispatch;
  `SLOTSTREAM_OPT_FUSED_PREFILL=0` restores its normal selection on the measured
  profile too. Disk checkpoints include the backend's arithmetic identity.
  The [integration measurements](db/records/measurements/fused-prefill-integration-2026-09-21.md)
  separate the complete backend upgrade from the fusion-only comparison;
  percentages from different studies must not be combined into a total speedup.
- Backend qualification keeps historical golden differences visible and adds
  independent current-backend model comparisons and scalar attention oracles.
  Exact speculative verification retains one-row projection arithmetic when
  selected. The installer matches older macOS shaders to the downloaded release,
  including releases made before this upgrade.
- Closing response details from the Mac app completes immediately while a
  thinking response is updating.

- Chat Completions streams long string tool arguments as they are generated,
  and parsing no longer rescans the whole growing argument at every token.
  Token-limit truncation now returns `finish_reason: length`, requested usage
  and the stream terminator, including incomplete required tool calls.
  Partial arguments are not completed calls and must not be executed.
- Conversation splicing recognizes earlier assistant replies inside a longer
  cached descendant, preserving generated reasoning and tool syntax across
  later turns. The disk cache retains generated IDs alongside its aligned
  checkpoint so restarting does not drop reasoning from the reconstructed
  prompt. Preparation checks retain the request's cancellation and
  deadline between history turns.
- Serving logs cache reuse decisions, periodic request phases and socket
  output failures. Prefill progress follows elapsed time and estimates the
  remaining wait from recent throughput. Ollama tool refusals name the
  supported OpenAI route.
- Serving diagnostics follow aligned cache boundaries and typed memory
  failures. The pressure test interrupts an actual scope spanning several
  prefill passes, then checks admission refusal and bounded recovery before
  retrying inference.

- Custom memory limits in the Mac app can exceed the automatic default within
  the Mac's supported range, with pressure protection and cache resizing still
  enabled. First switching to Custom keeps the current budget; later switches
  remember the last custom limit. Settings show current usage and the budget
  available now separately.
- `--memory-limit-gb` adds an adaptive process ceiling to the CLI. Existing
  fixed-cache flags retain their behavior. Diagnostics and budgeted model
  startup now share the same feasibility check at every context size, and
  cache resizing updates the reported current budget while retaining the
  selected ceiling.
- Adaptive limits survive the server's context assignment and are also
  available through `launch`. Fixed-profile diagnostics reject the option
  instead of silently ignoring it. Saved app limits outside the current Mac's
  range remain visible with a correction prompt.
- Fractional memory limits retain their precision in launch arguments and
  reported targets. Response details distinguish the budget used from the
  saved custom limit, and busy-machine guidance respects the hardware bound.
- Small caches recover after memory pressure or a busy startup even when the
  missing amount falls below the normal growth threshold. Recovery still waits
  for available memory and the existing cooldowns.
- Swift memory-planning APIs retain their original callable signatures.
  Directly constructed adaptive plans reject conflicting sources, missing
  targets and targets above the saved limit before model allocation.

- `slotstream optimization-state-check --variant complete-prompt` passes
  again. Tiling vision queries changes the rows an image produces, so the
  cache keys an image prompt on that setting too. When tiling joined the
  deployed family, the check kept looking up retained image states with the
  untiled key. It found nothing and stopped at its first image case, so its
  remaining cases, including every speculative-decoding case, did not run.
  Generation and the checks now take the key from one function. With them
  running again, the speculative variant asserts the resume rule's handoff: a
  state built without the draft head is not continued by a request that uses
  one. That request reads its whole prompt and answers what a cold read does.
  The previous handoff is still checked with `SLOTSTREAM_OPT_ALIGNED_RESUME=0`.
  No engine result changed.

## 0.2.22 - 2026-09-18

- Automatic context selection no longer trades away expert cache above the
  measured decode range on the assumption that its flat speed estimate means
  no performance cost. This fixes large explicit memory budgets silently
  becoming long-context reservations instead of useful cache. Busy starts use
  the same decision rule. Explicit `--max-context` choices remain available;
  startup and JSON reports distinguish the process budget, allocated expert
  cache and runtime/context allowances from measured memory usage.
- A continued conversation now computes what a cold one computes. The engine's
  arithmetic depends on how tokens were grouped into passes and on whether each
  one was read or generated, so the state a turn left behind, its prompt read
  in passes and its reply decoded a token at a time, was not what reading those
  same ids computes. The difference sat in the same band as re-chunking a
  prefill, 3.7% to 5.9% of the logit spread, and it crossed a token: on a
  1,430-token agent turn a fresh read scored `>` at 0.9576 and `]` at 0.0421
  for one position of tool-call syntax, the cached turn inverted them, and the
  model's first `file.edit` call came back malformed. A request now resumes
  only a state whose length is one of its own prefill pass boundaries and whose
  every token was read in those passes, and re-reads the rest, so the same
  conversation gives the same tokens and bit-identical prompt logits either
  way. The Sevra basics run that produced that malformed call now writes the
  same edit with no correction round. A follow-up turn pays one partial pass
  for it: measured at 961 slots on a three-turn chat, follow-up prefill 2.47 s
  against 8.56 s, both well under the 26.3 s of reading the conversation cold.
  New gate `slotstream prefix-exact-check`, and the weights-free
  `aligned-prefix-resume` catalogue check holds the policy in CI;
  `SLOTSTREAM_OPT_ALIGNED_RESUME=0` restores the previous reuse.

## 0.2.21 - 2026-09-18

- Faster speculative decode on long prompts. The three-row verify pass of
  draft depth 2 no longer falls to the dense attention kernel, whose cost
  grows with the context: from 6,144 tokens it runs two rows at a time through
  the vector kernel, the kernel plain decode's attention uses. The gain grows
  with the context, because it is the dense kernel's growth that it removes.
  On a quiet machine at a 22 GB target, speculative decode measured 11.82
  against 11.67 tok/s (x1.013) with a 16,356-token prompt, x1.085 on a second
  16,356-token prompt and x1.29 with a 32,740-token prompt, and the fetch-free
  verify pass is 32% cheaper at 32,740 tokens and 45% at 65,508. The split changes which drafts are accepted, so the 16k gain follows the prompt, 1% and 8% in the two measured; at 32k both arms accept alike and the ratio is the pass saving alone. `SLOTSTREAM_OPT_VERIFY_SPLIT=0` restores the previous pass.
- Exact mode, off by default: `SLOTSTREAM_OPT_ROW_INVARIANT=1` with
  `SLOTSTREAM_OPT_VERIFY_SPLIT_CONTEXT=0` makes a speculative run's output
  identical to a plain run's in the same mode for draft depths up to 4 (128 of
  128 tokens in the 16k comparison). The model's small dense matmuls run
  through one kernel at every row count, which changes plain decode's rounding
  as well, and each verify row attends in its own call over the keys plain
  decode reads, so the backend picks the same attention kernel.
- New gate `mtp-rowcheck` in `Tools/verify.sh`: in exact mode, every row of a
  two-row and a three-row verify pass, and the state a three-row pass leaves,
  must equal the one-row passes bit for bit, on a prompt whose positions cross
  1,024 keys, where the attention kernel changes, and one above the indexer
  budget. The weights-free `verify-pass-rows` catalogue check holds the
  kernels in CI, at every key count where the backend changes attention
  kernels. `mtp-bench --arms` compares plain, shipped, split and exact decode
  on one warm engine; `mtp-passcost` gains `--prompt-file`, `--max-context`
  and `--attention-modes` (stock, split, exact).
- Start a coding agent already connected to Slotstream with
  `slotstream launch claude`, `codex`, `pi`, `opencode` or `hermes`, or
  `slotstream launch` to pick from the agents installed. When no server is
  running, the command starts one in the background first and shows its start
  until the model answers: with the automatic window, or the one the agent
  needs when that is larger, shared prompts kept on disk in
  `~/.slotstream/prefix-cache`, and its log in
  `~/.slotstream/logs/serve.log`. The server keeps running while any agent
  the command opened runs, and stops 30 minutes after the last one exits
  (`--idle-exit`); Control-C while it starts stops it. The agent's settings
  are checked before the server starts, the model is never downloaded without
  asking, a server you started yourself is used as it is, and a server the
  command started is restarted only when its window is too small and no agent
  uses it. Two launches at the same time start one server between them.
  `--memory-gb` sets the new server's memory target, `--no-start` uses a
  running server only, and `--port` names the server's port, whose log is
  `serve-<port>.log`. Thinking starts off, and the agents get timeouts long
  enough for a first prompt: Claude Code runs with `MAX_THINKING_TOKENS=0`,
  30-minute request and stream timeouts and its nonessential network traffic
  off.
  The command reads the served model, window and reply limit, connects the
  agent for that run without changing its own configuration (Pi's models file gains
  a `slotstream` provider; Hermes gets its own `~/.hermes-slotstream`
  folder), and replaces itself with the agent. Codex gets a model catalog
  with its own version's base instructions, downloaded once; Claude Code gets
  its connection through `--settings`, so its settings files cannot redirect
  it. No prompt leaves the Mac by a side route: Claude Code's cloud provider
  switches are turned off and its API key and key helper cleared, the hosted
  WebSearch tool is denied, opencode enables only the `slotstream` provider
  through `OPENCODE_CONFIG_CONTENT` (an exported one is merged, not replaced)
  and points its build and plan agents at the model, Hermes pins every side
  task (including the command-approval check) to the model, and `codex
  cloud` is refused. Pi's models file keeps every other entry as written,
  down to key order and number formatting, and a symlinked file stays a
  symlink. `--dry-run` prints the plan with keys hidden and downloads
  nothing.
  New guides: [Claude Code](docs/CLAUDE-CODE.md) and
  [coding agents](docs/CODING-AGENTS.md) for Pi and opencode; the Codex and
  Hermes guides start with the command.
- `slotstream stop` stops the Slotstream server on a port (`--port`), whoever
  started it, including one `slotstream launch` is still starting, and says
  so when nothing runs there. The refusal when another model process holds
  the lock names it too.
- `slotstream serve --idle-exit <minutes>` stops the server after that long
  with no request and no registered process still running. Once it decides,
  new requests get a 503 instead of starting. `GET /slotstream/status`
  reports the server's process, window, requests and idle time, and
  `POST /slotstream/clients` registers a process to wait for; see
  [server status](docs/API.md#server-status), including what sized its
  memory plan. The server logs a line when `SIGTERM` stops it, also while the
  model loads, and a port already in use names `slotstream stop`.
- `slotstream prefix-cache` lists `~/.slotstream/prefix-cache` when no
  `--dir` is given, the directory servers started by `slotstream launch` use.
- Serve the Anthropic Messages API at `POST /v1/messages` and
  `POST /v1/messages/count_tokens`, the protocol Claude Code and the Anthropic
  SDKs use. Streaming follows Anthropic's event order with a `ping` every 10
  seconds during a long prompt read; tools, `tool_choice`, images, plain-text
  documents, thinking with replayable signatures, stop sequences and usage
  with the reused prompt as `cache_read_input_tokens` are supported. Unknown
  top-level fields are ignored and named in `X-Slotstream-Ignored-Fields`,
  Claude Code's per-conversation attribution line is dropped, and an
  oversized prompt fails with the `prompt is too long` message Claude Code
  compacts on. Anthropic's hosted server tools (`web_search_*`, `web_fetch_*`,
  `code_execution_*`, `tool_search_tool_*`, `mcp_toolset`, `advisor_*`) run on
  Anthropic's servers, so they are dropped from a request rather than
  answered, and naming one in `tool_choice` is an error; `container` and
  `mcp_servers` are refused with what they ask for.
- `/v1/chat/completions` accepts `store: false`, `metadata`,
  `prompt_cache_key`, `prompt_cache_retention`, `safety_identifier` and
  `service_tier` without effect, applies `min_p`, and takes the
  `effect_disposition`, `display_kind` and `display_metadata` bookkeeping
  Hermes puts on a message. Pi and the OpenAI SDKs
  send `store: false`, and it was refused
  ([#19](https://github.com/carloslfu/slotstream/issues/19)). `store: true`
  still returns 400, since no completion is kept to fetch.
- `/v1/chat/completions` without `max_tokens` lets a reply use a quarter of
  the served window, up to 8,192 tokens, as `/v1/responses` already did; the
  512-token default cut agents' edits short. The Ollama endpoints keep 512.
- A request that waits behind others until its estimated prefill no longer
  fits the wait budget now fails with the retryable 503
  `prefill_deadline_exceeded` instead of a 400.
- A request body over the 32 MiB limit is read and discarded before the 413
  answer, up to 256 MiB, so the client reads the error instead of losing the
  connection. A client that declares a large body and then stops sending gets
  its 413 as soon as the next piece fails to arrive, and the discarding never
  takes longer than 10 seconds in total.
- Library: an app that embeds Slotstream can count a chat request's prompt
  tokens (`Engine.countChatTokens`), find where a prompt's shared head ends
  (`Engine.sharedPrefixBoundary`), name a request's shared prefix and how long
  it is kept (`RequestControl.sharedPrefixTokens`, `.sharedPrefixRetention`,
  `SharedPrefixRetention`), store a checkpoint with that retention
  (`PrefixCache.storeReusableCheckpoint(…retention:)`), read the shared states
  on disk (`PersistentPrefixCache.storedSharedStates`), and see the save
  points and the stop sequence a generation used (`GenStats.sharedPrefix…`,
  `GenStats.stopSequence`). A server can report and bound its own use:
  `Server.activity`, `Server.idleExit`, `ServerActivity` and
  `ProcessIdentity`. Existing signatures are unchanged, and disk-tier
  statistics written by 0.2.18 to 0.2.20 still decode.
- Once the first image loads the vision tower, a server that retained whole
  conversations keeps the largest retention that fits beside it, instead of
  the much smaller budget share. At `--memory-gb 12` with a 65,536-token
  window, the share left coding agents' conversations too long to keep, so
  every later turn read the whole prompt again.
- A stop sequence is no longer matched inside the reasoning that precedes an
  answer.
- A tool call whose integer or number argument the model writes outside the
  range of a 64-bit integer, such as `1e20`, or as `inf`, no longer stops the
  server; the value is kept as a number, or as text when JSON has none.
- Streamed answers after reasoning no longer start with the blank lines the
  model writes after `</think>`, matching non-streamed answers.
- Reuse a shared system prompt across conversations
  ([#18](https://github.com/carloslfu/slotstream/issues/18)). While a prompt
  is processed, the head other conversations will start with is kept as a
  shared prefix: the system message when it ends 512 tokens or more in, and
  the longest head the prompt shares with a state already kept. The save point
  is the last prefill pass end at or before that boundary (the 256-token grid
  by default), so no pass is reshaped and outputs are unchanged. The state is
  forked into the in-memory prefix cache and, with `--prefix-cache-dir` and
  `--prefix-cache-min-tokens` or more tokens, written to disk. The next
  conversation with the same system prompt resumes from it instead of
  processing it again, in the same process or after a restart. Shared prefixes
  are kept once, are never replaced by the conversations that extend them, go
  after conversations when the disk quota needs room, and `slotstream
  prefix-cache` lists them, with their own row, a count in its summary and a
  `shared` field in `--json`, and `optimization-state-check shared-prefix`
  and `shared-prefix-mtp` hold the behavior on the model. Library callers name
  the shared head with `request.sharedPrefixTokens`; `GenStats` reports the
  save points. A request
  that declares tools, as coding agents' requests do, keeps its shared prefix
  in memory like a conversation (`request.sharedPrefixRetention`), and a
  shared prefix stays as recent as the conversation that continues from it,
  so other conversations no longer displace an agent's instructions before
  its next session starts.

## 0.2.20 - 2026-09-16

- Serve the OpenAI Responses API at `POST /v1/responses`, the protocol Codex
  requires since it dropped Chat Completions. Function tools, Codex's
  `namespace` bundles (flattened to `namespace.name` and split again on the
  way back) and freeform `custom` tools such as `apply_patch` render through
  the model's native tool grammar; replies stream as the item and delta
  events Codex reads, with a progress event every ten seconds during a long
  prompt read because Codex's idle timeout counts events. Reasoning streams
  as summary text and is accepted back as replayed history; pictures arrive
  as `input_image` parts in messages and in `function_call_output` items.
  `Tools/codex_catalog.py` writes the model catalog that tells Codex the
  served window and declares `apply_patch`. Guide: `docs/CODEX.md`; wire
  details: `docs/API.md`. Verified with `codex exec` creating a file through
  `apply_patch`, reading it back through `exec_command`, describing an
  attached picture, and reading one through `view_image`.
- Library: an app that embeds Slotstream can return allocator-held buffers
  after releasing its engine (`Engine.releaseUnusedMemory()`), drain the
  memory governor before that release (`MemoryGovernor.stopAndWait()`), and
  stop weight verification from a Stop button or at shutdown
  (`WeightStore.status(shouldContinue:)` and
  `WeightStore.sha256(of:shouldContinue:)`). Existing signatures are
  unchanged. The Sevra for Mac development app in `apps/macos` uses them; it
  is not part of the release download.
- Say who Slotstream is for. It is built for Macs that cannot hold the model,
  16 to 64 GB; 96 GB and larger Macs run it but are not the optimization
  target. The README, hardware guide, getting-started guide, engineering
  notes, `llms.txt`, agent instructions and the plan records now state it, and
  the 96 GB+ estimate row is labeled as the case where the model fits in
  memory. No number changed. Decision:
  `db/records/decisions/target-range-macs-that-cannot-hold-the-model.md`.
- Say that Slotstream is native end to end. The README's new Built native
  section, the engineering notes' native-stack table, the Swift library
  guide, the Sevra Mac notes and `llms.txt` now describe the Swift, MLX and
  Metal stack, the run-time-compiled Metal kernels, the C download decoder
  and the role of the Python tooling, and keep speed attributed to the
  measured mechanisms. No number changed. Decision:
  `db/records/decisions/native-stack-stated-on-every-surface.md`.

## 0.2.19 - 2026-09-16

- Generate replies 1.10x faster with a more accurate expert forecast at
  the same lead time. The decode lookahead now reads the model's state right
  after the previous layer's attention step, applies the next layer's router to
  it and corrects the result with a small learned table fitted for the
  checkpoint, so it reads about a fifth fewer expert records from the SSD during
  decode and wastes about three quarters fewer speculative bytes. Output is
  unchanged. `slotstream pull` fetches the 37.5 MB correction file
  (`lookahead/tap-correction-attention-rank128-v1.safetensors`) next to the
  weights and verifies it; if you installed the model with an earlier release,
  run `slotstream pull` once more, and until then the engine runs the 0.2.16
  forecast. The memory plan charges 409 MiB for the lookahead with the file
  (373 MiB without). `SLOTSTREAM_EXPERT_PREFETCH_TAP=boundary` keeps the 0.2.16
  forecast with the file present. Levers measured and left out on their
  registered gates: a co-routing prior, a lower read-issue threshold and
  computing the next layer's attention early, which reads more accurately but
  costs more GPU time than the reads it saves; see the
  [expert lookahead guide](docs/EXPERT-LOOKAHEAD.md).

## 0.2.18 - 2026-09-14

- Keep long conversations on disk with `serve --prefix-cache-dir <dir>`. A
  restarted server, or a conversation longer than the in-memory prefix cache
  holds, restores its last committed state instead of processing the whole
  prompt again, and continues exactly as it would have from memory. Each later
  turn writes only the tokens it added, and the previous turn's state stays so a
  reply can be regenerated after a restart. Off by default;
  `--prefix-cache-disk-gb`, `--prefix-cache-min-tokens` and
  `--prefix-cache-max-age-days` bound what is kept, and states nobody continued
  are removed before conversations. Files are checksummed, used only by the
  binary, model files and settings that wrote them, and hold conversation token
  ids: `slotstream prefix-cache --dir <dir> --clear` erases them. Library
  callers use `Engine.enablePersistentPrefixCache(_:)`, keep a request off disk
  with `RequestController.persistsPrefixState = false`, and remove a deleted
  conversation's states with `removeStates(overlapping:)`.

## 0.2.17 - 2026-09-13

- Pick the context window for each Mac. Auto now takes the largest of 32,768,
  65,536, 131,072 and 262,144 tokens that keeps speculative decoding, keeps one
  complete conversation ready for follow-up turns and adds at most a tenth to
  the planner's estimate for a typical request. In decimal-GB simulations that
  is 32,768 tokens through 32 GB, 65,536 from 36 GB, 131,072 at 64 GB and
  262,144 from 96 GB. A Mac that is busy at startup gets a smaller window
  rather than losing speculative decoding, and `doctor` lists every candidate
  with its reason.
- Accept `--max-context` up to 262,144, the model's full window, or `auto`.
  Requests with images still use at most 65,536 tokens. A window above 32,768
  keeps one complete conversation for follow-ups when the plan can hold it,
  and says how much a follow-up reuses when it can't.
- Raise auto's memory target on 64 GB and larger Macs by the chosen window's
  own charge, to 43.2 GB at 64 GB and 54.7 GB from 96 GB, so the expert cache
  keeps its size. `--max-context 32768` restores the former plan.
- With an explicit `--memory-gb`, auto also picks the window inside that
  target, trading some cache for a larger window within the 10% limit. Add
  `--max-context 32768` to keep an earlier plan. `--experts-per-layer` and
  `--pool-gb` keep 32,768 tokens.
- Show why `doctor` rejects a memory target in its tier table: too small for
  the window, above the Metal working set, or more than is reclaimable now.
- Qualify a full 131,072-token window on the development Mac: the prompt and
  reply fit their memory plans, and speculative decoding produced exactly the
  same reply. The full 262,144-token window has not run natively yet.

## 0.2.16 - 2026-09-13

- Generate replies 1.11x faster with speculative decoding. The new decode
  lookahead runs the router of the layer two ahead on the current hidden state,
  reads the experts it picks from the SSD straight into cache slots, keeps FP32
  router weights and drains the GPU every four layers instead of every layer.
  Output is unchanged. On twelve held-out prompts at a 20 GB target the
  development Mac went from 11.79 to 13.47 tok/s median. The memory plan charges
  its 373 MiB, and `SLOTSTREAM_OPT_EXPERT_PREFETCH=0` turns it off.
- Use speculative decoding from 32 GB Macs. Auto now turns the draft head on
  when the cache keeps 76 experts per layer, down from 120, a 21 GB target.
  Two drafts measured faster than plain decode at that size.
- Drain the GPU after every layer whenever a pass could not keep several layers
  of experts pinned, and let the memory governor re-plan with the running
  engine's lookahead decision and memory.
- Correct the benchmark report's medians, which took the upper middle value
  over an even count. Recorded cohorts score slightly lower, and every verdict
  stands.
- Document speed estimates and recommended context windows for each memory
  tier, and correct the 8 GB guidance: the smallest plan doesn't fit, so
  Slotstream refuses to start.

## 0.2.15 - 2026-09-11

- Stop treating system-wide macOS paging as a failed correctness or memory-budget
  check. Preserve paging diagnostics and the real process-memory, headroom,
  cancellation and completed-output safeguards. Clean performance measurements
  remain a separate qualification.
- Use two draft tokens by default when speculative decoding is enabled. Valid
  `SLOTSTREAM_DRAFT_DEPTH` overrides remain supported. The choice follows the
  mixed-workload comparison; it is not a universal throughput improvement.
- Fix peak-memory reporting after GPU buffers are freed by reading macOS's
  lifetime physical-footprint high-water. Keep current usage and sampled
  request peaks distinct, and report memory on early failures and cancellations.
- Add native memory-counter and explicit-budget regression checks, preserve
  older saved-statistics decoding, and clarify memory budgets and historical
  estimates in the documentation.
- Include the draft-depth studies, decode bottleneck evidence, and the reviewed
  Expert Lookahead plan. Learned expert prediction and expert prefetching remain
  planned work; this release does not implement them.

## 0.2.14 - 2026-09-10

- Faster repeated and continued prompts through committed prompt checkpoints,
  bounded prefill read grouping, and reuse of completed prompt state.
- Lower runtime memory through compact state and n-gram storage, bounded output
  buffering, and reduced temporary allocations. Expert reads and transfers
  retain checked bounds, exact ownership, and recovery after failure.
- Qualified rotation and projection paths reduce avoidable work while keeping
  reference fallbacks for unsupported shapes and platforms. Vision attention
  workspace and memory reservations are bounded independently.
- More responsive memory handling, cancellation, and serving recovery. Preserve
  the independent CLI, Swift library, and OpenAI/Ollama serving contracts.
- Publish the complete optimization evidence, including rejected experiments,
  performance limits, sustained generation comparisons, and practical serving
  results. [Integrated measurements](MEASUREMENTS.md#final-integrated-optimization-results)
  compare selected and reference paths in the same build; they are not a
  direct comparison with the previous public release. Prompt reuse improved
  responsiveness, while sustained decode was flat or slightly slower in the
  measured profiles. There is no universal tokens-per-second speedup claim.

- Shared context and request-wait configuration across run, serve, doctor and
  the Swift library. Exact allocation accounting includes retention and loaded
  components; discovery separates the configured window from model/mode limits.
- Cancellable queueing and request-to-first-token deadlines, with memory checks
  before bounded work, typed errors in every serving dialect and safe cleanup.
- Checked context diagnostics preserve reply room and enforce bounded late
  prefill passes. Larger public windows remain gated on full qualification.

The v0.2.12 and v0.2.13 tags stopped at prepublication test-harness failures
and have no release archives. This release corrects the isolated fixture and
startup-memory error checks, while preserving those tags and their evidence.
The release now signs and publishes the exact archive from successful main
CI, with checksum, source-identity and version verification.

The public artifact is installed and serving locally. Local acceptance completed
on September 11: all 25 original model gates and all 31 installed-release
checks passed against the same published binary. The final unchanged governor
and long-prompt memory tests completed with zero swap activity. Earlier failed
intervals and the passing reruns remain preserved in the
[release qualification record](db/records/measurements/release-qualification-0-2-14.md).

## 0.2.11 — 2026-09-06

- Compressed model downloads now come directly from the public Hugging Face
  mirror, avoiding publisher charges per download. The package, original
  hashes, compression saving, and resumable installation remain the same.
- Respect Hugging Face rate-limit reset headers and longer server-requested
  waits, with prompt cancellation. Add real HTTP retry and cancellation gates.
- Preserve older download URLs with free static redirects to Hugging Face.
  Add a resumable publisher that checks immutable package contents and
  preserves the existing model repository.

## 0.2.10 — 2026-09-06

- New model downloads use a lossless, quantization-aware package from
  Cloudflare R2 and its edge CDN: **16.12% fewer bytes**, reconstructing the
  exact original model. Independent chunks allow download, decoding, and
  writes to overlap while bounding memory.
- Embedded package and original-file hashes verify each stage. Unavailable
  objects fall back to pinned Hugging Face ranges. Verified progress resumes
  after interruption; damaged partial files repair automatically.
- Connection count adapts to measured throughput; explicit connection counts
  and raw mirrors remain available. Existing raw downloads keep their progress.
- Fixed retry progress accounting, duplicate verification, cancellation,
  simultaneous writers, malformed resume maps, unsafe partial-file types,
  and optional-file writes during fallback. Added native sanitizer and real
  HTTP gates for both transports.

- Interruption tests wait for durable chunk progress and explicit writer
  readiness, including delayed-start fixtures, so slower CI runners exercise
  the same resume state.

## 0.2.9 — not published

The release gate exposed a timing assumption in the interruption fixture.
No release asset was published; 0.2.10 includes the corrected qualification.

## 0.2.8 — 2026-09-05

- The OpenAI Chat Completions endpoint now supports function tools, streamed
  calls, tool results, and reasoning history. Tool IDs survive the full agent
  loop, including results returned out of order. Malformed calls fail
  explicitly. This adds the Hermes integration requested in
  [#11](https://github.com/carloslfu/slotstream/issues/11).
- An explicit `--max-context 65536` supports Hermes while ordinary serving
  keeps its existing context default. Long-context state and transient memory
  are charged before allocating the expert cache.
- Model discovery reports the runtime context window and available vision
  capability, so Hermes no longer misidentifies an image-enabled server as
  text-only. OpenAI requests accept
  Hermes's reasoning flags and bounded `options.num_ctx`. Unsupported
  structured output has an explicit rejection compatible with Hermes's
  fallback handling.
- Added a [connection guide](docs/CLIENTS.md) and a
  [Hermes setup guide](docs/HERMES.md), including local auxiliary routing,
  output budgets, and troubleshooting.

## 0.2.7 — 2026-09-04

- **The model reads images.** The checkpoint has always carried a vision tower
  — 333 `vision_tower.*` tensors the weight loader skipped by name — and the
  chat template has always rendered an image part to `<|image_pad|>`. Now the
  tower runs and its rows are spliced under those placeholders, on every
  dialect: Ollama's `images` array on `/api/chat` and `/api/generate`, OpenAI
  `image_url` parts, AI-SDK `file` parts on the fx gateway (whose catalogue now
  advertises the `vision` tag), and `slotstream run --image`.

  Based on [#10](https://github.com/carloslfu/slotstream/pull/10) by
  [@msx98](https://github.com/msx98), whose port of the tower and, in
  particular, whose prefix-cache design — keying each placeholder run on a
  digest of the image's bytes, because every image expands to a run of the same
  token id — are the load-bearing parts of this.

  Reworked before landing: the tower's attention goes through
  `MLXFast.scaledDotProductAttention` with a per-block `eval` (written out, it
  materialized a float32 `[16, N, N]` score matrix twice per block — 5.4 GB
  each at the largest image); the splice is a concatenation of contiguous spans
  on the GPU rather than a scalar loop over a CPU copy of the hidden state, and
  can no longer disagree with itself about how many rows it was given; image
  sources are inline bytes only, where the previous fallback to
  `Data(contentsOf:)` would fetch an arbitrary host or read a local file
  through `file://`; the tower loads under the generation lock and only when
  the machine can spare it, and `serve` announces its 0.9 GB rather than taking
  it silently against a printed plan that did not include it.

  Gated: `vision-check` (75 weights-free assertions — the reference
  processor's geometry, the source policy, run clipping, request shaping),
  `Tools/vision_ref.py` (the tower against an independent float32
  implementation of the reference, inside the band bfloat16 itself spans),
  `Tools/vision_serving.py` (19 assertions over every dialect, against a real
  server, requiring the model to name what is in the photograph), plus a
  vision leg in `mtp-check` and six image cases in `api_robustness.sh`.

- **A photograph's EXIF orientation is applied.** A phone stores its sensor's
  pixels plus a tag saying which way is up; every viewer turns the picture
  before showing it, and so does the reference processor
  (`ImageOps.exif_transpose`). slotstream did not, so every portrait photograph
  reached the model on its side — and the token count with it, since four of
  the eight orientations swap the axes. All eight are now checked corner by
  corner, weights-free, against EXIF's own table.

- **An image that ends mid-file is refused.** ImageIO is lenient by design:
  half a PNG decodes to the rows it has plus blank space, and reports itself
  complete, so an upload cut short by a dropped connection came back as a
  confident description of a mostly empty picture. The container's end marker
  is checked instead — `IEND` for PNG, the end-of-image marker near a JPEG's
  tail (editors append after it), `;` for GIF — and anything else is left to
  ImageIO rather than guessed at.

- **A transparent PNG is composited onto white, not onto black.** Found by
  putting a set of images with known content through the finished path: the
  decoder's context is premultiplied, so drawing over fresh memory made every
  transparent pixel black. Photographs have no alpha and never showed it;
  logos, charts, diagrams and screenshots exported with transparency do, and
  black text on a transparent background reached the model as black on black —
  it answered "the image is entirely black, with no discernible features or
  content". It now reads the text. Opaque images are byte-identical either way.

- **The request body cap is 32 MiB**, up from 4 MiB, so a base64 picture fits;
  the largest image accepted is 24 MiB decoded. The robustness suite's oversize
  probe moved with it — at 9,999,999 bytes it had silently stopped testing
  anything.

## 0.2.6 — 2026-09-03

- **An optional string in a tool schema is no longer read as a number.** fx
  writes an optional parameter as `anyOf: [{"type":"string"},{"type":"null"}]`,
  and three of the five required fields on its `terminal` tool are declared that
  way. Typed as an unknown union, the coercion took a numeric-looking value at
  face value, so a command or working directory like `2024` would have been sent
  as the integer 2024 and rejected. A union of exactly one real type plus null
  now resolves to that type; a genuine two-type union stays conservative. Found
  by capturing fx's real schemas off the wire rather than from a fixture.

## 0.2.5 — 2026-09-03

- **Fixed: a JSON null anywhere in an fx request failed the whole turn.** The
  chat-template bridge throws on `NSNull` and maps Swift `nil` to null, and the
  gateway dialect handed it `NSNull`, so a single `"default": null` inside one
  of fx's tool schemas — or a null for an unset optional argument in a replayed
  tool call — returned `400 template_error: Cannot convert value of type NSNull
  to Jinja Value` with no output at all. fx sends both routinely; the failure
  showed up on the first real multi-step task, one turn after a `terminal` call.
  Nulls now cross as an empty Optional, which the bridge degrades to null, so
  they render as `null` and array positions are preserved rather than dropped.
  Gated three ways: a T0 check that no path bridges an `NSNull`, and three live
  scenarios covering a null in a tool schema, in tool-call arguments, and in a
  JSON tool result.

## 0.2.4 — 2026-09-03

- **Decode is about 10% faster at small cache sizes, and the output is
  byte-identical.** `run` now prints a decode split beside the prefill one, and
  it found two things. The pool scatter was 20% of decode time and running at
  about 18 GB/s against a microbenchmark that writes slots at 49 to 75, because
  `SlotPool.ensure` ended every batch with a full GPU sync — 48 per token — that
  the gather in the same layer did not need. And the pool path was reading on
  the sweep's 12 lanes, tuned for long contiguous runs, where a layer's handful
  of nine-piece misses is latency-bound and wants more. Five interleaved rounds
  at 30 experts per layer: 6.93 to 7.63 tok/s, peak 7.5 to 7.8 GB, identical
  text. `SLOTSTREAM_SCATTER_MODE` and `SLOTSTREAM_POOL_QUEUE_DEPTH` are the A/B
  knobs; the sweep keeps its own `SLOTSTREAM_IO_QUEUE_DEPTH` of 12, because
  raising that one measured slower.
- **A pass can be read in query blocks, which bounds the attention transient
  without changing a number.** MLX 0.31.1 runs head dim 256 on its unfused
  attention path, materialising the whole `[24, pass, context]` score matrix;
  splitting the queries bounds it and is bit-identical at blocks of 256 and up.
  It is **off at every size the planner produces today** and engages only above
  the largest query-by-key product any prefill measurement covers — where the
  schedule already shrinks the pass — because measured end to end it lowers peak
  memory by 0.00 GB. The phase trace behind `SLOTSTREAM_MEM_TRACE=1` says why:
  attention, the PLE layer and the MoE sweep peak within 0.6 GB of each other,
  so bounding one alone can never lower the process. Recorded as a null result
  with its mechanism, not as an improvement.
- **M1 is closed, and the answer is that the eviction policy is not the lever.**
  The expert-locality study has been open since the first week: the simulator
  existed, the trace never did, because taking one needs a bounded forward pass.
  `SLOTSTREAM_ROUTER_TRACE` now records every routing decision and
  `Tools/trace_convert.py` feeds `Tools/cachesim.py`. On 220 decode steps at 30
  experts per layer, the shipped CLOCK measured 0.557 against LRU 0.568,
  LFU-decay 0.480, and an offline hot-set bound of 0.603 — so CLOCK stays. The
  same trace fixes the compulsory-miss ceiling for that workload at 0.906 and
  shows 10% of records serving 71% of accesses, which points the remaining work
  at capacity and a warm start rather than at eviction.
- The prefill sweep gathers each staging group's rows as it needs them instead
  of building one replicated copy of the whole pass up front (105 MB at a
  2048-token pass, 210 at 4096). Bit-identical; `sweep-check` reads the same
  3.320% of logit spread against the same control.
- **fx runs against slotstream.** A second HTTP dialect speaks the Vercel AI SDK
  Language Model Specification v4 over AI Gateway protocol 0.0.1, which is the
  wire [fx](https://fx.sh) uses. fx ships no plugin point, but its gateway client
  honours `FX_GATEWAY_CHAT_URL` and `FX_GATEWAY_BASE_URL` when they name an
  `http://` loopback address, so pointing it at a local server needs no fork and
  no patched binary: `POST /v3/ai/language-model` streams the turn,
  `GET /coding-agent/v1/models` is the catalogue, `GET /coding-agent/v1/credits`
  answers `fx credits`. Setup, limits and troubleshooting are in
  [docs/FX.md](docs/FX.md).
- **Native tool calling.** The model does not emit JSON tool calls; its template
  teaches it an XML form. That form is now parsed as it streams — several calls
  per turn, prose before and after, each argument typed against the tool's own
  JSON Schema — and a tag split across two token deltas can never leak into the
  user's transcript as text. Tool calls, tool results and reasoning also render
  back into a conversation, so an agent loop replays correctly.
- The catalogue derives every window from the running server's context cap
  rather than advertising a fixed one. fx reserves room for a reply only when
  the advertised reply budget is strictly smaller than the window; a fixed
  budget would, at small caps, tell fx it could fill the whole context with
  input and leave nothing to answer in.
- Agent turns get their own sampling defaults. The instruct default penalises
  repeated tokens, and the call format is obliged to repeat `</parameter>` and
  `</function>`, so the penalty pushed the model off the grammar exactly where
  it had to stay on it.
- The generated files cannot be committed stale. `llms-full.txt` comes from
  the docs and `MEASUREMENTS.md` / `PLAN.md` from the brain's records; a
  README edit that skipped the regenerate turned the docs job red, so
  `make hooks` now installs a pre-commit hook that regenerates them with
  the commit that moves their sources. The staleness check prints the drift
  it found instead of a bare verdict.

## 0.2.3 — 2026-09-02

- Reading a prompt is about twice as fast. A prefill pass of 256 tokens or
  more now sweeps each layer's experts through staging groups and MLX's
  grouped GEMM instead of gathering one matvec per token over the slot pool,
  reads consecutive experts as one contiguous `pread` per piece instead of
  nine ~307 KB pieces per record, and never writes the pool, so a long prompt
  no longer flushes what decode was using; the last pass admits the prompt's
  hottest experts so decode starts warm. Measured on the dev Mac, interleaved
  against 0.2.2's code: an 8k prompt at a 16 GB target 91 → 184 tok/s, ordinary
  prose 66 → 140, the 8.1 GB floor 51 → 93, `context-check --tokens 8192` 64 →
  152; at a matched 60-experts-per-layer pool a 4096-token pass reads 222
  tok/s (was 103). The n-gram rows a pass needs are now read in parallel
  rather than one at a time, which is where prose was paying ~35 s per 10k
  tokens. Peak memory is unchanged within 0.3 GB at 16 GB and 1.5 GB lower at the 8.1 GB floor, where MLX's buffer cache is now capped while a prompt is read.
  New gate `sweep-check`; `SLOTSTREAM_SWEEP=0`, `SLOTSTREAM_SWEEP_ADMIT=0`,
  `SLOTSTREAM_SWEEP_TRACE=1`, and `SLOTSTREAM_PREFILL_CACHE_MB` for A/B work.
  The planner's prefill estimates and the full-context waits on the README
  and in `doctor` moved with the measurements.
- slotstream is a Swift package as well as a binary. `Package.swift` declared
  no products, so nothing outside the repository could import it even by path:
  SwiftPM refused at graph resolution. There are now two library products —
  `Slotstream` (weights, planning, generation, serving) and
  `SlotstreamDiagnostics` (checks, goldens, benches) — beside the unchanged
  `slotstream` executable. `docs/LIBRARY.md` is the guide, including the part
  nobody guesses: MLX looks for its Metal shaders beside whichever executable
  is running.
- The weights are an addressable thing. `WeightStore.status()` answers ready /
  missing / incomplete / corrupt with the bytes still needed and the free disk
  where they land, so an app can ask before it tries to load, and a
  complete-looking copy is still hashed because size cannot see same-size
  corruption. `PinnedModel` is a public value; the download engine moved with
  it and no longer throws ArgumentParser's errors.
- The machine is a value, and a simulated one cannot allocate. `Machine`
  carries RAM, working set, availability and whether any of it was invented;
  a plan made for a simulated machine is marked and `Engine.load` refuses it.
  The global `Planner.availabilityOverride` is gone from the planning path.
  (Named `Machine`, not `Device`, because MLX exports its own `Device`.)
- Checks are library functions, not subcommand bodies. `runtime-check`,
  `governor-check`, `pull-check` and `sampler-golden` are `Diagnostics` and
  `Goldens` calls that return a report; the subcommands render it and print
  exactly what they always printed. New `slotstream-checks` runs the whole
  catalogue — 121 assertions across 9 checks, none needing weights — and CI
  runs it on every push alongside a coverage ratchet that holds a per-file
  floor.
- The serving layer's framing and routing rules are testable without a server:
  head parsing, the 411/413/431/400 decisions, absolute-form and query-string
  routing, and the loopback-only CORS policy. All of it previously needed a
  live server with 105 GB loaded.

- The repository carries its brain. `db/` is a public db.md store: every
  MEASUREMENTS.md and PLAN.md section is a record, every number on the README
  and the docs is a claim naming the measurement behind it and the surfaces
  it appears on, and decisions record what would reverse them. Both long
  documents are now generated from the records by `Tools/projections.py`,
  and `Tools/brain_gates.sh` (store validation, generated-document parity,
  the claims gate) runs in CI on every push.
- Docs: a Related projects section that names the peer engines and what each
  does differently, a Support section, `docs/HARDWARE.md` for rows measured
  on other Macs with an issue template to submit one, SECURITY.md, and
  CONTRIBUTING.md.
- CI runs the full build only when something other than prose changes; a
  docs-only push runs a twenty-second `docs` job (the llms-full.txt staleness
  check) instead.
- The serving layer answers while it is working. `/api/tags` and `/api/ps` read
  pool numbers through the *generation* lock, so both blocked for the length of
  a running request; with the accept loop also waiting on the connection
  semaphore, enough blocked metadata calls stopped the server answering
  anything at all, and a client polling either one saw a working server as a
  dead one. Pool numbers are published at each resize and read from a snapshot,
  and the accept loop never waits: a full pool answers 503.
- Reasoning no longer leaks into the answer. `think: true` returns the model's
  reasoning in `message.thinking` (`thinking` on `/api/generate`) and the reply
  in `content`; it used to hand clients the reasoning, a stray `</think>`, and
  the answer in one string.
- Deltas arrive per token. The incremental decoder waited for eight tokens
  before its first flush and held four back after it, so a client saw one delta
  per four tokens and nothing at all for a reply shorter than eight.
- An unseeded request is genuinely random. The sampler's default seed is a
  constant, so an unseeded request replayed the same text after every restart
  while the API documented the opposite. The seed is drawn at the HTTP boundary,
  leaving every offline gate deterministic.
- Stock clients work unchanged. JSON `null` means "not set" (the OpenAI client
  sends it for an unset `max_tokens`); `n: 1`, `frequency_penalty: 0`,
  `logprobs: false`, `logit_bias: {}`, `tools: []`, `response_format` text, and
  `user` are accepted at the value this server already implements and still
  refused at any other; `ollama show`'s empty `model` falls back to its `name`;
  and an untagged or `:latest` model name resolves to the only model. Knobs
  that would change the reply, such as `num_ctx` and `repeat_penalty`, are
  still refused rather than dropped.
- `ollama ps` reads correctly. It reported 104 GB of weights against a small
  pool and rendered "98% CPU" for a model running on the GPU; it now reports
  resident memory.
- HTTP framing is honest: 411 for a chunked body instead of reading it as
  empty, 413 for an oversized one instead of a bare connection reset, 431 for
  huge headers, 400 for a malformed `Content-Length`. A query string no longer
  404s the route, `HEAD` answers for the path actually asked for instead of a
  blanket 200, `/v1/models` carries `created`, and the first SSE delta carries
  the role. All of it is gated in `Tools/api_robustness.sh` (68 checks).

- Context length is documented and priced, and the cap is named for what it
  is. The 400 for a long prompt used to say "raise it with --max-context",
  a flag that could not go past the ceiling the server was already at; it
  now says the cap is the largest context measured so far (not a memory
  limit; context state is ~27 KiB per token) and what reading that prompt
  would have cost in time. `--max-context` above the ceiling is refused with
  the same explanation, on `serve` and `doctor`. The memory plan has a
  `context:` line and `/api/show` carries `max_context_tokens` and
  `est_prefill_s_at_max_context`; `doctor` ends with the wait before the
  first token by prompt length, and its tier table has a full-context column.
- Long prompts report progress: `run` and `serve` print the wait to expect
  and then one line per quarter for any prompt over 2k tokens.
- The prefill pass shrinks as the context grows (4096, 2048, 1024, 512 at
  about 4k, 14k, and 31k tokens), so a pass's query-by-key product never
  exceeds the largest one measured (a 4096-token pass finishing an 8,016-token
  prompt). Output is byte-identical at every pass size; the cost is some
  speed on the tail of a long prompt, and the plan's wait estimates include
  it. The never-measured 8192 pass is no longer a candidate.
- New `context-check` reads an N-token synthetic prompt through the real
  engine, reports seconds, tok/s, and peak memory against the plan, and stops
  before the machine swaps. New weights-free `prefill-schedule` prints the
  pass ladder and wait for any pass size. Gated in `planner_gates.sh`
  (bounded, floored, monotone, and equal to the doctor's wait) and one 2k rung
  in `verify.sh`.
- `pull`'s connection report counts the connections in use at once, one per
  session, instead of every distinct connection since the start; 0.2.1 could
  print "10 connections in use" for eight workers after two reconnects.
- `Tools/e2e_release.sh` expects the Ollama load acknowledgment for a chat
  with no messages, the 0.2.1 behaviour, instead of the 400 it asserted
  before; it was the one failing check of 31 against the installed 0.2.1.

## 0.2.2 — 2026-09-02

- Speculative decode pays, and ships. The draft head, `mtp.safetensors`
  (1.47 GB, sha256-pinned), is hosted on the weights mirror and pulled with
  everything else, so `--mtp auto` works out of the box on a large Mac. It is
  the manifest's one optional file: a source without it leaves the pull green
  with a notice and speculative decode off, `pull --verify` skips it when
  absent, and the startup check never asks to repair it. The weights are
  105.3 GB in 25 files.
- A rejected draft rolls back instead of re-running. The verify pass records
  the recurrent state after every position (the GDN recurrence stepped one
  token at a time, bit-identical to the fused kernel; conv windows sliced),
  so a rejection costs no model compute. Measured where auto enables the head
  (122 experts per layer, a quiet 48 GB Mac): ×1.24 decode with one draft
  (10.3 → 12.8 tok/s; ×1.33 on a code prompt, ×1.19 on a list, ×1.18 with the
  server's default sampling), up from ×1.17; ×1.20 at 57 per layer, up from
  ×1.12.
- One draft by default (was four). Four drafts lose at every size measured,
  ×0.88 even where auto turns the head on; one is best or tied everywhere and
  wastes the least on a rejection. `SLOTSTREAM_DRAFT_DEPTH` still overrides.
- The numbers are measured, not projected. The ×1.5–1.9 the 0.2.0 docs gave
  large caches assumed a five-token verify pass costs one token's pass; new
  hidden `mtp-passcost` measured 1.65 (a sixth of a pass per extra token),
  and auto's threshold reads 28 GB, not ~26. `mtp-check` bounds the reused
  speculative state's logits by the plain re-chunking band instead of
  comparing liveness, proves the recording pass exact against the batched
  one, and checks a rollback state by state against the plain path.
  `mtp-bench --sample` measures the sampled case.

## 0.2.1 — 2026-09-01

- `pull` opens the connections it claimed. Each of its eight connections is
  now its own URLSession: HTTP/2 multiplexes every request in a session over
  one TCP connection and ignores `httpMaximumConnectionsPerHost`, so every
  pull through 0.2.0 ran at one connection's speed — 25 to 40 MB/s from a home
  link 100 ms from Hugging Face, 72 from a gigabit datacenter link. Eight real
  connections measured 112 MB/s over a full install on that link (16 minutes)
  and 50 to 63 at home, and `pull` now prints the count it actually measured. The
  README's claim that Hugging Face caps the transfer near 55 MB/s was this bug
  seen from one link; it is withdrawn, as is the "R2 tested and rejected"
  verdict that rested on the same link (MEASUREMENTS.md, 2026-09-01).
- The Ollama CLI works again. 0.1.8's strict validator rejected the empty
  `name`/`system`/`template`/`options` the CLI's `/api/show` request always
  carries, so `ollama run` stopped before its first message. `/api/show` now
  accepts the deprecated `name` alias and empty overrides (non-empty ones stay
  a 400), advertises `capabilities`, chat/generate accept `keep_alive` and a
  null `options`, and generate accepts the empty `suffix`/`template` the
  CLI's one-shot mode sends (a non-empty suffix or template is still a 400).
  Ollama's documented "load" request (an empty prompt, or no messages), which
  the CLI sends when an interactive session opens, is acknowledged with
  `done_reason: "load"` instead of refused. Gated by `Tools/api_robustness.sh`
  with the CLI's exact request shapes.
- A weights directory reached through a symlink loads. Foundation refuses to
  list a symlinked directory, so `run` and `serve` failed with "couldn't be
  opened" while `doctor` and `pull --verify` worked; paths are now resolved
  once at the CLI boundary and in the shard index. Gated by `runtime-check`
  (weights-free) and a `verify.sh` run through a symlink.

## 0.2.0 — 2026-09-01

- Speculative decode with the model's draft head: `--mtp auto|on|off` on
  `run`, `serve`, and `doctor`. Auto enables it only at 120 or more experts per layer
  after its 1.6 GB charge, which raises the auto ceiling to 34.6 GB. Measured
  depth-1 accept rate 85.8%; ×0.96 at a 16 GB target, so it stays off there;
  the large-cache A/B is still pending.
- `Tools/mtp_convert.py` rebuilds `mtp.safetensors` (1.47 GB) from the
  official release with sha256 provenance; new `mtp-parity`, `mtp-accept`,
  `mtp-bench`, and `mtp-check` commands; `verify.sh` runs the MTP gates when
  the file is present.

## 0.1.10 — 2026-08-31

- Parity goldens ship in the repo, so a fresh clone can run the battery.

## 0.1.9 — 2026-08-31

- Installer and CI hardening; GitHub Actions runtimes updated.

## 0.1.8 — 2026-08-31

- Every weight file is checked against a sha256 manifest compiled into the
  binary; `pull --verify` covers all 24.
- Elastic drill and battery memory targets fixed; the `--memory-gb` promise
  re-verified and its measurements corrected.

## 0.1.7 — 2026-08-30

- Warm-decode estimates re-anchored on measurement; the planner no longer
  extrapolates past verified points.
- `Tools/e2e_release.sh`: acceptance run against the installed release.
- Live governor resize behavior observed and recorded.

## 0.1.6 — 2026-08-30

- Conversation prefix cache: follow-up turns prefill only what is new.
- Prefill pass size recalibrated.

## 0.1.5 and earlier — 2026-08-28 to 2026-08-29

- Serving robustness: every input that used to crash the server or corrupt
  its output is now a gated test.
- First public releases: the streaming engine, memory planner, `doctor`,
  `pull`, and the Ollama/OpenAI server. Details on the
  [releases page](https://github.com/carloslfu/slotstream/releases).
