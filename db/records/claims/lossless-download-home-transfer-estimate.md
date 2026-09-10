---
type: claim
id: 01m1td69m2kpd5f6pqan8wgdsk
created: 2026-09-06T03:46:30.145999+00:00
updated: 2026-09-08T22:35:06.470997+00:00
summary: Rounded transfer-only estimates from complete compressed bytes, explicitly excluding overhead and unhidden processing.
basis: estimated
gate: Tools/slotpack/checks.py; complete package build and public CLI qualification
needle: about 2 hours at 100 Mbps or 8 hours at 25 Mbps
supported_by: '[[records/measurements/lossless-model-download-2026-09-05]]'
surfaces: docs/GETTING-STARTED.md
title: Idealized compressed transfer estimates for home links
status: current
---
At 100 Mbps, package bytes / 12,500,000 bytes per second is about 1h58m; at 25 Mbps, about 7h51m. Rounded public estimates are about 2h and 8h. Actual connection throughput, retries and processing affect completion.
