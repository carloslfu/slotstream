# Export an offline support bundle

`Tools/support_bundle.py` creates a local ZIP from log files you explicitly
select. It uses only Python's standard library and needs Python 3.9 or later
on a system with no-follow and nonblocking file opens, including macOS. It
does not find logs automatically, run commands, collect environment variables,
contact the network, upload anything, or start Slotstream or a model.

From a repository checkout, replace the example paths with your selected logs
and a new output path. Keep quotes around paths with spaces:

```sh
python3 -B Tools/support_bundle.py \
  --log "/path/to/selected-server.log" \
  --log "/path/to/selected-client.log" \
  --output "/path/to/new-support-bundle.zip"
```

Repeat `--log` for each file, in the desired order. `--output` is required;
its parent directory must already exist. Existing output files and symlinks,
including broken symlinks, are refused. For usage, run:

```sh
python3 -B Tools/support_bundle.py --help
```

Successful output reports only the anonymous file count. Input errors identify
the numbered input or a generic cause, without printing source names, log text
or operating-system exception filenames. A nonzero exit means the export did
not complete. Check the input files and output location yourself; the tool does
not print their paths for you.

## Inspect before sharing

Sanitization is targeted and best effort. **The ZIP is not automatically safe
to share.** Open it locally and read every log member and the manifest before
any separate sharing action. For example, list members and inspect a selected
member using Python's standard-library ZIP reader:

```sh
python3 -m zipfile -l "/path/to/new-support-bundle.zip"
python3 -c 'import sys, zipfile; z = zipfile.ZipFile(sys.argv[1]); print(z.read("manifest.json").decode("utf-8")); print(z.read("logs/001.txt").decode("utf-8"))' "/path/to/new-support-bundle.zip"
```

Repeat the second command with each numbered log member, or use a local ZIP
viewer and text editor. These inspection commands display sanitized contents
in your terminal; they do not upload them. If anything private remains, edit a
copy of the selected source log and export to a different new output path.

The policy replaces:

- Complete lines containing recognized credential keys followed by `:` or `=`,
  case-insensitively, including quoted JSON keys: `authorization`,
  `proxy-authorization`, `cookie`, `set-cookie`, `x-api-key`, `api-key`,
  `api_key`, `password`, `passwd`, `pwd`, `secret`, `client_secret`,
  `access_token`, `refresh_token`, `id_token` and `token`. Lines containing
  a Bearer credential are also replaced. Similar diagnostic words such as
  `token_count`, `passwordless` and `authorization_failed` remain.
- PEM private-key blocks with conventional uppercase `BEGIN … PRIVATE KEY`
  markers, through their matching end marker or through the end of the input
  when unterminated. The complete marker lines are removed too.
- Entire literal HTTP(S) URLs, including the host, user information, path,
  query and fragment. This deliberately loses URL diagnostics to remove
  credentials that may appear anywhere in a URL. Apostrophes are valid URL
  content, so a closing single quote and adjacent text before the next URL
  boundary can also be redacted when a URL is single-quoted.
- Conventional `/Users/name`, `/home/name` and drive-letter Windows
  `C:\Users\name` home prefixes, replacing them with `[HOME]`. Names can
  contain spaces; Windows backslashes may be literal or doubled as in JSON.
  Path suffixes such as `/project` or `\logs` remain. Without a following
  separator or quote, a space-containing name can cause adjacent text to be
  redacted too.

Other text and ordinary line endings are preserved. Replacement markers can
break JSON or other structured-log syntax; archived logs are plain text.
Counts report replacements actually applied: a URL inside an already removed
credential line does not add a URL count.

Arbitrary free-text secrets, private conversation or file contents, addresses,
unrecognized credential names, unusual usernames/path forms and multiline
values outside recognized private-key blocks may remain. Encoded or escaped
forms are not decoded: for example, escaped URL slashes, percent-encoded home
prefixes, Unicode escapes and encoded credentials need manual inspection.
Paths outside the recognized home-prefix rules can remain in log text.

## Bounds and archive contents

Limits are inclusive: one to sixteen inputs, at most one MiB (1,048,576 bytes)
per file, and eight MiB (8,388,608 bytes) combined. These are conservative
exporter resource limits for bounded reads and in-memory ZIP construction;
they are not model limits or performance measurements. Trim or split larger
captures explicitly. The tool refuses invalid UTF-8, NUL bytes, directories,
special files, final-component symlinks, duplicate device/inode identities
(including hard links), and file changes observed during reading. Stop writes
to selected logs or use stable copies before exporting.

The ZIP contains `manifest.json` followed by `logs/001.txt`, `logs/002.txt`,
and so on, in input order. Schema and policy versions are both `1`. Each
manifest row records the anonymous member name, original and sanitized byte
lengths, SHA-256 of the **sanitized** bytes, and counts for credential lines,
private-key blocks, URLs and home prefixes. It does not record source names,
source paths, source timestamps or hashes of raw input bytes. Unchanged text
can naturally have the same hash as its input.

ZIP member timestamps are fixed to the ZIP epoch, member comments and extra
fields are empty, and member permissions are private. The output file is mode
`0600` on POSIX. Filesystem timestamps of the new ZIP itself are ordinary
creation/write timestamps; they are not source timestamps.

## Filesystem and failure limits

The exporter checks regular-file descriptor identity, size and modification/
change times before and after bounded reads, and compares the final source
path without following its final symlink. These checks detect observed
changes; they do not provide a filesystem snapshot or prevent later edits.
Parent directories can be followed and remain your responsibility. Choose
trusted input and output directories; this tool is not a hostile-directory
defense.

All selected inputs are validated and the ZIP is built in memory before the
output is created exclusively. Short writes are completed. On a handled
output I/O failure or keyboard interruption, cleanup is attempted only when
the output path still identifies the file created by this invocation; an
observed concurrent replacement is retained. Cleanup can itself fail. This
is no-clobber export, not atomic visibility: another reader can see a partial
file while it is being written, and a forced termination or crash can leave
a partial ZIP. Inspect the output location after an interrupted export and
choose a new path when retrying.
