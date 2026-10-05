---
type: run
created: 2026-10-05T03:59:34.169072+00:00
updated: 2026-10-05T03:59:34.169072+00:00
summary: Freeze and validate the exact existing retirement helper closure without scanning or retiring tensor payloads
binary: Frozen Python helpers copied from f3999859fca490fe8fa2eda4bfe0b05a4c51406f
captured_at: 2026-10-04
command: source_pins; metadata-only validate with original and frozen helpers; no run invocation
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
discarded: false
title: Research payload retirement protocol freeze
tool: research_payload_retirement and its existing bounded resource protocol
---

The existing metadata-only retirement plan now has an execution protocol and a separately copied exact helper closure. Both the original and copied helpers validate the protocol, preserved metadata and source custody. The protocol digest is `5d24cab202529e3ce1fa39e37c796ba630fac162fb6cd8de55d90fce412a1a97`. It still names precisely the earlier losing affine refit and redundant contiguous VQ copies and retains the unchanged resource envelope, exclusion lock, full-payload authentication and durable per-file retirement rules. This preparation reads only code and metadata; the full tensor scan and deletion have not run.

The physical execution prerequisite is completion and final analysis of the active frozen quality continuation, followed by actual process ownership and memory admission. The command then uses the copied helper at `.build/quantization-research/payload-retirement-protocol-v1/runner/Tools/research_payload_retirement.py`, its protocol JSON, the exact digest, and `.build/quantization-research` as root. It creates `payload-retirement-run-v1` exclusively. Any failure retains its receipt and is not silently retried. The standalone export execution protocol is frozen only after actual cleanup has made room, as required by that driver's contract. No export or public pull is performed here.

## protocol.json

Local evidence: `.build/quantization-research/payload-retirement-protocol-v1/protocol.json`; bytes: 1914; SHA-256: `5d24cab202529e3ce1fa39e37c796ba630fac162fb6cd8de55d90fce412a1a97`.

```json
{
  "kind": "authenticated-research-retirement-v1",
  "plan": "standalone-space-preparation-v2/plan.json",
  "plan_sha256": "faf90a122ad1cd8cf72f253150f6937daa13ffb5214ce77bd6ade73c9491851d",
  "report": "payload-retirement-run-v1",
  "schema": 1,
  "source_sha256": {
    "Tools/affine_expert_control.py": "24ed33aad9aac7f75593650535d995420add389b74cb33aa6b359b4427015908",
    "Tools/context_qualification.py": "ee929fe7433fe6287af2b5591dafc960315f2ed5d31902882cfd7d0c9a9f15e8",
    "Tools/memory_gate.py": "fed53adbbc761457f94e11ded179915d538b515d448dc029ff3f0604f7faf6fc",
    "Tools/prefill_bench.py": "000868d66f82cd1eba5973c0fa9b4259831a6bdbc5bcf7d4c4f858d86c71d472",
    "Tools/quantization_inventory.py": "af0220f7dde0b783fd5800ed2f0ee5545ed30bd855cf6d34d6a79820c9ef47cb",
    "Tools/quantization_quality.py": "99c99d16ee7bbb8576156fe5e8971a74ce243642bff240f855613c3ec0d135f8",
    "Tools/research_payload_retirement.py": "bb425367d49746adb55abb22faab9d1a4d89051f372afe397753bd883e4b1776",
    "Tools/slotpack/pack.py": "a8c671f40a366b92c5edc58af2aaa3faee5bd0adbf26bb569b57c93a5de9b720",
    "Tools/standalone_bundle.py": "9fc487691e6593027a68ad2453907ab45c92eed6ace9b566ce5bd176fc57c632",
    "Tools/tensor_subset.py": "ea29d68c2496eba6cd50e3cadad5119a9ebbc44a875970a3e136c145bf5484a8",
    "Tools/vq_dense_overlay.py": "34d3ed2bf55371cbc3472c48e54cd3c5b0006ba9dbfe6289b6506511b5477684",
    "Tools/vq_execution_profile.py": "0e298b9a73df41d55e1191ffdcbf5cc778112e7dae309e6a3b647080c1f4ce91",
    "Tools/vq_fused_reference.py": "0b7c71fbead91611460a5466f3082ca576301e95766dcee69bb82476feb85749",
    "Tools/vq_kernel_sources.py": "30929f4be32dd352a957a81deb22f7120dedce11ecd78fc3cdff4bb714ff4b0e",
    "Tools/vq_model_reference.py": "315dfb1b2ae098f35b68b074a29c1dc0e0e7986c806012cdc16cea00794ac506",
    "Tools/vq_ple_stream.py": "8e784edda032ac88dd8771e3e6337f8a59e78e14c5b8845c6e7808642f5ce33e"
  }
}

```

## preparation.json

Local evidence: `.build/quantization-research/payload-retirement-protocol-v1/preparation.json`; bytes: 2140; SHA-256: `35beaa003ae5b2517fd0da1d4bcfbd3936a8479a906fbf800e23d368d764650e`.

```json
{
  "schema": 1,
  "executed": false,
  "protocol_sha256": "5d24cab202529e3ce1fa39e37c796ba630fac162fb6cd8de55d90fce412a1a97",
  "source_sha256": {
    "Tools/affine_expert_control.py": "24ed33aad9aac7f75593650535d995420add389b74cb33aa6b359b4427015908",
    "Tools/context_qualification.py": "ee929fe7433fe6287af2b5591dafc960315f2ed5d31902882cfd7d0c9a9f15e8",
    "Tools/memory_gate.py": "fed53adbbc761457f94e11ded179915d538b515d448dc029ff3f0604f7faf6fc",
    "Tools/prefill_bench.py": "000868d66f82cd1eba5973c0fa9b4259831a6bdbc5bcf7d4c4f858d86c71d472",
    "Tools/quantization_inventory.py": "af0220f7dde0b783fd5800ed2f0ee5545ed30bd855cf6d34d6a79820c9ef47cb",
    "Tools/quantization_quality.py": "99c99d16ee7bbb8576156fe5e8971a74ce243642bff240f855613c3ec0d135f8",
    "Tools/research_payload_retirement.py": "bb425367d49746adb55abb22faab9d1a4d89051f372afe397753bd883e4b1776",
    "Tools/slotpack/pack.py": "a8c671f40a366b92c5edc58af2aaa3faee5bd0adbf26bb569b57c93a5de9b720",
    "Tools/standalone_bundle.py": "9fc487691e6593027a68ad2453907ab45c92eed6ace9b566ce5bd176fc57c632",
    "Tools/tensor_subset.py": "ea29d68c2496eba6cd50e3cadad5119a9ebbc44a875970a3e136c145bf5484a8",
    "Tools/vq_dense_overlay.py": "34d3ed2bf55371cbc3472c48e54cd3c5b0006ba9dbfe6289b6506511b5477684",
    "Tools/vq_execution_profile.py": "0e298b9a73df41d55e1191ffdcbf5cc778112e7dae309e6a3b647080c1f4ce91",
    "Tools/vq_fused_reference.py": "0b7c71fbead91611460a5466f3082ca576301e95766dcee69bb82476feb85749",
    "Tools/vq_kernel_sources.py": "30929f4be32dd352a957a81deb22f7120dedce11ecd78fc3cdff4bb714ff4b0e",
    "Tools/vq_model_reference.py": "315dfb1b2ae098f35b68b074a29c1dc0e0e7986c806012cdc16cea00794ac506",
    "Tools/vq_ple_stream.py": "8e784edda032ac88dd8771e3e6337f8a59e78e14c5b8845c6e7808642f5ce33e"
  },
  "frozen_helper_bytes": 198274,
  "validated_metadata_only": true,
  "payloads_hashed": 0,
  "payloads_retired": 0,
  "planned_files": 96,
  "planned_allocated_bytes": 100714610688,
  "prerequisite": "Complete the active quality continuation and its final analysis; inspect actual process ownership before the one heavy execution slot is used."
}

```

## frozen-validation.json

Local evidence: `.build/quantization-research/payload-retirement-protocol-v1/frozen-validation.json`; bytes: 157; SHA-256: `1f28f998f1f220337d2b58131cd471d99efde1308f46a4269f50fc8777a79f6f`.

```json
{
  "validated_frozen_helpers": true,
  "executed": false,
  "report_exists": false,
  "payloads_hashed": 0,
  "payloads_retired": 0,
  "source_files": 16
}

```
