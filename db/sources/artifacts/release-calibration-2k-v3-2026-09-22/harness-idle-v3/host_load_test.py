import json, plistlib, unittest
from host_load import parse_cpu, parse_gpu, assess, assess_window
from release_speed_bench import environment_reasons

class HostLoadTests(unittest.TestCase):
 def test_excludes_only_owned_processes(self):
  self.assertEqual(parse_cpu('10 200\n11 20\n12 7\n',{10}),{'background_cpu_percent':27,'largest_background_process_cpu_percent':20})
 def test_does_not_persist_process_identifiers(self):self.assertNotIn('pid',json.dumps(parse_cpu('10 5\n11 2\n',set())))
 def test_fail_closed_empty_cpu(self):
  with self.assertRaises(ValueError):parse_cpu('',set())
 def test_fail_closed_nonfinite_cpu(self):
  with self.assertRaises(ValueError):parse_cpu('10 nan',set())
 def test_fail_closed_negative_cpu(self):
  with self.assertRaises(ValueError):parse_cpu('10 -1',set())
 def test_gpu_across_devices(self):
  self.assertEqual(parse_gpu(plistlib.dumps([{'PerformanceStatistics':{'Device Utilization %':4}},{'PerformanceStatistics':{'Device Utilization %':12}}])),12)
 def test_missing_gpu_not_idle(self):
  with self.assertRaises(ValueError):parse_gpu(plistlib.dumps([{}]))
 def test_gpu_bool_not_number(self):
  with self.assertRaises(ValueError):parse_gpu(plistlib.dumps([{'PerformanceStatistics':{'Device Utilization %':True}}]))
 def test_threshold_boundaries(self):self.assertTrue(assess({'background_cpu_percent':50,'largest_background_process_cpu_percent':25,'gpu_utilization_percent':5})['idle_eligible'])
 def test_total_background_load(self):self.assertFalse(assess({'background_cpu_percent':51,'largest_background_process_cpu_percent':20,'gpu_utilization_percent':0})['background_cpu_eligible'])
 def test_single_process_background_load(self):self.assertFalse(assess({'background_cpu_percent':30,'largest_background_process_cpu_percent':26,'gpu_utilization_percent':0})['background_cpu_eligible'])
 def test_model_gpu_activity_is_diagnostic_during_request(self):
  d=assess({'background_cpu_percent':10,'largest_background_process_cpu_percent':8,'gpu_utilization_percent':100});self.assertTrue(d['background_cpu_eligible']);self.assertFalse(d['idle_eligible'])
 def test_mid_request_load_excludes(self):
  nominal=self.nominal()
  bad={**nominal,'host_load':self.load(cpu=400,process=300)}
  self.assertIn('sustained background CPU load or unavailable sample',environment_reasons({'swapouts':0},{'swapouts':0},nominal,nominal,[bad]*5))
 def test_mid_request_thermal_excludes(self):
  nominal=self.nominal()
  self.assertIn('non-nominal thermal or power state',environment_reasons({'swapouts':0},{'swapouts':0},nominal,nominal,[{**nominal,'thermalState':'fair'}]))
 def load(self,cpu=20,process=10,gpu=0):
  return {'background_cpu_percent':cpu,'largest_background_process_cpu_percent':process,'gpu_utilization_percent':gpu}
 def nominal(self):
  return {'pageins':0,'thermalState':'nominal','lowPowerModeEnabled':False,'host_load':self.load()}
 def test_brief_desktop_burst_allowed(self):
  self.assertTrue(assess_window([self.load()]*9+[self.load(220,110,30)],idle=True)['eligible'])
 def test_sustained_total_cpu_rejected(self):
  self.assertFalse(assess_window([self.load(101,40)]*10)['eligible'])
 def test_sustained_single_process_rejected(self):
  self.assertFalse(assess_window([self.load(80,51)]*10)['eligible'])
 def test_mean_gpu_gate_retained(self):
  self.assertFalse(assess_window([self.load(gpu=6)]*10,idle=True)['eligible'])
 def test_model_gpu_not_mistaken_for_background(self):
  self.assertTrue(assess_window([self.load(gpu=100)]*10)['eligible'])
 def test_frequent_bursts_rejected_even_with_low_mean(self):
  self.assertFalse(assess_window([self.load(0,0)]*7+[self.load(201,0)]*3)['eligible'])
 def test_incomplete_window_rejected(self):
  for samples in [[],[self.load()],[self.load(),{}],[self.load(),self.load(gpu=101)]]:
   self.assertFalse(assess_window(samples)['eligible'])
 def test_brief_cpu_burst_does_not_exclude_request(self):
  n=self.nominal();bad={**n,'host_load':self.load(220,110)}
  self.assertEqual(environment_reasons({'swapouts':0},{'swapouts':0},n,n,[n]*8+[bad]),[])
 def test_pageins_swapouts_remain_independent(self):
  n=self.nominal()
  reasons=environment_reasons({'swapouts':0},{'swapouts':1},n,{**n,'pageins':4097},[n])
  self.assertIn('host swap-out activity',reasons)
  self.assertIn('process page-ins unavailable or above4096pages',reasons)

if __name__=='__main__':unittest.main()
