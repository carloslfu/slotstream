---
type: decision
id: 01m1hsjvzdg2h8fm51tbdwdmzv
created: 2026-09-02T19:29:55.181495+00:00
updated: 2026-09-02T19:29:55.181495+00:00
summary: Staging buffer recycling was built, measured no faster and 6% slower with a higher peak, and dropped
decided_on: 2026-09-02
evidence: '[[records/measurements/what-set-the-knobs-group-size-lanes-recycling-the-cache-cap-admission-and-the-n-gram-rows]]'
reversible_if: a read-time split shows page faults or unmaps on the sweep's read path, and recycling then measures faster in paired rounds
title: Staging buffer recycling was built, measured no faster and 6% slower with a higher peak, and dropped
status: standing
---
Recycling the sweep's staging buffers through the MLX arrays' finalizers was built to
remove a page fault per 16 KiB and an unmap per group; measured in two paired rounds it
left the read time unchanged (23.6 s against 22.7) and cost 6% of prefill plus 0.3 GB of
peak from the sets it held, so it was removed before it shipped. The reads are not
waiting on page faults. Do not rebuild it on that premise.
