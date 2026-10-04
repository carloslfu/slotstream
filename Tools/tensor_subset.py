"""Losslessly copy selected safetensors into a new, independently checked file.

This is a research artifact primitive, not a model converter or installer.
The caller supplies a pinned source and a complete output/disk/process budget.
No whole tensor enters memory. The source descriptor is authenticated before
copying, then retained through independent tensor reconstruction and publication.
The caller still owns whole-pack completion and qualification.
"""
from dataclasses import dataclass
import hashlib
import json
import os
from pathlib import Path
import stat
import struct

from affine_expert_control import Source
from quantization_inventory import LIMIT, validate_header
from vq_ple_stream import stamp

CHUNK = 1_000_000
MAX_HEADER = 4_000_000


@dataclass(frozen=True)
class Piece:
    name: str
    source_offset: int
    output_offset: int
    count: int


@dataclass(frozen=True)
class Subset:
    prefix: bytes
    pieces: tuple[Piece, ...]
    source_bytes: int
    output_bytes: int


def plan(header, payload_bytes, selected):
    """Pure geometry. Header-only planning never authenticates source payloads."""
    validate_header(header, payload_bytes)
    names = tuple(selected)
    if (not names or any(type(name) is not str or name == '__metadata__' or name not in header for name in names)
            or len(set(names)) != len(names)):
        raise ValueError('subset must name unique existing tensors')
    metadata = header.get('__metadata__')
    if metadata is not None and (type(metadata) is not dict
            or any(type(key) is not str or type(value) is not str for key, value in metadata.items())):
        raise ValueError('safetensors metadata must contain strings')
    out = {} if metadata is None else {'__metadata__': dict(metadata)}
    pieces, cursor = [], 0
    for name in sorted(names, key=lambda name: (*header[name]['data_offsets'], name)):
        item = header[name]
        first, last = item['data_offsets']
        count = last - first
        out[name] = {'dtype': item['dtype'], 'shape': list(item['shape']),
                     'data_offsets': [cursor, cursor + count]}
        pieces.append(Piece(name, first, cursor, count))
        cursor += count
    validate_header(out, cursor)
    raw = json.dumps(out, sort_keys=True, separators=(',', ':'), ensure_ascii=False,
                     allow_nan=False).encode('utf-8')
    raw += b' ' * (-len(raw) % 8)
    if not 0 < len(raw) <= MAX_HEADER or cursor > LIMIT - 8 - len(raw):
        raise ValueError('subset header or complete extent exceeds its bound')
    prefix = struct.pack('<Q', len(raw)) + raw
    return Subset(prefix, tuple(pieces), payload_bytes, len(prefix) + cursor)


def read_exact(fd, offset, count, check):
    if (type(offset) is not int or type(count) is not int or offset < 0
            or not 0 <= count <= CHUNK or offset > LIMIT - count):
        raise ValueError('subset read exceeds its integer or chunk bound')
    result = bytearray()
    while len(result) < count:
        check()
        try:
            data = os.pread(fd, count - len(result), offset + len(result))
        except InterruptedError:
            continue
        if not data:
            raise ValueError('short subset read')
        result.extend(data)
    return bytes(result)


def write_exact(fd, offset, raw, check):
    if (type(offset) is not int or offset < 0 or len(raw) > CHUNK
            or offset > LIMIT - len(raw)):
        raise ValueError('subset write exceeds its integer or chunk bound')
    view = memoryview(raw)
    while view:
        check()
        try:
            count = os.pwrite(fd, view, offset)
        except InterruptedError:
            continue
        if not 0 < count <= len(view):
            raise OSError('short subset write')
        view = view[count:]
        offset += count


def copy(source: Source, selected, output, *, maximum_output_bytes, check):
    """Authenticate, copy, independently compare, sync, then publish once.

    Interrupted copying stays at a new .part path. A failure after publication
    may leave verified per-file output, but returns no receipt; the caller must
    never complete the pack in that case. Neither prior final nor partial files
    are overwritten. No hard link is made to the source, so an active reader's
    original inode and ctime stay unchanged.
    Only this new output's temporary/final names briefly share an inode.
    """
    if (type(maximum_output_bytes) is not int or not 0 < maximum_output_bytes <= LIMIT):
        raise ValueError('an explicit positive output reservation is required')
    source.recheck()
    subset = plan(source.header, source.pin['size'] - source.base, selected)
    if subset.output_bytes > maximum_output_bytes:
        raise ValueError('complete subset exceeds its output reservation')
    output = Path(output)
    temporary = output.with_name(output.name + '.part')
    parent = os.open(output.parent, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | os.O_CLOEXEC)
    parent_identity = os.fstat(parent)
    fd = None
    try:
        # Reject an existing destination before the expensive authentication.
        for name in (output.name, temporary.name):
            try:
                os.stat(name, dir_fd=parent, follow_symlinks=False)
            except FileNotFoundError:
                pass
            else:
                raise FileExistsError('subset destination already exists: ' + name)
        check()
        source.verify(check)
        fd = os.open(temporary.name, os.O_RDWR | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW | os.O_CLOEXEC,
                     0o600, dir_fd=parent)
        for offset in range(0, len(subset.prefix), CHUNK):
            write_exact(fd, offset, subset.prefix[offset:offset + CHUNK], check)
        for piece in subset.pieces:
            for offset in range(0, piece.count, CHUNK):
                check(); source.recheck()
                raw = read_exact(source.fd, source.base + piece.source_offset + offset,
                                 min(CHUNK, piece.count - offset), check)
                source.recheck()
                write_exact(fd, len(subset.prefix) + piece.output_offset + offset, raw, check)
        check(); source.recheck()
        os.fsync(fd)
        before = os.fstat(fd)
        if not stat.S_ISREG(before.st_mode) or before.st_size != subset.output_bytes:
            raise ValueError('completed subset extent or file type changed')
        # Re-read both sides, rather than trusting the producer's buffered data
        # or a hash computed while it wrote. Empty tensors remain real entries.
        tensor_hashes = {}
        for piece in subset.pieces:
            original, reconstructed = hashlib.sha256(), hashlib.sha256()
            for offset in range(0, piece.count, CHUNK):
                check(); source.recheck()
                count = min(CHUNK, piece.count - offset)
                original.update(read_exact(source.fd, source.base + piece.source_offset + offset, count, check))
                reconstructed.update(read_exact(fd, len(subset.prefix) + piece.output_offset + offset, count, check))
                source.recheck()
            if original.digest() != reconstructed.digest():
                raise ValueError('subset reconstruction changed tensor bytes: ' + piece.name)
            tensor_hashes[piece.name] = original.hexdigest()
        digest = hashlib.sha256()
        for offset in range(0, subset.output_bytes, CHUNK):
            check()
            raw = read_exact(fd, offset, min(CHUNK, subset.output_bytes - offset), check)
            overlap = max(0, min(len(raw), len(subset.prefix) - offset))
            if raw[:overlap] != subset.prefix[offset:offset + overlap]:
                raise ValueError('subset header changed')
            digest.update(raw)
        source.recheck(); check()
        if (stamp(os.fstat(fd)) != stamp(before)
                or stamp(os.stat(temporary.name, dir_fd=parent, follow_symlinks=False)) != stamp(before)):
            raise ValueError('subset output changed during independent verification')
        named_parent = os.stat(output.parent, follow_symlinks=False)
        if (not stat.S_ISDIR(named_parent.st_mode)
                or (named_parent.st_dev, named_parent.st_ino) != (parent_identity.st_dev, parent_identity.st_ino)):
            raise ValueError('subset destination directory changed')
        os.link(temporary.name, output.name, src_dir_fd=parent, dst_dir_fd=parent, follow_symlinks=False)
        # Creating our final link changes ctime. Identity, extent and mtime must
        # still agree, and both names must refer to the authenticated owner.
        linked = os.stat(output.name, dir_fd=parent, follow_symlinks=False)
        current = os.fstat(fd)
        if (stamp(linked) != stamp(current)
                or stamp(current)[:4] != stamp(before)[:4]):
            raise ValueError('subset publication changed its owned file')
        os.unlink(temporary.name, dir_fd=parent)
        os.fsync(parent)
        source.recheck()
        return {'size': subset.output_bytes, 'sha256': digest.hexdigest(),
                'source_sha256': source.pin['sha256'], 'tensor_sha256': tensor_hashes,
                'qualification': False}
    finally:
        if fd is not None:
            os.close(fd)
        os.close(parent)
