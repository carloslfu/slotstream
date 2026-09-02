---
type: measurement
id: 01m1hhwmqew7pgmv3zp836w6c9
created: 2026-09-02T17:15:26.830082+00:00
updated: 2026-09-02T17:15:26.830082+00:00
summary: The fastest path is not the WAN at all
date: 2026-09-02
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M11
order: '630'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: The fastest path is not the WAN at all
status: measured
---

For a second Mac or a team: a peer copy over 10 GbE takes about 1.5 minutes,
over a Thunderbolt bridge about 1 minute, and an external SSD is faster than
any link. A `pull --from <peer>` mode would beat every hosting change for
repeat installs; nothing here is implemented.
