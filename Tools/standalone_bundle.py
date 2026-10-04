"""Bounded assembly of a new research pack from authenticated components.

This is a storage primitive, not model admission or qualification. Its caller
owns the model-specific metadata/coverage checks, frozen resource protocol and
process guard. Existing inputs and output directories are never changed. A
complete manifest is published only after an independent full output audit.
"""
from __future__ import annotations

from dataclasses import dataclass
import hashlib
import json
import os
from pathlib import Path
import re
import stat

from affine_expert_control import Source
from quantization_inventory import LIMIT
from tensor_subset import CHUNK, copy as copy_subset, plan as subset_plan, read_exact, write_exact
from vq_ple_stream import stamp

MANIFEST = 'standalone-manifest.json'
MAX_MANIFEST = 4_000_000
MAX_GENERATED = 16_000_000
MAX_FILES = 256


def sha256(raw):
    return hashlib.sha256(raw).hexdigest()


def encoded(value):
    return (json.dumps(value, sort_keys=True, indent=2, ensure_ascii=False,
                       allow_nan=False) + '\n').encode()


def valid_sha(value):
    return type(value) is str and re.fullmatch('[a-f0-9]{64}', value) is not None


def valid_name(value):
    # Export owns a closed, flat namespace, not arbitrary user filenames.
    return (type(value) is str and re.fullmatch('[A-Za-z0-9][A-Za-z0-9._-]{0,127}', value)
            and not value.casefold().endswith('.part'))


@dataclass(frozen=True)
class Entry:
    name: str
    size: int
    optional: bool = False
    source: Path | None = None
    source_size: int | None = None
    source_sha256: str | None = None
    data: bytes | None = None
    selected: tuple[str, ...] = ()
    prefix_sha256: str | None = None

    def validate(self):
        if (not valid_name(self.name) or self.name.casefold() == MANIFEST
                or type(self.size) is not int or not 0 < self.size <= LIMIT
                or type(self.optional) is not bool or type(self.selected) is not tuple):
            raise ValueError('invalid standalone output entry')
        if self.data is not None:
            if (type(self.data) is not bytes or len(self.data) != self.size
                    or self.size > MAX_GENERATED or self.source is not None
                    or self.source_size is not None or self.source_sha256 is not None
                    or self.selected or self.prefix_sha256 is not None):
                raise ValueError('invalid bounded generated entry')
        else:
            if (not isinstance(self.source, Path) or type(self.source_size) is not int
                    or not 0 < self.source_size <= LIMIT or not valid_sha(self.source_sha256)):
                raise ValueError('copied entries require a complete pinned source')
            if self.selected:
                if (len(self.selected) > 20_000
                        or any(type(name) is not str or not 0 < len(name.encode()) <= 1024 for name in self.selected)
                        or len(set(self.selected)) != len(self.selected) or not valid_sha(self.prefix_sha256)):
                    raise ValueError('subset entries require exact bounded tensor coverage')
            elif self.prefix_sha256 is not None or self.size != self.source_size:
                raise ValueError('whole-file copies must retain their complete pinned extent')
        return self


def _regular(fd, size):
    value = os.fstat(fd)
    if not stat.S_ISREG(value.st_mode) or value.st_size != size:
        raise ValueError('bundle component type or extent changed')
    return stamp(value)


def _hash(fd, size, check):
    before = _regular(fd, size)
    digest = hashlib.sha256()
    for offset in range(0, size, CHUNK):
        check()
        digest.update(read_exact(fd, offset, min(CHUNK, size - offset), check))
        if _regular(fd, size) != before:
            raise ValueError('bundle component changed during authentication')
    return digest.hexdigest(), before


def _publish_file(parent, name, size, fill, check):
    """One independently verified file; failures never overwrite any name."""
    temporary = name + '.part'
    fd = os.open(temporary, os.O_RDWR | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW | os.O_CLOEXEC,
                 0o600, dir_fd=parent)
    try:
        expected = fill(fd)
        check(); os.fsync(fd)
        observed, before = _hash(fd, size, check)
        if observed != expected:
            raise ValueError('bundle output differs from authenticated input')
        if stamp(os.stat(temporary, dir_fd=parent, follow_symlinks=False)) != before:
            raise ValueError('bundle partial path no longer names its verified owner')
        check()
        os.link(temporary, name, src_dir_fd=parent, dst_dir_fd=parent, follow_symlinks=False)
        linked = _regular(fd, size)
        if (linked[:4] != before[:4]
                or stamp(os.stat(name, dir_fd=parent, follow_symlinks=False)) != linked):
            raise ValueError('bundle publication changed its owned file')
        os.unlink(temporary, dir_fd=parent)
        os.fsync(parent)
        return observed
    finally:
        os.close(fd)


def _copy(entry, parent, check):
    def fill(fd):
        if entry.data is not None:
            for offset in range(0, entry.size, CHUNK):
                write_exact(fd, offset, entry.data[offset:offset + CHUNK], check)
            return sha256(entry.data)
        source = os.open(entry.source, os.O_RDONLY | os.O_NOFOLLOW | os.O_NONBLOCK | os.O_CLOEXEC)
        try:
            before = _regular(source, entry.source_size)
            digest = hashlib.sha256()
            for offset in range(0, entry.size, CHUNK):
                check()
                raw = read_exact(source, offset, min(CHUNK, entry.size - offset), check)
                if _regular(source, entry.source_size) != before:
                    raise ValueError('source changed during whole-file copy')
                digest.update(raw); write_exact(fd, offset, raw, check)
            if digest.hexdigest() != entry.source_sha256 or _regular(source, entry.source_size) != before:
                raise ValueError('copied source differs from its pinned bytes')
            return entry.source_sha256
        finally:
            os.close(source)
    return _publish_file(parent, entry.name, entry.size, fill, check)


def export(entries, output, identity, *, maximum_output_bytes, manifest_reservation_bytes,
           minimum_free_bytes, check):
    """Assemble into a fresh directory; interrupted output stays unqualified.

    The explicit output reservation includes the final manifest and all files.
    Partial and final names briefly alias one newly created inode, so publication
    needs no second payload copy. There is no source linking, implicit cleanup,
    resume or overwrite. A failed call leaves evidence for an explicit decision.
    """
    if type(entries) not in (tuple, list) or not 0 < len(entries) <= MAX_FILES:
        raise ValueError('standalone file count exceeds its bound')
    entries = tuple(entries)
    for entry in entries:
        if type(entry) is not Entry:
            raise ValueError('standalone export requires immutable entries')
        entry.validate()
    names = {name.casefold() for entry in entries for name in (entry.name, entry.name + '.part')}
    if len(names) != 2 * len(entries):
        raise ValueError('standalone output filenames collide')
    if (type(maximum_output_bytes) is not int or not 0 < maximum_output_bytes <= LIMIT
            or type(manifest_reservation_bytes) is not int or not 0 < manifest_reservation_bytes <= MAX_MANIFEST
            or type(minimum_free_bytes) is not int or not 0 <= minimum_free_bytes <= LIMIT):
        raise ValueError('explicit bounded output, manifest and free-space reservations are required')
    total = sum(entry.size for entry in entries)
    reserved = total + manifest_reservation_bytes
    if reserved > maximum_output_bytes or reserved > LIMIT - minimum_free_bytes:
        raise ValueError('complete standalone output exceeds its reservation')
    if sum(entry.size for entry in entries if entry.data is not None) > MAX_GENERATED:
        raise ValueError('aggregate generated metadata exceeds its bound')
    # Freeze caller metadata before any callbacks or expensive work. It may
    # describe provenance, never assert product qualification through this API.
    if type(identity) is not dict or len(encoded(identity)) > MAX_MANIFEST:
        raise ValueError('bounded structured bundle identity required')
    identity = json.loads(encoded(identity))
    output = Path(output)
    if not valid_name(output.name):
        raise ValueError('standalone output requires a flat new directory name')
    parent = os.open(output.parent, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | os.O_CLOEXEC)
    directory = None
    try:
        check()
        space = os.statvfs(parent)
        if space.f_bavail * space.f_frsize < reserved + minimum_free_bytes:
            raise ValueError('insufficient real free space for complete standalone output')
        os.mkdir(output.name, mode=0o700, dir_fd=parent)
        directory = os.open(output.name, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | os.O_CLOEXEC,
                            dir_fd=parent)
        owner = os.fstat(directory)
        os.fsync(parent)

        def guard():
            check()
            named = os.stat(output, follow_symlinks=False)
            if (not stat.S_ISDIR(named.st_mode) or (named.st_dev, named.st_ino) != (owner.st_dev, owner.st_ino)):
                raise ValueError('standalone destination directory changed')
            space = os.statvfs(directory)
            if space.f_bavail * space.f_frsize < minimum_free_bytes:
                raise ValueError('standalone free-space reserve exhausted')

        files, reconstruction = [], []
        for entry in entries:
            guard()
            if entry.selected:
                source = Source(entry.source, {'size': entry.source_size, 'sha256': entry.source_sha256})
                try:
                    proposed = subset_plan(source.header, entry.source_size - source.base, entry.selected)
                    if proposed.output_bytes != entry.size or sha256(proposed.prefix) != entry.prefix_sha256:
                        raise ValueError('subset geometry differs from frozen output reservation')
                    receipt = copy_subset(source, entry.selected, output / entry.name,
                                          maximum_output_bytes=entry.size, check=guard)
                finally:
                    source.close()
                digest = receipt['sha256']
                reconstruction.append({'path': entry.name, 'source_sha256': receipt['source_sha256'],
                                       'tensor_sha256': receipt['tensor_sha256']})
            else:
                digest = _copy(entry, directory, guard)
            files.append({'path': entry.name, 'size': entry.size, 'sha256': digest, 'optional': entry.optional})
        if set(os.listdir(directory)) != {entry.name for entry in entries}:
            raise ValueError('standalone output contains unexpected or partial files')
        versions = {}
        # Independently authenticate every finished path, including subsets and
        # generated config/index. A writer receipt alone cannot complete a pack.
        for pin in files:
            guard()
            fd = os.open(pin['path'], os.O_RDONLY | os.O_NOFOLLOW | os.O_NONBLOCK | os.O_CLOEXEC,
                         dir_fd=directory)
            try:
                digest, version = _hash(fd, pin['size'], guard)
                if digest != pin['sha256']:
                    raise ValueError('standalone final audit found changed output')
                versions[pin['path']] = version
            finally:
                os.close(fd)
        manifest = {'schema': 1, 'kind': 'standalone-research-bundle-v1', 'complete': True,
                    'qualification': False, 'identity': identity, 'files': files,
                    'file_bytes': total, 'reconstruction': reconstruction}
        raw = encoded(manifest)
        if len(raw) > manifest_reservation_bytes:
            raise ValueError('standalone manifest exceeds its reserved output bytes')
        guard()
        if set(os.listdir(directory)) != set(versions):
            raise ValueError('standalone output gained unexpected files during audit')
        for name, version in versions.items():
            if stamp(os.stat(name, dir_fd=directory, follow_symlinks=False)) != version:
                raise ValueError('standalone output changed after independent audit')
        os.fsync(directory)
        # Do not run an arbitrary caller callback between final path checks and
        # publication. All remaining work is bounded by the metadata envelope.
        entry = Entry(MANIFEST, len(raw), data=raw)
        try:
            digest = _copy(entry, directory, lambda: None)
            os.fsync(parent)
        except BaseException:
            # _copy may have linked the manifest before a directory-sync error.
            # Remove only our exact manifest bytes; preserve all other evidence.
            try:
                fd = os.open(MANIFEST, os.O_RDONLY | os.O_NOFOLLOW | os.O_NONBLOCK | os.O_CLOEXEC,
                             dir_fd=directory)
                try:
                    observed, version = _hash(fd, len(raw), lambda: None)
                    if observed == sha256(raw) and stamp(os.stat(MANIFEST, dir_fd=directory, follow_symlinks=False)) == version:
                        os.unlink(MANIFEST, dir_fd=directory)
                        os.fsync(directory)
                finally:
                    os.close(fd)
            except (OSError, ValueError):
                pass
            raise
        return {'manifest_sha256': digest, 'manifest_bytes': len(raw),
                'output_bytes': total + len(raw), 'complete': True, 'qualification': False}
    finally:
        if directory is not None:
            os.close(directory)
        os.close(parent)
