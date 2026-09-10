---
type: run
id: 01m1vpbk0cnnv62tcxrggg1wj4
created: 2026-09-06T15:45:55.212219+00:00
updated: 2026-09-06T15:49:31.755771+00:00
summary: The unchanged compressed package is public on Hugging Face; committed identities and anonymous object hashes pass, and the original mirror is preserved.
binary: Python with huggingface_hub 1.29.0; unchanged Slotpack v1 package
captured_at: 2026-09-06
command: publish_hf.py --package package --repo carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack --receipt upload.json --token-stdin; public_probe.py --package package --base exact-pinned-public-prefix --receipt public.json
discarded: 'false'
machines: '[[records/machines/linux-host-helsinki-1gbit]]'
title: Lossless Slotpack publication on Hugging Face
tool: publish_hf.py, HfApi committed inventory, public_probe.py
---
# Compressed Hugging Face publication

The unchanged Slotpack package is published in a separate public, ungated model repository. The original raw mirror retains its exact original current file inventory. Its original pinned revision remains accessible. The publisher verifies local hashes, committed Git/LFS identities, coverage and preservation of existing repository files before its completion receipt.

The final metadata-only commit links the original license and removes Hugging Face metadata that incorrectly classified a lossless repack as a fine-tune. The package itself is unchanged.

These are publication and representative public-read checks. Complete client reconstruction and release acceptance are recorded separately. No account upgrade, billing fallback, or client telemetry was enabled.

## Package publication

```json
{
  "complete": true,
  "repo": "carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack",
  "initialRevision": "612f08ad5b5832c29f959f842cd669014619e547",
  "revision": "08fceb2e4a251860fc443b78deb72b0ad59ffdec",
  "prefix": "slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "objects": 4155,
  "packageBytes": 88295438048,
  "committedFiles": 4156,
  "commits": [
    "8fad66fefcb7650c108e6dfabb517884545254c0",
    "7de7a28ac88a7fdbd3a349c378183e2b0956fa06",
    "c13c4d3ab4ac1823ddac23d152aa35fb238e719f",
    "10a550f2a5c220b9b3985250b9e091d37cb6ef5b",
    "9c1ccadeb0ece592170aac294caf7bc842ecead0",
    "e08e68d2006150fed41dde767b39b53e44a49b02",
    "7b83b6a3a91d1d95d53c78695e2586ec630f67cc",
    "83e3bc33ffa3b6c0c53dbb80c23b40e08795b775",
    "e0afbc843b14a3aaf8305e2e7e443df908bdab68",
    "cfc9b201c86acc2477a16362374a8028b3428c4c",
    "596e1d05cd2b31290911e2a5dee7c6edd081d3b3",
    "8b9c4f48771bea4edb8573d8415105985819ebe7",
    "c38681e67c11f8e6e005ac4eb90f6687477b9941",
    "7a699738afc8e6055953bb2427000ac815409daa",
    "7f91d824dd16388b03151dcd60acc0749c30d6a6",
    "6c63f60381620f11c35faab2a95e7deaf3868f0d",
    "8fd58c5e8c406714d531b3bbc95bf86156ec06ac",
    "30a8d87123f5251045024626e383d3d82976c5b3",
    "92d0935fff5b16b60e8c37dadf2ddc939a988443",
    "eb30a12f4838ba89949b3ca0efaa0e784dd26763",
    "a511e983696192f4967ac3d69393a487c2fcdfbd",
    "9a3b3d8a88cfc21d241cdff17e4cefcf9e9bc6f4",
    "ef2c8e6748163ce7d50ebd8288c42ecbda7d8fa3",
    "f7dcb1a3fd0ef95e965963e4804577d13b92108e",
    "898e1ddddae2ef20e697a3513ef8c67cf4d0b6f2",
    "58709b92d1f3bfe89ff6cbf93f0d3efb70858d39",
    "530d180d8f0ff845654ebab0c3515c4dae760c66",
    "c1c0cd6b0c838e784b25908d7693277de3c6077c",
    "09d746e3546ae6cec3e179f728937e7a020e45e1",
    "18cc5e2aa5b2ef409c892233392a420eaa0fb463",
    "93ba64914dabb92407d21e832af4a6eec4f3cc57",
    "b6e2a16bfdc2759dcaf668dd95a9c12d3d1bf795",
    "73cbff6c29df4555a27b7e53ab8809bb9fce5a4b",
    "f95bd3ab7e93dd04b6ed5e55f43d5567a8356dfa",
    "a326d62800f25b9d17daab1b89e6de8e0310d0c1",
    "2e51eb2dad085a537a0cfe59c6b4d4cd55770d0b",
    "ee5350d47f5e3399f6920a6d551799be9eca9cde",
    "b946be203b6ff41cc5e2ae54c911bb1a91a3906c",
    "6c9e19ed883b2cb6d78e9b0ae45ef6ab84d5ae6d",
    "9f2cc4d8f067590a610acc8fa429e6cb87f8e0a6",
    "5155c0219f501f09bd874c236d08c77a41a6c31b",
    "89cdf54caae3d2fef4335902ac6ace0cd3ca0d7d",
    "85d9b54762c53a143940f60aa381a72a4e2a1978",
    "69f5f074f035f49431e50ea53347cd8b98aecafc",
    "25acb2b92f9b950e65dd8acbd48d2e7027fc44df",
    "110c3f5b96c4292b805f933b266a08612d2beeda",
    "7b776c3bc5cbe955fa5c19c25ca7dcc18f73b7b2",
    "85b636af7b3d3a68f32f6187291f2d4e8475ec72",
    "d64cb2f4282e2b8ebc2ae4bd1b833c93b5d24016",
    "8f6efe61327365e35e0120efd8bf31dbbb1f2362",
    "c0d6f681f2c871f0c7f45dff3159de9a15f67459",
    "5e162ca671f78a295da6ca8de4239a7021e7e537",
    "f7e3988d143c4e5c1399b711d7705957e9ca811b",
    "e22aad91ca37dc35178b7739f85e030f8e5293af",
    "32291cedc29af9586b2ecdbe75079968bad99126",
    "39ee0cf24cc2c8399b24b63be1af1b3da5f8c28f",
    "fd7954896ab6520c477a4aab249effab83217aff",
    "d2c2dff6c1963ebcfd868d9f5b31167e1525b706",
    "89f601ae6cf440539a4c17ded6106c3c7275c549",
    "21b7b954ec4ff4a597f944cabe2ef6c77d9ca951",
    "8b71b494f1a3c8968e846a26386898c7ab8cc622",
    "a8f44da6b868dcb4fcac35b5cf07ef1801379972",
    "ff256f1188072f602696516e09f6d9263e2fb715",
    "5256fe3b28f166da00201ac467f655fe0d914505",
    "08fceb2e4a251860fc443b78deb72b0ad59ffdec"
  ],
  "seconds": 913.2
}
```

## Final repository pin

```json
{
  "repo": "carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack",
  "revision": "13ec15dcebdddc817b57f0f9087c5ef82018f10e",
  "packageRevision": "08fceb2e4a251860fc443b78deb72b0ad59ffdec",
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "prefix": "slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "complete": true,
  "modelCardSHA256": "a9dc3bae85d556fecbdf90aaad684f47f372c17482d9f10b015cd90be7aa6848"
}
```

## Original mirror preservation

```json
{
  "rawRepo": "carloslfu/Qwen3.8-Flash-Next-MLX-4bit",
  "restoredRevision": "0a6ea875b01eb95929c56a135b92da340dc285fd",
  "originalRevision": "e9d552f83de4665d243d5c9cf73201a1ca6c16d7",
  "copySourceRevision": "d7f340b9bb0ef2aaf397f486bf31fc47fa795a79",
  "originalFilesPreserved": 27,
  "removedOnlyTemporaryPackageFiles": 1728,
  "rawSnapshotRestored": true
}
```

## Anonymous object reads

```json
{
  "pass_": true,
  "base": "https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/13ec15dcebdddc817b57f0f9087c5ef82018f10e/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "objects": [
    {
      "sha256": "f8d056d40477c485e58be568de748f76f334f548e5ef3f4ea177c32b3f999fe3",
      "bytes": 2230,
      "read": 1,
      "resolvedHost": "us.aws.cdn.hf.co",
      "headers": {
        "content-type": "application/octet-stream",
        "content-length": "2230",
        "etag": "\"771a916da8076198e1aecc9aed77ae31627d62dc7de991c251c0f3f1d1333c4e\""
      }
    },
    {
      "sha256": "f8d056d40477c485e58be568de748f76f334f548e5ef3f4ea177c32b3f999fe3",
      "bytes": 2230,
      "read": 2,
      "resolvedHost": "us.aws.cdn.hf.co",
      "headers": {
        "content-type": "application/octet-stream",
        "content-length": "2230",
        "etag": "\"771a916da8076198e1aecc9aed77ae31627d62dc7de991c251c0f3f1d1333c4e\""
      }
    },
    {
      "sha256": "359c1461a8ba63ea6deccf025f6995836b4708fadf2be2ef7022fada040f371b",
      "bytes": 34577548,
      "read": 1,
      "resolvedHost": "us.aws.cdn.hf.co",
      "headers": {
        "content-type": "application/octet-stream",
        "content-length": "34577548",
        "etag": "\"2d7cd8d607dcca219edbc287c93fe6014b089588df81517e63fd7aa6b147cef5\""
      }
    },
    {
      "sha256": "359c1461a8ba63ea6deccf025f6995836b4708fadf2be2ef7022fada040f371b",
      "bytes": 34577548,
      "read": 2,
      "resolvedHost": "us.aws.cdn.hf.co",
      "headers": {
        "content-type": "application/octet-stream",
        "content-length": "34577548",
        "etag": "\"2d7cd8d607dcca219edbc287c93fe6014b089588df81517e63fd7aa6b147cef5\""
      }
    },
    {
      "sha256": "c2619c3ebf01f6f8a5895c7767e3b96027b6bcd06a4633b7700b1c020315e437",
      "bytes": 34567664,
      "read": 1,
      "resolvedHost": "us.aws.cdn.hf.co",
      "headers": {
        "content-type": "application/octet-stream",
        "content-length": "34567664",
        "etag": "\"2cb2d9ec87009ef844cd393b2ec3184745cecf951e6d0a14fb840420afd3b101\""
      }
    },
    {
      "sha256": "c2619c3ebf01f6f8a5895c7767e3b96027b6bcd06a4633b7700b1c020315e437",
      "bytes": 34567664,
      "read": 2,
      "resolvedHost": "us.aws.cdn.hf.co",
      "headers": {
        "content-type": "application/octet-stream",
        "content-length": "34567664",
        "etag": "\"2cb2d9ec87009ef844cd393b2ec3184745cecf951e6d0a14fb840420afd3b101\""
      }
    }
  ]
}
```

## Provider policy

[Hugging Face public storage policy](https://huggingface.co/docs/hub/en/storage-limits) describes best-effort public hosting with limits, not an unlimited service guarantee. [Hugging Face request limits](https://huggingface.co/docs/hub/en/rate-limits) can require waits. [Cloudflare static-asset billing](https://developers.cloudflare.com/workers/static-assets/billing-and-limitations/) makes assets-only compatibility redirects free; Worker code and R2 are separate products.
