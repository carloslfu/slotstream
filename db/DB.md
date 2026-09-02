---
type: db-md
scope: engineering
owner: Carlos Galarza
---

# slotstream brain

The public db.md store for slotstream: every measurement with its method,
the design, the plan and its state, every number the docs claim and what
supports it, the decisions and what would reverse them, and the raw runs
behind the numbers. It lives in the repository, it is public, and it is the
authority for what the project knows. The long documents readers open,
`MEASUREMENTS.md` and `PLAN.md`, are generated from it.

## Agent instructions

**Session.** Load the standard with `dbmd spec` if it is not already loaded,
read this file, then `dbmd log tail 20 --dir db`. Every write goes through
`dbmd` (`write`, `fm set`, `body`, `section`, `link`, `rename`, `rm`) or, for
a file dropped straight into `sources/`, a `dbmd index rebuild --dir db`
afterwards. Finish with `dbmd validate --all db`, then
`cd db && dbmd log <kind> <object> -m "<note>"`. One curator at a time.

**Generated documents.** `MEASUREMENTS.md` and `PLAN.md` are projections of
`records/measurements/`, `records/design/`, and `records/plan/`. Never edit
them directly: edit the record, then run `python3 Tools/projections.py`.
Each record is one section; `doc` names the document, `level` the heading
depth, `order` the position (leave gaps, insert between). The renderer puts
exactly one blank line between sections, so a body's trailing whitespace
never matters. `--check` fails CI when the files and the records disagree. `README.md`, `docs/`,
`llms.txt`, and `CHANGELOG.md` are hand-written surfaces, not projections.

**Capture before you transcribe.** A number enters the store as raw tool
output first: the `--json` or transcript of `doctor`, `context-check`,
`mtp-bench`, `prefix-check`, `coldread`, `pull`, `verify.sh`, saved under
`sources/runs/YYYY/MM/` as a `run` with the exact command, the binary it ran,
and the machine. The measurement record then links it in `runs`. A run made
on a loaded or swapping machine is kept and marked `discarded: true` with the
reason, never deleted. Exact bytes live in the run file, never retyped into a
record body. Records lifted from the documents on 2026-09-02 predate this
rule: their runs were not preserved, and the frozen document under
`sources/docs/` is their evidence.

**Status is part of the record.** A `measurement` is `measured` while its
numbers stand, `superseded` when a later section re-anchored or replaced them
(`superseded_by` names it), `withdrawn` when the claim was retracted
(`withdrawn_by` names the correction), and `analysis` when the section
reasons over other measurements and produces none of its own. Never delete a
superseded or withdrawn record: the retraction is part of the evidence. The
body keeps its original wording; `note` carries the one-line status
explanation.

**Every public number is a claim.** A number on `README.md`, `docs/`, or
`llms.txt` gets a `claim` record: a `needle` that appears verbatim on every
listed surface, `basis` (`measured`, `derived` from measured numbers by the
tool's arithmetic, or `estimated` from a curve), `supported_by` links to the
measurements, and the `gate` that would catch it going stale, or `none`.
`Tools/claims_gate.py` fails when a current claim's needle is missing from a
surface or a withdrawn claim's needle is still present. When a measurement
is superseded, update or withdraw its claims in the same session. An
estimated number must read as an estimate on every surface.

**Decisions.** A choice that closes a line of work (a milestone skipped, a
queue item removed, a default changed) gets a `decision` with the evidence
links and the condition that would reverse it, so the question is not
re-derived later. The plan's live state stays in the `plan` records and is
never duplicated into decision frontmatter.

**Community measurements.** A measurement report from someone else's Mac
lands verbatim under `sources/community/YYYY/MM/` (issue URL, reporter's
GitHub handle, raw output), gets a `machine` record if the machine is new, and
a `measurement` record with `status: measured` and `machines` pointing at it.
`docs/HARDWARE.md` is a surface: its row gets a claim. Reporter data is the
handle and the hardware they chose to publish, nothing else.

**Public only.** This store ships with a public repository. Never write
credentials, tokens, private URLs, hostnames or IP addresses, personal data,
or unreleased security details here. Positioning, consulting, and career
framing of the project are not this store's business and live elsewhere.

**Memory safety.** Curating the store loads no model. Any run captured for
the store follows `AGENTS.md`: one model process at a time, small explicit
sizes for tests, reclaimable memory checked first, processes killed the
moment they finish.

## Policies

### Frozen pages

### Ignored types

## Folders

- records/measurements — every MEASUREMENTS.md section as a record: what was measured, how, on which machine, and whether it still stands
- records/design — PLAN.md's design sections: goal, ground truth, byte math, architecture, correctness strategy, references
- records/plan — PLAN.md's operating sections: status tracker, milestones, the ordered queue, risks, done criteria, open questions
- records/claims — every number on a public surface, with the measurement that supports it and the gate that guards it
- records/decisions — what was decided, on which evidence, and what would reverse it
- records/machines — the machines measurements ran on
- sources/docs — frozen snapshots of the documents the records were lifted from
- sources/runs — raw tool output captured before a number was transcribed
- sources/community — measurement reports from other people's Macs, verbatim
- sources/discussions — public discussion threads about slotstream, excerpted verbatim
- sources/references — vendor documentation and prior art cited by measurements and design

## Schemas

### measurement
- title (required, string)
- doc (required, enum: measurements)
- order (required, int)
- level (required, int)
- date (required, date)
- status (required, enum: measured, analysis, superseded, withdrawn)
- milestone (string)
- machines (link to records/machines/)
- superseded_by (link to records/measurements/)
- withdrawn_by (link to records/measurements/)
- runs (link to sources/runs/)
- source (link to sources/docs/)
- note (string)
- shard: flat
- summary_template: {title}

### design
- title (required, string)
- doc (required, enum: plan)
- order (required, int)
- level (required, int)
- date (required, date)
- source (link to sources/docs/)
- shard: flat
- summary_template: {title}

### plan
- title (required, string)
- doc (required, enum: plan)
- order (required, int)
- level (required, int)
- date (required, date)
- kind (required, enum: tracker, milestones, milestone, queue, queue-item, deprioritized, risks, done-criteria, questions)
- source (link to sources/docs/)
- shard: flat
- summary_template: {title}

### claim
- title (required, string)
- needle (required, string)
- surfaces (required, string)
- basis (required, enum: measured, derived, estimated)
- status (required, enum: current, withdrawn)
- supported_by (link to records/measurements/)
- gate (required, string)
- unique: needle
- summary_template: {title}

### decision
- title (required, string)
- decided_on (required, date)
- status (required, enum: standing, reversed)
- evidence (link to records/)
- reversible_if (required, string)
- summary_template: {title}

### machine
- title (required, string)
- kind (required, enum: mac, linux-host)
- chip (string)
- ram_gb (int)
- ssd (string)
- os (string)
- link (string)
- unique: title
- summary_template: {title}

### doc-snapshot
- title (required, string)
- original_path (required, string)
- git_head (required, string)
- dirty (required, bool)
- sha256 (required, string)
- captured_at (required, date)
- unique: sha256
- summary_template: {title}

### run
- title (required, string)
- tool (required, string)
- command (required, string)
- binary (required, string)
- machines (required, link to records/machines/)
- captured_at (required, date)
- discarded (required, bool)
- shard: by-date
- summary_template: {title}

### community-report
- title (required, string)
- url (required, url)
- reporter (required, string)
- captured_at (required, date)
- machines (link to records/machines/)
- shard: by-date
- summary_template: {title}

### discussion
- title (required, string)
- url (required, url)
- captured_at (required, date)
- shard: by-date
- summary_template: {title}

### reference
- title (required, string)
- url (required, url)
- captured_at (required, date)
- shard: by-date
- summary_template: {title}
