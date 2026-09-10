#!/usr/bin/env python3
"""Verify and unpack the exact CI-tested archive before release signing."""
import argparse
import hashlib
import json
from pathlib import Path
import tarfile
import io

from build_identity import source_files, sha

MEMBERS = {'slotstream', 'mlx.metallib', 'build-identity.json', 'build-source.tar.gz'}
MAX_BYTES = 512 * 1024 * 1024


def contents(archive, expected):
    entries = archive.getmembers()
    if len(entries) != len(expected) or {e.name for e in entries} != set(expected):
        raise ValueError('archive members do not match the expected closure')
    if any(not e.isfile() or e.size < 0 for e in entries) or sum(e.size for e in entries) > MAX_BYTES:
        raise ValueError('archive contains unsupported entries or exceeds its byte bound')
    return {e.name: archive.extractfile(e).read() for e in entries}


def verify_and_unpack(root, archive_path, output):
    root, archive_path, output = Path(root), Path(archive_path), Path(output)
    expected_digest = archive_path.with_name(archive_path.name + '.sha256').read_text().split()
    if len(expected_digest) != 2 or expected_digest[1] != archive_path.name or sha(archive_path) != expected_digest[0]:
        raise ValueError('release archive checksum mismatch')
    with tarfile.open(archive_path, 'r:gz') as archive:
        files = contents(archive, MEMBERS)
    identity = json.loads(files['build-identity.json'])
    for name, key in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                      ('build-source.tar.gz', 'source_archive_sha256')]:
        if hashlib.sha256(files[name]).hexdigest() != identity[key]:
            raise ValueError('build identity mismatch: ' + name)
    source = {str(p.relative_to(root)): sha(p) for p in source_files(root)}
    if identity['source'] != source:
        raise ValueError('candidate source does not match the release checkout')
    with tarfile.open(fileobj=io.BytesIO(files['build-source.tar.gz']), mode='r:gz') as archive:
        saved_source = contents(archive, source)
    if any(hashlib.sha256(data).hexdigest() != source[name] for name, data in saved_source.items()):
        raise ValueError('source archive does not reconstruct the release checkout')
    # Validate everything before creating output; never follow archive paths.
    output.mkdir(parents=True, exist_ok=False)
    for name, data in files.items():
        (output / name).write_bytes(data)
    (output / 'slotstream').chmod(0o755)
    return {'archive_sha256': expected_digest[0], 'binary_sha256': identity['binary_sha256'],
            'source_files': len(source), 'source_matches_checkout': True}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--archive', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    print(json.dumps(verify_and_unpack(Path(__file__).resolve().parent.parent,
                                      args.archive, args.output), sort_keys=True))


if __name__ == '__main__':
    main()
