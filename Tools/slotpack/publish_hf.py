#!/usr/bin/env python3
"""Publish a verified Slotpack into an existing public Hugging Face model repo.

Only the content-addressed package subtree is written. Existing files must
match exactly; other repo contents are retained. Credentials stay in memory.
Re-running safely resumes from the repository's actual committed inventory.
"""
import argparse
import hashlib
import json
import logging
import os
from pathlib import Path
import re
import sys
import time

import pack


def file_identity(path):
    if path.is_symlink() or not path.is_file():
        raise ValueError('package entry must be a regular file')
    size = path.stat().st_size
    sha = hashlib.sha256()
    git = hashlib.sha1(f'blob {size}\0'.encode())
    with path.open('rb') as stream:
        while chunk := stream.read(1 << 20):
            sha.update(chunk)
            git.update(chunk)
    return dict(size=size, sha256=sha.hexdigest(), gitBlob=git.hexdigest())


def package_files(root):
    data = (root/'manifest.json').read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    build = json.loads((root/'build-receipt.json').read_text())
    if digest != (root/'manifest.sha256').read_text().strip() or digest != build['manifestSHA256']:
        raise ValueError('manifest identity mismatch')
    if not all(build.get(key) for key in ['allOriginalHashesVerified', 'roundtripVerified', 'completeCoverage']):
        raise ValueError('package lacks build qualification')
    manifest = json.loads(data)
    if manifest['format'] != 'slotpack-v1' or manifest['files'] != pack.pins():
        raise ValueError('package differs from the original model pins')
    pack.coverage(manifest['files'], manifest['objects'])
    files = {}
    for obj in manifest['objects']:
        sha = obj['sha256']
        if not re.fullmatch('[0-9a-f]{64}', sha):
            raise ValueError('invalid object identity')
        relative = f'objects/{sha[:2]}/{sha}.bin'
        identity = file_identity(root/relative)
        if identity['sha256'] != sha or identity['size'] != obj['size']:
            raise ValueError('compressed object identity mismatch')
        files[relative] = identity
    files['manifest.json'] = file_identity(root/'manifest.json')
    return digest, files


def remote_identity(entry):
    lfs = entry.lfs
    return dict(size=entry.size, sha256=lfs.sha256 if lfs else None,
                gitBlob=None if lfs else entry.blob_id)


def matches(expected, actual):
    if actual['size'] != expected['size']:
        return False
    key = 'sha256' if actual.get('sha256') else 'gitBlob'
    return actual.get(key) == expected[key]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--package', type=Path, required=True)
    parser.add_argument('--repo', required=True)
    parser.add_argument('--receipt', type=Path, required=True)
    parser.add_argument('--token-stdin', action='store_true')
    parser.add_argument('--batch-size', type=int, default=64)
    parser.add_argument('--copy-from-repo', help='Reuse identical LFS objects already published in another model repo')
    parser.add_argument('--copy-from-revision', help='Exact source commit for server-side reuse')
    args = parser.parse_args()
    if not 1 <= args.batch_size <= 100:
        parser.error('batch size must be 1..100')
    if bool(args.copy_from_repo) != bool(args.copy_from_revision) or (args.copy_from_revision and not re.fullmatch('[0-9a-f]{40}', args.copy_from_revision)):
        parser.error('server-side reuse requires a source repo and exact commit')
    token = sys.stdin.readline(16385).strip() if args.token_stdin else os.environ.get('HF_TOKEN')
    if not token or len(token) > 16384:
        parser.error('provide existing authority through HF_TOKEN or --token-stdin')
    os.environ['HF_HUB_DISABLE_PROGRESS_BARS'] = '1'
    os.environ['HF_HUB_VERBOSITY'] = 'critical'
    logging.disable(logging.CRITICAL)
    from huggingface_hub import HfApi, CommitOperationAdd, CommitOperationCopy, RepoFile
    from huggingface_hub.errors import RemoteEntryNotFoundError
    api = HfApi(token=token)
    info = api.model_info(args.repo)
    if info.private or info.gated:
        raise ValueError('publication requires an existing public, ungated model repo')
    original_head = head = info.sha
    original = {e.path: remote_identity(e) for e in api.list_repo_tree(args.repo, recursive=True, revision=head) if isinstance(e, RepoFile)}
    digest, files = package_files(args.package)
    prefix = 'slotpack/v1/'+digest
    start = time.monotonic()
    try:
        remote = {e.path[len(prefix)+1:]: remote_identity(e) for e in api.list_repo_tree(args.repo, path_in_repo=prefix, recursive=True, revision=head) if isinstance(e, RepoFile)}
    except RemoteEntryNotFoundError:
        remote = {}
    for relative, actual in remote.items():
        if relative not in files or not matches(files[relative], actual):
            raise ValueError('immutable package subtree already contains different data')
    reusable = set()
    if args.copy_from_repo:
        for entry in api.list_repo_tree(args.copy_from_repo, path_in_repo=prefix, recursive=True, revision=args.copy_from_revision):
            if not isinstance(entry, RepoFile): continue
            relative = entry.path[len(prefix)+1:]
            if relative in files and entry.lfs and matches(files[relative], remote_identity(entry)):
                reusable.add(relative)
    pending = [relative for relative in files if relative not in remote]
    commits = []
    args.receipt.parent.mkdir(parents=True, exist_ok=True)
    def save(complete):
        receipt = dict(complete=complete, repo=args.repo, initialRevision=original_head,
                       revision=head, prefix=prefix, manifestSHA256=digest,
                       objects=len(files)-1, packageBytes=sum(f['size'] for f in files.values()),
                       committedFiles=len(remote), commits=commits,
                       seconds=round(time.monotonic()-start, 1))
        temp = args.receipt.with_suffix('.tmp')
        temp.write_text(json.dumps(receipt, indent=2)+'\n')
        os.replace(temp, args.receipt)
        print(json.dumps(receipt), flush=True)
    save(False)
    for start_index in range(0, len(pending), args.batch_size):
        batch = pending[start_index:start_index+args.batch_size]
        operations = [CommitOperationCopy(path_in_repo=prefix+'/'+relative, src_path_in_repo=prefix+'/'+relative,
                                          src_repo_id=args.copy_from_repo, src_revision=args.copy_from_revision, src_repo_type='model')
                      if relative in reusable else CommitOperationAdd(path_in_repo=prefix+'/'+relative, path_or_fileobj=args.package/relative)
                      for relative in batch]
        commit = api.create_commit(args.repo, operations, repo_type='model',
                                   commit_message='Publish lossless Slotpack '+digest[:12],
                                   revision='main', parent_commit=head, num_threads=8)
        head = commit.oid
        commits.append(head)
        for relative in batch:
            remote[relative] = files[relative]
        save(False)
    final = {e.path: remote_identity(e) for e in api.list_repo_tree(args.repo, recursive=True, revision=head) if isinstance(e, RepoFile)}
    for path, identity in original.items():
        if not path.startswith(prefix+'/') and final.get(path) != identity:
            raise ValueError('an existing repo file changed during publication')
    if {path[len(prefix)+1:] for path in final if path.startswith(prefix+'/')} != set(files):
        raise ValueError('published package inventory differs')
    for relative, expected in files.items():
        if not matches(expected, final[prefix+'/'+relative]):
            raise ValueError('published package content identity differs')
    save(True)


if __name__ == '__main__':
    try:
        main()
    except Exception as error:
        # Provider exception strings may contain signed URLs. Keep those out of
        # receipts and logs; HTTP status and exception type suffice for recovery.
        response = getattr(error, 'response', None)
        print(json.dumps(dict(complete=False, errorType=type(error).__name__,
                              httpStatus=getattr(response, 'status_code', None))), file=sys.stderr)
        sys.exit(1)
