---
type: run
id: 01m1vqjsr7ms36we5ke9z1cmpb
created: 2026-09-06T16:07:20.071120+00:00
updated: 2026-09-06T16:07:20.103681+00:00
summary: The released v0.2.10 client follows live free static redirects and reconstructs missing original files from Hugging Face with zero raw fallback.
binary: a4f5badd6fcf4c1d6b353dbac1067a83056e1b80e9663647384691fa906126e2
captured_at: 2026-09-06
command: v0.2.10 slotstream pull --dir isolated-legacy-test; independently hash reconstructed config.json, tokenizer.json and model-00011.safetensors
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Hugging Face legacy URL and released-client compatibility
tool: Unmodified v0.2.10 CLI, independent hashes, live HTTP and deployed asset configuration
---
The unchanged public v0.2.10 binary follows its built-in weights.sevra.page URLs through the live static asset redirects to the exact Hugging Face package. A separate test directory reuses the previously qualified original installation through read-only final-file symlinks, while deliberately omitting config.json, tokenizer.json and model-00011.safetensors. The real client reconstructs these missing files, independently checked afterward, and retains the reused files unchanged. This is a compatibility/reconstruction check, not a second complete fresh download or a timing benchmark. It ran alongside the fresh Mac pull, so their timings are not suitable for a host-performance comparison.

The domain is detached from R2 and attached to the assets-only deployment. A no-follow public request returns the expected redirect. The deployed assets configuration serves directly with no Worker-first invocation and no bindings. The redundant bucket remains until the complete fresh Mac pull passes.

## Earlier released client

```json
{
  "pass_": true,
  "version": "0.2.10",
  "binarySHA256": "a4f5badd6fcf4c1d6b353dbac1067a83056e1b80e9663647384691fa906126e2",
  "defaultSource": true,
  "source": "legacy weights.sevra.page redirect to Hugging Face",
  "files": [
    {
      "optional": false,
      "path": "config.json",
      "sha256": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
      "size": 33408
    },
    {
      "optional": false,
      "path": "model-00011.safetensors",
      "sha256": "9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0",
      "size": 2192353120
    },
    {
      "optional": false,
      "path": "tokenizer.json",
      "sha256": "0997f410c57a1f4e53b09e4be8f4a172d90edd9564368fb0847030937229b9f3",
      "size": 12809320
    }
  ],
  "reusedFiles": 22,
  "reuseSource": "Previously qualified original installation; read-only symlinks",
  "secondsDiagnostic": 209.776128375,
  "clientOutput": "compressed pull: 2.22 GB remaining, 8 connections; verified chunks resume automatically\nconnection tuning starts at 8, capped at 32; extra connections must improve throughput\n0.0% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 22/25 files verified\nverified config.json\n0.0% verified \u00b7 3.6 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n0.0% verified \u00b7 7.8 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n0.0% verified \u00b7 6.8 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n0.0% verified \u00b7 10.0 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n0.0% verified \u00b7 12.0 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n0.0% verified \u00b7 9.7 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n1.4% verified \u00b7 8.1 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n1.4% verified \u00b7 4.7 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n1.4% verified \u00b7 7.9 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n1.4% verified \u00b7 4.7 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n1.4% verified \u00b7 5.0 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n1.4% verified \u00b7 4.8 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n1.4% verified \u00b7 5.6 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n1.4% verified \u00b7 6.4 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\ndownload connection trial: 16 active\n2.9% verified \u00b7 5.6 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n2.9% verified \u00b7 7.5 MB/s received \u00b7 ETA measuring \u00b7 23/25 files verified\n4.3% verified \u00b7 9.2 MB/s received \u00b7 ETA 793 s \u00b7 23/25 files verified\n4.3% verified \u00b7 8.4 MB/s received \u00b7 ETA 838 s \u00b7 23/25 files verified\n4.3% verified \u00b7 11.1 MB/s received \u00b7 ETA 882 s \u00b7 23/25 files verified\n4.3% verified \u00b7 9.4 MB/s received \u00b7 ETA 926 s \u00b7 23/25 files verified\n4.3% verified \u00b7 10.5 MB/s received \u00b7 ETA 970 s \u00b7 23/25 files verified\n4.3% verified \u00b7 18.5 MB/s received \u00b7 ETA 1014 s \u00b7 23/25 files verified\n5.8% verified \u00b7 19.1 MB/s received \u00b7 ETA 782 s \u00b7 23/25 files verified\n6.5% verified \u00b7 19.8 MB/s received \u00b7 ETA 718 s \u00b7 23/25 files verified\n8.0% verified \u00b7 21.7 MB/s received \u00b7 ETA 602 s \u00b7 23/25 files verified\n13.7% verified \u00b7 15.7 MB/s received \u00b7 ETA 339 s \u00b7 23/25 files verified\n13.7% verified \u00b7 20.2 MB/s received \u00b7 ETA 351 s \u00b7 23/25 files verified\n16.6% verified \u00b7 20.2 MB/s received \u00b7 ETA 291 s \u00b7 23/25 files verified\n16.6% verified \u00b7 15.4 MB/s received \u00b7 ETA 301 s \u00b7 23/25 files verified\n19.6% verified \u00b7 19.8 MB/s received \u00b7 ETA 254 s \u00b7 23/25 files verified\ndownload connection trial: 32 active\n21.0% verified \u00b7 14.7 MB/s received \u00b7 ETA 240 s \u00b7 23/25 files verified\n21.0% verified \u00b7 18.2 MB/s received \u00b7 ETA 248 s \u00b7 23/25 files verified\n24.7% verified \u00b7 19.7 MB/s received \u00b7 ETA 208 s \u00b7 23/25 files verified\n26.1% verified \u00b7 18.9 MB/s received \u00b7 ETA 198 s \u00b7 23/25 files verified\n26.2% verified \u00b7 21.9 MB/s received \u00b7 ETA 203 s \u00b7 23/25 files verified\n29.0% verified \u00b7 22.4 MB/s received \u00b7 ETA 181 s \u00b7 23/25 files verified\n30.5% verified \u00b7 21.4 MB/s received \u00b7 ETA 173 s \u00b7 23/25 files verified\n30.5% verified \u00b7 21.1 MB/s received \u00b7 ETA 178 s \u00b7 23/25 files verified\n33.4% verified \u00b7 19.8 MB/s received \u00b7 ETA 160 s \u00b7 23/25 files verified\n33.4% verified \u00b7 23.3 MB/s received \u00b7 ETA 164 s \u00b7 23/25 files verified\n33.4% verified \u00b7 25.9 MB/s received \u00b7 ETA 168 s \u00b7 23/25 files verified\n36.2% verified \u00b7 21.1 MB/s received \u00b7 ETA 151 s \u00b7 23/25 files verified\n36.2% verified \u00b7 11.8 MB/s received \u00b7 ETA 155 s \u00b7 23/25 files verified\n36.2% verified \u00b7 14.5 MB/s received \u00b7 ETA 158 s \u00b7 23/25 files verified\n37.0% verified \u00b7 13.8 MB/s received \u00b7 ETA 157 s \u00b7 23/25 files verified\n37.0% verified \u00b7 11.7 MB/s received \u00b7 ETA 160 s \u00b7 23/25 files verified\n38.4% verified \u00b7 10.8 MB/s received \u00b7 ETA 154 s \u00b7 23/25 files verified\n41.3% verified \u00b7 12.3 MB/s received \u00b7 ETA 139 s \u00b7 23/25 files verified\n42.7% verified \u00b7 6.1 MB/s received \u00b7 ETA 134 s \u00b7 23/25 files verified\n44.2% verified \u00b7 9.1 MB/s received \u00b7 ETA 129 s \u00b7 23/25 files verified\n44.2% verified \u00b7 8.1 MB/s received \u00b7 ETA 131 s \u00b7 23/25 files verified\n47.1% verified \u00b7 5.0 MB/s received \u00b7 ETA 119 s \u00b7 23/25 files verified\n47.1% verified \u00b7 8.3 MB/s received \u00b7 ETA 121 s \u00b7 23/25 files verified\n48.5% verified \u00b7 4.8 MB/s received \u00b7 ETA 117 s \u00b7 23/25 files verified\n48.5% verified \u00b7 14.8 MB/s received \u00b7 ETA 119 s \u00b7 23/25 files verified\n49.9% verified \u00b7 20.4 MB/s received \u00b7 ETA 114 s \u00b7 23/25 files verified\n49.9% verified \u00b7 19.4 MB/s received \u00b7 ETA 116 s \u00b7 23/25 files verified\n49.9% verified \u00b7 16.3 MB/s received \u00b7 ETA 118 s \u00b7 23/25 files verified\n49.9% verified \u00b7 14.6 MB/s received \u00b7 ETA 120 s \u00b7 23/25 files verified\n50.6% verified \u00b7 17.8 MB/s received \u00b7 ETA 119 s \u00b7 23/25 files verified\n52.1% verified \u00b7 17.6 MB/s received \u00b7 ETA 114 s \u00b7 23/25 files verified\n52.7% verified \u00b7 9.8 MB/s received \u00b7 ETA 113 s \u00b7 23/25 files verified\n52.7% verified \u00b7 16.4 MB/s received \u00b7 ETA 115 s \u00b7 23/25 files verified\n54.2% verified \u00b7 24.3 MB/s received \u00b7 ETA 110 s \u00b7 23/25 files verified\n55.6% verified \u00b7 22.3 MB/s received \u00b7 ETA 105 s \u00b7 23/25 files verified\n60.0% verified \u00b7 24.2 MB/s received \u00b7 ETA 89 s \u00b7 23/25 files verified\n63.0% verified \u00b7 26.8 MB/s received \u00b7 ETA 80 s \u00b7 23/25 files verified\n64.5% verified \u00b7 24.3 MB/s received \u00b7 ETA 76 s \u00b7 23/25 files verified\n65.9% verified \u00b7 24.8 MB/s received \u00b7 ETA 72 s \u00b7 23/25 files verified\nverified tokenizer.json\n67.7% verified \u00b7 23.8 MB/s received \u00b7 ETA 68 s \u00b7 24/25 files verified\n69.9% verified \u00b7 23.4 MB/s received \u00b7 ETA 62 s \u00b7 24/25 files verified\n75.6% verified \u00b7 19.8 MB/s received \u00b7 ETA 47 s \u00b7 24/25 files verified\n81.3% verified \u00b7 11.1 MB/s received \u00b7 ETA 34 s \u00b7 24/25 files verified\n85.7% verified \u00b7 7.7 MB/s received \u00b7 ETA 25 s \u00b7 24/25 files verified\n87.1% verified \u00b7 7.4 MB/s received \u00b7 ETA 23 s \u00b7 24/25 files verified\n90.0% verified \u00b7 7.1 MB/s received \u00b7 ETA 17 s \u00b7 24/25 files verified\n90.0% verified \u00b7 6.5 MB/s received \u00b7 ETA 17 s \u00b7 24/25 files verified\n94.3% verified \u00b7 6.3 MB/s received \u00b7 ETA 10 s \u00b7 24/25 files verified\n97.1% verified \u00b7 2.5 MB/s received \u00b7 ETA 5 s \u00b7 24/25 files verified\n97.1% verified \u00b7 1.9 MB/s received \u00b7 ETA 5 s \u00b7 24/25 files verified\n97.1% verified \u00b7 2.6 MB/s received \u00b7 ETA 5 s \u00b7 24/25 files verified\n98.6% verified \u00b7 2.2 MB/s received \u00b7 ETA 2 s \u00b7 24/25 files verified\n98.6% verified \u00b7 1.2 MB/s received \u00b7 ETA 2 s \u00b7 24/25 files verified\n98.6% verified \u00b7 1.7 MB/s received \u00b7 ETA 2 s \u00b7 24/25 files verified\nverified model-00011.safetensors\n32 TCP connections observed across the active workers\ndownload verified: 2.22 GB received, 0 raw fallback chunks, 171.1 s\n\nready. next:  slotstream serve     (or: slotstream run --prompt \"...\")\n"
}
```

## Live redirect

```json
{
  "pass_": true,
  "status": 302,
  "location": "https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/13ec15dcebdddc817b57f0f9087c5ef82018f10e/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38/manifest.json"
}
```

## Static delivery configuration

```json
{
  "routes": [
    {
      "id": "4c91fbe5dcce4b37adf39f009f89043a",
      "pattern": "weights.sevra.page/*",
      "script": null,
      "request_limit_fail_open": false
    }
  ],
  "version": {
    "id": "7033ec37-f90f-4e65-a0a8-e57fe1ace98f",
    "assets": {
      "not_found_handling": "404-page",
      "redirects": {
        "version": 1,
        "rules": {
          "/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38/*": {
            "to": "https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/13ec15dcebdddc817b57f0f9087c5ef82018f10e/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38/:splat",
            "status": 302
          }
        },
        "staticRules": {}
      },
      "raw_redirects": "/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38/* https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/13ec15dcebdddc817b57f0f9087c5ef82018f10e/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38/:splat 302\n",
      "serve_directly": true,
      "raw_run_worker_first": false
    },
    "bindingTypes": []
  }
}
```
