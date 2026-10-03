import copy,hashlib,json,os,struct,tempfile,unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch
import affine_expert_reference as m
from affine_expert_control import Source

class ReferenceTests(unittest.TestCase):
 def make_table(self,root,*,dtype='U32',columns=20):
  module='language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0'
  header={};body=b''
  for part,typ,width in [('weight',dtype,columns),('scales','BF16',5),('biases','BF16',5)]:
   raw=bytes((n%251 for n in range(4*width*(4 if typ=='U32' else 2))))
   header[module+'.'+part]={'shape':[4,width],'dtype':typ,'data_offsets':[len(body),len(body)+len(raw)]};body+=raw
  h=json.dumps(header).encode();p=Path(root)/'source';p.write_bytes(struct.pack('<Q',len(h))+h+body)
  source=Source(p,{'size':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
  archive=SimpleNamespace(config={'quantization':{'bits':4,'group_size':32}},mapping={k:'source' for k in header},sources={'source':source})
  return archive,source,module
 def test_owned_ple_ranges_and_order(self):
  with tempfile.TemporaryDirectory() as root:
   archive,source,module=self.make_table(root)
   try:
    table=m.Table(archive,module)
    with self.assertRaises(ValueError):table.gather([0])
    source.verify(lambda:None);pieces=table.gather([3,0,3])
    self.assertEqual([len(x) for x in pieces],[240,30,30])
    self.assertEqual(pieces[0][:80],pieces[0][160:]);self.assertNotEqual(pieces[0][:80],pieces[0][80:160])
    self.assertEqual(table.receipt()['bytes_read'],200)
    for rows in [[],[True],[-1],[4],[0]*8193]:
     with self.assertRaises(ValueError):table.gather(rows)
    with patch.object(m.os,'pread',return_value=b''):
     with self.assertRaises(ValueError):table.gather([0])
   finally:source.close()
 def test_ple_metadata_and_changed_source(self):
  with tempfile.TemporaryDirectory() as root:
   archive,source,module=self.make_table(root,columns=19)
   try:
    with self.assertRaises(ValueError):m.Table(archive,module)
   finally:source.close()
  with tempfile.TemporaryDirectory() as root:
   archive,source,module=self.make_table(root)
   try:
    source.verify(lambda:None);table=m.Table(archive,module)
    p=Path(root)/'source'
    with p.open('r+b') as handle:handle.seek(-1,os.SEEK_END);handle.write(b'x')
    with self.assertRaises(ValueError):table.gather([0])
   finally:source.close()
 def test_proof_scope_binding(self):
  proof={'complete':True,'control_manifest_sha256':'a'*64,'instrument_sha256':'b'*64,
    'normalization':m.NORMALIZATION,'architecture_sha256':m.ARCH_SHA256,'prompt_chunk':512,
    'ple_tables_proven':128,'traversal':{'equal_bits':True,'tokens':513,'layers':4}}
  m.check_proof(proof,{'sha256':'b'*64},'a'*64)
  for key,value in [('complete',False),('control_manifest_sha256',None),('normalization','fold-again'),('architecture_sha256','0'*64),('prompt_chunk',256),('ple_tables_proven',127),('instrument_sha256','c'*64),('traversal',{'equal_bits':True,'tokens':512,'layers':4})]:
   broken=copy.deepcopy(proof);broken[key]=value
   with self.assertRaises(ValueError):m.check_proof(broken,{'sha256':'b'*64},'a'*64)

if __name__=='__main__':unittest.main()
