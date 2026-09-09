---
type: run
id: 01m2238jmzy6566v09y37frm1w
created: 2026-09-09T03:26:54.623465+00:00
updated: 2026-09-09T03:26:54.651397+00:00
summary: Final Hermes configuration regression and cleanup verification
binary: Hermes b1f003e18633298d549668b8e186af84cca45b76 and 4a39a3ff8bea45ab5a6b646ce26ced88a8fed079; synthetic HTTP
captured_at: 2026-09-08
command: Hermes Python Tools/hermes_config_gate.py SOURCE OUTPUT (both recorded commits); ps and lsof cleanup checks
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Final Hermes configuration regression and cleanup verification
tool: Tools/hermes_config_gate.py
---
Both full configuration suites rerun after final test review. The failed-summary assertion now sits outside the exception handler, so an unexpected successful response cannot be mistaken for the expected failure. Actual captured failure responses were also checked for their expected local HTTP status. Earlier detailed wire receipts remain unchanged. The owned native test server was stopped after the live client and protocol gates; process and port checks found it absent.

```json
{
  "gate_sha256": "fdedc6abecc3f9f42e780541d6ad3ccfacdbc6d86bce8a7e7d5a5d5c25bddf0d",
  "guide_yaml_sha256": "ba683cf7d66b1f219071f03471e70488fcc2057076717619128debcbb870a6c0",
  "results": {
    "latest": {
      "passed": true,
      "cases": [
        {
          "case": "clean",
          "passed": true,
          "error": null
        },
        {
          "case": "conflicting_custom",
          "passed": true,
          "error": null
        },
        {
          "case": "reasoning_medium",
          "passed": true,
          "error": null
        },
        {
          "case": "changed_limit",
          "passed": true,
          "error": null
        },
        {
          "case": "missing_provider",
          "passed": true,
          "error": null
        },
        {
          "case": "disabled_provider",
          "passed": true,
          "error": null
        },
        {
          "case": "unavailable",
          "passed": true,
          "error": null
        },
        {
          "case": "unauthorized",
          "passed": true,
          "error": null
        },
        {
          "case": "truncated_summary",
          "passed": true,
          "error": null
        },
        {
          "case": "empty_summary",
          "passed": true,
          "error": null
        },
        {
          "case": "sticky_profile_override",
          "passed": true,
          "error": null
        }
      ],
      "failure_statuses_verified": true
    },
    "reported_version": {
      "passed": true,
      "cases": [
        {
          "case": "clean",
          "passed": true,
          "error": null
        },
        {
          "case": "conflicting_custom",
          "passed": true,
          "error": null
        },
        {
          "case": "reasoning_medium",
          "passed": true,
          "error": null
        },
        {
          "case": "changed_limit",
          "passed": true,
          "error": null
        },
        {
          "case": "missing_provider",
          "passed": true,
          "error": null
        },
        {
          "case": "disabled_provider",
          "passed": true,
          "error": null
        },
        {
          "case": "unavailable",
          "passed": true,
          "error": null
        },
        {
          "case": "unauthorized",
          "passed": true,
          "error": null
        },
        {
          "case": "truncated_summary",
          "passed": true,
          "error": null
        },
        {
          "case": "empty_summary",
          "passed": true,
          "error": null
        },
        {
          "case": "sticky_profile_override",
          "passed": true,
          "error": null
        }
      ],
      "failure_statuses_verified": true
    }
  },
  "owned_server_stopped": true,
  "port_11434_has_no_listener": true
}
```
