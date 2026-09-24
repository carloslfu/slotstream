# Sevra for Mac

Sevra is being built as a native personal AI application around Slotstream.
The development app lives under `apps/macos`. This is ongoing implementation,
not an announced alpha or a supported installer.

## Native philosophy

Product behavior is shared through Markdown/text specifications, schemas and
declarative fixtures. Each platform owns its UI, runtime, memory, tools,
permissions and inference integration. Independent upstream libraries are
allowed; sharing application source is not a requirement.

Mac uses SwiftUI and AppKit/TextKit over a Swift application runtime. That
runtime calls Slotstream in process and uses the official bundled dbmd tool
for deterministic file-database operations. Metal and dbmd keep their own
implementations. The native interface needs no web server or account.
Slotstream itself is native Swift on MLX and Metal end to end
([native stack](ENGINEERING.md#native-stack)), which is what makes the
in-process call possible.

The [engineering specification](../db/records/design/sevra-spec/overview.md)
owns the detailed contracts. Its
[implementation ledger](../db/records/design/sevra-spec/implementation-status.md)
distinguishes code, observed behavior and unpassed qualification. Windows and
Linux have independent implementation plans; this change builds the Mac app.
Cloud development, paid sync and remote inference remain deferred until users
ask for them.

## Build and run locally

Use a Mac development checkout with Swift Command Line Tools, the existing
Slotstream dependencies and Metal resource, and the official dbmd executable.
Set `SEVRA_DBMD` to the reviewed absolute executable path if it is not installed
at the default location used by the build script.

```bash
bash Tools/build_sevra_mac.sh
open .build/Sevra.app
```

The script copies the runtime dependencies into the development bundle and
ad-hoc signs it. Developer ID signing, notarization, the installed updater and
clean-machine qualification are separate work. A successful ad-hoc build does
not establish a trusted public distribution.

By default the app opens `~/Sevra/Home`. For disposable development data, launch
the executable directly with a dedicated Home:

```bash
SEVRA_HOME="$HOME/Sevra/DevelopmentHome" .build/Sevra.app/Contents/MacOS/Sevra
```

The current integration verifies and uses the existing Slotstream model
location. Settings can check that installation or explicitly download, resume
or repair its pinned files. Opening Sevra starts no download. Fresh-download
and cancellation qualification remain separate from the installed-model test. No model is loaded merely to inspect history or edit a draft. Before
running real inference, follow the repository's memory-safety rules and stop
any other model process you own. Never stop somebody else's process without
coordination. The bounded functional-test configuration is documented in the
[Mac baseline](../db/records/design/sevra-spec/mac-platform.md); it is not yet a
qualified automatic product recommendation.

The current engine keeps its model-process lock until the process exits.
After running inference in Sevra, quit Sevra before starting another model
process; the Unload control alone does not release that process-wide lock.

## Exercise the local workflow

Open a new thread and attach files or folders with the paperclip, the
**File → Attach Files…** command (⌘⇧A), drag and drop, or paste. A thread holds
up to eight attachments, each shown as a chip above the composer. Ask Sevra
about them, or ask for a cited briefing and review the complete document before
choosing **Save document**. The model is told each attachment's name, kind and
access, so a question such as "what is this?" reads the attached file instead
of asking what you mean. Saved artifacts use create-only publication inside
the Home.

### What Sevra can read

- **Text and code:** Markdown, plain text, CSV, JSON, logs and common source
  files up to 8 MB each.
- **Documents:** PDF, Word (`.docx` and `.doc`), RTF, OpenDocument text, Excel
  (`.xlsx`) and EPUB, up to 64 MB. Sevra searches their text and cites the page
  a PDF excerpt came from.
- **Scans and images:** PNG, JPEG, HEIC, TIFF, GIF, WebP and BMP, plus PDF pages
  without a text layer. Sevra recognizes their text on this Mac when a page is
  read, at most 40 pages per request, and marks such citations as recognized
  text.
- **Folders:** live access without an upfront scan or a fixed file-count limit.
  Sevra browses subfolders, finds filenames and searches content as needed.
  New files, renames and edits appear on subsequent operations. Hidden entries
  and symbolic links are excluded. Broad searches skip dependency folders such
  as `node_modules`; Sevra can inspect a specific dependency folder when needed.

Long listings and searches return bounded pages. Sevra can continue from where
it stopped, including further matches in the same file. If a directory changes
between pages, Sevra must restart the operation with current names. Search reports
skipped or unreadable entries instead of treating them as searched. An attachment stays
usable regardless of the size of its tree. Access remains limited to the files
or folders you selected.

Without an attachment, Sevra explains how to add one with the paperclip. Thread
only affects remembered context; attached files remain available in that mode.

Password-protected, damaged and oversized documents are refused with a reason.
Sevra reads the text inside a document, not its layout; tables and multiple
columns come out as plain text.

Rich documents are opened by `sevra-extract`, a small helper that ships inside
the app. Each document gets a fresh helper process that receives only the
document's bytes. Before it parses anything, the helper puts itself in a macOS
sandbox that denies reading your files, writing outside its own work folder,
all network access, launching programs and the window server. Text recognition is
split in two. A strict helper turns the file into plain grayscale pixels, and a
second helper that may use the GPU and Neural Engine only ever sees those
pixels. Sevra stops a helper that runs too long, prints too much, uses too much
memory or is cancelled, together with anything it started.

### Reviewed changes

Each chip has an access menu. **Read only** is the default. **Can propose
changes** lets Sevra stage new files and edits in that folder or file. Staged
changes are never written during a response. When it ends, **Review changes**
shows every file with a line-by-line diff, and **Show complete text** shows
exactly what will be written.

**Write Files** applies the whole set. Sevra first checks that each file is
unchanged since it was read and saves the previous version in the Home. It then
replaces the file in one atomic step, keeping its permissions and Finder tags.
A file edited after the review, replaced by a symbolic link, or hard-linked
elsewhere is left alone and reported. If Sevra closes while writing, the
review reports which files were written; nothing is replayed.

**Undo Changes** restores the previous versions and moves new files to the
Trash, where **Show in Trash** finds them. A file edited since Sevra wrote it
is left as it is. Sevra never changes shell scripts, HTML, SVG or notebooks,
and keeps access only while a folder is attached. After a restart, attach the
folder again to write or undo. Incognito threads can read but not change files.

### Knowledge bases

A folder with a `DB.md` file attaches as a db.md knowledge base. Sevra searches
and queries it through the pinned dbmd tool, which runs inside the same kind of
sandbox, confined to that store. With changes allowed, Sevra can stage new
records and body edits, appends and replacements, for review. Records are
written through dbmd, so indexes stay current; db.md files each new record by
its type, and the review reports where it went. Frontmatter, the store's
`DB.md`, its indexes and log, and anything under `sources/` are never edited.
Undo restores the records and rebuilds the index.

### Skills and mini-apps

The sparkles button in the composer lists skills. **/app** asks Sevra to build
or change a mini-app, and **/skill** saves a repeatable workflow. Your own
skills appear after you approve them; type `/name` to use one. A skill only adds
instructions to a request. It never grants access to files, and anything it
proposes still waits for your review.

A mini-app is one HTML file with its own CSS and JavaScript. Its review shows
the data it asks for and how many records each collection already holds, notes
about what it tries to do, its source, and a live **Try it** preview backed by
scratch data that is discarded. **Turn On App** publishes that exact version and
grants the listed access on this Mac. Open apps from **Apps & Skills** (⌘2),
where you can switch versions, turn an app off or remove it. Removing an app
keeps its versions and data in the Home.

Apps store records through `window.sevra` (`list`, `get`, `create`, `update`,
`archive`, `restore`) in named collections. Each record is a db.md file under
`db/records/app-data/` in your Home, with a revision number that prevents lost
updates. An app sees only the collections its active version declared and you
approved. Apps that use the same collection share its records. Sevra assigns
record ids, tells an app about changes made elsewhere with a `sevra-change`
event but never about its own saves, and slows down an app that saves too often.
A save based on a stale revision is refused instead of overwriting newer data. A
changed app file, a restored Home or a Home file edited outside Sevra stops
access until you act.

Each app runs in its own web view that serves only its approved bytes. It has no
network: loads are blocked by content rules and a content security policy, and
anything that would connect anyway meets a proxy that refuses it. Peer
connections, link preconnects and DNS prefetching are switched off, and the app
does not run at all unless WebKit confirms they are. Navigation, popups,
downloads and camera or microphone access are refused, and browser storage ends
with the view. Opening a web link from an app asks you first. Backups carry app
versions and data but never their access grants, so a restored app stays off
until you turn it on.

Settings exposes System, Light and Dark. System follows macOS; overrides
persist. Saved drafts and threads reopen with the same Home. Incognito is a
separate session and cannot create persistent memories, staged artifacts,
file changes, apps or skills.

After a completed Home exchange, **Continue in thread** opens a work thread
with that exchange visibly labeled **From Home**. The original messages stay
in Home and are quoted by reference. Further messages in Home do not become
part of the continuation. **Open thread** returns to the existing continuation;
repeated clicks do not create duplicates. **View in Home** returns to Home.
The continuation keeps the memory scope, and both composers retain their own
drafts. File attachments and approval authority stay with the original thread;
attach a file again to let the continuation read it. Search, copy and export
include the visible quoted exchange. Forget still suppresses its source from
future AI context without erasing the inspectable history.

## Draft saving and regression checks

The composer serializes draft writes and tracks each acknowledged revision
independently of the display refresh. Typing during a save stays in the editor;
the writer drains the latest text before switching threads or closing. Send
accepts the message and updates its draft in one durable transaction. A pending
save cannot restore a sent message. Incognito closing drains pending work
before removing the thread.

Recoverable revision changes are handled quietly. A real competing draft offers
both versions for an explicit choice. Save failures keep the text visible, offer
Retry Save and Copy Draft, and prevent closing with unpersisted edits. Send
retries reuse an acceptance nonce so an uncertain result cannot create a
duplicate message. Successful recovery clears its own warning.

Journal uses the same draft coordinator. Unsaved entries survive reopening,
and Save entry commits the entry and remaining draft together. Repeated clicks
and uncertain-result retries keep one accepted entry. Text typed while saving
remains available for the next entry. Model-file verification also checks for
cancellation between bounded reads, so Stop does not wait for a complete hash
scan.

Run the Mac development regressions without loading a model:

```bash
bash Tools/check_sevra_mac.sh
```

The script builds the app and local CLI, then checks the production composer
state machine with delayed and failing storage, native Markdown presentation,
and the runtime using scripted inference and real dbmd persistence. Disposable
Homes exercise restart, crash recovery, tool boundaries and data isolation.
The runtime suite also covers document reading, the helper sandbox, reviewed
changes, crash recovery, knowledge bases, skills and mini-app data. It finds
`sevra-extract` beside itself, or through `SEVRA_EXTRACT`. The script also runs
two offscreen view checks. The mini-app check loads a hostile page into the
production app host and requires that a local listener sees no connection and
no datagram, then clicks through a file-change review and an app review:

```bash
bash Tools/check_sevra_apps_ui.sh
```

The thinking-controls check can also run on its own:

```bash
bash Tools/check_sevra_thinking_ui.sh
```

That check renders the production views over the scripted engine in a scratch
Home, finds each control by its rendered label and clicks it: Think longer on
and off, Send, the live clock and the last lines of the thought, the details
popover with the working notes, Answer now, the thinking line above the reply,
the optional speed line with the live writing speed, and the typical-time
hint, in light and dark appearance. Its
window is ordered far outside every display and the process never activates,
so nothing appears on screen; snapshots land in `.build/sevra-thinking-ui/`.
Native UI walkthroughs, VoiceOver passes and real-model checks remain separate
evidence; this suite does not qualify every OS, input method, accessibility
mode or release.

## Home backup and recovery

Settings → General → **Back up Home…** saves a verified folder containing saved
conversations, drafts, memories, journal and owned files. **Reveal backup** opens
its location. Attached source folders and model weights remain separate; a
retained citation is only an excerpt of its original source. Device credentials,
source grants and Incognito content are excluded.

**Restore backup…** creates a new Home beside the backup or in another folder.
It refuses an existing destination and verifies the declared files before
publishing the restored copy. Opening that copy keeps AI paused for a dated
privacy review. Inspect Knowledge first. Known newer Forget decisions from the
current Home are retained; a backup restored without that current state may be
missing later privacy choices. Enabling AI does not restart old jobs, reattach
sources or approve a document. Large Homes and physical power-loss recovery
still need broader qualification.

When a saved draft changes in another editor, **Inspect Home changes…** shows
the changed text. **Adopt reviewed drafts** accepts only the exact version you
reviewed and preserves local conflict records. If the composer also has unsaved
text, the existing two-version choice protects it. This works after restart,
although a previous draft that was never retained is explicitly unavailable.
Drafts and conflict records are excluded from AI context. Changed conversation
evidence, missing records and malformed drafts remain paused for recovery;
arbitrary edits to owned state are not silently imported.

## Long conversations and inspectable context

Sevra keeps the full saved conversation while selecting a bounded recent window
of complete exchanges for each request. Older partial excerpts are labeled as
such. **Context** shows which messages and saved memories were used and what was
omitted. An oversized current request or pinned Home exchange is refused with
its text preserved; attach long material as a source instead.

Saved memories are selected by word overlap with the request, thread scope and
recency, within a bounded budget. This is deterministic retrieval, not a claim
of semantic recall. Forget excludes the source event from future windows and
derived excerpts. New Thread only conversations may read shared memories but
keep newly saved memories within that thread. Older Thread only conversations
retain their stricter reading scope until you explicitly allow shared memories.
Incognito uses neither saved memories nor persistent conflict records.

## Thinking and response details

**Think longer**, in the composer bar, lets Sevra reason before it answers. It
is off by default and stays on for the thread until you turn it off; a thread
with attached sources thinks too. While Sevra thinks, the status reads
"Thinking…" with a clock, and the last few lines of its reasoning appear under
it, newest at the bottom. Click them to read all the working notes, or press
**Answer now** to end the thought and answer from what Sevra has so far. When
the answer arrives, a line above it says how long Sevra thought. Click that line
for the notes and the rest of the response's details. Working notes are not
saved or remembered: they stay only while Sevra is open, for the eight most
recent responses, and never enter the conversation's copy, export or search.
Only how long the thought took and how it ended is saved with the response.

Every response also records what it cost on this Mac, measured by the engine:
the tokens it wrote and how fast, the time to its first token, how much of the
conversation it read and how much it reused, the context it used, any model
load it waited for, the share of the model's experts already in memory while
it wrote, and the memory budget it ran with. Speed depends on that budget, so
the details always show it. With a custom limit, they distinguish that saved
limit from the smaller budget available for the response. Turn on **Show response details** in the
conversation options menu or the View menu to add a line under every reply
with tokens per second, tokens written and time to first token, and to show
the live writing speed in the status while Sevra writes. To open the full
details, click a reply's thinking line or speed line, choose **Show Response
Details** from the reply's context menu, or press ⌥⌘I for the latest reply.
**Copy** there copies the numbers as text, without any notes or messages. The
numbers stay in your Home and are never sent anywhere.

## Brand and native UI review

The unified macOS toolbar brings the window controls, sidebar toggle, current
page, memory status, Search and three-dot actions into one row. Long thread
titles truncate while their full text remains available to accessibility and
in the tooltip. Control-Command-S toggles the sidebar or compact navigation.
The actions menu follows the current thread and includes Settings.

The heading follows the sidebar divider as navigation resizes, and sits beside
the native navigation controls when the sidebar is hidden. Conversation text,
composer, status and document actions share a reading column. Search, Journal
and Knowledge use matching gutters. Sidebar icons and row spacing follow a
consistent grid; document titles, text and footer actions align in split review.

Settings separates General, Model and Keyboard into native sections. General
holds appearance and Home location; Model keeps automatic memory and readiness
controls together, with usage details available through a disclosure. Model-file
checks show their own progress and readiness. Keyboard lists the same shortcuts
used by the app menus.

Search supports arrow-key selection and Return to open the selected thread.
Arrow keys remain with the input method while composing text. Escape closes
native Find before leaving a document, and returns from a panel to the
conversation. Memory choices show their selected scope; Incognito explains its
restriction instead of offering scope changes it cannot apply. Knowledge uses
plain save/forget wording and explains memories that are too long to save.

The sidebar uses the approved Observer mark and lowercase Poppins wordmark.
The app bundle includes a multiresolution Observer icon for Finder, the Dock
and About. Both the command-line bundle script and Xcode target package it.
To regenerate the icon from the same native vector used by the sidebar:

```bash
bash Tools/generate_sevra_icon.sh
bash Tools/build_sevra_mac.sh
```

The source mark retains the approved geometry; the rounded warm tile is specific
to the Mac app icon. Modern layered-icon qualification through
[Apple's Icon Composer workflow](https://developer.apple.com/documentation/Xcode/creating-your-app-icon-using-icon-composer)
remains release work.

A native walkthrough verified the logo in Light and Dark, appearance persistence,
Save and relaunch, saved-document viewing, large text, narrow navigation, draft
continuity through appearance changes and scoped Find. **Open document** now
shows the current saved UTF-8 file inside Sevra, with a separate Finder action.
Its owner-mediated preview has a bounded read and refuses symbolic links.
Saved documents also remain available from the conversation’s **Documents** menu
after later messages. Earlier citations resolve to their own retained run and
source excerpt, including after reopening the Home.

The runtime validates the complete tool response before executing any call.
It can request bounded schema feedback for unsupported argument keys or a
recognized tool-name spelling mistake. The rejected response executes nothing;
the model must return a valid new response, and saving still requires exact
document approval. The final adversarial replay passed this path with the real local model,
including correction, cited proposal, exact approval and reopening the saved
file. This qualifies the bounded fixture, not every possible user task.
What the model writes before calling a tool says what it is about to do, so
it is shown as one line under the reply's **Activity**, ahead of the calls it
introduces, and never becomes part of the answer. The answer is the final
round's text, or the text beside a proposal. If the final round has no text
of its own, the reply keeps what the model wrote along the way.
See the [feature audit](../db/records/design/sevra-spec/implementation-status.md#adversarial-mac-app-review)
for the current evidence and open requirements.

The conversation and saved-document view render headings, emphasis, lists,
quotes, syntax-colored code and native tables. Code has an exact-copy action;
the outline jumps to headings, code blocks and tables. Standard selection and
Find operate within the loaded history page. Earlier/Newer navigate bounded
pages; Copy conversation and Export Markdown preserve the complete source.
Raw HTML stays literal, images do not download, and opening a web link requires
a destination review. Evidence links resolve only to excerpts supplied by the
native owner. Unsupported or oversized Markdown remains readable as source.

Hover over the conversation icons for their native help: **Outline** jumps
to a heading, code block or table and appears when the rendered view has
sections to navigate. **Conversation options** holds Markdown source, copy,
export and Find. Document previews have their own options and Find; source
mode and Find stay scoped to the pane you choose.

**Jump to latest message** is a round down-arrow above the composer. It appears
when newer content is below or you are reading an earlier page, and disappears
at the latest message. Click it or press **⌃⌘↓** to return to the newest content.
New output follows while you are at the bottom; scrolling up or selecting text
preserves your reading position. Sending your own message returns to the latest
page while keeping the composer focused. The shortcut also appears in the View
menu and Keyboard settings.

The composer grows with the draft, retains native Undo and marked-text handling,
and accepts files and folders through its picker, drag or paste. Thread controls
cover pin, rename, lifecycle and memory scope. Review opens beside the conversation
when space allows; compact windows use explicit navigation and a single document
pane. Search, Settings and document commands have deliberate focus behavior.

Markdown parsing uses the upstream Swift Markdown library off the UI thread.
Completed messages are cached during streaming. Native tables use AppKit's
compatible text-layout path deliberately; this does not claim a wholly
TextKit 2 implementation. The Markdown dependencies' notices ship in the app.

This remains a development interface. Complete screen-reader/IME qualification,
live OS accessibility transitions, sustained interaction and measured frame,
latency and memory budgets still require the full native test matrix. Ad-hoc
builds do not establish installed-release quality. The
[implementation ledger](../db/records/design/sevra-spec/implementation-status.md)
records the exact observed scope and remaining gates.

## Memory and readiness

Settings → Model → Memory budget defaults to **Automatic (Recommended)**. The app uses
Slotstream’s memory planner and elastic cache governor, keeping the current
text model and context fixed while adapting cache residency to the Mac and
other applications. The recommendation inherits the engine’s measured
operating ceiling; it is not a promise of optimal performance on every Mac.

Desktop also uses the engine's automatic speculative decoding when the optional
draft head is installed and its full memory cost fits. Smaller budgets keep
ordinary decoding. This is independent of **Think longer** and needs no user
switch. Short chats use smaller prompt-processing batches to create useful
conversation checkpoints; longer inputs retain the engine's throughput schedule.
Crossing between schedules can require a fresh read because incompatible
checkpoints are never reused.
The [operating-policy record](../db/records/decisions/sevra-app-speed-defaults-2026-09-23.md)
contains the comparisons, costs and conditions for revising these choices.

**Custom limit** means “use up to” the selected budget within the displayed
supported range, which comes from this Mac's hardware rather than the automatic
default. It retains automatic pressure protection. Switching to Custom starts
at the current budget; returning to it restores your last chosen limit. The
saved limit stays stable when available memory changes. Settings distinguish
the app’s physical memory use from the budget available now. Unified
CPU/GPU memory is counted once.
If a saved limit exceeds the current Mac's supported range, Settings shows
the saved value and asks you to lower it or choose Automatic.

The model loads with the first request and verifies the pinned files. Within
that app session, unchanged files on APFS can reuse the successful verification
after unloading. File identity, size and modification/change timestamps are
checked again; changes require fresh hashing. Other filesystems and new app
launches always hash again. No verification proof is stored on disk. An immediate
reload lets macOS refresh its memory statistics before sizing the next model,
so memory just released is not incorrectly counted as still occupied.
**Keep model ready → Automatic** keeps it loaded while Sevra is in the foreground,
including while you read or compose. Leaving the foreground starts an inactivity
interval, with a bounded delay informed by observed preparation time. Memory
pressure, power saving and sleep can release it sooner. **While app is open** favors warm
follow-ups but still yields to memory pressure and sleep. **Release memory
now** preserves saved conversations and personal memory. Ordinary conversations
can reuse a disposable prompt cache in that Home after a reload. Thinking and
incognito sessions keep their inference state off disk. Backups exclude the
prompt cache; it can be rebuilt from the saved conversation.

Budget changes during a response apply after that job finishes. New messages
wait through the short resource handoff. Closing the window follows the
existing accepted-work policy; quitting drains work and releases the model.
Sleep stops active work and interrupts queued work. Wake permits new requests
without replaying interrupted actions. An unavailable memory reading or a
configuration that cannot fit produces an explicit refusal. The full
conversation stays on disk while each request uses its disclosed context window.

The native lifecycle and policy checks are in the ordinary regression runner.
The separate `--performance-real --home <new-disposable-directory>` check uses
a bounded custom budget to exercise lazy loading, warm reuse, changing a budget
during generation, release/reload, responsive metadata and automatic idle
release. Follow the same model-process and headroom rules as the real fixture
below. Full hardware qualification and clean paired performance measurements
remain separate from these functional checks.

Real cache, response-metrics, thinking and source-tool checks also accept
`--mtp-profile-gb <budget>` for an explicitly requested MTP performance profile.
They require the chosen budget plus the ordinary headroom, refuse a profile
that does not actually enable MTP, and use disposable Homes. The default checks
retain their small budgets. `--real-speed --memory-gb <budget> --arm <policy>`
compares complete allocations and checks reused output against a fresh run;
`--extended` includes a longer inventory. These are development measurements,
not public hardware qualification.

## Checks and internal CLI

```bash
swift build --package-path apps/macos -c release --product sevra-mac-checks
apps/macos/.build/release/sevra-mac-checks
swift build --package-path apps/macos -c release --product sevra-presentation-checks
apps/macos/.build/release/sevra-presentation-checks
swift build --package-path apps/macos -c release --product sevra-local
apps/macos/.build/release/sevra-local --help
```

The check runner uses fake inference and real dbmd mutations in disposable
Homes. It does not load the large model. Real-engine and native interaction
results must be recorded separately. The internal `sevra-local` executable
does not replace the existing `sevra` compatibility CLI. An active Home is
exclusive. The internal CLI attaches through a user-local authenticated Unix
socket to the existing owner, or acquires the Home lock itself when given an
explicit dbmd executable. It never starts a second owner for an active Home.
Incognito is unavailable to this initial CLI attachment.

```bash
apps/macos/.build/release/sevra-local status --home "$HOME/Sevra/Home"
apps/macos/.build/release/sevra-local chat --home "$HOME/Sevra/Home" --prompt "Hello"
```

The app must already own that Home for these commands. A CLI connection may
detach while the app continues its accepted job. Preserve the printed nonce
to reconcile uncertain submission; a lost response is not permission to retry
with a new request id. The optional network server is not implemented.

The real-model fixture additionally exercises source reading, citation review,
create-only document publication and reopening its durable Home. Run it only
under the repository memory rules, with a new disposable destination:

```bash
cp Tools/lib/mlx-0.32.2.metallib apps/macos/.build/release/mlx.metallib
apps/macos/.build/release/sevra-mac-checks --real \
  --source "$PWD/apps/macos/Fixtures/private-workspace-brief" \
  --home "$PWD/.build/sevra-disposable-real-check"
```

The harness reviews a synthetic fixture after checking its frozen rubric. It
does not certify the native Save button, appearance, accessibility or public
release. See the implementation ledger for observed and pending evidence.

A second real-model fixture asks a question about a generated PDF, proposes an
exact edit to a text file and proposes a counter mini-app, acting as reviewer
for each. The generated PDF is the same bytes on every run, so two runs on the
same Mac and memory plan give the model the same input. It needs the helper,
the metallib copied as above and the same memory rules:

```bash
SEVRA_EXTRACT="$PWD/apps/macos/.build/release/sevra-extract" \
  apps/macos/.build/release/sevra-mac-checks --real-basics \
  --home "$PWD/.build/sevra-disposable-real-basics"
```

To try the counter app it built, run the apps check against the app's file. The
app opens twice in the production host over one scratch store. After a few
clicks on plus, the reopened app must show the same count and keep a single
saved record:

```bash
SEVRA_APP_UNDER_TEST="$(find "$PWD/.build/sevra-disposable-real-basics/Home/extensions/miniapps" -name index.html | head -1)" \
  SEVRA_APP_DATA=counter:write bash Tools/check_sevra_apps_ui.sh
```

A third real-model check compares the numbers Sevra records for a response
with the engine's own statistics for the same requests: a thinking turn that
loads the model, a second thinking turn that resumes the conversation instead
of reading it again, and a plain turn after switching thinking off, which reads
it again because the switch changes the system instructions. The engine
resumes a request only at its own prefill pass boundaries, so the opening
message is long enough for the conversation to pass the first one. It needs
the metallib copied as above and the same memory rules:

```bash
apps/macos/.build/release/sevra-mac-checks --real-metrics \
  --home "$PWD/.build/sevra-disposable-real-metrics"
```

The live-source fixture checks the model's explanation of file access, then
attaches a large disposable folder, locates and cites a file, rediscovers it
after a rename and edit, and proposes a reviewed change. It verifies the
approved bytes and undo. Use a new destination and the same memory rules:

```bash
SEVRA_EXTRACT="$PWD/apps/macos/.build/release/sevra-extract" \
  apps/macos/.build/release/sevra-mac-checks --real-sources \
  --home "$PWD/.build/sevra-disposable-real-sources"
```

Its `receipt.json` records answers, actual tool traces, source excerpts and
failures. The ordinary checks also cover live navigation and search pagination
without loading a model; `sevra-mac-checks --sources` runs that group alone.

Slotstream's original CLI, serving APIs, library products and package coordinates
remain independently usable. This application work does not rename the public
repository, publish a release or change existing credentials and services.
