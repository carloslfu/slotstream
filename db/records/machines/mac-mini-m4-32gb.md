---
type: machine
id: 01m2s4e4fs0dxr88w41bb9qs22
created: 2026-09-18T05:20:00.000000+00:00
updated: 2026-09-18T11:30:00.000000+00:00
summary: 'A Mac mini M4, 32 GB, that holds the checkpoint twice: on the 251 GB internal SSD and on a Thunderbolt 4 WD_BLACK SN8100. It is the first machine here whose second disk is fast enough that reading both at once is worth the code.'
chip: Apple M4
kind: mac
os: macOS 15.7.4 (24G517)
ram_gb: '32'
ssd: internal 251 GB APPLE SSD AP0256Z on Apple Fabric, and an external 2 TB WD_BLACK SN8100 in an OWC Express 1M2 enclosure on Thunderbolt 4
title: Mac mini, Apple M4, 32 GB, two disks
---
A Mac mini (Mac16,10), Apple M4 with 4 performance and 6 efficiency cores,
32 GB of unified memory and macOS 15.7.4. slotstream's memory plan prints
`34 GB RAM` on it because it reads the byte count (34.36 GB) rather than
Apple's nameplate figure. `iogpu.wired_limit_mb` is raised to 28,700, which is
not boot-persistent here and has to be set again after a restart.

**Idle baseline.** Left alone with nothing loaded, the machine has about
**28.8 GB** reclaimable by `vm_stat` accounting and **29.9 GB** by the reading
slotstream itself uses
([[sources/runs/2026/09/2026-09-18-mac-mini-idle-memory-baseline]]). Both
numbers are `free + purgeable + file-backed`, and they differ because
`vm_statistics64.free_count` from the Mach call already includes speculative
pages while `vm_stat`'s printed "Pages free" line does not: 64,675 speculative
pages, 1.06 GB, exactly the gap on the day it was captured. Slotstream's
reading is the one that decides whether a request starts, because
`RequestControl.check` compares `Plan.deviceAvailableGB()` against the next
allocation plus `availabilitySlackGB` (`max(1.5, 0.05 x ramGB)` = 1.72 GB
here). A default plan's `expected_peak_bytes` is 23.05 GB, so an idle machine
carries roughly 5 GB of headroom over what a run asks for.

That headroom is the whole reason a finished run has to be reclaimed before the
next one starts. A resident plan holds its pool and fixed footprint, 10.31 plus
5.30 GB in the default ledger, and subtracting anything of that order from 29.9
lands below the roughly 24.8 GB the same plan needs. This is what refused the
trailing probe of
[[sources/runs/2026/09/2026-09-18-decode-queue-depth-and-prefetch-lanes]]: the
machine was never short, the script simply did not wait. Note that
`iogpu.wired_limit_mb` plays no part in this. Nothing under `Sources/` reads
that sysctl; it caps what Metal may wire, while the refusal comes from
slotstream's own accounting against the availability reading above.

What makes this machine worth a record is that it has two disks rather than
one, and that the slower of the two is still fast. The internal 251 GB Apple
SSD and an external WD_BLACK SN8100 2 TB in an OWC Express 1M2 enclosure on
Thunderbolt 4 both hold the same 105.26 GB checkpoint, 26 files each, so any
weight read can be served from either side. Every other machine in this store
reads weights from exactly one device, and the tier curve behind
`--experts-per-layer` assumes that.

The two disks are asymmetric, and the asymmetry is what the routing policy has
to deal with. Measured device-side through the file system with `fio` against
the real checkpoint files, on a 55 GB working set that no cache on this machine
can hold, the internal SSD saturates at **1.81 GB/s** and needs 4 concurrent
readers to get there, while the external SN8100 saturates at **3.18 GB/s** from
2 readers on. The external drive's single-reader figure, 2.06 GB/s, already
beats the internal drive's saturated figure, so a policy that splits reads
evenly leaves the faster disk idle. Their sum, **4.99 GB/s**, is the ceiling a
mirrored read path can approach and is the number
[[records/measurements/mirror-reads-across-two-disks-2026-09-18]] is measured
against. The external drive's ceiling is the Thunderbolt 4 link rather than the
drive: it reads 3.17 to 3.18 GB/s at every block size from 352 KB to 2.75 MB
and every thread count from 2 to 13.

The internal copy costs 105.26 GB of a 251 GB disk, so the mirror is not free
on this machine and would not fit at all on the 256 GB base storage of
[[records/machines/mac-mini-m2-16gb]] alongside a system.
