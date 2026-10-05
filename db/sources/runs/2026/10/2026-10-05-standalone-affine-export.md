---
type: run
created: 2026-10-05T14:54:28.097163+00:00
updated: 2026-10-05T15:00:40.701219+00:00
summary: Authenticated retirement of redundant payloads and complete independently hashed standalone export; research admission only
binary: 3e4542d7afc3723f1627f181040159d01e0c2f46 plus frozen helper identities
captured_at: 2026-10-05
command: Frozen payload-retirement-protocol-v1 followed by affine-standalone-export-protocol-v1; exact protocols and receipts below
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Complete standalone three-bit export and bounded staging retirement
tool: Tools/research_payload_retirement.py; Tools/affine_standalone_run.py
---

The frozen preauthorized retirement authenticates every named redundant payload before deleting it. Original weights, the active minmax expert source, metadata, numerical evidence and all quality-study outputs remain intact. The existing exporter then assembles original dense, draft, tokenizer and vision components with minmax three-bit experts and owned rotary coefficients. Its independent whole-file audit completes. No performance, task-quality, public distribution or Auto-selection qualification follows from export alone.

### Retirement protocol

Local evidence: `.build/quantization-research/payload-retirement-protocol-v1/protocol.json`. SHA-256: `5d24cab202529e3ce1fa39e37c796ba630fac162fb6cd8de55d90fce412a1a97`.

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

### Retirement receipt

Local evidence: `.build/quantization-research/payload-retirement-run-v1/receipt.json`. SHA-256: `770b3a11489f8f37634058b6f363e0c1f7f55e5ebf100dc7aae9bb8a08e05743`.

```json
{
  "authenticated": [
    {
      "bytes": 1101006056,
      "path": "affine-expert-refit-pack-v1/experts-00.safetensors",
      "sha256": "7dbcbaab62784ac4317c428c3a39c89fd086de8f4bfe0f259a3c1f285327cf29"
    },
    {
      "bytes": 1101006056,
      "path": "affine-expert-refit-pack-v1/experts-01.safetensors",
      "sha256": "bc23aa0345bd4ba6782455e6aa0a31cb15967c8c4310690844c159a0308784b0"
    },
    {
      "bytes": 1101006056,
      "path": "affine-expert-refit-pack-v1/experts-02.safetensors",
      "sha256": "7f7f2d65d853587c5e24b5b61c2eb40609aa488dbbbda7d1b239eb723a070b6f"
    },
    {
      "bytes": 1101006056,
      "path": "affine-expert-refit-pack-v1/experts-03.safetensors",
      "sha256": "d2c72baf7dc28b3567b02154c0bbbc76dcfaa3d310549400c753972ded7ad19e"
    },
    {
      "bytes": 1101006056,
      "path": "affine-expert-refit-pack-v1/experts-04.safetensors",
      "sha256": "bbac521535b91bc22724b82a1433ac2c9c27f4c639c468cf508d78ccd471209c"
    },
    {
      "bytes": 1101006056,
      "path": "affine-expert-refit-pack-v1/experts-05.safetensors",
      "sha256": "e4c529e50bf49f093009185470c7449c0e7e5acb8f83a0d3b8a5cc9485c93196"
    },
    {
      "bytes": 1101006056,
      "path": "affine-expert-refit-pack-v1/experts-06.safetensors",
      "sha256": "ef550e2cfa4dacd1b75de5fbda967e5bb3a45c59e1c5b7ccf047e117b8d7a71b"
    },
    {
      "bytes": 1101006056,
      "path": "affine-expert-refit-pack-v1/experts-07.safetensors",
      "sha256": "66b2b4849befe0c84dd39ce9139ca38c70de747b5a1a0197696e2a293949fe55"
    },
    {
      "bytes": 1101006056,
      "path": "affine-expert-refit-pack-v1/experts-08.safetensors",
      "sha256": "aa8e877d716b3798457090440df9e1ae106acecc6b39801862a77df20f01e973"
    },
    {
      "bytes": 1101006056,
      "path": "affine-expert-refit-pack-v1/experts-09.safetensors",
      "sha256": "40490c298870cf4f3d0ad5e05a923fdb5fae10910e8cfadc09289ba68d2196e5"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-10.safetensors",
      "sha256": "bbf1f48cb527a27d43393d42d7dfcaf160b42b1000ef710cbb69839bce5d2de6"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-11.safetensors",
      "sha256": "bdee8ab6f98f6f46e6b3e5733d631e00ee1f4b98555106212284b9cb1d75b937"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-12.safetensors",
      "sha256": "3e788795306e63d4104a41731f986a88a1814a026533fb2373d23a069c184bcb"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-13.safetensors",
      "sha256": "6ae2943cfa5f90edeb24e2323d6bcea93528347e75786c66cc0c1d68cf145da4"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-14.safetensors",
      "sha256": "a34fb46024e28360538393b5481d7b8439ff34cde0ba45b33d69d4e04f142f60"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-15.safetensors",
      "sha256": "f68d40481b92373c2ec913f5533a851a2eee15b8d87d52f1a9f255c22bb01385"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-16.safetensors",
      "sha256": "38b7000667517a5aca06654e04f1cb84f992d66cea6cd56fe037155297dd5dd6"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-17.safetensors",
      "sha256": "775e72d01c1b273a347ecbc6e26d769943392e1cff30c25534f7470803253513"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-18.safetensors",
      "sha256": "f7227f9c70f949e067d76cb176a68858b2f7ff3d807ce42f4530cee8758dbf6d"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-19.safetensors",
      "sha256": "e8fe57432d20068b1474c970601934ff1b402ace92afc0c1655f443ed91b18c7"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-20.safetensors",
      "sha256": "84936a55e79978cdf22b5bf6b2183272a0d5079ca6ed3e33c1a569aaa3a28c4c"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-21.safetensors",
      "sha256": "87dadc413e7476cfc2561f678aa05de882df2fdf85107a7d34b624a4d3365a41"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-22.safetensors",
      "sha256": "acfb2597582323ef4b9ba6f8d5852e898534172f3f687521434507bb616dc9a4"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-23.safetensors",
      "sha256": "405de07d079352cb59b7de8dcf41d965a85f4ed77a82070467d0273745254034"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-24.safetensors",
      "sha256": "64677955994d974861787e206976425ea2bd5e839c196b848bfb078f6be43abc"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-25.safetensors",
      "sha256": "8934661eb1345f2ea59bceb742e989b0649cbb57709f798074232b094caf5a70"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-26.safetensors",
      "sha256": "33cb1866e47f47139a456434320e2982ad45dbb394a73e009e1a5e1354846eea"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-27.safetensors",
      "sha256": "8f585487a41bf1f09ae0d2c0dedb3971d5e589e8f378e3a7428ab95fe26f5f03"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-28.safetensors",
      "sha256": "3f8995a863790b9216edf740465f8b830ea3376b1de7719ef3b8df09138c773c"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-29.safetensors",
      "sha256": "05fb21bfa9ba12d6bd601228f1ba9e27e60168ea140060f18dda574610e5adaf"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-30.safetensors",
      "sha256": "fb67a7d9904519725cbbc8fd5e30c2bac909a63f783f5a20d9f28cd35433ff7e"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-31.safetensors",
      "sha256": "61c77289b5e7437ae729b87ca07761798db6e1261e74eaa10c2f87db67ee214e"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-32.safetensors",
      "sha256": "9492fbace287959678423bb4df07e4c07eae932d36b3f5b289d324ec65eca0c5"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-33.safetensors",
      "sha256": "3a3ecb89ee603cd0c97ab04b65a6f96c62e872b2441e78ace61bcb389642557d"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-34.safetensors",
      "sha256": "78dae9e48c33e7ba400af4660bcd800339a7c872f010f5329506930b60ba3d1a"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-35.safetensors",
      "sha256": "a4678d529bd0b9e6c90cebf87f5b42c8ee63d8c67d9bf5267d123a1b5495300a"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-36.safetensors",
      "sha256": "d6bd128c4f6fa3bf72023bc97e0487bfaa0652389546650767e99f0fc57cf8fd"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-37.safetensors",
      "sha256": "45f2020edb36c6af272b610197b6d6ad8ba9b6a430f7b9e9c0c2b2451bad541c"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-38.safetensors",
      "sha256": "b22bed1ac28598cf28493591ae29bc7652109cb8863b48d47c039cbcc2137afb"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-39.safetensors",
      "sha256": "0db01610c350ad4c1ac1d57096b4f3e50e98171ee3478174448cde9d930ef2e5"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-40.safetensors",
      "sha256": "bb25326e76c01aea912b603cc216a8696d043664ba469d9f21252b6bb2e49c8a"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-41.safetensors",
      "sha256": "8e6fe8a87363bcedbcf4f9bb979a211fa432046d9614cdc18dd0927e2e8f77ad"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-42.safetensors",
      "sha256": "f6c57c8c5fe12e2e11d0711dcb892a26a1b1705a0df8e131891f8e454492d9a2"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-43.safetensors",
      "sha256": "e5f01796a36a123a0a98174f157d348520ad0ad70486cfbcb6c0c65c2b2d28e8"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-44.safetensors",
      "sha256": "e0d3c859327daf269cb4257fab5f52ebeeb53e20899c7818703affde5d2a8089"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-45.safetensors",
      "sha256": "329c3c32d1393e53b62bc7001f5eea7a4f974c541eab0ae518f6204dcc1d8c59"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-46.safetensors",
      "sha256": "2990696fb05b295d46fe43134d0367314bc7feb9c42cca307a5349421b0ffbe9"
    },
    {
      "bytes": 1101006064,
      "path": "affine-expert-refit-pack-v1/experts-47.safetensors",
      "sha256": "ea11034331a3ebd7c4cca59db4254e78789333b58f4256fc10830d155213d4d6"
    },
    {
      "bytes": 1342193664,
      "path": "vq-contiguous-records-v1/experts-00.safetensors",
      "sha256": "ea72b4f45a00182eae5cb7117fff63ebf34a2ac4e02856a5458451554191a889"
    },
    {
      "bytes": 1342193664,
      "path": "vq-contiguous-records-v1/experts-01.safetensors",
      "sha256": "2677ad7d8713279d4780a5f50d32c217a00cc218ce592876d416532b32c83776"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-02.safetensors",
      "sha256": "7a5c05be0199572032bd2f378ab196dbf23daad9e26c1b42499eca0ec460dc5f"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-03.safetensors",
      "sha256": "036855be07278982b1fe6abd1bfe63f96491c9a62835a1085099fa65d503057d"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-04.safetensors",
      "sha256": "98bf80a77a1d343357321c23a7bc71f91089726f10e5ca89f7b567acb6d5f5ab"
    },
    {
      "bytes": 1342193664,
      "path": "vq-contiguous-records-v1/experts-05.safetensors",
      "sha256": "eacf097d56fa7569eb70ba8a6ef127b5f062a747654a8f4483ae563f67d7c12f"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-06.safetensors",
      "sha256": "a5b3e17b2467965cde6a8f4424fb945e8018bd88633b673ee0b9e5fb33013127"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-07.safetensors",
      "sha256": "46b66a7ca33db6b20f040cd49e3d364baa0f792927d70b8ae0eca893fe43110a"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-08.safetensors",
      "sha256": "1bcc215f68be4f949061ef89490819ee93decb6c8eb6a5a47953225c91d151bf"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-09.safetensors",
      "sha256": "01fb2e5434c597f26a8bbac476d758453c6cffca32081a49f8b175b3eb946712"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-10.safetensors",
      "sha256": "7b43395a265078c8fc29e7d9e765f4243f386a4d82cf85a0a16e3d8c23d42ba4"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-11.safetensors",
      "sha256": "0fcdeefca338109bbe80449b3aa6e88d4973b5a81dbd286e41fb289411f74a49"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-12.safetensors",
      "sha256": "0c0fbb4575063622a7dac516742c69390112313d6198447a48474ea2c5c4652e"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-13.safetensors",
      "sha256": "cc35a97dfe3fdc4bbbc010eb812bf871e0d005036a2d8e248444e529f21cfa89"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-14.safetensors",
      "sha256": "6c080d0f576512b639c7f61218be0cffcc59a8a458e48c66e67916bf353876ce"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-15.safetensors",
      "sha256": "84da49d5d34f73b6394ec408b7d1b21f9d75286e7d9d53e8489fbb27d15c3268"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-16.safetensors",
      "sha256": "eb86da308982529728867306246a87a57d05e9fc64c1bf51358946ec6f7037f7"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-17.safetensors",
      "sha256": "4dbc0a1a58e724e56f31561f9ec2aa91e36fea8c207580025ca9839db4772ccb"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-18.safetensors",
      "sha256": "556b354cfed0cca4ff9b0e1e3cc8e3ef18f0e3bd9715c87aa238e5a3c5f120eb"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-19.safetensors",
      "sha256": "a7cc8cf80b02d2e9cdf875f07ec27734eb4f66bc9ab5e80f1daf855b3595b9ab"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-20.safetensors",
      "sha256": "48c437b41dd2303db3f4bb752ecde05bc3694a7c1a1fa889adf6ce67b5a705ba"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-21.safetensors",
      "sha256": "f0933a7acf8065a662a906f4747796b3b1085ec7f00a14bf5a467bb13c2397e4"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-22.safetensors",
      "sha256": "f8c00dd6344b872472e7f707c46611b676455b3a8a3c07394c27241d831e2855"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-23.safetensors",
      "sha256": "0c8763b87502e9b00f3bb7e144def354bbd019d41850492a00549c8b6bbe148d"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-24.safetensors",
      "sha256": "c4ca1b9dd27838063b6916e6094afc6e7a473e8ad299684f1eb6e86e76a7777f"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-25.safetensors",
      "sha256": "25e22c98e853dde295b9a33748ca2889869df18b8b6c5e5a01837622540e605e"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-26.safetensors",
      "sha256": "c97fa578c3dc1832b437cdeb49f0fcc98a93b0c480cfd0243997d49fe6abe26c"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-27.safetensors",
      "sha256": "3e9cbc84a4a31843136d6c58c6bb90894ab893a72f1a30ddb6fcee01eb5f6290"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-28.safetensors",
      "sha256": "78f4c9d8575f61159dadb917233fc180682eebc03da4f259ecf7771e21e16bda"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-29.safetensors",
      "sha256": "2ed3c909f8e1357655fbdb5b9b07c8a66fd815af86fbef3ae6cfe3bfe261e8ef"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-30.safetensors",
      "sha256": "67e6ec9c4bf4eff00e3fac172213161ddb3f50591c78de0afab821a5f6abd99a"
    },
    {
      "bytes": 1342193664,
      "path": "vq-contiguous-records-v1/experts-31.safetensors",
      "sha256": "3fd3c097849341a9acc3822a2ffb3294b264cdeaab5313859bf7ed0ae5415d61"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-32.safetensors",
      "sha256": "979911f4ef5dd69071fcaa8acaf190503611ab3ce3ec60fe24a2b81199bd4695"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-33.safetensors",
      "sha256": "525773948e552d16dfbeee326faadc0bdb26e70446b53fbd01ee31ad9cbaaf7e"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-34.safetensors",
      "sha256": "dd171cc8d4f86f4f0009810ff20a36863402c207004379a05d55fe031963cbef"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-35.safetensors",
      "sha256": "ccbe1c258c80af879c1fffb7b5d8f4158b923df930c9303afa2a68ba4e526f8b"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-36.safetensors",
      "sha256": "0bea4b0d5badb17630d77405bee371b585a3b76afff0e1664753d38ca66330b7"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-37.safetensors",
      "sha256": "0c470961671d2fe5325bd8a7d108df124d535f16f6607c442bad36c4731cacf3"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-38.safetensors",
      "sha256": "b170daed7845b84b4ab1e7216833ea645bc7793e49ece1e4f584a12a9aafe5e7"
    },
    {
      "bytes": 1342193664,
      "path": "vq-contiguous-records-v1/experts-39.safetensors",
      "sha256": "29c58331b464c58cae4c7208973cf1ca82f8e2812605cb26c745595a1f16e755"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-40.safetensors",
      "sha256": "ec565a8d467553681f269fc56125afd389ebb6b0f956d7767a41eac7996a289a"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-41.safetensors",
      "sha256": "dd1a10a26ee938a0673c158eeed8bd0894aba06e362b88171c73721dcbd60813"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-42.safetensors",
      "sha256": "e3d0476f1d80acc0426b5c57c09ea59500bc62fc546a443ec6776ba2356dca85"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-43.safetensors",
      "sha256": "14b599ac761f80620698e8cb37899c630fa99246cc7cabce49739402b3bd38c5"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-44.safetensors",
      "sha256": "45f2c795be2365d88f1421559c253de0541df19c34321ff62ace7574268a0f29"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-45.safetensors",
      "sha256": "3a01b8a9e99ee0f6362ae47ce9f943310d0f456d5ff86bcc924f25f84a48a9c4"
    },
    {
      "bytes": 947929088,
      "path": "vq-contiguous-records-v1/experts-46.safetensors",
      "sha256": "3bf32b0fbc7c71105ef9b4b6769637717c1d322430cb64304bd6e35b26427c90"
    },
    {
      "bytes": 1342193664,
      "path": "vq-contiguous-records-v1/experts-47.safetensors",
      "sha256": "69b6d39823b5bb5f88546c6a895539a1b516cddd3b39c6f687bf346e0c25b45a"
    }
  ],
  "complete": true,
  "owned_preflight": {
    "page_bytes": 16384,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   333601.\nPages active:                                 960923.\nPages inactive:                              1391399.\nPages speculative:                            149580.\nPages throttled:                                   0.\nPages wired down:                             180594.\nPages purgeable:                               19961.\n\"Translation faults\":                     3884826826.\nPages copy-on-write:                       328895880.\nPages zero filled:                       18150740950.\nPages reactivated:                         498699913.\nPages purged:                               16647411.\nFile-backed pages:                           1684525.\nAnonymous pages:                              817377.\nPages stored in compressor:                   322702.\nPages occupied by compressor:                  64204.\nDecompressions:                            157045757.\nCompressions:                              180484131.\nPageins:                                  5615258729.\nPageouts:                                    2711227.\nSwapins:                                       30361.\nSwapouts:                                     156707.\nPages tagged:                                 156823.\nPages tagged resident:                        135349.\nPages tagged compressed:                       21474.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8436.\nPages tag-storage free:                         5127.\nPages tag-storage non-tag pageable:            84733.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3160576.\nTagged compressions:                         1586471.\nTagged decompressions:                       1440183.\n",
    "reclaimable_bytes": 33392017408,
    "swapins": 30361,
    "swapouts": 156707
  },
  "peak_process_bytes": 37519360,
  "plan_sha256": "faf90a122ad1cd8cf72f253150f6937daa13ffb5214ce77bd6ade73c9491851d",
  "preflight": {
    "page_bytes": 16384,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   333677.\nPages active:                                 960929.\nPages inactive:                              1391399.\nPages speculative:                            149580.\nPages throttled:                                   0.\nPages wired down:                             180594.\nPages purgeable:                               19961.\n\"Translation faults\":                     3884826272.\nPages copy-on-write:                       328895727.\nPages zero filled:                       18150740900.\nPages reactivated:                         498699913.\nPages purged:                               16647411.\nFile-backed pages:                           1684525.\nAnonymous pages:                              817383.\nPages stored in compressor:                   322702.\nPages occupied by compressor:                  64204.\nDecompressions:                            157045757.\nCompressions:                              180484131.\nPageins:                                  5615258728.\nPageouts:                                    2711227.\nSwapins:                                       30361.\nSwapouts:                                     156707.\nPages tagged:                                 156823.\nPages tagged resident:                        135349.\nPages tagged compressed:                       21474.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8436.\nPages tag-storage free:                         5127.\nPages tag-storage non-tag pageable:            84733.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3160576.\nTagged compressions:                         1586471.\nTagged decompressions:                       1440183.\n",
    "reclaimable_bytes": 33393262592,
    "swapins": 30361,
    "swapouts": 156707
  },
  "protocol_sha256": "5d24cab202529e3ce1fa39e37c796ba630fac162fb6cd8de55d90fce412a1a97",
  "qualification": false,
  "retired": [
    "affine-expert-refit-pack-v1/experts-00.safetensors",
    "affine-expert-refit-pack-v1/experts-01.safetensors",
    "affine-expert-refit-pack-v1/experts-02.safetensors",
    "affine-expert-refit-pack-v1/experts-03.safetensors",
    "affine-expert-refit-pack-v1/experts-04.safetensors",
    "affine-expert-refit-pack-v1/experts-05.safetensors",
    "affine-expert-refit-pack-v1/experts-06.safetensors",
    "affine-expert-refit-pack-v1/experts-07.safetensors",
    "affine-expert-refit-pack-v1/experts-08.safetensors",
    "affine-expert-refit-pack-v1/experts-09.safetensors",
    "affine-expert-refit-pack-v1/experts-10.safetensors",
    "affine-expert-refit-pack-v1/experts-11.safetensors",
    "affine-expert-refit-pack-v1/experts-12.safetensors",
    "affine-expert-refit-pack-v1/experts-13.safetensors",
    "affine-expert-refit-pack-v1/experts-14.safetensors",
    "affine-expert-refit-pack-v1/experts-15.safetensors",
    "affine-expert-refit-pack-v1/experts-16.safetensors",
    "affine-expert-refit-pack-v1/experts-17.safetensors",
    "affine-expert-refit-pack-v1/experts-18.safetensors",
    "affine-expert-refit-pack-v1/experts-19.safetensors",
    "affine-expert-refit-pack-v1/experts-20.safetensors",
    "affine-expert-refit-pack-v1/experts-21.safetensors",
    "affine-expert-refit-pack-v1/experts-22.safetensors",
    "affine-expert-refit-pack-v1/experts-23.safetensors",
    "affine-expert-refit-pack-v1/experts-24.safetensors",
    "affine-expert-refit-pack-v1/experts-25.safetensors",
    "affine-expert-refit-pack-v1/experts-26.safetensors",
    "affine-expert-refit-pack-v1/experts-27.safetensors",
    "affine-expert-refit-pack-v1/experts-28.safetensors",
    "affine-expert-refit-pack-v1/experts-29.safetensors",
    "affine-expert-refit-pack-v1/experts-30.safetensors",
    "affine-expert-refit-pack-v1/experts-31.safetensors",
    "affine-expert-refit-pack-v1/experts-32.safetensors",
    "affine-expert-refit-pack-v1/experts-33.safetensors",
    "affine-expert-refit-pack-v1/experts-34.safetensors",
    "affine-expert-refit-pack-v1/experts-35.safetensors",
    "affine-expert-refit-pack-v1/experts-36.safetensors",
    "affine-expert-refit-pack-v1/experts-37.safetensors",
    "affine-expert-refit-pack-v1/experts-38.safetensors",
    "affine-expert-refit-pack-v1/experts-39.safetensors",
    "affine-expert-refit-pack-v1/experts-40.safetensors",
    "affine-expert-refit-pack-v1/experts-41.safetensors",
    "affine-expert-refit-pack-v1/experts-42.safetensors",
    "affine-expert-refit-pack-v1/experts-43.safetensors",
    "affine-expert-refit-pack-v1/experts-44.safetensors",
    "affine-expert-refit-pack-v1/experts-45.safetensors",
    "affine-expert-refit-pack-v1/experts-46.safetensors",
    "affine-expert-refit-pack-v1/experts-47.safetensors",
    "vq-contiguous-records-v1/experts-00.safetensors",
    "vq-contiguous-records-v1/experts-01.safetensors",
    "vq-contiguous-records-v1/experts-02.safetensors",
    "vq-contiguous-records-v1/experts-03.safetensors",
    "vq-contiguous-records-v1/experts-04.safetensors",
    "vq-contiguous-records-v1/experts-05.safetensors",
    "vq-contiguous-records-v1/experts-06.safetensors",
    "vq-contiguous-records-v1/experts-07.safetensors",
    "vq-contiguous-records-v1/experts-08.safetensors",
    "vq-contiguous-records-v1/experts-09.safetensors",
    "vq-contiguous-records-v1/experts-10.safetensors",
    "vq-contiguous-records-v1/experts-11.safetensors",
    "vq-contiguous-records-v1/experts-12.safetensors",
    "vq-contiguous-records-v1/experts-13.safetensors",
    "vq-contiguous-records-v1/experts-14.safetensors",
    "vq-contiguous-records-v1/experts-15.safetensors",
    "vq-contiguous-records-v1/experts-16.safetensors",
    "vq-contiguous-records-v1/experts-17.safetensors",
    "vq-contiguous-records-v1/experts-18.safetensors",
    "vq-contiguous-records-v1/experts-19.safetensors",
    "vq-contiguous-records-v1/experts-20.safetensors",
    "vq-contiguous-records-v1/experts-21.safetensors",
    "vq-contiguous-records-v1/experts-22.safetensors",
    "vq-contiguous-records-v1/experts-23.safetensors",
    "vq-contiguous-records-v1/experts-24.safetensors",
    "vq-contiguous-records-v1/experts-25.safetensors",
    "vq-contiguous-records-v1/experts-26.safetensors",
    "vq-contiguous-records-v1/experts-27.safetensors",
    "vq-contiguous-records-v1/experts-28.safetensors",
    "vq-contiguous-records-v1/experts-29.safetensors",
    "vq-contiguous-records-v1/experts-30.safetensors",
    "vq-contiguous-records-v1/experts-31.safetensors",
    "vq-contiguous-records-v1/experts-32.safetensors",
    "vq-contiguous-records-v1/experts-33.safetensors",
    "vq-contiguous-records-v1/experts-34.safetensors",
    "vq-contiguous-records-v1/experts-35.safetensors",
    "vq-contiguous-records-v1/experts-36.safetensors",
    "vq-contiguous-records-v1/experts-37.safetensors",
    "vq-contiguous-records-v1/experts-38.safetensors",
    "vq-contiguous-records-v1/experts-39.safetensors",
    "vq-contiguous-records-v1/experts-40.safetensors",
    "vq-contiguous-records-v1/experts-41.safetensors",
    "vq-contiguous-records-v1/experts-42.safetensors",
    "vq-contiguous-records-v1/experts-43.safetensors",
    "vq-contiguous-records-v1/experts-44.safetensors",
    "vq-contiguous-records-v1/experts-45.safetensors",
    "vq-contiguous-records-v1/experts-46.safetensors",
    "vq-contiguous-records-v1/experts-47.safetensors"
  ],
  "samples": 38,
  "schema": 1,
  "seconds": 35.696365457999995,
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
  "staging_after_bytes": 322429095936,
  "staging_before_bytes": 423143677952
}
```

### Standalone export protocol

Local evidence: `.build/quantization-research/affine-standalone-export-protocol-v1/protocol.json`. SHA-256: `144c6a247215759a606580fc09e944b35a60d2e5c2a709f886514a7481ec7e4d`.

```json
{
  "kind": "affine-standalone-export-v1",
  "paths": {
    "control": "affine-expert-control-pack-v1",
    "output": "affine-standalone-pack-v1",
    "parent": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "plan": "standalone-complete-plan-v1.json",
    "report": "affine-standalone-export-run-v1",
    "rotary": "vq-extended-rotary-v1/rotary-output/angles-f32le.bin"
  },
  "plan_sha256": "399ac7230feaeeda399ac1a1ef3cd82ed4c1510144ae6bafd69d6740faa7ddf1",
  "resource": {
    "concurrent_workers": 1,
    "headroom_bytes": 3000000000,
    "maximum_output_bytes": 90236537746,
    "maximum_process_bytes": 1000000000,
    "maximum_research_staging_bytes": 430000000000,
    "maximum_seconds": 3600,
    "minimum_free_bytes": 3000000000,
    "new_raw_logit_bytes": 0,
    "paid_compute_usd": 0,
    "preflight_bytes": 4000000000,
    "receipt_reservation_bytes": 1000000
  },
  "schema": 1,
  "source_sha256": {
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Tools/affine_expert_control.py": "24ed33aad9aac7f75593650535d995420add389b74cb33aa6b359b4427015908",
    "Tools/affine_standalone_export.py": "e6f1a564f84f8d2fe0915c84628e947d30a1be36c61df04f0c708304f3b7966b",
    "Tools/affine_standalone_metadata.py": "659162470043868e646056edb4d16d3159e79d2ce90fba6cdf3b38a4b3725175",
    "Tools/affine_standalone_run.py": "67fd107032fc5903797fc5cf1061f18575b62a679656b6261296ec886b85d3ad",
    "Tools/context_qualification.py": "ee929fe7433fe6287af2b5591dafc960315f2ed5d31902882cfd7d0c9a9f15e8",
    "Tools/memory_gate.py": "fed53adbbc761457f94e11ded179915d538b515d448dc029ff3f0604f7faf6fc",
    "Tools/prefill_bench.py": "000868d66f82cd1eba5973c0fa9b4259831a6bdbc5bcf7d4c4f858d86c71d472",
    "Tools/quantization_inventory.py": "af0220f7dde0b783fd5800ed2f0ee5545ed30bd855cf6d34d6a79820c9ef47cb",
    "Tools/quantization_quality.py": "99c99d16ee7bbb8576156fe5e8971a74ce243642bff240f855613c3ec0d135f8",
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

### Standalone export receipt

Local evidence: `.build/quantization-research/affine-standalone-export-run-v1/receipt.json`. SHA-256: `d5b4b9a1a87702ee89f4e63774ade9346018bdf9156da897f30304d0598ec90e`.

```json
{
  "complete": true,
  "export": {
    "complete": true,
    "manifest_bytes": 419192,
    "manifest_sha256": "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5",
    "output_bytes": 90232956938,
    "qualification": false
  },
  "observed_staging_bytes": 412690948096,
  "owned_preflight": {
    "page_bytes": 16384,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                  1836718.\nPages active:                                 496789.\nPages inactive:                               501559.\nPages speculative:                              1529.\nPages throttled:                                   0.\nPages wired down:                             179155.\nPages purgeable:                                1236.\n\"Translation faults\":                     3885247760.\nPages copy-on-write:                       328966289.\nPages zero filled:                       18150971337.\nPages reactivated:                         498737512.\nPages purged:                               16673939.\nFile-backed pages:                            233995.\nAnonymous pages:                              765882.\nPages stored in compressor:                   323218.\nPages occupied by compressor:                  64489.\nDecompressions:                            157045802.\nCompressions:                              180484728.\nPageins:                                  5621404490.\nPageouts:                                    2711413.\nSwapins:                                       30361.\nSwapouts:                                     156707.\nPages tagged:                                 155546.\nPages tagged resident:                        133967.\nPages tagged compressed:                       21579.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8436.\nPages tag-storage free:                         5338.\nPages tag-storage non-tag pageable:            84522.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3184768.\nTagged compressions:                         1586576.\nTagged decompressions:                       1440183.\n",
    "reclaimable_bytes": 33946812416,
    "swapins": 30361,
    "swapouts": 156707
  },
  "peak_process_bytes": 69795840,
  "plan_sha256": "399ac7230feaeeda399ac1a1ef3cd82ed4c1510144ae6bafd69d6740faa7ddf1",
  "preflight": {
    "page_bytes": 16384,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                  1836677.\nPages active:                                 496782.\nPages inactive:                               501559.\nPages speculative:                              1529.\nPages throttled:                                   0.\nPages wired down:                             179155.\nPages purgeable:                                1236.\n\"Translation faults\":                     3885247188.\nPages copy-on-write:                       328966136.\nPages zero filled:                       18150971287.\nPages reactivated:                         498737512.\nPages purged:                               16673939.\nFile-backed pages:                            233995.\nAnonymous pages:                              765875.\nPages stored in compressor:                   323218.\nPages occupied by compressor:                  64489.\nDecompressions:                            157045802.\nCompressions:                              180484728.\nPageins:                                  5621404489.\nPageouts:                                    2711413.\nSwapins:                                       30361.\nSwapouts:                                     156707.\nPages tagged:                                 155546.\nPages tagged resident:                        133967.\nPages tagged compressed:                       21579.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8436.\nPages tag-storage free:                         5338.\nPages tag-storage non-tag pageable:            84522.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3184768.\nTagged compressions:                         1586576.\nTagged decompressions:                       1440183.\n",
    "reclaimable_bytes": 33946140672,
    "swapins": 30361,
    "swapouts": 156707
  },
  "protocol_sha256": "144c6a247215759a606580fc09e944b35a60d2e5c2a709f886514a7481ec7e4d",
  "qualification": false,
  "samples": 163,
  "schema": 1,
  "seconds": 161.94782312499999,
  "source_sha256": {
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Tools/affine_expert_control.py": "24ed33aad9aac7f75593650535d995420add389b74cb33aa6b359b4427015908",
    "Tools/affine_standalone_export.py": "e6f1a564f84f8d2fe0915c84628e947d30a1be36c61df04f0c708304f3b7966b",
    "Tools/affine_standalone_metadata.py": "659162470043868e646056edb4d16d3159e79d2ce90fba6cdf3b38a4b3725175",
    "Tools/affine_standalone_run.py": "67fd107032fc5903797fc5cf1061f18575b62a679656b6261296ec886b85d3ad",
    "Tools/context_qualification.py": "ee929fe7433fe6287af2b5591dafc960315f2ed5d31902882cfd7d0c9a9f15e8",
    "Tools/memory_gate.py": "fed53adbbc761457f94e11ded179915d538b515d448dc029ff3f0604f7faf6fc",
    "Tools/prefill_bench.py": "000868d66f82cd1eba5973c0fa9b4259831a6bdbc5bcf7d4c4f858d86c71d472",
    "Tools/quantization_inventory.py": "af0220f7dde0b783fd5800ed2f0ee5545ed30bd855cf6d34d6a79820c9ef47cb",
    "Tools/quantization_quality.py": "99c99d16ee7bbb8576156fe5e8971a74ce243642bff240f855613c3ec0d135f8",
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
  "staging_before_bytes": 322429378560
}
```
