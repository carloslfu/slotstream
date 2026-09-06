#!/usr/bin/env python3
"""Publication checks: reject changed bytes and preserve immutable identities."""
import hashlib
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import publish_hf


class PublicationChecks(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        payload = b'verified compressed test object'
        sha = hashlib.sha256(payload).hexdigest()
        self.relative = f'objects/{sha[:2]}/{sha}.bin'
        (self.root/self.relative).parent.mkdir(parents=True)
        (self.root/self.relative).write_bytes(payload)
        self.files = [dict(path='weights.bin', size=4, sha256='0'*64)]
        manifest = dict(format='slotpack-v1', files=self.files, objects=[dict(
            sha256=sha, size=len(payload), rawSize=4, rawSHA256='0'*64,
            ranges=[dict(file=0, offset=0, length=4)])])
        data = (json.dumps(manifest)+'\n').encode()
        self.digest = hashlib.sha256(data).hexdigest()
        (self.root/'manifest.json').write_bytes(data)
        (self.root/'manifest.sha256').write_text(self.digest+'\n')
        self.build = dict(manifestSHA256=self.digest, allOriginalHashesVerified=True,
                          roundtripVerified=True, completeCoverage=True)
        (self.root/'build-receipt.json').write_text(json.dumps(self.build))
        self.patch = patch.object(publish_hf.pack, 'pins', return_value=self.files)
        self.patch.start()
        self.addCleanup(self.patch.stop)

    def test_only_manifest_named_files_are_published(self):
        (self.root/'private.log').write_text('must not be uploaded')
        digest, files = publish_hf.package_files(self.root)
        self.assertEqual(digest, self.digest)
        self.assertEqual(set(files), {self.relative, 'manifest.json'})

    def test_changed_object_is_rejected(self):
        (self.root/self.relative).write_bytes(b'changed compressed test object')
        with self.assertRaises(ValueError): publish_hf.package_files(self.root)

    def test_changed_manifest_is_rejected(self):
        with (self.root/'manifest.json').open('ab') as stream: stream.write(b' ')
        with self.assertRaises(ValueError): publish_hf.package_files(self.root)

    def test_symlink_object_is_rejected(self):
        original = self.root/self.relative
        copy = self.root/'copy'
        original.rename(copy)
        original.symlink_to(copy)
        with self.assertRaises(ValueError): publish_hf.package_files(self.root)

    def test_missing_build_gate_is_rejected(self):
        self.build['roundtripVerified'] = False
        (self.root/'build-receipt.json').write_text(json.dumps(self.build))
        with self.assertRaises(ValueError): publish_hf.package_files(self.root)

    def test_different_model_pins_are_rejected(self):
        with patch.object(publish_hf.pack, 'pins', return_value=[]):
            with self.assertRaises(ValueError): publish_hf.package_files(self.root)

    def test_remote_identity_supports_git_and_lfs_and_rejects_changes(self):
        identity = publish_hf.file_identity(self.root/self.relative)
        self.assertTrue(publish_hf.matches(identity, dict(size=identity['size'], sha256=identity['sha256'])))
        self.assertTrue(publish_hf.matches(identity, dict(size=identity['size'], gitBlob=identity['gitBlob'])))
        self.assertFalse(publish_hf.matches(identity, dict(size=identity['size'], sha256='0'*64)))
        self.assertFalse(publish_hf.matches(identity, dict(size=identity['size']+1, sha256=identity['sha256'])))


if __name__ == '__main__': unittest.main()
