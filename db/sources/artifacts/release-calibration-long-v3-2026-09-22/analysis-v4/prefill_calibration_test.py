import unittest
from calibration import evaluate_prefill

def row(kind='code', rate=100, **kw):
    return dict(environment_eligible=True,idle_calibration_eligible=True,
        stage='prefill_miss',reused_tokens=0,prefill_tokens=2000,
        prefill_seconds=2000/rate,profile='p',fixture=kind,kind=kind,
        slots=1000,mtp=False,chunk=256,context=32768,target_gb=10,
        output_sha256='same',estimator_prefill_tps=80,**kw)

class PrefillCalibrationTests(unittest.TestCase):
    def test_requires_three_matching_observations(self):
        self.assertFalse(evaluate_prefill([row()]*2)['qualified_fixture_cells'])
    def test_never_fits_cache_hits_or_pilots(self):
        for field,value in [('reused_tokens',1),('idle_calibration_eligible',False),('environment_eligible',False)]:
            r=row();r[field]=value
            self.assertFalse(evaluate_prefill([r]*3)['qualified_fixture_cells'])
    def test_changed_plan_and_output_rejected(self):
        for field,value in [('slots',999),('output_sha256','other')]:
            r=row();r[field]=value
            self.assertFalse(evaluate_prefill([row(),row(),r])['qualified_fixture_cells'])
    def test_training_never_uses_held_out_family(self):
        checks=evaluate_prefill([row('code',100)]*3+[row('prose',50)]*3)['held_out_checks']
        c=next(x for x in checks if x['kind']=='code')
        self.assertEqual(c['training_families'],['prose'])
        self.assertEqual(c['training_correction'],50/80)
        self.assertEqual(c['original_wait_error_pct'],25)
        self.assertEqual(c['held_out_wait_error_pct'],100)
    def test_incompatible_plan_cannot_train_a_correction(self):
        p=row('prose');p['chunk']=512
        self.assertFalse(evaluate_prefill([row()]*3+[p]*3)['held_out_checks'])

if __name__=='__main__':unittest.main()
