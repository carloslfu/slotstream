"""Execute only the actual raw-resume verdict block, never raw main/transport.

The intact progress guard and three verdict statements use tiny real partmaps,
a real Counter and one finite check callback. No project module is imported.
"""
import ast
import collections
import contextlib
import hashlib
import io
import json
from pathlib import Path
import tempfile
import traceback
import unittest


SOURCE = Path(__file__).with_name('raw_checks.py').resolve()
CHUNK = 64 * 1024 * 1024
CACHED = ('good', 'weights.safetensors', 0)
MISSING = [('good', 'weights.safetensors', start * CHUNK) for start in (1, 2, 3)] + [
    ('good', 'mtp.safetensors', start * CHUNK) for start in (0, 1, 2)] + [('good', 'config.json', 0)]
MAPS = {'weights.safetensors.partmap': b'\x01\x00\x00\x00',
        'mtp.safetensors.partmap': b'\x00\x00\x00', 'config.json.partmap': b'\x00'}


def verdict_block():
    text = SOURCE.read_text()
    tree = ast.parse(text, filename=str(SOURCE))
    mains = [node for node in tree.body if isinstance(node, ast.FunctionDef) and node.name == 'main']
    if len(mains) != 1:
        raise ValueError('expected one actual main')
    blocks = [node for node in mains[0].body if isinstance(node, ast.With) and len(node.items) == 1
              and isinstance(node.items[0].context_expr, ast.Call)
              and ast.dump(node.items[0].context_expr) == ast.dump(ast.parse(
                  "tempfile.TemporaryDirectory(prefix='slotpack-raw-check-')", mode='eval').body)]
    if len(blocks) != 1:
        raise ValueError('expected the unique private raw fixture with-body')
    body = blocks[0].body
    cancel = ast.dump(ast.parse("check('raw-cancel', 'pause-resume', False, dest=dest, cancel='after-progress')", mode='eval').body)
    repairs = ast.dump(ast.parse("good.glob('*.safetensors')", mode='eval').body)
    starts = [index for index, node in enumerate(body) if isinstance(node, ast.Expr) and ast.dump(node.value) == cancel]
    ends = [index for index, node in enumerate(body) if isinstance(node, ast.For) and ast.dump(node.iter) == repairs]
    if len(starts) != 1 or len(ends) != 1 or not starts[0] < ends[0]:
        raise ValueError('actual cancel/repair anchors are not unique and ordered')
    selected = body[starts[0] + 1:ends[0]]
    if [type(node) for node in selected] != [ast.Assert, ast.Assign, ast.Expr, ast.Assert]:
        raise ValueError('expected intact guard, before assignment, check call and verdict assertion')
    if ast.dump(selected[2].value) != ast.dump(ast.parse("check('raw-resume', dest=dest)", mode='eval').body):
        raise ValueError('actual selected check invocation changed')
    # The parsed original nodes are compiled directly. No predicate, expression,
    # location or AST node is replaced, copied, shortened or otherwise rewritten.
    module = ast.Module(body=selected, type_ignores=[])
    first, last = selected[0].lineno, selected[-1].end_lineno
    selected_text = ''.join(text.splitlines(keepends=True)[first-1:last])
    metadata = {'selected_text': selected_text, 'selected_text_sha256': hashlib.sha256(selected_text.encode()).hexdigest(),
                'selected_ast_sha256': hashlib.sha256(ast.dump(module, include_attributes=True).encode()).hexdigest(),
                'selected_line_start': first, 'selected_line_end': last, 'selected_statements': 4,
                'selected_node_types': [type(node).__name__ for node in selected]}
    return compile(module, str(SOURCE), 'exec'), metadata


def counter_rows(counter):
    return [{'key': list(key), 'count': count} for key, count in sorted(counter.items())]


class FiniteCheck:
    def __init__(self, counter, requests, dest):
        self.counter, self.requests, self.dest = counter, tuple(requests), dest
        self.calls, self.trace = [], []

    def __call__(self, *args, **options):
        self.calls.append({'args': list(args), 'kwargs': {name: str(value) for name, value in options.items()}})
        if len(self.calls) != 1 or args != ('raw-resume',) or options != {'dest': self.dest}:
            raise AssertionError('unexpected/extra check call; no native fallback exists')
        for key in self.requests:
            self.counter[key] += 1
            self.trace.append({'key': list(key), 'count_after': self.counter[key]})
        return self.dest


class VerdictCase(unittest.TestCase):
    def scenario(self, label, requests, *, initial=None, maps=None):
        executable, selected = verdict_block()
        counter = collections.Counter(initial or {})
        before = counter.copy()
        with tempfile.TemporaryDirectory(prefix="raw verdict's fixture ") as folder:
            dest = Path(folder).resolve()/'resumed'
            dest.mkdir()
            contents = dict(MAPS if maps is None else maps)
            for name, data in contents.items():
                (dest/name).write_bytes(data)
                (dest/name).chmod(0o600)
            files_before = {name: {'hex': data.hex(), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()}
                            for name, data in sorted(contents.items())}
            provider = FiniteCheck(counter, requests, dest)
            stdout, stderr = io.StringIO(), io.StringIO()
            result = {'kind': 'returned'}
            # Only sum/any are exposed for the original guard/verdict. No import,
            # transport/process/compiler API, native binary or whole-main entry.
            namespace = {'__builtins__': {'sum': sum, 'any': any},
                         'counts': counter, 'check': provider, 'dest': dest}
            with contextlib.redirect_stdout(stdout), contextlib.redirect_stderr(stderr):
                try:
                    exec(executable, namespace)
                except BaseException as error:
                    result = {'kind': 'AssertionError' if type(error) is AssertionError else 'propagated_exception',
                              'type': type(error).__name__, 'module': type(error).__module__, 'message': str(error),
                              'traceback': ''.join(traceback.format_exception(type(error), error, error.__traceback__))}
            files_after = {name: {'hex': (dest/name).read_bytes().hex(), 'bytes': (dest/name).stat().st_size,
                                 'sha256': hashlib.sha256((dest/name).read_bytes()).hexdigest()}
                           for name in sorted(contents)}
            proof = {'proof_kind': 'test_proof_not_transport_or_product_report', 'fixture': label,
                     'source_sha256': hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
                     'test_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(), **selected,
                     'initial_counts': counter_rows(before), 'final_counts': counter_rows(counter),
                     'request_plan': [list(key) for key in requests], 'request_trace': provider.trace,
                     'planned_requests': len(requests), 'consumed_requests': len(provider.trace),
                     'check_calls': provider.calls, 'check_call_count': len(provider.calls), 'private_dest': str(dest),
                     'partmaps_before': files_before, 'partmaps_after': files_after,
                     'actual_outcome': result, 'fragment_stdout': stdout.getvalue(), 'fragment_stderr': stderr.getvalue(),
                     'boundary': 'intact source-extracted progress/verdict block only; no whole main, downloader, HTTP, native execution or OS-exit qualification'}
            proof_path = dest.parent/'test-proof.json'
            proof_path.write_text(json.dumps(proof, indent=2, sort_keys=True) + '\n')
            actual_bytes = proof_path.read_bytes()
            envelope = dict(proof, proof_sha256=hashlib.sha256(actual_bytes).hexdigest(), proof_bytes=len(actual_bytes))
            print('RAW_RESUME_GATE_FIXTURE ' + json.dumps(envelope, sort_keys=True))
            self.assertEqual(json.loads(actual_bytes), proof)
            self.assertEqual(files_before, files_after)
            self.assertLessEqual(sum(row['bytes'] for row in files_before.values()), 8)
            self.assertTrue(all((dest/name).stat().st_mode & 0o111 == 0 for name in contents))
            self.assertIn(result['kind'], ('returned', 'AssertionError', 'propagated_exception'))
            if result['kind'] == 'propagated_exception':
                self.assertIn(label, ('control/progress-missing', 'control/progress-empty'))
                self.assertIn(result['type'], ('FileNotFoundError', 'IndexError'))
            self.assertEqual(stdout.getvalue(), '')
            self.assertEqual(stderr.getvalue(), '')
            self.assertLessEqual(len(provider.calls), 1)
            expected = before.copy()
            if provider.calls:
                for key in requests:
                    expected[key] += 1
            self.assertEqual(counter, expected)
            self.assertEqual(len(provider.trace), len(requests) if provider.calls else 0)
            for call in provider.calls:
                self.assertEqual(call, {'args': ['raw-resume'], 'kwargs': {'dest': str(dest)}})
            return envelope

    def verdict(self, value, kind, calls, requests):
        self.assertEqual(value['actual_outcome']['kind'], kind, repr(value['actual_outcome']))
        self.assertEqual(value['check_call_count'], calls)
        self.assertEqual(value['consumed_requests'], requests)


class BaselineControls(VerdictCase):
    def test_ordinary_seven_missing_ranges_are_reused(self):
        self.verdict(self.scenario('control/ordinary-reuse', MISSING), 'returned', 1, 7)

    def test_arbitrary_existing_counts_do_not_change_verdict(self):
        existing = {CACHED: 9, ('pause-resume', 'weights.safetensors', 0): 12,
                    ('good', 'unrelated.json', 0): 27, ('missing', 'mtp.safetensors', 0): 4}
        self.verdict(self.scenario('control/preexisting-counts', MISSING, initial=existing), 'returned', 1, 7)

    def test_full_eight_chunk_redownload_fails(self):
        self.verdict(self.scenario('control/full-redownload', [CACHED, *MISSING]), 'AssertionError', 1, 8)

    def test_no_completed_progress_fails_before_check(self):
        empty = {name: bytes(len(data)) for name, data in MAPS.items()}
        missing = {name: data for name, data in empty.items() if not name.startswith('weights.')}
        for label, maps in (('zero', empty), ('missing', missing),
                            ('empty', dict(empty, **{'weights.safetensors.partmap': b''}))):
            with self.subTest(progress=label):
                value = self.scenario('control/progress-' + label, MISSING, maps=maps)
                allowed = [('AssertionError', 'AssertionError')]
                if label == 'missing': allowed.append(('propagated_exception', 'FileNotFoundError'))
                if label == 'empty': allowed.append(('propagated_exception', 'IndexError'))
                self.assertIn((value['actual_outcome']['kind'], value['actual_outcome'].get('type')), allowed)
                self.assertEqual(value['check_call_count'], 0)
                self.assertEqual(value['consumed_requests'], 0)


class ResumeVerdictRegression(VerdictCase):
    def test_one_retry_preserves_reuse(self):
        self.verdict(self.scenario('regression/one-retry', [*MISSING, MISSING[0]]), 'returned', 1, 8)

    def test_four_bounded_retries_preserve_reuse(self):
        # Two extras on each of two missing ranges: at most three attempts per
        # range. These are recorded callback observations, not HTTP retries.
        self.verdict(self.scenario('regression/four-retries', [*MISSING, MISSING[0], MISSING[0], MISSING[1], MISSING[1]]), 'returned', 1, 11)

    def test_cached_range_redownload_with_optional_missing_fails(self):
        required_and_optional_failure = [CACHED, *MISSING[:3], MISSING[-1], ('good', 'mtp.safetensors', 0)]
        self.verdict(self.scenario('regression/cached-zero-with-optional-missing', required_and_optional_failure), 'AssertionError', 1, 6)

    def test_other_progress_does_not_establish_cached_zero(self):
        for label, changed in (('other-weight-chunk', {'weights.safetensors.partmap': b'\x00\x01\x00\x00'}),
                               ('other-file', {'weights.safetensors.partmap': b'\x00\x00\x00\x00', 'mtp.safetensors.partmap': b'\x01\x00\x00'})):
            with self.subTest(progress=label):
                self.verdict(self.scenario('regression/progress-' + label, MISSING, maps=dict(MAPS, **changed)), 'AssertionError', 0, 0)


if __name__ == '__main__':
    unittest.main(verbosity=2)
