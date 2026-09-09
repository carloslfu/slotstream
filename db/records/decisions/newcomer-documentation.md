---
type: decision
id: 01m21jj97w5hteckpk2khdy25h
created: 2026-09-08T22:35:06.876703+00:00
updated: 2026-09-09T00:30:00.240558+00:00
summary: Keep the README a short newcomer index; separate practical setup guides from engineering references.
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
