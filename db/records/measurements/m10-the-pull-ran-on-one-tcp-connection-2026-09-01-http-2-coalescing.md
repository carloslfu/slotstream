---
type: measurement
id: 01m1hhwmb6p4dsyvr6403k4vch
created: 2026-09-02T17:15:26.438529+00:00
updated: 2026-09-02T17:15:26.438529+00:00
summary: 'M10 — The pull ran on one TCP connection (2026-09-01): HTTP/2 coalescing, measured and fixed'
date: 2026-09-01
doc: measurements
level: '2'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M10
order: '510'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'M10 — The pull ran on one TCP connection (2026-09-01): HTTP/2 coalescing, measured and fixed'
status: measured
---

A user reported a 22 MB/s average for the whole 104 GB. The investigation
overturned three numbers this document had published, all measured from the
same home link in Popayán, and found that `pull` had never opened more than
one TCP connection.
