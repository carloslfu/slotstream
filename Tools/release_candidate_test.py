"""Release reuses only an exact source-bound, checksummed CI artifact."""
import hashlib
import gzip
import io
import json
from pathlib import Path
import tarfile
import tempfile
import unittest
from unittest.mock import patch

from build_identity import source_files, sha
import release_candidate
from release_candidate import contents, verify_and_unpack


def archive_bytes(files, extra=None):
    output = io.BytesIO()
    with tarfile.open(fileobj=output, mode='w:gz') as archive:
        for name, data in files.items():
            entry = tarfile.TarInfo(name); entry.size = len(data)
            archive.addfile(entry, io.BytesIO(data))
        if extra is not None: archive.addfile(extra)
    return output.getvalue()


class ReadTrace(io.BytesIO):
    def __init__(self, raw):
        super().__init__(raw)
        self.furthest_requested = 0

    def seek(self, offset, whence=0):
        position = super().seek(offset, whence)
        self.furthest_requested = max(self.furthest_requested, position)
        return position

    def read(self, size=-1):
        position = self.tell()
        data = super().read(size)
        self.furthest_requested = max(self.furthest_requested, position + (size if size >= 0 else len(data)))
        return data


class MemberBoundTests(unittest.TestCase):
    def reject_at_header(self, entry, expected, prefix=b'', limit=None):
        # A real header without its declared payload: no large fixture is
        # allocated. Reject it before TarFile seeks to the next header.
        raw = prefix + entry.tobuf(format=tarfile.USTAR_FORMAT)
        stream = ReadTrace(raw)
        with tarfile.open(fileobj=stream, mode='r:') as archive, \
                patch.object(release_candidate, 'MAX_BYTES', release_candidate.MAX_BYTES if limit is None else limit), \
                patch.object(archive, 'extractfile', wraps=archive.extractfile) as extract:
            with self.assertRaises(ValueError): contents(archive, expected)
            extract.assert_not_called()
        self.assertLessEqual(stream.furthest_requested, len(raw))

    def test_oversized_member_is_refused_before_payload_traversal(self):
        entry = tarfile.TarInfo('slotstream'); entry.size = release_candidate.MAX_BYTES + 1
        self.reject_at_header(entry, {'slotstream'})

    def test_unknown_or_duplicate_member_is_refused_before_payload_traversal(self):
        entry = tarfile.TarInfo('unexpected'); entry.size = release_candidate.MAX_BYTES
        with self.subTest(kind='unknown'):
            self.reject_at_header(entry, {'slotstream'})
        first = tarfile.TarInfo('slotstream'); first.size = 1
        prefix = first.tobuf(format=tarfile.USTAR_FORMAT) + b'x' + bytes(511)
        entry.name = 'slotstream'
        entry.size = release_candidate.MAX_BYTES - 1
        with self.subTest(kind='duplicate'):
            self.reject_at_header(entry, {'slotstream', 'mlx.metallib'}, prefix)

    def test_cumulative_bound_is_checked_before_the_next_payload(self):
        first = tarfile.TarInfo('slotstream'); first.size = 5
        prefix = first.tobuf(format=tarfile.USTAR_FORMAT) + b'first' + bytes(507)
        second = tarfile.TarInfo('mlx.metallib'); second.size = 5
        self.reject_at_header(second, {'slotstream', 'mlx.metallib'}, prefix, limit=8)

    def test_unsupported_type_is_refused_without_reading_another_header(self):
        entry = tarfile.TarInfo('slotstream'); entry.type = tarfile.SYMTYPE; entry.linkname = 'target'
        self.reject_at_header(entry, {'slotstream'})

    def test_exact_bound_is_accepted_and_all_metadata_precedes_extraction(self):
        files = {'slotstream': b'abc', 'mlx.metallib': b'12345'}
        raw = archive_bytes(files)
        for mode, data in [('r:gz', raw), ('r:', gzip.decompress(raw))]:
            with self.subTest(mode=mode), tarfile.open(fileobj=io.BytesIO(data), mode=mode) as archive, \
                    patch.object(release_candidate, 'MAX_BYTES', 8):
                self.assertEqual(contents(archive, files), files)
        raw = archive_bytes(files | {'unexpected': b''})
        with tarfile.open(fileobj=io.BytesIO(raw), mode='r:gz') as archive, \
                patch.object(archive, 'extractfile', wraps=archive.extractfile) as extract:
            with self.assertRaises(ValueError): contents(archive, files)
            extract.assert_not_called()


class ReleaseCandidateTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(); self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        for name in ['Sources/Example.swift', 'Package.swift', 'Package.resolved', 'Makefile',
                     'Tools/build_identity.py', 'Tools/fetch_metallib.sh',
                     'THIRD_PARTY_NOTICES.md', 'Licenses/Example.txt']:
            path = self.root / name; path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('fixture: ' + name)
        source = {str(p.relative_to(self.root)): sha(p) for p in source_files(self.root)}
        self.files = {'slotstream': b'fixture executable', 'mlx.metallib': b'fixture library',
                      'build-source.tar.gz': archive_bytes({name:(self.root/name).read_bytes() for name in source})}
        self.identity = {'source': source, 'binary_sha256': hashlib.sha256(self.files['slotstream']).hexdigest(),
                         'metallib_sha256': hashlib.sha256(self.files['mlx.metallib']).hexdigest(),
                         'source_archive_sha256': hashlib.sha256(self.files['build-source.tar.gz']).hexdigest()}
        self.files['build-identity.json'] = json.dumps(self.identity).encode()
        self.archive = self.root / 'slotstream-arm64.tar.gz'; self.output = self.root / 'unpacked'

    def write_archive(self, extra=None):
        self.archive.write_bytes(archive_bytes(self.files, extra))
        self.archive.with_name(self.archive.name+'.sha256').write_text(sha(self.archive)+'  '+self.archive.name+'\n')

    def check_failure(self):
        with self.assertRaises(ValueError): verify_and_unpack(self.root, self.archive, self.output)
        self.assertFalse(self.output.exists())

    def test_exact_source_archive_and_binary_are_preserved(self):
        self.write_archive(); result = verify_and_unpack(self.root, self.archive, self.output)
        self.assertTrue(result['source_matches_checkout'])
        for name, data in self.files.items(): self.assertEqual((self.output/name).read_bytes(), data)
        self.assertTrue((self.output/'slotstream').stat().st_mode & 0o111)

    def test_corrupt_download_fails_before_output(self):
        self.write_archive(); self.archive.write_bytes(self.archive.read_bytes()+b'corrupt'); self.check_failure()

    def test_binary_mismatch_fails_before_output(self):
        self.files['slotstream'] = b'different executable'; self.write_archive(); self.check_failure()

    def test_stale_source_is_not_released(self):
        self.write_archive(); (self.root/'Sources/Example.swift').write_text('new code'); self.check_failure()

    def test_changed_or_missing_license_is_not_released(self):
        self.write_archive()
        (self.root/'Licenses/Example.txt').unlink()
        self.check_failure()

    def test_forged_source_archive_is_rejected(self):
        source = {name:(self.root/name).read_bytes() for name in self.identity['source']}
        source['Sources/Example.swift'] = b'other source'
        self.files['build-source.tar.gz'] = archive_bytes(source)
        self.identity['source_archive_sha256'] = hashlib.sha256(self.files['build-source.tar.gz']).hexdigest()
        self.files['build-identity.json'] = json.dumps(self.identity).encode()
        self.write_archive(); self.check_failure()

    def test_missing_and_unexpected_members_are_rejected(self):
        for name in list(self.files):
            with self.subTest(missing=name):
                data = self.files.pop(name); self.write_archive(); self.check_failure(); self.files[name] = data
        self.files['../unexpected'] = b'bad'; self.write_archive(); self.check_failure()

    def test_duplicate_member_is_rejected(self):
        self.write_archive(tarfile.TarInfo('slotstream')); self.check_failure()

    def test_symlink_member_is_rejected(self):
        self.files.pop('slotstream'); entry=tarfile.TarInfo('slotstream'); entry.type=tarfile.SYMTYPE; entry.linkname='/tmp/target'
        self.write_archive(entry); self.check_failure()

    def test_existing_output_is_not_overwritten(self):
        self.write_archive(); self.output.mkdir(); (self.output/'slotstream').write_text('keep')
        with self.assertRaises(FileExistsError): verify_and_unpack(self.root, self.archive, self.output)
        self.assertEqual((self.output/'slotstream').read_text(), 'keep')


if __name__ == '__main__': unittest.main()
