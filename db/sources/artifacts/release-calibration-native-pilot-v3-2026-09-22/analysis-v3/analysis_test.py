import copy,unittest
from analyze import summarize
from calibration import evaluate
from report import cache_class

def row(tps=10,complete=True,eligible=True,ids=None,sig=None):
 return {'environment_eligible':eligible,'metrics':{'output_ids':ids or list(range(64)),'stats':{'decodeTokens':64}},'signature':sig or [900,False,256,32768,10.0],'complete_answer':complete,'strict_global_swap_eligible':False,'decode_tps':tps,'client_seconds':64/tps,'done_reason':'stop' if complete else 'length','exclusions':[] if eligible else ['paging']}
class AnalysisTests(unittest.TestCase):
 def test_requires_three(self):self.assertFalse(summarize([row(),row()])['qualified_throughput'])
 def test_exact_three(self):self.assertTrue(summarize([row(),row(),row()])['qualified_full_answers'])
 def test_contaminated_not_counted(self):self.assertFalse(summarize([row(),row(),row(eligible=False)])['qualified_throughput'])
 def test_do_not_drop_slow_outlier(self):self.assertEqual(summarize([row(2),row(10),row(12)])['decode_tps_range'],[2,12])
 def test_capped_not_full(self):self.assertTrue(summarize([row(complete=False)]*3)['qualified_throughput']);self.assertFalse(summarize([row(complete=False)]*3)['qualified_full_answers'])
 def test_changed_outputs_not_qualified(self):self.assertFalse(summarize([row(),row(),row(ids=[3])])['qualified_throughput'])
 def test_changed_plan_not_pooled(self):self.assertFalse(summarize([row(),row(),row(sig=[1000,False,256,32768,10.0])])['qualified_throughput'])
 def test_no_data(self):self.assertIsNone(summarize([])['median_decode_tps'])
 def test_tiny_output_not_decode_anchor(self):r=row();r['metrics']['stats']['decodeTokens']=1;self.assertEqual(summarize([r]*3)['eligible'],0)
 def test_global_sensitivity_not_relabelled(self):self.assertEqual(summarize([row()]*3)['strict_global_eligible'],0)
 def test_cache_classes(self):
  self.assertEqual(cache_class({'promptTokens':1024,'reusedPrefixTokens':0}),'miss')
  self.assertEqual(cache_class({'promptTokens':1024,'reusedPrefixTokens':256}),'partial')
  self.assertEqual(cache_class({'promptTokens':1024,'reusedPrefixTokens':1024}),'complete')
 def test_family_is_held_out_of_correction(self):
  def r(fixture,kind,rate):return {'profile':'p','fixture':fixture,'kind':kind,'idle_calibration_eligible':True,'environment_eligible':True,'stage':'measured','output_tokens':100,'slots':900,'mtp':False,'chunk':256,'context':32768,'target_gb':10,'output_sha256':fixture,'decode_tps':rate,'estimator_decode_tps':10}
  results=evaluate([r('a','code',20)]*3+[r('b','prose',10)]*3)['held_out_checks']
  self.assertEqual([x['training_correction'] for x in results],[1,2])
  self.assertEqual([x['held_out_kind'] for x in results],['code','prose'])
  self.assertEqual([x['training_families'] for x in results],[['prose'],['code']])
 def test_no_calibration_without_repeated_evidence(self):self.assertEqual(evaluate([])['held_out_checks'],[])
 def test_unregistered_population_cannot_calibrate(self):
  self.assertFalse(evaluate([{'environment_eligible':True}]*3)['qualified_fixture_cells'])
if __name__=='__main__':unittest.main()
