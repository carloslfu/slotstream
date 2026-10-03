---
type: measurement
id: 01m4234mynacmqastsgfhf9zx1
created: 2026-10-03T23:56:09.557903304+00:00
updated: 2026-10-04T01:58:25.482041276+00:00
summary: 'Mirror reads on main 57aa493: decode 6.13 to 7.06 tok/s, median paired lift 15.6%, explicit keepalive off.'
date: 2026-10-04
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m4-32gb]]'
note: Measured f37412f/base57aa493; identical compiled inputs after rebase to180bd72, full model35/0 and new static pass; explicit off profile, output-identical/no swap, OS/SSD cache uncontrolled.
order: '1740'
runs: '[[sources/runs/2026/10/2026-10-04-mirror-current-baseline-paired]]'
title: Mirrored checkpoint pairs on main 57aa493 with keepalive off
status: measured
---
Three interleaved AB/BA pairs on the Mac mini M4 measured **6.13 to 7.06 tok/s**, with a median paired ratio of 1.156 (+15.6%). Each arm completes 200 greedy tokens with seed 1, MTP on, 118 experts/layer, context 8192 and explicit `--gpu-keepalive off`. All six output token IDs and stdout hashes match; no global swap is observed. Both model copies pass all pinned SHA256 checks before inference.

Median decode I/O is 10.781442592 to 7.385706209 s, and prefill read throughput 3.203592113 to 4.787029147 GB/s. The internal copy serves about 35–36% of routed bytes. Peak lifetime physical footprint is 20.923 GB and lifetime RSS 19.989 GB, under the declared 28 GB ceiling. The paired-ratio median and the ratio of the two arm medians are different statistics.

Measured executable source is f37412f based on main `57aa493`; exact binary, Metal and source-archive SHA256 identities are in the linked run. The subsequent rebase to main `180bd72` leaves the compiled Sources/Package inputs unchanged; [[sources/runs/2026/10/2026-10-04-mirror-local-validation]] retains the Git-object proof, full updated static pass and complete 35/0 model acceptance. Fresh processes empty application caches; OS/SSD cache is uncontrolled. The result qualifies this one public keepalive-off profile, not default-auto throughput, cold SSDs or other hardware. The October 3 source 26 experiment and September experiments remain dated observations. Separate physical file-reader witnesses do not predict decode speed.
