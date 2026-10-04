import math
from statistics import NormalDist
import unittest

import quantization_paired as p

class PairedTests(unittest.TestCase):
    def test_published_tango_table_I(self):
        witnesses={30:[.08272430812509922,.13640414215181698,.1827155628750875],
                   50:[.0513331857862701,.08480529424830945,.11390024826992938],
                   80:[.03271296386072461,.05410152928022316,.07276951853259764]}
        for n,values in witnesses.items():
            for harm,want in enumerate(values):self.assertAlmostEqual(p.upper_loss(harm,0,n,.05),want,places=12)
    def test_zero_discordance_closed_form(self):
        for n in [1,2,10,400,10000]:
            for alpha in [.1,.05,.05/6,1e-6]:
                z=NormalDist().inv_cdf(1-alpha)
                self.assertAlmostEqual(p.upper_loss(0,0,n,alpha),z*z/(n+z*z),places=12)
    def test_mcnemar_null(self):
        for h,g,n in [(9,1,30),(5,4,10),(3,3,20),(0,6,60)]:
            s=p.discordance_mle(h,g,n,0)
            self.assertAlmostEqual(s,(h+g)/n)
            self.assertAlmostEqual((-(h-g)/n)*math.sqrt(n/s),(g-h)/math.sqrt(h+g))
    def test_extreme_tables_and_monotonic_harm(self):
        for n in [1,5,30]:
            self.assertEqual(p.upper_loss(n,0,n,.05),1.)
            last=-math.inf
            for h in range(n+1):
                value=p.upper_loss(h,0,n,.05);self.assertGreaterEqual(value,last);last=value
            for h in range(n+1):
                for g in range(n-h+1):
                    lower,upper=p.interval(h,g,n,.05)
                    self.assertLessEqual(lower,(h-g)/n);self.assertGreaterEqual(upper,(h-g)/n)
                    self.assertGreaterEqual(lower,-1.);self.assertLessEqual(upper,1.)
                    opposite=p.interval(g,h,n,.05)
                    self.assertEqual(lower,-opposite[1]);self.assertEqual(upper,-opposite[0])
    def test_independent_constrained_likelihood(self):
        def ll(h,g,n,loss,s):
            terms=[(h,(s+loss)/2),(g,(s-loss)/2),(n-h-g,1-s)]
            if any(c and v<=0 for c,v in terms):return -math.inf
            return math.fsum(c*math.log(v) for c,v in terms if c)
        for n,h,g in [(1,0,0),(1,1,0),(1,0,1),(9,2,3),(10,0,6),(37,14,9),(200,1,0),(1000,200,200)]:
            for loss in [-.93,-.3,-.01,0.,.03,.7,.99]:
                lo,hi=abs(loss),1.
                for _ in range(140):
                    a=lo+(hi-lo)/3;b=hi-(hi-lo)/3
                    if ll(h,g,n,loss,a)<ll(h,g,n,loss,b):lo=a
                    else:hi=b
                want=max(ll(h,g,n,loss,x) for x in [abs(loss),1.,(lo+hi)/2])
                got=ll(h,g,n,loss,p.discordance_mle(h,g,n,loss))
                self.assertAlmostEqual(got,want,places=9)
    def test_reject_bad_counts_and_probabilities(self):
        for h,g,n in [(True,0,1),(1.,0,10),(-1,0,1),(0,-1,1),(1,1,1),(0,0,0),(0,0,1000001)]:
            with self.assertRaises(ValueError):p.upper_loss(h,g,n,.05)
        for alpha in [True,None,float('nan'),float('inf'),0,1e-10,.5,1]:
            with self.assertRaises(ValueError):p.upper_loss(0,0,10,alpha)
        for loss in [True,None,float('nan'),float('inf'),-1.01,1.01]:
            with self.assertRaises(ValueError):p.discordance_mle(0,0,1,loss)
    def rows(self):
        return [dict(id=f'{f}-{i}',family=f,baseline_pass=True,candidate_pass=True) for f,n in [('a',400),('b',200)] for i in range(n)]
    def summarize(self,rows=None,**kw):
        args=dict(family_weights={'a':.25,'b':.75},family_margins={'a':.05,'b':.05},overall_margin=.03,alpha=.05);args.update(kw)
        return p.stratified_summary(self.rows() if rows is None else rows,**args)
    def test_stratified_not_pooled_and_no_qualification(self):
        got=self.summarize();a=p.upper_loss(0,0,400,.025);b=p.upper_loss(0,0,200,.025)
        self.assertEqual(got['per_family_alpha'],.025)
        self.assertAlmostEqual(got['overall']['upper_loss'],.25*a+.75*b)
        self.assertNotAlmostEqual(got['overall']['upper_loss'],p.upper_loss(0,0,600,.05))
        self.assertFalse(got['qualification']);self.assertTrue(got['all_statistical_margins_met'])
    def test_harm_sign_gains_and_family_hard_bound(self):
        rows=self.rows()
        for i in range(20):rows[i]['candidate_pass']=False
        got=self.summarize(rows,family_weights={'a':.01,'b':.99},overall_margin=.05)
        self.assertTrue(got['overall']['inside_margin']);self.assertFalse(got['all_statistical_margins_met'])
        self.assertEqual(got['families']['a']['harm'],20)
        self.assertEqual(got['families']['a']['observed_loss'],.05)
        rows[20]['baseline_pass']=False
        self.assertEqual(self.summarize(rows)['families']['a']['gain'],1)
    def test_duplicate_missing_family_nonbinary_and_invalid_contract(self):
        rows=self.rows()
        for value in [[],rows+rows[:1],rows[:400],[{**rows[0],'candidate_pass':1}], [{**rows[0],'family':'c'}]]:
            with self.assertRaises(ValueError):self.summarize(value)
        for kw in [dict(family_weights={'a':.3,'b':.8}),dict(family_weights={'a':1.}),dict(family_weights={'a':float('nan'),'b':.5}),dict(overall_margin=0),dict(family_margins={'a':.05,'b':True})]:
            with self.assertRaises(ValueError):self.summarize(**kw)

if __name__=='__main__':unittest.main()
