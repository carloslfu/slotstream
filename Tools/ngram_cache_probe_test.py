"""Reject incomplete, incomparable or misbound full-cache qualification."""
import copy
import json
from pathlib import Path
import tempfile
import unittest

from ngram_cache_probe import ARMS, HASHES, assess, contract, digest, native_observation, validate_prerequisites


class NgramCacheProbeTests(unittest.TestCase):
    def setUp(self):
        self.spec = contract()

    def report(self, arm):
        compact, ring = int('compact' in arm), int(arm.endswith('-ring'))
        metrics = {k:self.spec[k] for k in ['fill_tokens','tile_tokens','eviction_tokens','warm_calls']}
        metrics.update(compact=compact,ring=ring,filled_rows=380000,end_rows=365000,
            filled_payload_bytes=380000*160*(2 if compact else 4),
            end_payload_bytes=365000*160*(2 if compact else 4),
            warm_row_hits=128*256*16,eviction_row_misses=65000,
            physical_before_bytes=3_000_000_000,
            physical_filled_bytes=3_400_000_000-compact*120_000_000,
            physical_end_bytes=3_400_000_000-compact*120_000_000,
            sampled_peak_bytes=3_500_000_000,lifetime_rss_peak_bytes=3_600_000_000,
            sampled_count=200,mlx_active_bytes=2_000_000_000,
            swapins_before=7,swapins_after=7,swapouts_before=9,swapouts_after=9,
            nominal_thermal_endpoints=1,normal_power_endpoints=1,
            fill_seconds_including_hash=10.,warm_assembly_seconds_per_call=.01,
            eviction_assembly_seconds=1.-ring*.1)
        return {'name':'optimization-ngram-cache-'+arm,'passed':True,
                'items':[{'name':'bounded native checks','passed':True}]+[
                    {'name':'sha256:'+k,'passed':True,'detail':'a'*64} for k in sorted(HASHES)],
                'measurements':metrics}

    def rows(self):
        return [{'round':n,'arm':arm,'valid':True,
                 'observation':native_observation(self.report(arm),arm,self.spec)}
                for n in range(1,8) for arm in ARMS]

    def test_complete_identical_work_can_qualify_separate_resource_and_queue_claims(self):
        result=assess(self.rows(),self.spec,True)
        self.assertTrue(result['all_completed_outputs_exact'])
        self.assertTrue(all(c['qualified_component'] for c in result['comparisons']))
        self.assertFalse(result['inference_adopted'])

    def test_incomplete_or_excluded_work_cannot_be_replaced(self):
        rows=self.rows()
        self.assertFalse(any(c['qualified_component'] for c in assess(rows[:-1],self.spec,True)['comparisons']))
        self.assertFalse(any(c['qualified_component'] for c in assess(rows,self.spec,False)['comparisons']))
        for row in rows:
            if row['round'] <= 3: row['valid']=False
        self.assertFalse(any(c['qualified_component'] for c in assess(rows,self.spec,True)['comparisons']))
        for extra in [rows[0], rows[0]|{'round':8}, rows[0]|{'arm':'foreign'}]:
            with self.assertRaises(ValueError): assess(rows+[extra],self.spec,True)

    def test_payload_halving_does_not_substitute_for_measured_physical_saving(self):
        rows=self.rows()
        for row in rows:
            if row['arm']=='compact': row['observation']['metrics']['physical_filled_bytes']=3_350_000_000
        self.assertFalse(assess(rows,self.spec,True)['comparisons'][0]['qualified_component'])
        rows=self.rows()
        rows[1]['observation']['metrics']['physical_before_bytes']-=100_000_000
        self.assertFalse(assess(rows,self.spec,True)['comparisons'][0]['qualified_component'])

    def test_changed_outputs_or_work_cannot_be_a_speedup(self):
        rows=self.rows();rows[1]['observation']['hashes']['warm_embedding']='b'*64
        with self.assertRaises(ValueError): assess(rows,self.spec,True)
        rows[1]['valid']=False
        self.assertFalse(any(c['qualified_component'] for c in assess(rows,self.spec,True)['comparisons']))
        rows=self.rows();rows[1]['observation']['metrics']['end_rows']-=1
        with self.assertRaises(ValueError): assess(rows,self.spec,True)

    def test_native_report_requires_real_eviction_payload_bounds_and_complete_hashes(self):
        report=self.report('compact')
        for key,value in [('eviction_row_misses',40000),('warm_row_hits',1),('end_rows',365001),
                          ('filled_payload_bytes',0),('physical_filled_bytes',5_000_000_001),
                          ('warm_assembly_seconds_per_call',float('nan')),('sampled_count',1),
                          ('compact',True)]:
            bad=copy.deepcopy(report);bad['measurements'][key]=value
            # A Boolean is never a valid mode observation, despite == 0/1.
            with self.assertRaises(ValueError): native_observation(bad,'compact',self.spec)
        for change in [{'passed':False},{'skipped':'not run'},{'items':report['items'][:-1]}]:
            with self.assertRaises(ValueError): native_observation(report|change,'compact',self.spec)
        for key,value in [('swapins_after',8),('swapouts_after',10),('nominal_thermal_endpoints',0),('normal_power_endpoints',0)]:
            changed=copy.deepcopy(report);changed['measurements'][key]=value
            self.assertFalse(native_observation(changed,'compact',self.spec)['resources_clean'])

    def test_native_prerequisites_are_exact_same_build_non_skipped_reports(self):
        identity={k:'a'*64 for k in ['binary_sha256','source_archive_sha256','metallib_sha256']}
        build={'identity':identity}
        with tempfile.TemporaryDirectory() as directory:
            entries={}
            for variant in ['ngram','cache-bookkeeping']:
                path=Path(directory)/variant;path.mkdir()
                manifest={'identity':identity,'passed':True,'exit_code':0,'assertions':1,
                          'command':['slotstream','optimization-state-check','--variant',variant,'--tokens','256']}
                report={'name':'optimization-state-'+variant,'passed':True,'items':[{'passed':True}],
                        'measurements':{'prompt_tokens':256}}
                (path/'manifest.json').write_text(json.dumps(manifest));(path/'stdout.txt').write_text(json.dumps(report))
                entries[variant]={'directory':str(path),'sha256':{n:digest(path/n) for n in ['manifest.json','stdout.txt']}}
            spec=self.spec|{'native_prerequisites':entries}
            self.assertEqual(set(validate_prerequisites(spec,build)),{'ngram','cache-bookkeeping'})
            with self.assertRaises(ValueError): validate_prerequisites(self.spec,build)
            with self.assertRaises(ValueError): validate_prerequisites(spec,{'identity':identity|{'binary_sha256':'b'*64}})
            path=Path(entries['ngram']['directory'])/'stdout.txt'
            value=json.loads(path.read_text());value['skipped']='not run';path.write_text(json.dumps(value))
            with self.assertRaises(ValueError): validate_prerequisites(spec,build)
            entries['ngram']['sha256']['stdout.txt']=digest(path)
            with self.assertRaises(ValueError): validate_prerequisites(spec,build)


if __name__=='__main__':unittest.main()
