---
type: decision
id: 01m21jj97w5hteckpk2khdy25h
created: 2026-09-08T22:35:06.876703+00:00
updated: 2026-11-17T17:20:08.600475+00:00
summary: Keep the README compact and the author easy to reach; preserve essential setup, evidence and community, with detailed results and memory guidance in linked pages.
decided_on: 2026-09-08
reversible_if: The public setup changes or users demonstrate that a different entry point makes installation and first use clearer.
title: Newcomer documentation and engineering references
status: standing
---
# Newcomer documentation

Keep the README focused on what the project does, who can run it, installation,
a first reply, and links to the next task. User guides provide complete setup
steps, expected results, and practical troubleshooting. Engineering and
reference pages hold implementation details, protocol behavior, measurements,
and developer tests.

The Hermes guide retains its tested configuration. Move the rationale and
qualification into the Hermes engineering notes. Preserve measured facts and
claim coverage at their new locations, and preserve old README anchors when
sections move. The public commands describe released behavior; ongoing
engineering work has its own records.

## Link and landing-page pass, 2026-09-08

Give each README link a clear purpose. Keep one developer entry point and
one guide per next task; avoid repeated link lists and shortcuts to every
reference page. Link to the actual model license, not just its repository.
The hardware guide starts with requirements and a small credited-results
table. Full test conditions stay in an expandable section, and the measurement
procedure lives in the testing reference. Preserve distinct estimates,
community reports, and author-run measurements when simplifying that page.

## Balance correction, 2026-09-08

Carlos found the reduction too aggressive and explicitly asked to restore
star count and other useful sections. This correction controls over the
short-index and minimal-link interpretations above. Simplicity is clear
hierarchy, plain language, and concise sections; it is not minimum content.

A first-time visitor should understand the purpose, capabilities, practical
fit, measured evidence, setup, limitations, and community without having to
leave the README for every answer. Keep the star and latest-release badges,
star-history chart, performance summary with caveats, plain mechanism, FAQs,
origin story, author, contributions, and support visible. Link to complete
recipes and engineering methods. Useful links and sections need no arbitrary
count limit. The live star badge and existing weekly chart are project
metadata, not evidence of adoption or model quality.

## Sub-document pass, 2026-09-16

Carlos asked for a simpler README that surfaces what matters and points to
sub-documents for the rest, compelling without selling. The README keeps the
sections the balance correction names and now carries one performance
paragraph (the 0.2.19 release benchmark), the planning-range table with a
two-sentence basis, and a short memory-and-context summary. The measured
results table with its credits and notes, the estimate rationale, the tested
macOS versions and the prompt-reading estimates live in `docs/HARDWARE.md`,
which was already their home; the release-by-release lookahead history lives
in `docs/EXPERT-LOOKAHEAD.md`. Twelve claims whose numbers left the README
dropped it from their surfaces and keep their other surfaces; every old README
anchor and linked heading was preserved. The README went from 455 to 350
lines.

## Introduction pass, 2026-09-16

Carlos asked whether the README needed the release-benchmark sentence (the
comparison with the 0.2.18 forecast, the 1.10x and the 14.38 to 15.86 tok/s
medians) and for a pass over every section, so that the README reads as a
simple, compelling introduction with the detail in the guides. The Speed
paragraph now states the headline measurement, the mechanism in one sentence
and the pointer to the lookahead guide; the comparison numbers stay in
`docs/EXPERT-LOOKAHEAD.md`, `docs/HARDWARE.md`, `docs/CLI.md` and the release
notes. The context-window list under the table went because the table shows
it, the draft-token FAQ lives only in `docs/CLI.md`, and the RAM FAQ keeps one
preview command. The Slotstream note, Who it's for, Built native and the Swift FAQ
were tightened without dropping a stated fact. Four claims dropped the README
from their surfaces and keep the others: `corrected-forecast-0-2-19-faster-decode`,
`corrected-forecast-0-2-19-medians-tok-s`, `draft-depth-default-two` and
`automatic-context-window-262144-from-96-gb`. Every anchor, linked heading and
required section stays. The README went from 350 to 334 lines.

## Second introduction pass, 2026-09-16

Carlos asked for an evaluation of every item so that the README is solid,
simple and compelling for people arriving. The model name now links to its
weights page and is introduced as a large open model; the navigation line says
Speed like the heading; the Slotstream note is one shorter paragraph; Who it's for
and the fastest-way FAQ state the 96 GB case in one sentence each; the About
This Mac instruction has no arrow; the Speed paragraph no longer explains what
the installer downloads; the auto-mode sentence is plainer; the guides table
groups the two coding agents and names fx; the limits list states the 96 GB
case as a limit and drops the request budget, which lives in the API, CLI,
Hermes and troubleshooting guides (`context-default-wait-policy` dropped the
README from its surfaces); the RAM FAQ opens in one sentence. Every link and
anchor was checked, 50 links and none broken. The README went from 334 to 325
lines.

## Released engine and development app, October 26, 2026
Carlos requested an update to the README and GitHub description to reflect current Slotstream work, keep SSD streaming prominent, preserve the fully native Swift, MLX/Metal and no-Python message, and distinguish released features from development work.

The README keeps the original large-model headline, documented measurements, setup, community and support sections. It identifies the published engine and its original-model default separately from Fast/Smart aliases and the native Mac app on main. New app installations use Fast; existing saved choices and the independent CLI default are preserved. Q2 stays an explicit engineering candidate. Requirements and performance tables remain scoped to the original model, with their dates and methods intact.

The app introduction explains local documents, citations, reviewed changes, exact tables, conversations, memory, journal and Home integrations, while retaining development status and the absence of a public app installer. The native-stack description keeps Swift ownership and Python-free inference explicit and acknowledges the C++ Metal-execution adapters. The engineering guide and agent-facing documentation carry the same distinctions.

Selected GitHub description:

> Run a 105 GB AI model on an Apple Silicon Mac with 16–64 GB of RAM by streaming experts from SSD. Fully native Swift on MLX and Metal. Offline, no Python. Released engine works with Claude Code, Codex, and Ollama/OpenAI/Anthropic clients. Native Mac app and Fast/Smart model choices in development.

This is documentation maintenance, not a new model default, performance result or product release. Current engineering authority remains [[records/decisions/fast-and-smart]] and [[records/decisions/slotstream-app-identity]].

## One maintained model, October 26, 2026
The later owner decision [[records/decisions/one-maintained-model]] supersedes the Fast/Smart development positioning in the earlier section. Current surfaces name Qwen3.8-Flash-Next 4-bit only, keep SSD streaming and fully native Swift/MLX/Metal with no Python runtime prominent, and link retired experiments separately. Preserve the released engine versus source-built app distinction. v0.2.30 remains the latest release.

## Shorter introduction and earlier author, November 17, 2026
Carlos requested a shorter README so readers reach the author section sooner. Keep the introduction, requirements, install and first-use commands, a short measured-speed summary and a plain mechanism explanation before the author. Link to the author from the top navigation. Keep the model scope, limitations, FAQs, origin, guides, support, sponsor and star history concise and visible.

Prompt-processing tables and speed estimates already live in `docs/HARDWARE.md`; link there instead of repeating them in the README. Move the detailed RAM FAQ and disk-write explanation to that guide. Preserve the dated benchmark scope, measurement evidence, author wording and all old README anchors. Update claim surfaces when numbers move, retaining withdrawn-claim checks. This changes documentation structure, not engine behavior, model policy or performance evidence.
