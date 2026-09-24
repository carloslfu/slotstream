---
type: native-spec
meta-type: operational
id: 01m2gb63bjf3kzznf6ta8jp920
created: 2026-09-14T16:14:44.082480+00:00
updated: 2026-09-21T17:07:30.935279+00:00
summary: Mac application implementation progress and unpassed release gates
---
# Mac implementation status

Implementation started September 14, 2026, at Carlos's request. A functional native Mac development app and its Swift-owned runtime now exist. This is a scoped implementation receipt, not completion of the full Mac plan, public alpha, stable release or another platform.

| Area | Implemented and observed | Remaining qualification |
| --- | --- | --- |
| Native application | SwiftUI/AppKit window, native TextKit composer/document, Home and threads, attachments, review, memory/journal/settings, menus and window lifecycle. The first bundle launched through native UI, accepted a folder and prompt, opened Settings during model preparation, and reached real-model review. | The later native audit verified the Observer/sidebar/About icon, Light/Dark and System resolution, native Save, clean relaunch, in-app saved-document viewing, large content text, narrow layout, draft continuity through appearance changes and scoped Find. Live OS appearance changes, complete IME/focus/selection continuity, assistive technologies and long-document budgets remain pending. The later rich-document pass adds native Markdown, code, tables, citations, bounded history, resizable navigation, a growing composer and responsive artifact review. Its source receipt below owns the exact observed scope. |
| Swift runtime | Direct in-process Slotstream inference, bounded successful-turn tool gating, serial queue, durable acceptance/nonces, stop signalling, drafts with revision checks, explicit memory admission/correction/Forget, thread scopes and Incognito. Combined context and save-race fixtures pass. | Strict load/stop quiescence, idle/pressure lifecycle, event cursor/replay completeness, large-Home scaling and longitudinal personal-loop fixtures remain open. |
| First complete job | Real local model read both public Cedar fixtures, produced a cited briefing satisfying the frozen rubric, stopped for review, then the synthetic reviewer committed the exact proposed bytes. Reopening recovered the artifact and completed thread. Source excerpts are preserved for new runs. | The separate native audit subsequently verified Save and reopening its earlier real-model proposal. Neither run certifies broad task reliability, model comparisons or arbitrary source types. The receipt identifies the exact tested binary; later draft/memory changes have separate targeted checks. |
| Persistence | Official dbmd mutations, compact Home index, independent thread/draft records, immutable conversation/excerpt events, native hash/recovery ledger, create-only artifact publication. Actual process termination at intent/documents/artifact/record seams recovers idempotently. External edits pause writes and preserve bytes. | Complete export and inert restore, interactive reconciliation, cross-implementation schema conformance, full source-folder closure and power-loss proof remain pending. A process-crash test is not a storage power-loss test. |
| Local CLI | Separate sevra-local consumer uses the same runtime. Authenticated bounded Unix IPC, same-user peers, long Home paths, ephemeral capability, duplicate acceptance and detached completion pass; unbound Incognito access is refused. The CLI can reopen the completed real-test Home. | Full CLI grammar, historical event replay and the optional authenticated network server are not complete. |
| Model setup | Settings is wired to explicit pinned WeightStore inspection/download/resume/repair; model maintenance excludes inference. Startup does not download. Existing verified model inference was exercised. | Fresh acquisition/repair/cancellation, automatic maintained hardware selection and the same-hardware model-value comparison remain unqualified. |
| Build and brand | Independent apps/macos package preserves the root engine package. Local source/dependency hashes stay identical across the app build; dbmd, Metal and licensed Inter/Poppins resources are bundled and ad-hoc signature verification passes. Native Observer geometry and a multiresolution bundled ICNS are included, with the same image in About. The Xcode project is now explicitly included despite the general ignore rule. App/CLI/check products compile; Xcode project and Info.plist parse. | Full Xcode is absent on this host. Since September 21, CI builds the Xcode app target in Release for Apple silicon, ad hoc signed, and verifies the bundle; see Repository validation. Modern layered-icon and Finder/Dock-shell appearance qualification remain open. Developer ID, notarization, installed updater/rollback, clean-machine compatibility, voluntary feedback, external users and all release gates remain pending. |

## Evidence

- [[sources/runs/2026/09/2026-09-14-sevra-first-native-tool-loop]] records the first real app interaction and pending proposal. No file was committed by that UI run.
- [[sources/runs/2026/09/2026-09-14-sevra-real-workspace-brief-complete]] preserves the real-model complete fixture, full proposal/citations, fixed rubric and exact reviewed commit/reopen result.
- [[sources/runs/2026/09/2026-09-14-sevra-runtime-recovery-and-bundle]] preserves the latest targeted checks and the tested executable, helper, resource and bundle input hashes.

The synthetic Home used for native QA now holds the completed real-model proposal, committed through native Save and reopened through the final in-app document viewer. It is separate from the disposable real-check Home, where the harness committed its own document. No app has been published, no installed release is claimed, and no unrelated engine work was reverted.

## Brand and Mac practice audit

[[sources/runs/2026/09/2026-09-14-sevra-native-brand-ui-audit]] records the later native walkthrough, exact final build, fixes and unpassed requirements. The saved-document reader now opens current artifact bytes inside Sevra with bounded UTF-8/no-follow file access; its targeted checks and the runtime regression suite pass. Opening no longer depends on a separate Markdown editor. The icon packaging, warm Settings canvas, secondary text/boundary contrast, transcript spacing and compact document composer were corrected during the review.

## Rich Markdown and native polish

[[sources/runs/2026/09/2026-09-14-sevra-rich-markdown-native-polish]] captures the follow-up implementation, exact final bundle and native walkthrough. Swift Markdown now parses off the UI thread with completed-message reuse, source positions and late-reference updates. AppKit renders headings, nested/task lists, quotes, syntax-colored code and native tables. Its compatible text engine supports NSTextTable deliberately; this is not an all-TextKit-2 claim. Raw HTML and remote images remain inert, links require destination review, and citations resolve only to owner-supplied excerpts. Source mode and complete Markdown copy/export preserve the original text.

The UI adds code-copy actions, a document outline and native heading/table/code accessibility rotors, bounded history paging, a resizable rail with scrollable compact overlay, growing composer, recent editor-state cache, split artifact review, explicit source inspection, persistent error states and a single keyboard-command map. Focus and unnecessary system context actions were corrected during actual use. Native controls, warm Light/Dark/System palettes, Inter content, Poppins wordmark and the Observer icon remain coherent.

Observed in the running app: rich formatting and tables in Light/Dark, large reading/writing text, compact navigation with both threads reachable, focused Search/Settings and return commands, exact Unicode code copy with Undo, native artifact Find, split resizing, source excerpt/hash/byte details, reviewed Save and reopen, safe link review/cancel, full Markdown export and individual-file attachment. Saved and exported bytes matched their full expected source. The synthetic UI fixture is labeled and archived; it is separate from the real-model Cedar evidence. The complete runtime suite and standalone presentation checks pass.

Still unqualified: the full sustained fake/real-load performance matrix, complete VoiceOver/table-cell and IME behavior, live OS accessibility transitions, cross-page selection continuity and external-user sessions. The native split divider reports disabled through AX even though mouse resizing works. A bounded recent editor cache does not preserve Undo after its older views are evicted. These limits stay visible; no full UI-D, alpha, stable or installed-release gate is accepted. Model acquisition, rich extraction containment, full Home export/inert restore and extensions remain plan work.

## Repository validation

The existing engine static gates pass across the recorded invocations. Newly
authored evidence metadata was completed after the first validation stopped;
the raw outputs were preserved. The engine brain has no validation errors and
retains its two historical log warnings. This work does not claim a warning-free brain cleanup.

[[sources/runs/2026/09/2026-09-14-sevra-mac-static-regressions]]

Since September 21 the app has its own CI workflow, `sevra-mac.yml`, for every change to the app, to the engine sources it builds on, or to its scripts. It runs `Tools/check_sevra_mac.sh`, the scripted checks without model weights, and `Tools/build_sevra_xcode.sh`, a Release build of the Xcode project for Apple silicon that fails on any package version other than the app's pins, on a bundle missing its executable, Metal library, dbmd or document helper, or on an ad hoc signature that does not verify. The Xcode build passed on every run. The first runs showed four failures that only the runner produced: a composer timing assumption, a disclosure that a synthesized click did not open, a slash that text recognition misread, and a 10 GB test limit the runner cannot hold. Each was fixed or replaced. Text recognition is unavailable inside the document helper's sandbox on the runner, so CI accepts the helper's own error for images and scanned pages; a development Mac must still read them. The fifth run, on `92dffed`, passed both jobs.

[[sources/runs/2026/09/2026-09-21-sevra-mac-ci]]

## Resume order
Start with the latest adversarial review's unresolved gates: replay the unchanged real Cedar fixture using the final corrected candidate when the other model experiment has finished, then recheck the last Queue/archive-filter/Find-focus/quiet-cancel fixes when the Mac is unlocked. Preserve failure evidence and exact executable/source identity. The prior scoped native pass is not a full final-binary UI qualification.

Next qualify long-context/Home behavior and complete interactive external-edit recovery plus Home export/inert restore. Continue native focus/IME/selection, accessibility, live System appearance, sustained performance, fresh model acquisition and hardware/lifecycle qualification. Complete the signed installed-release gates before public release. Skills, mini-app isolation/data/version lifecycle and the rest of stable scope remain future implementation.

[[records/design/sevra-spec/overview]]
[[sources/runs/2026/09/2026-09-15-sevra-mac-adversarial-review]]
## Draft coordination correction
[[sources/runs/2026/09/2026-09-15-sevra-draft-coordination-regressions]] records the draft race correction and exact tested bundles. Draft saving now uses one production ComposerSession with acknowledged revisions, coalesced writes, coordinated navigation and shutdown, and atomic Send/draft updates. Real conflicts preserve both versions for an explicit choice. Save failures retain text, offer Retry Save and Copy Draft, block unsafe close, and clear on recovery. Send retries preserve acceptance identity. Incognito removal drains pending writes; new text views retain focus intent until attached to their window.

The production coordinator's delayed/failing-storage scenarios, mixed operation sequence, real-dbmd draft/reopen checks, and existing runtime/Markdown regressions pass. Native checks cover exact multiline Unicode, Undo/Redo, navigation, quit/relaunch, oversized-draft refusal/recovery, a real local-model response with typing during acceptance, Incognito cleanup, repeated new-thread focus, and the final error controls in Dark/System appearance. The receipt distinguishes the real-inference bundle from the final wording/focus build. These targeted passes do not close the remaining UI, model lifecycle, data portability or release gates above.

## Unified native toolbar
The Mac window now uses one AppKit toolbar for its traffic lights, sidebar toggle, current-page/thread heading, memory/lifecycle status, Search and contextual More menu. The extra SwiftUI header is removed. Native buttons/menus follow appearance and activation state; noninteractive title text has no button backing. Long titles truncate with a full accessible value and tooltip. Control-Command-S controls wide or compact navigation, with the same command-map entry in View and Settings.

[[sources/runs/2026/09/2026-09-15-sevra-unified-native-toolbar]] records the successful bundle build, scoped Light/Dark and compact layout checks, Search/back/sidebar interactions and final Incognito menu round trip. No broader UI-D or release gate is accepted by this change.

## Adaptive memory and readiness
The Mac app now defaults to automatic memory planning, with native custom
ceilings that retain elasticity and pressure protection. Settings separates
budget, current physical usage and model readiness. Preferences persist;
ordinary changes defer to the end of the complete job, and new messages queue
through the resource handoff. Idle release, keep-ready, explicit release,
sleep admission/cancellation and wake without replay are wired. Engine teardown
drains the governor and temporary Metal objects. Metadata avoids the generation
lock. Oversized conversation history is refused instead of silently trimmed.

Verification: the complete native composer/presentation/runtime regression
suite passes, including resource-policy sweeps, malformed settings, deferred
changes, controlled handoff, sleep/wake and context-overflow cases. The bounded
real-model sequence passes lazy loading, warm reuse, setting changes while
active, lower-budget reload, automatic idle release and draft preservation.
A first real run exposed a handoff refusal and is preserved with its corrected
regression. The final native walkthrough verified persisted settings, numeric
validation, accessibility slider increment, System/Light/Dark rendering, a
pending setting change during real inference and Incognito cleanup. The app is
left on Automatic memory, Automatic readiness and System appearance.

Evidence and exact build identities:
[[sources/runs/2026/09/2026-09-15-sevra-adaptive-memory]].
Operating policy and scope: [[records/design/sevra-spec/mac-platform]].

This closes the scoped development memory-control integration gap. The full
physical sleep/wake, OS-pressure/thermal and supported-hardware matrix, clean
paired latency/model-value measurements, complete assistive-technology review
and installed public-release gates remain open. Idle delays and the inherited
model-specific operating ceiling are not claimed to be universally optimal.

## Native layout refinement
The follow-up layout pass aligns the toolbar heading with the detail-pane gutter through sidebar resizing and native navigation grouping. Compact and split layouts remove the spacer entirely. Conversation, composer, run status, document controls and panels share a readable column; artifact chrome and text share edge insets. Sidebar icon columns, row heights, interaction states and document control sizes are consistent. Journal removes its duplicate page heading; transcript speaker and section gaps are more compact without changing source copy/export.

[[sources/runs/2026/09/2026-09-15-sevra-native-layout-refinement]] records the final build identity and scoped native Light/Dark, compact, large-text, sidebar-resize, split-document, full-screen document and menu checks. The presentation regression checks pass. The app was left on Home with System appearance and default reading/sidebar sizes. Existing drafts and independent runtime work were preserved. Complete native accessibility, sustained-load and installed-release gates remain open.
Final bundle and source-mapping correction after concurrent app edits: [[sources/runs/2026/09/2026-09-15-sevra-layout-final-bundle]]. Its manifest owns the exact final source identity; final Home/Search checks passed.

## Home continuation correction
The native Continue in thread action now resolves and visibly labels the exact selected Home exchange by event reference. New titles derive from the selected user message; repeated actions reopen the same continuation. Home offers Open thread, while View in Home returns to the original stream. Search, copy/export and paging include quoted history. Navigation coordinates both drafts and publishes the destination before activating its composer. Source access and approval authority remain thread-scoped.

[[sources/runs/2026/09/2026-09-15-sevra-home-continuation]] records the reproduced empty-view defect, passing runtime/composer/Markdown regressions, exact context and permission checks, a real native local-model continuation, restart and independent draft verification. The final app bundle was rebuilt and its input manifest verified. This corrects the latest completed Home exchange action; arbitrary earlier-turn selection and the complete historical link-card UI remain broader plan work. No complete app or release gate is accepted by this scoped check.

## Native UX and Settings audit
Settings now groups General, Model and Keyboard behind a native category control. Related memory/readiness settings stay together, optional diagnostics use a disclosure, and file status distinguishes unchecked from missing. Keyboard shortcuts and meaningful model/budget values have explicit accessible labels and values. Search supports visible Up/Down selection and Return; marked input retains arrow ownership. Escape closes native Find first, then the panel, restoring the conversation and its draft. Memory choices show their scope clearly, Incognito omits unavailable changes, and Knowledge explains save/forget and length restrictions.

[[sources/runs/2026/09/2026-09-15-sevra-native-ux-settings-audit]] preserves the native walkthrough, final bundle identity and raw scripted regression output. Scoped native checks cover Light/Dark, compact and 24-point reading text, settings input validation, model-file checking, Search, document Find/Escape, Incognito cleanup and draft preservation. The complete scripted composer/presentation/runtime suite passed before later independent engine edits; the receipt separates that scope from final build and native checks. System appearance, default text/sidebar sizes, Automatic memory/readiness and Home were restored. Full assistive-technology, live IME, sustained-load, hardware and installed-release gates remain open.

## Adversarial Mac app review
The corrected development app passes the complete composer, Markdown and runtime regression suite. The final real-model Cedar replay also passes the unchanged rubric, exact approval and reopened-artifact checks. It reproduced the tool spelling error, rejected it without executing an alias, and accepted the corrected response. Earlier failed attempts remain evidence; they are superseded by this scoped replay, not erased.

[[sources/runs/2026/09/2026-09-15-sevra-mac-adversarial-fixes]] records the failures, multiple correction passes, final passing logs, native observations, source manifests and installed development identity. The earlier whole-feature inventory remains in [[sources/runs/2026/09/2026-09-15-sevra-mac-adversarial-review]].

| Area | Corrected and verified | Still open |
| --- | --- | --- |
| Durable user work | Historical documents/citations; coordinated journal/draft revisions and nonces; invalid-save recovery; canonical paths; shutdown guards; exact external-draft review, version preservation and restart reconciliation; verified Home backup and inert restore with explicit privacy activation | Arbitrary owned-evidence edits, large-Home scale, complete portability and physical power-loss qualification |
| Model and tools | Full call-set validation; correction in the leading system message supported by the pinned model template; successful final real cited document; exact approval/rejection; cancellable model-file hashing | Broad task reliability, fresh acquisition/repair and complete load/stop/hardware qualification |
| Memory and context | Deterministic bounded memory ranking; full selected memory text; complete recent exchanges and labeled partial earlier excerpts; inspectable exact message selection; Forget lineage; old strict thread-only privacy retained until opt-in | Semantic recall quality, source-heavy token-bound recovery and longitudinal/multi-hardware qualification |
| Native UI | Find/Escape returns focus to the searched document; Queue labeling, archive/new-thread visibility; recovery inspection and dated restore review; visible backup feedback; Light/Dark/System; native Check/Stop; positive toolbar sizing without the sampled startup warning | Full VoiceOver/IME, live OS transitions, sustained-load/latency and hardware matrix |
| Local runtime/CLI | Composer races, FIFO/cancel/sleep fixtures, source boundaries, current-run IPC, Incognito isolation and process-crash recovery | Full CLI grammar/event replay/network adapter and complete storage interoperability |
| Remaining product plan | Missing features stay explicit and are not counted as tested | Rich extraction containment, skills/mini-app sandbox/version/data lifecycle, signed installer/notarization/updater/rollback, voluntary feedback and external-user qualification |

The final Mac source matches the tested isolated snapshot. Independent engine changes in the root checkout were preserved and are not implicitly qualified by this app receipt. The development app at `.build/Sevra.app` now contains the tested executable and manifest, keeps its normal identity/resources, and verifies with ad-hoc signing. A rollback copy was retained, the existing Home reopened, and its canonical data stayed exact. Private contents were excluded from the public evidence. All audit/model processes were closed; the ordinary development app remains on Home. No public release or push occurred.

These results close the earlier real-replay and locked-screen blockers. They do not establish bug freedom or completion of the Mac stable-release plan.

## Native control help and document actions
The conversation icons and related controls expose native hit-target tooltips
and accessibility help. Unavailable actions explain their prerequisite.
Conversation and artifact Find target their own views, and their Markdown
source toggles are independent. Outline actions guard against obsolete render
ranges; the outline appears only when a rendered view has useful destinations.
Empty-state attachment and File menu commands follow current admission guards.

[[sources/runs/2026/09/2026-09-15-sevra-mac-controls-and-help]] records the prior
native paging, outline, split Find, keyboard/source, exact copy/export,
attachment/detachment, new-thread and settings checks. Its permanent toolbar
Latest and explanatory empty outlines were subsequently refined by the
contextual navigation pass below. Native tooltip properties and AX help are
verified; sustained hover-bubble capture and the complete accessibility/OS
matrix remain untested.

## Contextual conversation navigation
Latest is now a round down-arrow above the composer, visible only when newer
content is below or an earlier page is loaded. It returns to the exact latest
page after layout, with a native tooltip, accessible name and Control-Command-
Down shortcut in the View menu and Keyboard settings. Streaming preserves a
reader's position and text selection; following resumes when the reader
returns to the bottom. Sending a message shows the latest page without
stealing composer focus. Resizing and text-size changes preserve following.

[[sources/runs/2026/09/2026-09-15-sevra-contextual-latest]] preserves a reproduced
resize failure and the passing native production-view regression probe,
composer/Markdown reruns, click/keyboard/paging and light/dark UI observations,
matched source/input manifests and final bundle identity. The updated app
reopened the unchanged Home, and the test process was closed. No model was
loaded. These scoped checks do not close the broader product, sustained-load,
IME/VoiceOver or signed-release gates, or qualify concurrent root engine work.

## Thinking before answers
Opt-in thinking is implemented as specified in [[records/design/sevra-spec/runtime-contract]] and [[records/design/sevra-spec/ui-contract]]: a sticky per-thread "Think longer" switch, off by default and off for tool turns; an explicit `low` effort with a 768-token thought ceiling and forced closure; Answer now; a live clock and working-notes disclosure; a per-run receipt with no persisted thought text; Incognito isolation; local endpoint and internal CLI intents. The scripted suite gained `--thinking` and the check runner gained `--real-thinking`. Full scripted suite and the real-model check pass on the development Mac at the bounded 10 GB plan: in the final run all four phases completed: a 96-token forced close answered correctly after 20.9 s of thought, Answer now ended a thought at 8.2 s and the answer followed, the app's own budget closed naturally after 34 tokens, a plain turn followed in the same thread, three receipts persisted and no thought text reached any Home file. Earlier runs found and fixed a clock that included prompt reading, a misleading receipt after a failed answer phase, and a sampled answer phase that outran the reply cap. The offscreen UI check (`Tools/check_sevra_thinking_ui.sh`, now part of `Tools/check_sevra_mac.sh`) passes its 24 checks against the production views with light and dark snapshots: the switch turns on and off from its own control, Send starts a thought whose clock and Answer now button appear, the working notes open from their chevron and show the streaming thought with its privacy line, Answer now ends the thought and the receipt line and the typical-time hint follow. A VoiceOver pass and a person's review of the live app, thinking in tool loops, a heavier level and an automatic mode remain open. Evidence: [[sources/runs/2026/09/2026-09-16-sevra-mac-thinking]].

## Reading, reviewed changes, knowledge bases, skills and mini-apps
Implemented on September 17 as specified in [[records/design/sevra-spec/runtime-contract]] and [[records/design/sevra-spec/ui-contract]]:

- Up to eight file, folder and db.md store attachments per thread, each read only or changeable.
- PDF, Word, RTF, OpenDocument text, Excel and EPUB reading with page citations, and text recognition for images and scanned pages when a read covers them.
- The sandboxed `sevra-extract` helper, built, copied and signed into the app by `Tools/build_sevra_mac.sh` and the Xcode project.
- Staged file and record changes with a line-diff review, digest-bound writes, reporting after a crash mid-write, and undo that restores previous versions and moves new files to the Trash.
- db.md search, query and record changes through the pinned dbmd inside the helper sandbox.
- `/skill` and `/app` proposals with create-only versioned publication, activation and removal.
- Mini-apps in an offline web host with device-local data grants and db.md-backed records, plus a live preview on scratch data during review. An open app hears only about changes it did not make, and a write budget contains a runaway app.
- A 32,768-token planning window and larger reply budgets for documents, changes and apps.

This replaces the "Rich extraction containment" and "skills/mini-app sandbox/version/data lifecycle" gaps listed under Adversarial Mac app review with the scripted evidence below. That table keeps its original wording.

Verification on the development Mac, with the real bundled dbmd, in an isolated snapshot whose `apps/macos` and check scripts match the source exactly. Inference is scripted except in the real-model runs:

- `Tools/check_sevra_mac.sh` passes. It includes every earlier suite and the new basics suite: the helper sandbox self-test and its process-group memory measurement; reading and search; tool groups and cancelled document reading; change review and exact writes; conflicts, links and review across restart; process death while writing; knowledge bases, including a record edited while earlier records are written; skills; and the app data lifecycle.
- The offscreen apps check (`Tools/check_sevra_apps_ui.sh`) loads a hostile page twice into the production app host. The page tries fetch, XHR, WebSocket, EventSource, workers, beacons, peer connections from the page and from a fresh frame, popups, storage, undeclared and read-only collections, a link click with a ping, a form, location changes and a meta refresh. A loopback TCP listener and a UDP socket saw no connection and no datagram. The check then clicks through the change review and the app review flows in the production views, including a second app that sees the first app's saved record, with light and dark snapshots.
- Removing the new record re-check, measuring only the helper process for its memory limit, leaving link preconnects on or allowing every app write makes the corresponding check fail. Before the echo fix, the check that reproduces a save-on-change app counted 40 records within about four seconds; afterwards it counts one.
- On an earlier build of this work, the real-model basics check passed all twelve of its checks in 544 seconds at the 10 GB plan, with a peak physical footprint of 7.4 GB and no swap growth. The model answered the PDF question with the budget and page 2 from a PDF citation. It staged the exact status edit after one bounded correction of a malformed argument name. It proposed a 4,521-byte counter app with no review notes, which was turned on. Run in the production host by the new app-under-test mode, that app counted to 3 but showed 0 after reopening and left two records, because it looked for a record id it had chosen itself. The app guidance now explains host-assigned ids and change events.
- On the final build, the same check passed again in 512 seconds with the same peak footprint and no swap growth. Its counter app followed the corrected guidance and passed the app-under-test mode, showing 3 after reopening with one saved record. The PDF answer and the edit trace matched the first run byte for byte, although the generated PDF differed between the two runs; see the fixture fix below. A traced replay showed that the malformed edit call comes from the engine's cached continuation, not from the model's preference. Read fresh, the same prompt gives a correct call, and the flipped token scores 4%.

Defects found and fixed while verifying:

- A draft app could open network connections despite the content rules and security policy: a peer connection from a child frame, and a TCP connection from a link-click preconnect. WebKit's network feature switches, a refusing proxy and the bridge in every frame now stop them, and the host refuses to run an app unless WebKit reads back peer connections, link preconnects and DNS prefetching as off.
- After a restart, a run waiting for review blocked attaching the folder it needed, so the review could never be applied. Only working runs block attachment changes now.
- The knowledge helper waited for input it never received. It now reads input only when a record body is passed.
- A helper killed mid-request left its work folder behind. Later helpers remove such folders after 15 minutes.
- Tool results escaped the slashes in paths. Model-facing output now keeps plain slashes while stored Home bytes stay unchanged.
- A record edited while earlier records in the same set were written would have been overwritten, because dbmd has no compare-and-set. Each record's base is now checked again just before dbmd writes it.
- The helper memory limit ignored a dbmd process the helper starts. The whole process group is now measured.
- The app review said an app cannot reach other apps, while collections are shared by name. The review now counts records already saved in each requested collection and says that apps using a collection share its records.
- The host echoed an app's own saves back as change events, so an app that saves on every change could create records in a loop until the collection limit. Open apps now hear only about changes they did not make, the preview follows the same rule, and each app has a write budget.
- Single-suite check modes signaled completion before removing their temporary folder, leaving files behind. The signal now follows cleanup.
- Engine results no longer depend on cache history. A turn resumes only its own prefill pass boundaries, so the continued conversation computes what a cold one computes, bit for bit, and the check's first `file.edit` call is now correct with no correction round. Canonical: [[records/decisions/a-continued-conversation-computes-what-a-cold-one-computes]], measured in [[records/measurements/conversation-resume-exactness]].
- The reply opened with the model's words from its tool rounds: the real-model PDF answer began "I'll look through the attached files...". Those words now go to the run's Activity as one line ahead of the calls they introduce, and the reply is the final round's text. A new scripted check fails without the change, and the real-model PDF answer now starts with the budget.
- The real-model checks' PDF fixture had new bytes on every run, because Quartz stamps the time and a random document ID, and `source.read` hands the model the file's SHA-256. The same check could therefore word its answer differently from run to run. The fixture is now pinned, and two consecutive real-model runs gave the same answer, edit and app file byte for byte. Evidence: [[sources/runs/2026/09/2026-09-19-complete-prompt-image-key-and-answer-narration]].
- Asked "what is this?" about one attached PDF in the live app, the model asked what "this" meant and read nothing. Its instructions said files were attached but never named them. They now name each attachment, quoted as data, with its kind and access. A scripted check fails without the change, and a new real-model job asks the same question about an attached report and reads it. Evidence: [[sources/runs/2026/09/2026-09-19-sevra-names-attachments]].
- Think longer was unavailable whenever a source was attached, which is where a person most wants it. It is now unavailable only while the Home is paused, and a tool turn thinks too; a thought shortens only a plain answer, never a turn that can stage work. Measured rather than assumed: across three real-model runs with thinking on, every tool call was valid, no response was rejected, and the reviewed edit wrote the same file; the four jobs took 783, 682 and 1,257 seconds against 636 with thinking off.
- A proposal refused for something the model can fix ended the job. One real-model run lost its whole app job to an app id that matched nothing, with nothing staged and no way on. A refusal now returns as a tool result, at most twice per job, and a later run recovered a refused oversized app and still reached its review. Evidence: [[sources/runs/2026/09/2026-09-20-thinking-with-tools-and-refused-proposals]].

Still open:

- A VoiceOver pass and a person's review of the new panels in the live app.
- App Sandbox, signing and notarization for the app and its helper.
- Launching the Xcode-built app. CI builds and verifies it but does not run it.
- A recheck of WebKit's private feature switches on each macOS release.
- The documented helper residuals: global metadata reads and folder listing in the dbmd modes.
- The narrow window between the record re-check and dbmd's own write. Closing it needs a compare-and-set in dbmd, which `body set` does not offer.
- Measured revision of the new operating bounds and of the larger window's first-token cost.
- Local-model task reliability with these tools.

Evidence: [[sources/runs/2026/09/2026-09-17-sevra-mac-basics]], [[sources/runs/2026/09/2026-09-19-complete-prompt-image-key-and-answer-narration]], [[sources/runs/2026/09/2026-09-19-sevra-names-attachments]] and [[sources/runs/2026/09/2026-09-20-thinking-with-tools-and-refused-proposals]].

## Response details
Implemented on September 20 at Carlos's request that the app show its speed and its thinking as optional extra information, as specified in [[records/design/sevra-spec/runtime-contract]] (Thinking before answers, Response metrics) and [[records/design/sevra-spec/ui-contract]] (Thinking controls, Response details):

- Each run records the engine's own numbers for its model requests, summed over a job's rounds, a refused round included. Numbers only, never text.
- While a thought runs, its last lines stream under the run status, at most three lines with the top line fading, and open the response's details. This replaces the collapsed "Working notes (thinking)" box.
- A reply that thought carries a quiet "Thought for 42 s ›" line above its text, outside the message's Markdown, copies, export and search. A job that thought before several rounds reads as one receipt.
- "Show response details", off by default and remembered on this Mac, adds a speed line under each finished reply and the live writing speed to the run status.
- One details popover per response, from the thinking line, the speed line, the reply's context menu or View > Response Details (⌥⌘I): thinking with every working note still in memory, speed, context with Inspect, activity, and Copy for the numbers.
- Working notes stay in process memory for the eight most recent responses, within 64 KiB each.

Verification on the development Mac:

- `Tools/check_sevra_mac.sh` passes with 168 PASS lines in an isolated snapshot of HEAD `40209f8` plus this work. The new checks are the scripted response-details suite, a presentation test that keeps the new lines out of the message and its copies, and the offscreen thinking check's 39 checks over the production views in light and dark appearance.
- The real-model metrics check (`--real-metrics`), run from the same snapshot at the 10 GB plan, matched the engine's statistics field by field over three turns: a thinking turn that loaded the model, a second thinking turn that reused 256 tokens from earlier in the conversation, and a plain turn after switching thinking off. Replies were written at 5.5 and 6.0 tokens per second. The peak physical footprint was 8.35 GB, and swap did not grow.

Found while verifying: a thinking turn reads its prompt tail and its thought twice. The thought and the answer are two engine requests, and the engine resumes a request only from one of its own prefill pass boundaries, so the answer reads again everything after the prompt's last boundary, and the whole thought. In the real run that second read took 4.8 and 5.4 s, longer than writing one of the answers, and a person sees it as a pause before the first word. Those timings describe the previous implementation and remain historical evidence. The qualified September 21 prompt-speed change now continues the live state under one generation gate, while later turns still obey [[records/decisions/a-continued-conversation-computes-what-a-cold-one-computes]]. Real thinking controls and exact response metrics pass; see [[records/measurements/prompt-speed-qualification-2026-09-21]].

Still open:

- A VoiceOver pass and a person's review of the preview, the lines and the popover in the live app.
- The second read before a thinking turn's answer.
- The memory budget row reads the plan's total process budget. Another session's uncommitted adaptive memory limit may give a person's limit a field of its own, which the row would then have to follow.

Evidence: [[sources/runs/2026/09/2026-09-20-sevra-response-details]].
