from pathlib import Path
import hashlib,importlib.util,json,os,struct,sys,tempfile,unittest
from unittest.mock import patch
sys.path.insert(0,'Tools')
import affine_expert_control as m

class ControlTests(unittest.TestCase):
 def test_recipe_budgets_do_not_relax_the_original(self):
  required=52_848_290_992
  old={'policy':m.POLICY,'paid_compute_usd':0,'maximum_process_bytes':4_000_000_000,
       'maximum_seconds':1800,'minimum_headroom_bytes':3_000_000_000,'minimum_preflight_bytes':13_000_000_000,
       'maximum_output_bytes':required,'maximum_research_staging_bytes':365_000_000_000}
  self.assertEqual(m.conversion_budget(old,required,refitted=False),(m.POLICY,1800))
  new={**old,'policy':m.REFIT_POLICY,'maximum_seconds':7200,'maximum_research_staging_bytes':430_000_000_000,
       'refit_component_receipt_sha256':m.REFIT_COMPONENT_SHA256,
       'refit_implementation_sha256':m.REFIT_IMPLEMENTATION_SHA256,'maximum_concurrent_producers':1}
  self.assertEqual(m.conversion_budget(new,required,refitted=True),(m.REFIT_POLICY,7200))
  for original,mode,faults in [(old,False,[('maximum_research_staging_bytes',430_000_000_000),('maximum_seconds',3600),('policy',m.REFIT_POLICY)]),
                              (new,True,[('maximum_seconds',1800),('refit_component_receipt_sha256','0'*64),
                                         ('refit_implementation_sha256','0'*64),('maximum_concurrent_producers',2),('maximum_concurrent_producers',True)])]:
   for key,value in faults+[('maximum_output_bytes',required-1),('maximum_process_bytes',4_000_000_001),
                            ('minimum_headroom_bytes',2_999_999_999),('minimum_preflight_bytes',12_999_999_999),
                            ('maximum_seconds',True),('maximum_research_staging_bytes',430_000_000_001),('paid_compute_usd',1)]:
    with self.subTest(mode=mode,key=key),self.assertRaises(ValueError):
     m.conversion_budget({**original,key:value},required,refitted=mode)
  for required_value,mode in [(0,False),(True,False),(required,1),(required,'refit')]:
   with self.assertRaises(ValueError):m.conversion_budget(old,required_value,refitted=mode)
 def fixture(self,root,header=None):
  header=header or {'value':{'dtype':'U32','shape':[512,1,1],'data_offsets':[0,2048]}}
  raw=json.dumps(header).encode();body=struct.pack('<512I',*range(512));p=Path(root)/'source.safetensors'
  p.write_bytes(struct.pack('<Q',len(raw))+raw+body)
  return p,{'size':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()}
 def test_geometry_and_complete_header(self):
  total=0
  for layer in range(48):
   header,prefix,payload=m.sized_header(layer)
   self.assertEqual(len(header),9);self.assertEqual(payload,512*2150400)
   m.validate_header(header,payload);self.assertEqual(struct.unpack('<Q',prefix[:8])[0],len(prefix)-8)
   total+=payload
  self.assertEqual(total,52848230400)
  self.assertEqual(m.metadata(640,2560,3)['weight']['shape'],[512,640,240])
  self.assertEqual(m.metadata(2560,640,3)['weight']['shape'],[512,2560,60])
  self.assertEqual(m.metadata(640,2560,2)['weight']['shape'],[512,640,160])
  for args in [(640,2559,3),(640,2560,1),(640,2560,3,True),(640,2560,3,0),(640,2560,3,513)]:
   with self.assertRaises(ValueError):m.metadata(*args)
  for layer in [-1,48,True]:
   with self.assertRaises(ValueError):m.sized_header(layer)
 def test_owned_verified_ranges(self):
  with tempfile.TemporaryDirectory() as root:
   p,pin=self.fixture(root);source=m.Source(p,pin)
   try:
    with self.assertRaises(ValueError):source.read('value',0,1)
    source.verify(lambda:None)
    self.assertEqual(struct.unpack('<8I',source.read('value',504,8)),tuple(range(504,512)))
    for first,count in [(-1,1),(512,1),(511,2),(0,0),(0,9),(True,1)]:
     with self.assertRaises(ValueError):source.read('value',first,count)
    with p.open('r+b') as h:h.seek(-4,os.SEEK_END);h.write(b'\0\0\0\0')
    with self.assertRaises(ValueError):source.read('value',0,1)
   finally:source.close()
 def test_source_kinds_and_full_hash(self):
  with tempfile.TemporaryDirectory() as root:
   p,pin=self.fixture(root);linked=Path(root)/'linked';linked.symlink_to(p)
   with self.assertRaises(OSError):m.Source(linked,pin)
   fifo=Path(root)/'fifo';os.mkfifo(fifo)
   with self.assertRaises(ValueError):m.Source(fifo,pin)
   source=m.Source(p,{**pin,'sha256':'0'*64})
   try:
    with self.assertRaises(ValueError):source.verify(lambda:None)
    self.assertFalse(source.verified)
   finally:source.close()
 def test_source_header_coverage(self):
  with tempfile.TemporaryDirectory() as root:
   p,pin=self.fixture(root,{'value':{'dtype':'U32','shape':[511,1,1],'data_offsets':[4,2048]}})
   with self.assertRaises(ValueError):m.Source(p,pin)
 def test_short_write_and_io_failure(self):
  with tempfile.TemporaryFile() as f:
   actual=os.pwrite
   with patch.object(m.os,'pwrite',side_effect=lambda fd,b,o:actual(fd,b[:3],o)):
    m.write_all(f.fileno(),b'complete-record',5)
   self.assertEqual(os.pread(f.fileno(),15,5),b'complete-record')
   with patch.object(m.os,'pwrite',return_value=0):
    with self.assertRaises(OSError):m.write_all(f.fileno(),b'x',0)
 def test_owned_output_digest(self):
  with tempfile.TemporaryFile() as f:
   f.write(b'complete tensor payload');f.flush()
   self.assertEqual(m.hash_owned(f.fileno(),23,lambda:None),hashlib.sha256(b'complete tensor payload').hexdigest())
   with self.assertRaises(ValueError):m.hash_owned(f.fileno(),24,lambda:None)

if __name__=='__main__':unittest.main()
