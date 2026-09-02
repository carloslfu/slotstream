---
type: machine
id: 01m1hhwk08st1mah9tte0qt4w9
created: 2026-09-02T17:15:25.064634+00:00
updated: 2026-09-02T17:15:25.064634+00:00
summary: A Linux host on a 1 Gbit/s datacenter port in Helsinki, used through Docker for the weight-download measurements in M10 and M11.
kind: linux-host
link: 1 Gbit/s datacenter port, Helsinki
os: Linux, Docker
title: Linux host, Helsinki, 1 Gbit/s port (download measurements)
---

The vantage point for the parallel-download measurements of 2026-09-01 and
2026-09-02 (`Tools/pull_bench_linux.sh` runs the exact pull code in Docker).
It exists in the store so a download number can say which link it was
measured on: from this port Hugging Face, R2 direct, and Cloudflare's edge
all fill 1 Gbit/s at eight connections, while the home link in Popayán caps
every host alike. No hostname or address is recorded here.
