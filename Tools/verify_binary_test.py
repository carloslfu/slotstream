"""Exercise verify.sh's real dispatch/check functions without model or build work."""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name('verify.sh').read_text()


class VerifyBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-verify-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.safety = self.root/'safety.txt'
        self.paths = {}
        for name, relative in [('release', '.build/release/slotstream'),
                               ('legacy', 'legacy/slotstream'),
                               ('frozen', "frozen space's; $(touch injected)/selected")]:
            path = self.root/relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['VERIFY_FIXTURE_TRACE'], 'a') as output:
    output.write(json.dumps({'binary': __file__, 'arguments': sys.argv[1:]})+'\\n')
if sys.argv[1:] == ['template-check']:
    print('248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271')
raise SystemExit(int(os.environ.get('VERIFY_FIXTURE_EXIT', '0')))
''')
            path.chmod(0o755)
            self.paths[name] = path

    def run_check(self, changes=None, *, template=False, vision=False):
        # Extract the actual header, check function and one real call site.
        # Replace only the external preflight observation; full verify.sh,
        # its compiler/weight reads and its model battery are never launched.
        header = SCRIPT[SCRIPT.index('BIN='):SCRIPT.index('QPID=""')]
        needle = ('check "vision tower dumps' if vision else
                  'check "chat template ==' if template else 'check "layer parity (')
        lines = SCRIPT.splitlines()
        index = next(i for i, line in enumerate(lines) if line.lstrip().startswith(needle))
        call = lines[index]
        while call.endswith('\\'):
            index += 1
            call += '\n'+lines[index]
        script = 'set -eo pipefail\n'+header+'''
safety_before() {
  printf '%s\\n' "$1" >> "$VERIFY_FIXTURE_SAFETY"
  return "${VERIFY_FIXTURE_PREFLIGHT_EXIT:-0}"
}
'''+call+'\n[ "$FAIL" -eq 0 ]\n'
        env = {k:v for k,v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VERIFY_FIXTURE_'))}
        env.update(SLOTSTREAM_VERIFY_OUT=str(self.root/"results space's"),
                   VP=str(self.root/"vision output's; $(touch injected)"),
                   VERIFY_FIXTURE_TRACE=str(self.trace), VERIFY_FIXTURE_SAFETY=str(self.safety))
        env.update(changes or {})
        p = subprocess.run(['bash', '-c', script], cwd=self.root, env=env,
                           text=True, capture_output=True, timeout=10)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] if self.trace.exists() else []
        self.assertFalse((self.root/'injected').exists(), p.stdout+p.stderr)
        return p, rows

    def selected(self, env, name, *, template=False, vision=False):
        p, rows = self.run_check(env, template=template, vision=vision)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(len(rows), 1)
        self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name].resolve())
        self.assertEqual(rows[0]['arguments'],
                         ['vision-parity', '--out', str(self.root/"vision output's; $(touch injected)")] if vision else
                         ['template-check'] if template else
                         ['parity', '--tokens', '9707,11,1246,525,498,30', '--layers', '2', '--compare', 'bench/parity31', '--row-invariant'])
        if not template:
            self.assertEqual(self.safety.read_text(), '13\n')

    def test_default_release(self):
        self.selected({}, 'release')

    def test_legacy_bin(self):
        self.selected({'BIN': str(self.paths['legacy'])}, 'legacy')

    def test_selected_path_preserves_spaces_quotes_and_shell_metacharacters(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_explicit_selection_has_precedence(self):
        self.selected({'BIN': str(self.paths['legacy']), 'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_template_substitution_uses_selected_path(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', template=True)

    def test_vision_output_path_is_passed_as_one_literal_argument(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', vision=True)

    def test_missing_selected_file_does_not_fall_back(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_failure_fails_gate(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_EXIT': '23'})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(len(rows), 1)

    def test_failed_preflight_prevents_launch(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_PREFLIGHT_EXIT': '2'})
        self.assertEqual(p.returncode, 2)
        self.assertEqual(rows, [])


class VerifyContextStatus(unittest.TestCase):
    def test_context_failures_are_recorded_without_truncating_the_battery(self):
        valid = {
            'fits': True, 'aborted': None, 'prefill_tokens': 2048,
            'stats': {
                'sampledFootprint': {'peakBytes': 8_000_000_000, 'samples': 10,
                                     'intervalMilliseconds': 50},
                'lifetimeRSSPeakBytes': 8_000_000_000,
                'physicalFootprintEndBytes': 7_000_000_000,
                'generatorVMBefore': {'swapins': 10, 'swapouts': 20},
                'generatorVMAfter': {'swapins': 10, 'swapouts': 20},
            },
        }
        excluded = json.loads(json.dumps(valid))
        excluded['fits'] = False
        excluded['stats']['memoryPressureCancelled'] = True
        paging = json.loads(json.dumps(valid))
        paging['stats']['generatorVMAfter'].update(swapins=100, swapouts=200)
        oversized = json.loads(json.dumps(valid))
        oversized['stats']['sampledFootprint']['peakBytes'] = 10_000_000_001
        cases = [
            ('success', json.dumps(valid), 0, 0, 2, 0),
            ('global paging is diagnostic', json.dumps(paging), 0, 0, 2, 0),
            ('actual pressure cancellation', json.dumps(excluded), 1, 0, 0, 2),
            ('nonzero overrides success JSON', json.dumps(valid), 23, 0, 1, 1),
            ('zero cannot override failed observations', json.dumps(excluded), 0, 0, 0, 2),
            ('memory ceiling remains mandatory', json.dumps(oversized), 0, 0, 1, 1),
            ('empty output replaces stale success', '', 23, 0, 0, 2),
            ('malformed output', '{broken', 0, 0, 0, 2),
            ('missing fields', '{}', 0, 0, 0, 2),
            ('failed preflight prevents generation', '', 0, 2, 0, 2),
        ]
        for name, output, status, preflight, passed, failed in cases:
            with self.subTest(name=name), tempfile.TemporaryDirectory(prefix='slotstream-context-status-') as directory:
                root = Path(directory)
                results = root/"results space's; $(touch injected)"
                fixture = root/"binary space's"
                fixture.write_text('''#!/usr/bin/env python3
import os,sys
assert sys.argv[1:] == ['context-check','--tokens','2048','--memory-gb','10','--sample-footprint','--json']
sys.stdout.write(os.environ['VERIFY_CONTEXT_TEXT'])
sys.stderr.write('context diagnostic\\n')
raise SystemExit(int(os.environ['VERIFY_CONTEXT_EXIT']))
''')
                fixture.chmod(0o755)
                context_json = root/'context.json'
                context_json.write_text(json.dumps(valid))
                header = SCRIPT[SCRIPT.index('BIN='):SCRIPT.index('QPID=""')]
                start = SCRIPT.index('CONTEXT_STATUS=0')
                end = SCRIPT.index('echo "== serving robustness', start)
                block = SCRIPT[start:end].replace('/tmp/ssv_ctx.json', str(context_json))
                block = block.replace('Tools/memory_gate.py', str(Path(__file__).with_name('memory_gate.py').resolve()))
                script = 'set -eo pipefail\n'+header+'''
safety_before() { return "$VERIFY_CONTEXT_PREFLIGHT"; }
BIG_MEMORY=10
'''+block+'''
printf 'AFTER_CONTEXT\\nCOUNTS %s %s\\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
'''
                env = {k: v for k, v in os.environ.items()
                       if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VERIFY_CONTEXT_'))}
                env.update(SLOTSTREAM_TEST_BINARY=str(fixture), SLOTSTREAM_VERIFY_OUT=str(results),
                           VERIFY_CONTEXT_TEXT=output, VERIFY_CONTEXT_EXIT=str(status),
                           VERIFY_CONTEXT_PREFLIGHT=str(preflight))
                process = subprocess.run(['bash', '-c', script], cwd=root, env=env,
                                         text=True, capture_output=True, timeout=10)
                self.assertIn('AFTER_CONTEXT', process.stdout, process.stdout+process.stderr)
                self.assertIn(f'COUNTS {passed} {failed}', process.stdout)
                self.assertEqual(process.returncode, int(failed != 0), process.stdout+process.stderr)
                self.assertEqual(context_json.read_text(), output)
                self.assertEqual((results/'context-check.exit-status.txt').read_text(), f'{preflight or status}\n')
                self.assertEqual((results/'context-check.stderr.txt').read_text(),
                                 '' if preflight else 'context diagnostic\n')
                self.assertEqual(len(list(results.glob('check-*.txt'))), 2)
                self.assertFalse((root/'injected').exists())


class VerifyGovernorStatus(unittest.TestCase):
    small = False

    def run_status(self, text, status=0):
        with tempfile.TemporaryDirectory(prefix='slotstream-governor-status-') as directory:
            root = Path(directory)
            result = root/"results PASS; $(touch injected)"
            result.mkdir()
            fixture = root/"selected binary's path"
            args = (['elastic-drill', '--memory-limit-gb', '10', '--max-memory-gb', '10', '--mtp', 'off']
                    if self.small else ['elastic-drill', '--slots', '1000', '--max-memory-gb', '13', '--memory-limit-gb', '13', '--mtp', 'off'])
            fixture.write_text("#!/usr/bin/env python3\nimport os,sys\n"
                               f"assert sys.argv[1:] == {args!r}\n"
                               "sys.stdout.write(os.environ['VERIFY_DRILL_TEXT'])\n"
                               "raise SystemExit(int(os.environ['VERIFY_DRILL_STATUS']))\n")
            fixture.chmod(0o755)
            # Execute the actual verification block with the real system sed.
            # Only the native model-producing command is replaced by a fixture.
            if self.small:
                start = SCRIPT.index('SMALL_DRILL_LOG=')
                end = SCRIPT.index('\nfi', start)+len('\nfi')
            else:
                start = SCRIPT.index('DRILL_LOG=')
                end = SCRIPT.index('\nesac', start)+len('\nesac')
            block = 'set -eo pipefail\nPASS=0; FAIL=0\n'+SCRIPT[start:end]+'''
printf 'COUNTS %s %s\\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
'''
            env = dict(os.environ, BIN=str(fixture), VERIFY_OUT=str(result),
                       VERIFY_DRILL_TEXT=text, VERIFY_DRILL_STATUS=str(status))
            process = subprocess.run(['bash','-c',block], cwd=root, env=env,
                                     text=True, capture_output=True, timeout=10)
            self.assertFalse((root/'injected').exists(), process.stdout+process.stderr)
            self.assertEqual((result/('elastic-drill-small.txt' if self.small else 'elastic-drill.txt')).read_text(), text)
            return process

    def test_real_status_shape_passes_with_progress_and_memory_record(self):
        process = self.run_status('progress\nELASTIC DRILL MEMORY {"complete":true}\n'
                                  'ELASTIC DRILL PASS: exact recovery\n')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_success_without_final_newline_passes(self):
        process = self.run_status('ELASTIC DRILL PASS: exact recovery')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_failure_and_skip_cannot_pass_from_words_in_their_details(self):
        for text in ['ELASTIC DRILL FAIL: expected PASS\n',
                     'ELASTIC DRILL SKIP: unable to run PASS case\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_process_failure_overrides_success_even_with_pass_in_log_path(self):
        process = self.run_status('ELASTIC DRILL PASS: complete\n', status=23)
        self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 0 1', process.stdout)

    def test_missing_or_malformed_final_status_fails_closed(self):
        for text in ['', 'other PASS output\n', 'ELASTIC DRILL PASSED: no\n',
                     'ELASTIC DRILL PASS\n', 'ELASTIC DRILL PASSIVE: no\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_duplicate_or_conflicting_final_statuses_fail_closed(self):
        for text in ['ELASTIC DRILL PASS: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL FAIL: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL PASS: a\nELASTIC DRILL FAIL: b\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)


class VerifySmallGovernorStatus(VerifyGovernorStatus):
    small = True


class VerifyHistoricalBackendDiagnostic(unittest.TestCase):
    def run_status(self, code, output):
        begin = SCRIPT.index('  LEGACY_MTP_STATUS=0')
        end = SCRIPT.index('  # MTP is priced', begin)
        with tempfile.TemporaryDirectory(prefix='legacy-backend-diagnostic-') as temp:
            env = dict(os.environ, VERIFY_OUT=temp, FIXTURE_STATUS=str(code), FIXTURE_OUTPUT=output)
            return subprocess.run(['bash', '-c', '''set -eo pipefail
FAIL=0
run_binary() { printf '%s\\n' "$FIXTURE_OUTPUT"; return "$FIXTURE_STATUS"; }
''' + SCRIPT[begin:end] + '\n[ "$FAIL" -eq 0 ]\n'],
                env=env, text=True, capture_output=True, timeout=10)

    def test_old_agreement_and_numerical_difference_are_distinct_diagnostics(self):
        for code, output, expected in [(0, 'MTP PARITY PASS', 'also agrees'),
                                        (2, 'MTP PARITY FAIL', 'differs')]:
            result = self.run_status(code, output)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            self.assertIn('DIAGNOSTIC', result.stdout)
            self.assertIn(expected, result.stdout)
            self.assertNotIn('PASS ', result.stdout)

    def test_unrelated_errors_are_not_waived(self):
        for code, output in [(2, 'missing weights'), (1, 'MTP PARITY FAIL'),
                             (139, 'MTP PARITY FAIL')]:
            result = self.run_status(code, output)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('FAIL  historical draft-head diagnostic could not complete', result.stdout)


class QualityProbeStatus(unittest.TestCase):
    """Run the complete probe with finite transport and real JSON stages."""

    # These ordinary answers are independent of the probe's matching logic.
    ITEMS = [
        ('What is the capital of France? One word.', 'Paris', 'capital of France'),
        ('Who wrote the play Hamlet? Just the name.', 'Shakespeare', 'author of Hamlet'),
        ('What is the chemical symbol for gold? Just the symbol.', 'Au', 'symbol for gold'),
        ('How many continents are there? Just the number.', '7', 'continent count'),
        ('What is 17 times 23? Just the number.', '391', '17x23'),
        ('If a train leaves at 2pm and arrives 3 hours 30 minutes later, what time does it arrive? Just the time.', '5:30', 'elapsed time'),
        ('A shop sells pens for 3 dollars each. How much do 7 pens cost? Just the number.', '21', 'multi-step arithmetic'),
        ('Sort these numbers ascending, comma separated, nothing else: 12, 3, 47, 8', '3, 8, 12, 47', 'sorting'),
        ('Which is larger, 9.11 or 9.9? Answer with just the number.', '9.9', 'decimal comparison'),
        ('Reply with exactly the word BANANA and nothing else.', 'BANANA', 'exact-word obedience'),
        ('List three primary colors, comma separated, no other words.', 'red, blue, yellow', 'list format'),
        ('Answer only YES or NO: is the sky blue on a clear day?', 'YES', 'yes/no obedience'),
        ('Translate to Spanish, nothing else: The house is big.', 'La casa es grande.', 'translation'),
        ('Write a Python one-liner that returns the sum of a list named xs. Code only.', 'sum(xs)', 'python one-liner'),
        ('Complete: The mitochondria is the ___ of the cell. One word.', 'powerhouse', 'cloze completion'),
    ]
    SERIALIZER = '\nimport json,sys; print(json.dumps({"model":"qwen3.8-flash-next:4bit",\n "messages":[{"role":"user","content":sys.argv[1]}],"stream":False,\n "options":{"temperature":0,"num_predict":60}}))'
    PARSER = 'import json,sys; print(json.load(sys.stdin)["message"]["content"])'
    SHIM = r'''import json, os, subprocess, sys
from pathlib import Path
root = Path(__file__).resolve().parent
config = json.loads((root/'config.json').read_text())
trace = root/'trace.jsonl'
mode, args = sys.argv[1], sys.argv[2:]

def record(row):
    row.update(pid=os.getpid(), ppid=os.getppid(), sid=os.getsid(0), pgid=os.getpgrp())
    fd = os.open(trace, os.O_WRONLY | os.O_CREAT | os.O_APPEND, 0o600)
    try:
        data = (json.dumps(row, sort_keys=True)+'\n').encode()
        if os.write(fd, data) != len(data):
            raise RuntimeError('short trace write')
    finally:
        os.close(fd)

def refuse(reason):
    record({'stage':'unknown', 'mode':mode, 'args':args, 'reason':reason})
    raise SystemExit(97)

def payload(index):
    return {'model':'qwen3.8-flash-next:4bit',
            'messages':[{'role':'user', 'content':config['items'][index][0]}],
            'stream':False, 'options':{'temperature':0, 'num_predict':60}}

def response(index):
    if index == 0 and config['case'] == 'malformed':
        return b'{invalid JSON\n'
    answer = 'London' if index == 0 and config['case'] == 'wrong' else config['items'][index][1]
    return (json.dumps({'message':{'content':answer}, '_fixture_index':index})+'\n').encode()

if mode == 'curl':
    if len(args) != 6 or args[:5] != ['-s','--max-time','600',config['url'],'-d']:
        refuse('curl flags/URL/arity')
    try:
        request = json.loads(args[5])
        prompt = request['messages'][0]['content']
        index = [item[0] for item in config['items']].index(prompt)
    except (ValueError, KeyError, TypeError, IndexError):
        refuse('unknown request JSON/prompt')
    if args[5] != json.dumps(payload(index)):
        refuse('request differs from real serializer output')
    prior = [json.loads(line) for line in trace.read_text().splitlines()]
    if any(row['stage'] == 'curl' and row['index'] == index for row in prior):
        refuse('duplicate request')
    out = response(index)
    status = int(config['case'][4:]) if index == 0 and config['case'] in ('curl18','curl28') else 0
    record({'stage':'curl', 'index':index, 'args':args, 'stdout':out.decode(), 'status':status})
    sys.stdout.buffer.write(out)
    raise SystemExit(status)
elif mode == 'python':
    if len(args) == 3 and args[:2] == ['-c', config['serializer']]:
        matches = [i for i,item in enumerate(config['items']) if item[0] == args[2]]
        if len(matches) != 1:
            refuse('unknown serialization prompt')
        index = matches[0]
        data = None
        stage = 'serialize'
    elif args == ['-c', config['parser']]:
        data = sys.stdin.buffer.read()
        curls = [json.loads(line) for line in trace.read_text().splitlines()
                 if json.loads(line)['stage'] == 'curl']
        if not curls:
            refuse('parser without recorded curl')
        index = curls[-1]['index']
        if data != response(index):
            refuse('parser input differs from finite response')
        stage = 'parse'
    else:
        refuse('unknown Python command')
    command = [config['python'], '-I', '-S', '-B'] + args
    child = subprocess.Popen(command, stdin=subprocess.PIPE if data is not None else subprocess.DEVNULL,
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    record({'stage':'real-python-start', 'kind':stage, 'index':index, 'argv':command, 'child_pid':child.pid,
            'child_sid':os.getsid(child.pid), 'child_pgid':os.getpgid(child.pid)})
    out, err = child.communicate(data, timeout=10)
    status = 23 if index == 0 and config['case'] == stage+'23' else child.returncode
    record({'stage':stage, 'index':index, 'stdin':None if data is None else data.decode(),
            'stdout':out.decode(), 'stderr':err.decode(), 'real_status':child.returncode,
            'status':status, 'child_pid':child.pid})
    sys.stdout.buffer.write(out)
    sys.stderr.buffer.write(err)
    raise SystemExit(status)
else:
    refuse('unknown shim mode')
'''

    def run_case(self, case):
        import hashlib
        import shlex
        import shutil
        import sys

        with tempfile.TemporaryDirectory(prefix='quality-probe-status-') as temp:
            root = Path(temp)
            bin_dir = root/'bin'
            bin_dir.mkdir()
            python = str(Path(sys.executable).resolve())
            script = Path(__file__).with_name('quality_probe.sh').resolve()
            config = dict(items=self.ITEMS, case=case, python=python,
                          serializer=self.SERIALIZER, parser=self.PARSER,
                          url='http://127.0.0.1:49193/api/chat')
            (root/'config.json').write_text(json.dumps(config, sort_keys=True))
            (root/'shim.py').write_text(self.SHIM)
            for name, mode in [('curl', 'curl'), ('python3', 'python')]:
                shim = bin_dir/name
                shim.write_text('#!/bin/sh\nexec '+shlex.quote(python)+' -I -S -B '+
                                shlex.quote(str(root/'shim.py'))+' '+mode+' "$@"\n')
                shim.chmod(0o755)
            # No PATH fallback: the probe can reach only these exact tools.
            for name in ['grep', 'tr', 'cut']:
                (bin_dir/name).symlink_to('/usr/bin/'+name)
            env = {'PATH':str(bin_dir), 'HOME':os.environ['HOME'], 'LC_ALL':'C'}
            command = ['/bin/bash', str(script), '49193']
            (root/'quality_probe.sh').write_bytes(script.read_bytes())
            inputs = [script, Path(python), root/'shim.py', root/'config.json', *bin_dir.iterdir()]
            (root/'source-inputs.json').write_text(json.dumps({str(path):
                hashlib.sha256(path.read_bytes()).hexdigest() for path in inputs}, sort_keys=True))
            (root/'command.json').write_text(json.dumps(dict(argv=command, cwd=str(root), env=env)))
            try:
                process = subprocess.run(command, cwd=root, env=env, text=True,
                                         capture_output=True, timeout=20)
                (root/'stdout').write_text(process.stdout)
                (root/'stderr').write_text(process.stderr)
                (root/'status').write_text(str(process.returncode))
                rows = [json.loads(line) for line in (root/'trace.jsonl').read_text().splitlines()]
            finally:
                # The private phase recorder preserves artifacts even on assertion/timeout.
                if getattr(self, 'ARTIFACTS', None):
                    shutil.copytree(root, Path(self.ARTIFACTS)/case, symlinks=True)
            self.assertEqual([row for row in rows if row['stage'] == 'unknown'], [])
            self.assertEqual(process.stderr, '')
            failure = case != 'success'
            lines = process.stdout.splitlines()
            # Check the product outcome first, so original regressions are failures,
            # with all actual request/stage evidence retained for independent inspection.
            self.assertEqual(process.returncode, int(failure), process.stdout)
            self.assertEqual(lines[-1], 'quality probe: passed %d, failed %d' %
                             (14 if failure else 15, int(failure)))
            first = 'capital of France'
            self.assertEqual([line for line in lines if line.startswith('FAIL  ')],
                             [('FAIL  '+first+' -> '+('London' if case == 'wrong' else
                               'Paris' if case in ('curl18', 'curl28', 'parse23') else ''))] if failure else [])
            self.assertEqual([line for line in lines if line.startswith('PASS  ')],
                             ['PASS  '+label for _, _, label in self.ITEMS[int(failure):]])
            expected_curls = list(range(1 if case == 'serialize23' else 0, 15))
            curls = [row for row in rows if row['stage'] == 'curl']
            self.assertEqual([row['index'] for row in curls], expected_curls)
            expected_stages = []
            for index in range(15):
                expected_stages += [('real-python-start', index), ('serialize', index)]
                if index in expected_curls:
                    expected_stages += [('curl', index), ('real-python-start', index), ('parse', index)]
            self.assertEqual([(row['stage'], row['index']) for row in rows], expected_stages)
            for row in rows:
                self.assertEqual((row['sid'], row['pgid']), (os.getsid(0), os.getpgrp()))
                index, stage = row['index'], row['stage']
                if stage == 'real-python-start':
                    self.assertEqual((row['child_sid'], row['child_pgid']), (os.getsid(0), os.getpgrp()))
                if stage == 'serialize':
                    expected = {'model':'qwen3.8-flash-next:4bit',
                                'messages':[{'role':'user','content':self.ITEMS[index][0]}],
                                'stream':False,'options':{'temperature':0,'num_predict':60}}
                    self.assertEqual(row['stdout'], json.dumps(expected)+'\n')
                    self.assertEqual(row['real_status'], 0)
                    self.assertEqual(row['status'], 23 if index == 0 and case == 'serialize23' else 0)
                if stage == 'parse':
                    malformed = index == 0 and case == 'malformed'
                    answer = 'London' if index == 0 and case == 'wrong' else self.ITEMS[index][1]
                    self.assertEqual(row['stdout'], '' if malformed else answer+'\n')
                    self.assertEqual(row['real_status'], 1 if malformed else 0)
                    self.assertEqual(row['status'], 23 if index == 0 and case == 'parse23' else row['real_status'])
                if stage == 'curl':
                    self.assertEqual(row['status'], int(case[4:]) if index == 0 and case.startswith('curl') else 0)

    def test_all_success_control(self):
        self.run_case('success')

    def test_curl_18_with_correct_stdout_fails_first_item(self):
        self.run_case('curl18')

    def test_curl_28_with_correct_stdout_fails_first_item(self):
        self.run_case('curl28')

    def test_wrong_answer_control(self):
        self.run_case('wrong')

    def test_malformed_json_control(self):
        self.run_case('malformed')

    def test_serializer_23_with_valid_stdout_prevents_first_request(self):
        self.run_case('serialize23')

    def test_parser_23_with_correct_stdout_fails_first_item(self):
        self.run_case('parse23')


if __name__ == '__main__':
    unittest.main()
