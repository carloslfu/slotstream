---
type: run
id: 01m3141wm0a94z0tts0zt1fwzr
created: 2026-09-21T04:37:11.424362+00:00
updated: 2026-09-21T04:41:57.904433+00:00
summary: Sevra records each response's engine numbers and shows its speed, thinking line and working notes on request; the real-model check matches the engine and finds thinking turns read twice
binary: sevra-mac-checks b01a853a7d9b4129
captured_at: 2026-09-20
command: bash Tools/check_sevra_mac.sh and sevra-mac-checks --real-metrics --home <new>, in an isolated snapshot of HEAD 40209f8 plus this work
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Response details: speed, thinking and working notes in the Mac app'
tool: sevra-mac-checks, Tools/check_sevra_mac.sh, Tools/check_sevra_thinking_ui.sh
---
Carlos reported that the Mac app showed neither tokens per second nor the model's thinking. The engine measured every request, but the app kept none of it: `LocalInference` read only a request's error and finish reason, and neither the turn nor the saved run had a place for numbers. The thought streamed into a "Working notes (thinking)" box under the run status, collapsed by default and shown only for the latest response. Thinking itself is off until a thread turns on Think longer, by the 2026-09-16 decision. This run records what was built in response and how it was checked.

## What changed

- Each run records `metrics`, the engine's own statistics for its model requests, numbers only: reply tokens and decode time, thought tokens and decode time, prompt tokens read and their time, tokens reused from earlier in the conversation, context used of the window, time to first token, model load when the response waited for it, model rounds, the expert cache hit rate while writing and the memory budget. A job sums its rounds, including a round whose response the host refused.
- While a thought runs, its last lines stream under the run status as one flowing passage, at most three lines, the top line fading once it outgrows them. The passage opens the response's details.
- A reply that thought carries a quiet "Thought for 42 s ›" line above its text. A job that thought before several model rounds reads as one receipt, "over 3 steps".
- "Show response details", off by default, in the conversation options and View menus, adds a speed line under each finished reply, for example "6.0 tok/s · 24 tokens · 5.8 s to first token", and the live writing speed to the run status.
- One popover per response, from the thinking line, the speed line, the reply's context menu or View > Response Details (⌥⌘I), shows the thinking with every working note still in memory, the speed, the context and the activity, and copies the numbers as text.
- Working notes stay in process memory for the eight most recent responses, within 64 KiB each, and are never written to the Home, copied, exported, searched or remembered.

The contracts are [[records/design/sevra-spec/runtime-contract]] (Thinking before answers, Response metrics) and [[records/design/sevra-spec/ui-contract]] (Thinking controls, Response details).

## Scripted and offscreen checks

`bash Tools/check_sevra_mac.sh` passed in an isolated snapshot, `.build/sevra-response-details/slotstream`: HEAD `40209f8` exported with `git archive`, plus this work's files copied from the checkout and compared byte for byte. Two files there, `apps/macos/App/ContentView.swift` and `apps/macos/Checks/main.swift`, also hold another session's uncommitted hunks, so the snapshot carries only this work's hunks of them. Engine sources are HEAD's. The app source manifest, `shasum -a 256` of each file from `find apps/macos -type f -not -path '*/.build/*' | LC_ALL=C sort`, has 74 files and hashes to `284221aaca0c3568e3cf777c50bc58796dd875a8a916d67d1e85d16352edc3a7`. The gate's `sevra-mac-checks` has SHA-256 `b01a853a7d9b4129a19eeac431787c18ecb1fa423b9a01f19c99a5a11ddfb57a`.

Exit 0 with 168 PASS lines and no failure, 313 s after a 184 s release build and an 88 s debug build. Two earlier runs in the shared checkout stopped before any check ran, because the other session saved `Sources/Slotstream/ToolCallSplitter.swift` and then `Plan.swift` during the build.

For this work the gate covers:

- The scripted response-details suite: numbers add up across rounds; the reply line and the copied details state them; receipts merge; the thought preview flows as plain text; a thinking job with a refused round records the exact sum of its rounds and one working note per round; numbers persist with the run and carry no text; a run recorded before numbers and steps existed still decodes; live speed is observable while thinking and while writing; working notes stay for the eight most recent runs and the ninth drops the oldest.
- The presentation tests: the thinking line and the speed line are drawn in the conversation but stay out of the message's Markdown source and every copy.
- The offscreen thinking check, 39 checks over the production views in light and dark appearance: the last lines of a running thought instead of the collapsed box, staying within three lines as the thought grows; the preview opening the details with the streaming notes and their privacy line; Answer now; the thinking line above the reply opening the details with the receipt and the speed; the speed line turned on and off; and the live writing speed in the status. Its snapshots were reviewed.

The development bundle `.build/Sevra.app` was built from the same snapshot by `Tools/build_sevra_mac.sh`, which records its inputs in `Contents/Resources/build-inputs.json`. Its `Contents/MacOS/Sevra` has SHA-256 `57a210d5b59bf7f3fd32c3e514fdab88d51f1ff32cfa522b973129cc463142b8`, its ad hoc signature verifies, and the earlier build of 14:56 is kept as `.build/Sevra.previous.app`.

## Real model, 10 GB plan
`sevra-mac-checks --real-metrics --home <new>` runs three turns in one thread and compares each run's recorded numbers with `LocalInference.lastStats`, the engine's statistics for exactly that run's requests. Reply and thought tokens and seconds, reading, reuse, context, the token-weighted hit rate and the budget must match; the first turn must record its model load and later turns none.

It ran from the snapshot's own release build, `sevra-mac-checks` SHA-256 `b01a853a7d9b4129a19eeac431787c18ecb1fa423b9a01f19c99a5a11ddfb57a`, after another session's model server had exited. Before the run, reclaimable memory was 31.4 GB (free 5.5, file-backed 25.7), memory pressure reported 82% free and swap held 5,051.6 MB from earlier use. The check exited 0 after 75.6 s with a peak physical footprint of 8.35 GB (maximum resident set 3.10 GB). Swap was 5,043.6 MB afterwards and no check process remained.

| turn | request | prompt | read | reused | read time | written | write time | rate |
|---|---|---|---|---|---|---|---|---|
| 1, thinking, loads the model | thought | 321 | 321 | 0 | 8.75 s | 96 | 16.61 s | 5.78 tok/s |
| | answer | 442 | 186 | 256 | 4.82 s | 24 | 4.33 s | 5.54 tok/s |
| 2, thinking | thought | 488 | 232 | 256 | 5.74 s | 35 | 5.96 s | 5.87 tok/s |
| | answer | 524 | 268 | 256 | 5.44 s | 24 | 4.01 s | 5.99 tok/s |
| 3, plain, after switching thinking off | answer | 391 | 391 | 0 | 8.22 s | 1 | 0.29 s | 3.46 tok/s |

What the app recorded and shows, all equal to the engine's numbers:

- Turn 1: "5.5 tok/s · 24 tokens · 8.8 s to first token · model loaded in 9.1 s". The thought reached its 96-token check budget: "Thought for 17 s, up to its limit". Reading 507 tokens in 14 s, context 442 of 32,768, expert cache hits 34%, "Memory budget: 10.0 GB, your limit". The load time covers verifying the model files, planning memory and starting the engine; the engine's own banner reported 1.2 s for the last step.
- Turn 2: "6.0 tok/s · 24 tokens · 5.8 s to first token", no load. The model closed its thought after 34 tokens, "Thought for 6 s"; the engine counts 35 because it also wrote the close tag. Reading 500 tokens in 11 s with 256 reused from earlier in the conversation, hits 29%.
- Turn 3: "3.5 tok/s · 1 token · 8.2 s to first token", reading all 391 tokens: switching thinking off removes the reasoning-effort line that opens the system block, so nothing before it can be reused.

An earlier run of the same check, from a release build of the shared checkout (`sevra-mac-checks` `279be2f064d86ca6`, first 16 hex digits), also passed. It had the same prompts, reads, reuse and token counts in every request, 8.26 GB peak footprint and rates within about 10% of these: 6.13 and 6.11 tok/s for the two answers.

Three runs before that were needed to make the check itself correct. The first asserted reuse on the plain turn after the switch, which reads everything again by contract, and it showed "9.0 GB" for a 10 GB limit because it reported the planned peak; the row now reports the plan's total process budget, "10.0 GB, your limit" or "about 20.1 GB, automatic". The second asserted reuse on the second thinking turn and failed, because a 157-token opening prompt never reaches the first 256-token pass boundary where the engine can resume. The opening message is now long enough to pass it, and the assertion requires at least 256 reused tokens.

## Finding: a thinking turn reads its prompt tail and its thought twice
The thought and the answer are two engine requests, because the answer switches from the thinking sampling profile to greedy decoding with its own reply cap. The engine resumes a request only from a snapshot at one of that request's own prefill pass boundaries, so that a continued conversation computes what a cold one computes bit for bit ([[records/decisions/a-continued-conversation-computes-what-a-cold-one-computes]]). The state the thought leaves behind was extended by decoding and is not such a snapshot. The answer request therefore reads again everything after the prompt's last boundary, and the whole thought.

In the table, that second read took 4.82 s in turn 1 (65 prompt tokens, 96 thought tokens and the closure) and 5.44 s in turn 2 (232 prompt tokens, the 35-token thought and a separator), longer than the 4.01 s it took to write turn 2's answer. A run with a prompt under the first boundary read the whole 157-token prompt again with its thought: 232 tokens in 5.36 s. A person sees this as a pause between the end of the thought and the first word of the answer.

The app contract and the code comment used to say that the answer continues from the held prefix state. Both now describe the second read. Removing it is an engine decision this run does not take: for example, one request that changes sampling at the close tag and accepts the closure tokens on its live state, weighed against the exactness decision above.

## Binary and working tree
The scripted gate, the bundle and the real-model check above all come from the snapshot of HEAD `40209f8` plus this work. The shared checkout also held another session's uncommitted engine and settings changes: an adaptive memory limit in `Sources/Slotstream` (Plan, Governor, Machine, ContextFeasibility, ContextWindowPolicy, Engine) and `apps/macos/Runtime/Performance.swift`, and tool-call streaming in `ToolCallSplitter.swift`. Only the earlier real run was built with them. The response-details code uses only committed engine interfaces. Its memory budget row reads the plan's `targetGB`; if the adaptive limit moves a person's limit into a field of its own, that row has to follow it.
