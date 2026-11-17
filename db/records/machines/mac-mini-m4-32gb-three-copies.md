---
type: machine
id: 01m7fcqmzmx9g135c4ce4frmp4
created: 2026-11-15T10:41:02.452843006+00:00
updated: 2026-11-17T14:01:40.157204283+00:00
summary: Mac mini M4 32 GiB, three checkpoint copies on three devices
chip: Apple M4
kind: mac
link: https://github.com/carloslfu/slotstream/pull/143
os: macOS 15.7.4, build 24G517
ram_gb: '32'
ssd: APPLE SSD AP0256Z 256 GB internal; WD_BLACK SN8100 2 TB external; Samsung SSD 960 EVO 250 GB external
title: Mac mini M4 32 GiB, three checkpoint copies on three devices
---
Mac mini (Mac16,10), Apple M4, 34359738368 bytes RAM, macOS 15.7.4 build 24G517.
Three checkpoint copies on three physical devices: internal APPLE SSD AP0256Z 256 GB,
external WD_BLACK SN8100 2 TB (PCI-Express), and external Samsung SSD 960 EVO 250 GB
(PCI-Express). It is the same Mac as [[records/machines/mac-mini-m4-32gb-mirror-review]],
with a third copy added.

The machine serves a production workload with `--memory-gb 27`, MTP and vision on and all three
copies passed as `--mirror`. Runs on it stop production first, then a local cleanup script stops
user applications and the run waits 60 s before starting. Serial numbers, volume UUIDs, user
names and hostnames are excluded.

`iogpu.wired_limit_mb` is set to 28700 at boot, and `slotstream doctor` reports a 30.1 GB Metal working set on this machine.