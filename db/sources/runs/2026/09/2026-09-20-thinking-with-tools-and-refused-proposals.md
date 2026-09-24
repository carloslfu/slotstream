---
type: run
id: 01m3067fkw43j01v31d1mjnx8m
created: 2026-09-20T19:55:57.436824+00:00
updated: 2026-09-20T19:55:58.105802+00:00
summary: Think longer is available with a source attached, tool turns think, and a refused proposal is corrected instead of ending the job; measured on three real-model runs
binary: sevra-mac-checks 61b98ded5f53e522
captured_at: 2026-09-20
command: bash Tools/check_sevra_mac.sh; sevra-mac-checks --real-basics --think --home <new>, three times
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Thinking with tools, measured, and a refused proposal the model can correct
tool: sevra-mac-checks, Tools/check_sevra_mac.sh
---
Sevra's "Think longer" switch was unavailable whenever a source was attached, which is where a person most wants it: reading a report and asking what it means. The reason on record was that tool-call reliability had been measured with thinking off and the combination had not been measured. That is a reason to measure it, not a reason to decide for the person, and this run measures it.

## What changed

- The switch is unavailable only while the Home is paused for review. A thread with an attachment thinks like any other.
- A tool turn thinks: the thought runs first and the same turn may then call tools, which is what the pinned template renders.
- A thought shortens only a plain answer, to its 1,024-token reply cap. A turn that can stage a change, a document or an app keeps the job's whole budget, because the thought has a budget of its own. `ReplyPolicy.replyTokens` holds that rule and the scripted checks pin all three cases.
- A proposal the host refuses for something the model can fix now comes back as a tool result, like every other tool error, at most twice per job. It used to throw, which ended the job.

## Measured: the four real-model basics jobs at the 10 GB plan

| run | thinking | result | seconds |
|---|---|---|---|
| 2026-09-19 baseline | off | 14 of 14 | 636 |
| run 1 | on | 14 of 14 | 783 |
| run 2 | on | 13 of 14, the app job ended on a refusal | 682 |
| run 3, with the correction | on | 14 of 14 | 1,257 |

Tool-call syntax held in every thinking run: no response was rejected, and no schema correction was requested. The reviewed edit wrote the same file in all four runs, SHA-256 `646bb50f7a5184693ac355518a0ddaca2854e55e528f640b897bbf7b8d00db7d`.

The thoughts are short at the app's `low` effort. Per job, in tokens and seconds: 13/2, 16/2, 110/16, 14/2 in run 1; 21/3, 14/2, 69/10, 20/3 in run 2; 19/2, 8/1, 204/33, 19/2 in run 3. Every one closed on its own, none reached the 768-token budget.

Three runs are not a reliability estimate, and the spread in wall time is dominated by the app job, which generates a whole HTML document: run 3 spent 1,257 seconds because its first proposal was refused and rewritten. What these runs do show is that a thinking turn can call tools without breaking the calls, and what it costs on this Mac.

## The job that a refusal used to end

Run 2's app job failed outright. The model proposed an app with `app_id` set to `counter`, which matches no app, and the host refused: "No app matches counter. Use app.read to find it, or omit app_id for a new app." The refusal is right, and its text already tells the model what to do, but it was thrown rather than returned, so the job ended with no app, no review and nothing to act on. An ordinary tool error has always come back to the model as a tool result; only a proposal threw.

Now a refused proposal returns the same way, at most twice in a job, with nothing staged in between. Run 3 exercised it against the real model: the app job's trace reads `app.propose: refused. The app must be one HTML document under 256 KB.` and then `app.propose: inert draft awaiting review`. The same bound covers a reserved skill name, and the scripted checks cover both the correction and the stop after the bound.

## Checks

`bash Tools/check_sevra_mac.sh` passes, 146 checks. The thinking check now asserts that a tool turn receives the request, records its own receipt, and keeps its whole reply budget while thinking, and it pins the three reply-budget cases directly. A new `refusedProposalChecks` covers a corrected proposal and a model that keeps sending an invalid one. The skill check now asserts that a reserved name is refused, corrected up to the bound, and then stops the job.
