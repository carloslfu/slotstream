---
type: run
id: 01m223hxwtwx67mhxk7dtmgegz
created: 2026-09-09T03:32:01.050546+00:00
updated: 2026-09-09T03:32:01.081125+00:00
summary: Hermes local endpoint proxy exclusions
binary: Hermes b1f003e18633298d549668b8e186af84cca45b76 and 4a39a3ff8bea45ab5a6b646ce26ced88a8fed079
captured_at: 2026-09-08
command: 'Isolated Hermes Python: resolve local endpoint with HTTP_PROXY, then repeat with NO_PROXY and no_proxy loopback exclusions'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Hermes local endpoint proxy exclusions
tool: agent.process_bootstrap._get_proxy_for_base_url
---
Pure proxy-selection function check, without HTTP or inference. For each recorded Hermes commit, a clean child environment calls agent.process_bootstrap._get_proxy_for_base_url first with HTTP_PROXY set to a synthetic loopback proxy, then with both NO_PROXY and no_proxy set to localhost,127.0.0.1. The selected proxy must disappear for both guide endpoint spellings. This is a configuration-layer check, not evidence about any reported laptop settings or an actual proxy server.

```json
{
  "latest": {
    "without_exclusion": "http://127.0.0.1:17897",
    "with_exclusion_localhost": null,
    "with_exclusion_loopback_ip": null,
    "passed": true
  },
  "reported_version": {
    "without_exclusion": "http://127.0.0.1:17897",
    "with_exclusion_localhost": null,
    "with_exclusion_loopback_ip": null,
    "passed": true
  }
}
```
