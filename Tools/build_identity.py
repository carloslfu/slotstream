#!/usr/bin/env python3
"""Bind a built executable to a reconstructible source archive and package pins."""
import hashlib
import io
import json
from pathlib import Path
import sys
import tarfile

def sha(p):
    h = hashlib.sha256()
    with p.open("rb") as f:
        for data in iter(lambda: f.read(1024*1024), b""): h.update(data)
    return h.hexdigest()

def source_files(root):
    # SwiftPM can compile native targets and copy resources. A Swift-only glob
    # silently omitted CSlotpack's implementation and public header.
    candidates = [*root.joinpath("Sources").rglob("*"), root/"Package.swift",
                  root/"Package.resolved", root/"Makefile",
                  root/"Tools/build_identity.py", root/"Tools/fetch_metallib.sh"]
    if any(p.is_symlink() for p in candidates):
        raise ValueError("build source symlinks require an explicit archived dependency")
    return sorted(p for p in candidates if not p.is_dir())


def bind(root, stage, directory):
    if stage not in ("before", "after"):
        raise ValueError("stage must be before or after")
    root = Path(root).resolve()
    out = root / directory
    out.mkdir(parents=True, exist_ok=True)
    # Any failed post-build check invalidates a previous receipt, including a
    # missing input or an unsupported source dependency discovered below.
    if stage == "after":
        (out/"build-identity.json").unlink(missing_ok=True)
    files = source_files(root)
    source = {str(p.relative_to(root)): sha(p) for p in files}
    if stage == "before":
        (out/"build-source-before.json").write_text(json.dumps(source, sort_keys=True))
        return
    if json.loads((out/"build-source-before.json").read_text()) != source:
        raise ValueError("source changed during build; binary provenance is unverified, rebuild")
    with tarfile.open(out/"build-source.tar.gz", "w:gz") as tar:
        for p in files:
            name = str(p.relative_to(root))
            data = p.read_bytes()
            if hashlib.sha256(data).hexdigest() != source[name]:
                raise ValueError("source changed while archiving; rebuild")
            info = tar.gettarinfo(str(p), arcname=name)
            info.size = len(data)
            tar.addfile(info, io.BytesIO(data))
    if source != {str(p.relative_to(root)): sha(p) for p in source_files(root)}:
        raise ValueError("source changed while archiving; rebuild")
    result = {"source":source,"source_archive_sha256":sha(out/"build-source.tar.gz"),
              "binary_sha256":sha(out/"slotstream"),"metallib_sha256":sha(out/"mlx.metallib")}
    (out/"build-identity.json").write_text(json.dumps(result,indent=2)+"\n")


if __name__ == "__main__":
    try:
        bind(Path(__file__).resolve().parent.parent, *sys.argv[1:])
    except ValueError as error:
        raise SystemExit(str(error))
