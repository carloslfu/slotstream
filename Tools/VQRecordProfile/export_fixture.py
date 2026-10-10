#!/usr/bin/env python3
"""Export pinned VQ expert metadata without opening weight payloads."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import tempfile


MODEL = "TheDrainFlorist/Qwen3.8-Flash-Next-VQ-2.1bpw"
REVISION = "8684640a3956b01c47f5d47f9b999e2ab8b985f1"
PINNED = {
    "candidate-receipt.json": "3fae529d9b264fed388c42a9265d4cae87dae28abf30484160414c5470f9a341",
    "candidate/config.json": "4299e87dc3b2d11e53c683d4f17f1196ccf95b75399ddd77d470e148aae1d929",
    "candidate/model.safetensors.index.json": "35f2f37dd0eda19f81cae8436d0c102c9e1ad13c4381bd8dea72a0d4a6ef25eb",
    "headers-receipt.json": "00dfd2ae6cecb1e3e9bbcddf8812fcbfc74173e02a92cf05205efdea0ad546d5",
}
WIDTH = {"U8": 1, "U32": 4, "BF16": 2, "F16": 2, "I64": 8, "F32": 4}
COMPONENTS = ("codes", "vq_scales", "codebook")
SIDECAR = "mtp-head-q6.safetensors"


def require(condition, message):
    if not condition:
        raise ValueError(message)


def unique_pairs(pairs):
    result = {}
    for key, value in pairs:
        require(key not in result, f"duplicate JSON key: {key}")
        result[key] = value
    return result


def decode(data, label):
    try:
        return json.loads(data, object_pairs_hook=unique_pairs)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ValueError(f"invalid JSON in {label}: {exc}") from exc


def read_json(path):
    return decode(path.read_bytes(), str(path))


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def positive_int(value):
    return type(value) is int and value > 0


def collect(source):
    pinned_bytes = {}
    for relative, expected in PINNED.items():
        contents = (source / relative).read_bytes()
        require(sha256(contents) == expected, f"pinned SHA-256 mismatch: {relative}")
        pinned_bytes[relative] = contents

    receipt = decode(pinned_bytes["candidate-receipt.json"], "candidate receipt")
    config = decode(pinned_bytes["candidate/config.json"], "config")
    index = decode(pinned_bytes["candidate/model.safetensors.index.json"], "index")
    header_receipt = decode(pinned_bytes["headers-receipt.json"], "headers receipt")
    require(receipt["model"] == MODEL and receipt["revision"] == REVISION, "wrong checkpoint")
    require(receipt["metadata_only"] is True, "candidate receipt is not metadata-only")
    require(header_receipt["revision"] == REVISION and header_receipt["files"] == 139, "wrong header receipt")
    require(header_receipt["payload_downloaded"] is False, "payload receipt is not metadata-only")
    quant = config["quantization"]
    require(quant["mode"] == "affine" and quant["bits"] == 8 and
            config["quantization_config"] == quant, "unexpected non-VQ quantization config")

    expected_modules = {f"model.layers.{layer}.mlp.switch_mlp.{projection}"
                        for layer in range(48) for projection in ("gate_proj", "up_proj", "down_proj")}
    configured = config["vq_modules"]
    require(set(configured) == expected_modules, "VQ module inventory differs from 48 x 3")
    modules = []
    for name in sorted(configured):
        item = configured[name]
        fields = {"experts": item["experts"], "input": item["in"], "output": item["out"],
                  "dim": item["dim"], "k": item["k"], "group": item["group"]}
        require(all(positive_int(value) for value in fields.values()), f"invalid module geometry: {name}")
        modules.append({"name": name, **fields})

    listed = receipt["listed_weights"]
    require(len(listed) == receipt["weight_files"] == 139, "weight file inventory mismatch")
    listed_files = {entry["name"]: entry["bytes"] for entry in listed}
    require(len(listed_files) == 139, "duplicate listed weight file")
    weight_map = index["weight_map"]
    require(isinstance(weight_map, dict), "invalid weight map")
    seen = {}
    headers = []
    selected = {}
    for file in sorted(listed_files):
        wrapper = read_json(source / "headers" / (file + ".json"))
        raw = (source / "headers" / (file + ".header.bin")).read_bytes()
        require(wrapper["revision"] == REVISION and wrapper["file"] == file and
                wrapper["file_bytes"] == listed_files[file], f"wrapper identity mismatch: {file}")
        require(wrapper["header_bytes"] == len(raw) and wrapper["header_sha256"] == sha256(raw),
                f"raw header mismatch: {file}")
        require(wrapper["bytes_downloaded"] == len(raw) + 8 and
                wrapper["payload_downloaded"] is False, f"non-metadata header receipt: {file}")
        tensors = decode(raw, file)
        require(tensors == wrapper["tensors"], f"wrapper tensors differ from raw header: {file}")
        headers.append({"file": file, "sha256": sha256(raw)})
        offset = 0
        entries = [(name, value) for name, value in tensors.items() if name != "__metadata__"]
        entries.sort(key=lambda pair: pair[1]["data_offsets"][0])
        for name, value in entries:
            require(name not in seen, f"duplicate tensor name: {name}")
            seen[name] = file
            span = value["data_offsets"]
            shape = value["shape"]
            dtype = value["dtype"]
            require(isinstance(span, list) and len(span) == 2 and
                    all(type(x) is int and x >= 0 for x in span) and span[0] == offset and span[1] > offset,
                    f"noncontiguous tensor offsets: {name}")
            require(dtype in WIDTH and isinstance(shape, list) and
                    all(positive_int(x) for x in shape), f"invalid tensor descriptor: {name}")
            count = WIDTH[dtype]
            for dimension in shape:
                count *= dimension
            require(count == span[1] - span[0], f"tensor byte span mismatch: {name}")
            offset = span[1]
            if ".switch_mlp." in name and file != SIDECAR:
                module, dot, suffix = name.rpartition(".")
                require(dot and module in expected_modules and suffix in COMPONENTS,
                        f"unexpected VQ tensor: {name}")
                require(name not in selected, f"duplicate VQ tensor: {name}")
                selected[name] = {"name": name, "dtype": dtype, "shape": shape, "byteCount": count}
        require(offset + len(raw) + 8 == listed_files[file], f"file size mismatch: {file}")

    for name, file in weight_map.items():
        require(seen.get(name) == file, f"index tensor mismatch: {name}")
    for name, file in seen.items():
        require(name in weight_map or file == SIDECAR, f"unindexed non-sidecar tensor: {name}")
    require(len(seen) == header_receipt["tensor_count"], "header tensor count mismatch")
    expected_tensors = {module + "." + component for module in expected_modules for component in COMPONENTS}
    require(set(selected) == expected_tensors, "VQ component inventory mismatch")
    require(len(headers) == 139, "header count mismatch")
    return {
        "schema": 1, "model": MODEL, "revision": REVISION,
        "source": {"candidateReceiptSHA256": PINNED["candidate-receipt.json"],
                   "configSHA256": PINNED["candidate/config.json"],
                   "indexSHA256": PINNED["candidate/model.safetensors.index.json"],
                   "headersReceiptSHA256": PINNED["headers-receipt.json"], "headers": headers},
        "modules": modules, "tensors": [selected[name] for name in sorted(selected)],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    try:
        fixture = collect(args.source)
        data = (json.dumps(fixture, sort_keys=True, indent=2, ensure_ascii=False) + "\n").encode("utf-8")
        args.output.parent.mkdir(parents=True, exist_ok=True)
        with tempfile.NamedTemporaryFile(dir=args.output.parent, prefix=args.output.name + ".", delete=False) as handle:
            temporary = Path(handle.name)
            handle.write(data)
        try:
            os.replace(temporary, args.output)
        finally:
            temporary.unlink(missing_ok=True)
    except (OSError, KeyError, TypeError, ValueError) as exc:
        parser.exit(1, f"export failed: {exc}\n")


if __name__ == "__main__":
    main()
