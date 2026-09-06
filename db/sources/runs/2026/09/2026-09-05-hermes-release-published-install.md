---
type: run
id: 01m1ta5cfj59s8vddkkav9zy4m
created: 2026-09-06T02:53:34.577539+00:00
updated: 2026-09-06T02:53:34.636791+00:00
summary: 'Hermes 0.2.8: public release and installed-client verification'
binary: 3ccf3e9e8b5989e3f4bb85e3ba5ec51c48e9dba7fea68c2e7811bcc27a2316c8
captured_at: 2026-09-06T02:53:09.173172+00:00
command: GitHub Actions release run 34006921406; public installer; python3 /tmp/slotstream-hermes-published-install-test.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Hermes 0.2.8: public release and installed-client verification'
tool: GitHub release, checksum, signed provenance, installer, runtime, Hermes
---
Version 0.2.8 was published by GitHub Actions, downloaded, verified, installed through the public installer, and exercised with the real released Hermes client. The installed binary and Metal library match the exact CI asset bytes. Both the public archive SHA-256 and signed provenance were verified; the attestation names the release workflow, tag, source commit and archive digest below. No locally built package was uploaded.

The prior local Hermes installation remains intact in its original release directory. The ordinary `slotstream --version` command was run outside the development repository and returned 0.2.8. The installer ran detached from a controlling terminal so it did not automatically launch an unbounded auto-sized server. Runtime checks and an explicit context/vision doctor plan passed.

The actual installed release then served --memory-gb 11 --max-context 65536 --vision on --mtp off after the model/build lock cleared and reclaimable memory was checked. Real Hermes terminal execution, follow-up recall, title fallback, vision discovery and the image answer passed. The actual Hermes CLI returned OK and exited zero. All owned servers were stopped after testing. The helper permitted only the real terminal dispatcher reading a synthetic fixture, used isolated Hermes state and a placeholder key, and blocked non-loopback network connections. The CLI's attempted GitHub update check was blocked; all inference stayed local.

This additional run verifies the published CI artifact and installation. It does not repeat the separately preserved full-window text memory measurement, the forced-compaction fixture, or every wire regression. Those release qualification results are linked from the measurement record and share the same source implementation; their exact local build identities remain explicit.

The receipt below selects directly from the native client outputs, drops repeated fixture messages and inline image bytes, and preserves hashes of the complete local captures. The publication, signed provenance, tagged source archive, and all synthetic client captures are retained locally under `.build/hermes-release-v0.2.8/`. The issue remains open and no reply was posted.

## Publication, provenance and installed-client receipt

```json
{
  "recorded_at": "2026-09-06T02:53:09.173172+00:00",
  "release": {
    "tagName": "v0.2.8",
    "url": "https://github.com/carloslfu/slotstream/releases/tag/v0.2.8",
    "publishedAt": "2026-09-06T02:44:43Z",
    "isDraft": false,
    "isPrerelease": false
  },
  "assets": [
    "slotstream-arm64.tar.gz",
    "slotstream-arm64.tar.gz.sha256"
  ],
  "release_ci": {
    "databaseId": 34006921406,
    "headSha": "f05b15dfa4d109ae32b882688ce615c3454cffe1",
    "conclusion": "success",
    "url": "https://github.com/carloslfu/slotstream/actions/runs/34006921406"
  },
  "install": {
    "verified_at": "2026-09-06T02:48:37.215286+00:00",
    "tag": "v0.2.8",
    "source_commit": "f05b15dfa4d109ae32b882688ce615c3454cffe1",
    "public_release": "https://github.com/carloslfu/slotstream/releases/tag/v0.2.8",
    "build_workflow": "https://github.com/carloslfu/slotstream/actions/runs/34006921406",
    "archive_sha256": "d1266daed642951cbfba22f75c1bcd7b321c5356738c14a0858d15f2ec4da817",
    "installed_binary_sha256": "3ccf3e9e8b5989e3f4bb85e3ba5ec51c48e9dba7fea68c2e7811bcc27a2316c8",
    "installed_metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "ordinary_path_command_version": "0.2.8",
    "bin_symlink": "releases/d1266daed642951cbfba22f75c1bcd7b321c5356738c14a0858d15f2ec4da817-macos26",
    "previous_bin_symlink": "releases/local-hermes-800502693480a7187f81fab231f8516dccc56a7926894e7c0e8c2ce2480ed3f8",
    "previous_binary_sha256": "800502693480a7187f81fab231f8516dccc56a7926894e7c0e8c2ce2480ed3f8",
    "previous_install_retained": true,
    "installer_exit_code": 0,
    "checksum_exit_code": 0,
    "provenance_verification_exit_code": 0,
    "installer_command": "SLOTSTREAM_RELEASE_BASE=https://github.com/carloslfu/slotstream/releases/download/v0.2.8 sh install.sh",
    "installer_source_commit": "f05b15dfa4d109ae32b882688ce615c3454cffe1",
    "installer_automatic_launch_disabled_by_detached_session": true
  },
  "installed_identity": {
    "binary_sha256": "3ccf3e9e8b5989e3f4bb85e3ba5ec51c48e9dba7fea68c2e7811bcc27a2316c8",
    "version": "0.2.8",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "tag": "v0.2.8",
    "source_commit": "f05b15dfa4d109ae32b882688ce615c3454cffe1"
  },
  "hermes_release_tag": "v2026.8.31",
  "hermes_release_commit": "29112bef099274229cadff79cdff7bf7b99c4b77",
  "installed_client_phases": [
    {
      "name": "runtime-check",
      "command": [
        "/Users/carlos/.slotstream/bin/slotstream",
        "runtime-check"
      ],
      "exit": 0,
      "seconds": 0.02413733396679163
    },
    {
      "name": "doctor",
      "command": [
        "/Users/carlos/.slotstream/bin/slotstream",
        "doctor",
        "--memory-gb",
        "11",
        "--max-context",
        "65536",
        "--vision",
        "on",
        "--mtp",
        "off",
        "--json"
      ],
      "exit": 0,
      "seconds": 0.08976624999195337
    },
    {
      "name": "hermes-release",
      "command": [
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release/.venv/bin/python",
        "/tmp/slotstream-hermes-release-candidate/Tools/hermes_integration_gate.py",
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release",
        "/tmp/slotstream-hermes-published-install-evidence/hermes-release",
        "--image",
        "/tmp/slotstream-hermes-release-candidate/Tools/assets/vision_test/secret1.jpg"
      ],
      "exit": 0,
      "seconds": 136.7764101671055
    },
    {
      "name": "hermes-cli",
      "command": [
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release/.venv/bin/python",
        "/tmp/slotstream-hermes-release-candidate/Tools/hermes_integration_gate.py",
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release",
        "/tmp/slotstream-hermes-published-install-evidence/hermes-cli",
        "--cli"
      ],
      "exit": 0,
      "seconds": 64.72428974998184
    }
  ],
  "clients": {
    "hermes-release": {
      "context_length": 65536,
      "compression_threshold": 52224,
      "ollama_num_ctx": 65536,
      "title": "Diagnose local Hermes and Slotstream integration",
      "vision_discovered": true,
      "passed": true,
      "main_output_budgets": [
        4096,
        4096,
        4096,
        4096
      ],
      "executions": [
        {
          "name": "terminal",
          "args": {
            "command": "cat diagnostic.txt"
          },
          "result": "{\"output\": \"HERMES_SLOTSTREAM_INTEGRATION_42\", \"exit_code\": 0, \"error\": null}"
        }
      ],
      "tool_turn": {
        "final_response": "HERMES_SLOTSTREAM_INTEGRATION_42",
        "api_calls": 2,
        "completed": true,
        "turn_exit_reason": "text_response(finish_reason=stop)",
        "failed": false,
        "partial": false,
        "interrupted": false,
        "response_transformed": false,
        "pre_transform_response": null,
        "response_previewed": false,
        "model": "qwen3.8-flash-next:4bit",
        "provider": "custom",
        "base_url": "http://127.0.0.1:11434/v1",
        "input_tokens": 3156,
        "output_tokens": 37,
        "cache_read_tokens": 3138,
        "cache_write_tokens": 0,
        "reasoning_tokens": 0,
        "prompt_tokens": 6294,
        "completion_tokens": 37,
        "total_tokens": 6331,
        "last_prompt_tokens": 3183,
        "estimated_cost_usd": 0.0,
        "cost_status": "unknown",
        "cost_source": "none",
        "service_tier": null
      },
      "followup": {
        "final_response": "The file `diagnostic.txt` contained exactly:\n\n```\nHERMES_SLOTSTREAM_INTEGRATION_42\n```",
        "api_calls": 1,
        "completed": true,
        "turn_exit_reason": "text_response(finish_reason=stop)",
        "failed": false,
        "partial": false,
        "interrupted": false,
        "response_transformed": false,
        "pre_transform_response": null,
        "response_previewed": false,
        "model": "qwen3.8-flash-next:4bit",
        "provider": "custom",
        "base_url": "http://127.0.0.1:11434/v1",
        "input_tokens": 3187,
        "output_tokens": 62,
        "cache_read_tokens": 6331,
        "cache_write_tokens": 0,
        "reasoning_tokens": 0,
        "prompt_tokens": 9518,
        "completion_tokens": 62,
        "total_tokens": 9580,
        "last_prompt_tokens": 3224,
        "estimated_cost_usd": 0.0,
        "cost_status": "unknown",
        "cost_source": "none",
        "service_tier": null
      },
      "image_turn": {
        "final_response": "Dog",
        "api_calls": 1,
        "completed": true,
        "turn_exit_reason": "text_response(finish_reason=stop)",
        "failed": false,
        "partial": false,
        "interrupted": false,
        "response_transformed": false,
        "pre_transform_response": null,
        "response_previewed": false,
        "model": "qwen3.8-flash-next:4bit",
        "provider": "custom",
        "base_url": "http://127.0.0.1:11434/v1",
        "input_tokens": 6986,
        "output_tokens": 63,
        "cache_read_tokens": 6331,
        "cache_write_tokens": 0,
        "reasoning_tokens": 0,
        "prompt_tokens": 13317,
        "completion_tokens": 63,
        "total_tokens": 13380,
        "last_prompt_tokens": 3799,
        "estimated_cost_usd": 0.0,
        "cost_status": "unknown",
        "cost_source": "none",
        "service_tier": null
      },
      "blocked_nonlocal_connection_count": 0,
      "complete_result_sha256": "6008ed7b78a40562eeeb9395ee986d9e3e87a6e5fde558419d666f92f1a371a6",
      "complete_http_sha256": "d79faf638baf358fc378612d367ec4b07e4de0e8c879f8193b66f97022f822e9"
    },
    "hermes-cli": {
      "cli_exit": 0,
      "passed": true,
      "cli_answers": [
        "OK"
      ],
      "main_output_budgets": [
        4096
      ],
      "executions": [],
      "blocked_nonlocal_connection_count": 0,
      "complete_result_sha256": "fcaa814a46d92e3df47f258108b01aa104c07a007f3eadaf11f93606a37909b2",
      "complete_http_sha256": "f03af18c47115102906ac8174f93fc5f3415cae4513119f113db55de5a52f0be"
    }
  },
  "owned_test_server_stopped": true,
  "provenance_verification": {
    "certificate": {
      "certificateIssuer": "CN=sigstore-intermediate,O=sigstore.dev",
      "subjectAlternativeName": "https://github.com/carloslfu/slotstream/.github/workflows/release.yml@refs/tags/v0.2.8",
      "issuer": "https://token.actions.githubusercontent.com",
      "githubWorkflowTrigger": "push",
      "githubWorkflowSHA": "f05b15dfa4d109ae32b882688ce615c3454cffe1",
      "githubWorkflowName": "release",
      "githubWorkflowRepository": "carloslfu/slotstream",
      "githubWorkflowRef": "refs/tags/v0.2.8",
      "buildSignerURI": "https://github.com/carloslfu/slotstream/.github/workflows/release.yml@refs/tags/v0.2.8",
      "buildSignerDigest": "f05b15dfa4d109ae32b882688ce615c3454cffe1",
      "runnerEnvironment": "github-hosted",
      "sourceRepositoryURI": "https://github.com/carloslfu/slotstream",
      "sourceRepositoryDigest": "f05b15dfa4d109ae32b882688ce615c3454cffe1",
      "sourceRepositoryRef": "refs/tags/v0.2.8",
      "sourceRepositoryIdentifier": "1349285058",
      "sourceRepositoryOwnerURI": "https://github.com/carloslfu",
      "sourceRepositoryOwnerIdentifier": "5993168",
      "buildConfigURI": "https://github.com/carloslfu/slotstream/.github/workflows/release.yml@refs/tags/v0.2.8",
      "buildConfigDigest": "f05b15dfa4d109ae32b882688ce615c3454cffe1",
      "buildTrigger": "push",
      "runInvocationURI": "https://github.com/carloslfu/slotstream/actions/runs/34006921406/attempts/1",
      "sourceRepositoryVisibilityAtSigning": "public"
    },
    "statement": {
      "_type": "https://in-toto.io/Statement/v1",
      "subject": [
        {
          "name": "slotstream-arm64.tar.gz",
          "digest": {
            "sha256": "d1266daed642951cbfba22f75c1bcd7b321c5356738c14a0858d15f2ec4da817"
          }
        }
      ],
      "predicateType": "https://slsa.dev/provenance/v1",
      "predicate": {
        "buildDefinition": {
          "buildType": "https://actions.github.io/buildtypes/workflow/v1",
          "externalParameters": {
            "workflow": {
              "path": ".github/workflows/release.yml",
              "ref": "refs/tags/v0.2.8",
              "repository": "https://github.com/carloslfu/slotstream"
            }
          },
          "internalParameters": {
            "github": {
              "event_name": "push",
              "repository_id": "1349285058",
              "repository_owner_id": "5993168",
              "runner_environment": "github-hosted"
            }
          },
          "resolvedDependencies": [
            {
              "digest": {
                "gitCommit": "f05b15dfa4d109ae32b882688ce615c3454cffe1"
              },
              "uri": "git+https://github.com/carloslfu/slotstream@refs/tags/v0.2.8"
            }
          ]
        },
        "runDetails": {
          "builder": {
            "id": "https://github.com/carloslfu/slotstream/.github/workflows/release.yml@refs/tags/v0.2.8"
          },
          "metadata": {
            "invocationId": "https://github.com/carloslfu/slotstream/actions/runs/34006921406/attempts/1"
          }
        }
      }
    },
    "verified_timestamps": [
      {
        "type": "Tlog",
        "uri": "https://rekor.sigstore.dev",
        "timestamp": "2026-09-05T21:44:38-05:00"
      }
    ]
  }
}
```

## installed-preflight.json

```json
{
  "reclaimable_gb": 36.269719552,
  "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   117607.\nPages active:                                1283472.\nPages inactive:                              1114670.\nPages speculative:                            205374.\nPages throttled:                                   0.\nPages wired down:                             228933.\nPages purgeable:                               13613.\n\"Translation faults\":                    14392361642.\nPages copy-on-write:                       661541238.\nPages zero filled:                       18026728015.\nPages reactivated:                        3115255360.\nPages purged:                               66804066.\nFile-backed pages:                           2082508.\nAnonymous pages:                              521008.\nPages stored in compressor:                  1605555.\nPages occupied by compressor:                 130558.\nDecompressions:                           1117645542.\nCompressions:                             1423188983.\nPageins:                                  6810026998.\nPageouts:                                   10899923.\nSwapins:                                    42685814.\nSwapouts:                                   74277638.\nPages tagged:                                 155243.\nPages tagged resident:                        123977.\nPages tagged compressed:                       31266.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         4990.\nPages tag-storage non-tag pageable:            86507.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5601024.\nTagged compressions:                        10455932.\nTagged decompressions:                       9650784.\n",
  "model_pids": "",
  "lock": "",
  "builds": ""
}
```

## runtime-check.log

```text
PASS  process physical footprint is readable
PASS  process RSS high-water is readable
PASS  prefix cache reaches its four-entry bound
PASS  an identical history replaces instead of duplicating an entry
PASS  a miss evicts before allocating a fifth state
PASS  a smaller live token ceiling evicts immediately
PASS  held GB includes fixed recurrent state
PASS  identical bytes hash alike
PASS  different bytes do not
PASS  the same image at the same offset matches
PASS  a swapped image does not
PASS  an entry ending inside a run still matches that run
PASS  a text-only entry rejects a prompt with an image inside its range
PASS  an image beyond the entry's range is irrelevant to the match
PASS  a vision conversation is held, not discarded
PASS  the same ids with a different picture miss
PASS  the text-only splice never sees a vision entry
PASS  prefix splice chooses the longest retained extension
PASS  prefix splice is strict, not an identical-history match
PASS  prefix splice lookup does not consume the retained state
PASS  a disabled prefix cache offers no splice
PASS  shard listing works through a symlinked model dir
PASS  8.1 GB plan stays inside its target
PASS  10.0 GB plan stays inside its target
PASS  16.0 GB plan stays inside its target
PASS  30.0 GB plan stays inside its target
RUNTIME CHECK PASS
```

## doctor.log

```text
{
  "availability_clamped" : false,
  "device_available_gb" : 39.5,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 771.01176470588018,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 2.8999999999999999,
  "expected_peak_gb" : 10,
  "experts_per_layer_cached" : 15,
  "fully_resident" : false,
  "max_context_tokens" : 65536,
  "max_ram_percent" : 70,
  "mtp" : false,
  "pool_gb" : 1.8999999999999999,
  "pool_slots" : 696,
  "prefill_chunk" : 256,
  "prefix_cache_max_tokens" : 10445,
  "source" : "--memory-gb",
  "target_gb" : 11,
  "vision" : true,
  "vision_resident_gb" : 0.90000000000000002
}
```

## api-version.json

```json
{
  "version": "0.2.8"
}
```

## Installed-client runner completion

```text
WAIT installed: another model/build is active
PREFLIGHT installed: reclaimable GB=36.269719552
START runtime-check
END runtime-check exit=0
START doctor
END doctor exit=0
START published installed client server
START hermes-release
END hermes-release exit=0
START hermes-cli
END hermes-cli exit=0
Owned installed server stopped: 3190
PUBLISHED INSTALL HERMES PASS
Installed runner cleanup complete
```
