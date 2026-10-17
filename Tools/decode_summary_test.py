"""Exercise both actual report bodies using tiny files, without running a sweep."""
import ast
import contextlib
import io
import json
from pathlib import Path
import statistics
import tempfile
from types import SimpleNamespace
import unittest

import decode_summary as summary

ROOT = Path(__file__).resolve().parent


def producer_report():
    # Importing decode_sweep would load benchmark machinery. Extract only its
    # actual report body; the sole external boundary writes a JSON fixture.
    tree = ast.parse((ROOT / 'decode_sweep.py').read_text())
    functions = [node for node in tree.body if isinstance(node, ast.FunctionDef) and node.name == 'report']
    assert len(functions) == 1
    namespace = {'json': json, 'statistics': statistics,
                 'xla': SimpleNamespace(write_json=lambda path, value: path.write_text(json.dumps(value)))}
    if hasattr(summary, 'compare_outputs'):
        namespace['compare_outputs'] = summary.compare_outputs
    exec(compile(ast.Module(body=functions, type_ignores=[]), str(ROOT / 'decode_sweep.py'), 'exec'), namespace)
    return namespace['report']


def cell(config, request='a', round=0, ids=(1, 2), clean=True, tps=10):
    return {'config': config, 'request_id': request, 'round': round, 'clean': clean,
            'metrics': {'output_ids': list(ids), 'tps': tps, 'drafted': 0, 'accepted': 0,
                        'decode_tokens': len(ids), 'verify_passes': 1, 'decode_seconds': 0.2,
                        'decode_records': 2, 'decode_read_bytes': 10, 'hit_rate': 0.5, 'ttft': 0.1}}


class ExactnessEvidence(unittest.TestCase):
    def reports(self, rows, metadata=True):
        results, rendered = {}, {}
        for kind in ['summary', 'producer']:
            with tempfile.TemporaryDirectory(prefix='decode-report-fixture-') as name:
                root = Path(name)
                path = root / 'cells.jsonl'
                path.write_text(''.join(json.dumps(row) + '\n' for row in rows))
                output = io.StringIO()
                with contextlib.redirect_stdout(output):
                    if kind == 'summary':
                        if metadata:
                            (root / 'report.json').write_text(json.dumps({'reference': 'reference'}))
                        result = summary.summarize(root)
                        summary.render('fixture', result)
                        results[kind] = result['configs']
                    else:
                        producer_report()(path, [{'name': row['config']} for row in rows], 'reference', root)
                        results[kind] = json.loads((root / 'report.json').read_text())['summary']
                rendered[kind] = output.getvalue()
        return results, rendered

    def test_absent_reference_metadata_never_certifies_a_candidate(self):
        results, _ = self.reports([cell('candidate')], metadata=False)
        for kind, configurations in results.items():
            with self.subTest(kind=kind):
                self.assertIsNone(configurations['candidate']['exact'])

    def test_excluded_reference_does_not_supply_output_evidence(self):
        results, _ = self.reports([cell('reference', clean=False), cell('candidate')])
        for kind, configurations in results.items():
            with self.subTest(kind=kind):
                self.assertIsNone(configurations['candidate']['exact'])

    def test_partial_reference_coverage_stays_unknown(self):
        results, _ = self.reports([cell('reference'), cell('candidate'), cell('candidate', request='b')])
        for kind, configurations in results.items():
            with self.subTest(kind=kind):
                value = configurations['candidate']
                self.assertIsNone(value['exact'])
                self.assertEqual(value.get('compared_cells'), 1)
                self.assertEqual(value.get('uncompared_requests'), ['b'])

    def test_known_mismatch_wins_over_an_uncompared_request(self):
        results, rendered = self.reports([cell('reference'), cell('candidate', ids=(9,)), cell('candidate', request='b')])
        for kind, configurations in results.items():
            with self.subTest(kind=kind):
                value = configurations['candidate']
                self.assertIs(value['exact'], False)
                self.assertEqual(value.get('mismatched', value.get('mismatched_requests')), ['a'])
                self.assertIn('EXACTNESS FAILURES', rendered[kind])

    def test_complete_matches_keep_paired_rates(self):
        rows = [cell('reference'), cell('candidate', tps=20),
                cell('reference', round=1, tps=12), cell('candidate', round=1, tps=24)]
        results, _ = self.reports(rows)
        for kind, configurations in results.items():
            with self.subTest(kind=kind):
                value = configurations['candidate']
                self.assertIs(value['exact'], True)
                self.assertEqual(value.get('ratio', value.get('ratio_to_reference')), 2)
                self.assertEqual(value.get('pairs', value.get('paired_n')), 2)

    def test_exactness_can_compare_across_rounds_without_timing_pairs(self):
        results, _ = self.reports([cell('reference'), cell('candidate', round=1)])
        for kind, configurations in results.items():
            with self.subTest(kind=kind):
                value = configurations['candidate']
                self.assertIs(value['exact'], True)
                self.assertIsNone(value.get('ratio', value.get('ratio_to_reference')))

    def test_reference_drift_is_still_a_canonical_output_mismatch(self):
        results, _ = self.reports([cell('reference'), cell('reference', round=1, ids=(9,)), cell('candidate', round=1, ids=(9,))])
        for kind, configurations in results.items():
            with self.subTest(kind=kind):
                self.assertIs(configurations['reference']['exact'], False)
                self.assertIs(configurations['candidate']['exact'], False)

    def test_no_clean_candidate_has_no_exactness_evidence(self):
        results, _ = self.reports([cell('reference'), cell('candidate', clean=False)])
        for kind, configurations in results.items():
            with self.subTest(kind=kind):
                self.assertIsNone(configurations['candidate'].get('exact'))

    def test_unknown_display_is_neither_yes_nor_a_failure(self):
        results, rendered = self.reports([cell('candidate')])
        for kind, text in rendered.items():
            with self.subTest(kind=kind):
                row = next(line for line in text.splitlines() if line.startswith('candidate '))
                self.assertEqual(row.split()[-1], '-')
                self.assertNotIn('EXACTNESS FAILURES', text)


if __name__ == '__main__':
    unittest.main()
