"""Release reuses only an exact source-bound, checksummed CI artifact."""
import hashlib
import io
import json
from pathlib import Path
import tarfile
import tempfile
import unittest

from build_identity import source_files, sha
from release_candidate import verify_and_unpack


def archive_bytes(files, extra=None):
    output = io.BytesIO()
    with tarfile.open(fileobj=output, mode='w:gz') as archive:
        for name, data in files.items():
            entry = tarfile.TarInfo(name); entry.size = len(data)
            archive.addfile(entry, io.BytesIO(data))
        if extra is not None: archive.addfile(extra)
    return output.getvalue()


class ReleaseCandidateTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(); self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        for name in ['Sources/Example.swift', 'Package.swift', 'Package.resolved', 'Makefile',
                     'Tools/build_identity.py', 'Tools/fetch_metallib.sh']:
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
