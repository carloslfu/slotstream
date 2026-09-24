import json, plistlib, unittest
from host_load import parse_cpu, parse_gpu, assess
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
  nominal={'pageins':0,'thermalState':'nominal','lowPowerModeEnabled':False,'host_load':{'background_cpu_eligible':True}}
  bad={**nominal,'host_load':{'background_cpu_eligible':False}}
  self.assertIn('background CPU load or unavailable sample',environment_reasons({'swapouts':0},{'swapouts':0},nominal,nominal,[bad]))
 def test_mid_request_thermal_excludes(self):
  nominal={'pageins':0,'thermalState':'nominal','lowPowerModeEnabled':False,'host_load':{'background_cpu_eligible':True}}
  self.assertIn('non-nominal thermal or power state',environment_reasons({'swapouts':0},{'swapouts':0},nominal,nominal,[{**nominal,'thermalState':'fair'}]))

if __name__=='__main__':unittest.main()
