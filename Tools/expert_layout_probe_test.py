#!/usr/bin/env python3
import errno
import json
import os
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
import unittest
from expert_layout_probe import build_artifact, validate_artifact, exact_read, exact_write, summarize


class LayoutTests(unittest.TestCase):
    def refs(self, root):
        source=root/'source.bin'; source.write_bytes(bytes(range(192)))
        stat=source.stat()
        return [[{'path':str(source),'offset':p*64,'row_bytes':8,
                  'source_size':stat.st_size,'source_mtime_ns':stat.st_mtime_ns} for p in range(3)]]

    def test_actual_interleave_and_payload_validation(self):
        with TemporaryDirectory() as name:
            root=Path(name); refs=self.refs(root); dst=root/'artifact'
            build_artifact(dst,refs,experts=8)
            self.assertEqual(validate_artifact(dst)['bytes'],192)
            expected=b''.join(bytes(range(p*64+e*8,p*64+(e+1)*8)) for e in range(8) for p in range(3))
            self.assertEqual((dst/'experts.bin').read_bytes(),expected)
            (dst/'experts.bin').write_bytes(bytes([255])+expected[1:])
            with self.assertRaisesRegex(ValueError,'digest'): validate_artifact(dst)

    @unittest.skipUnless(sys.platform=='darwin','Darwin uncached derived copies')
    def test_uncached_sparse_copies_keep_offsets_and_source_identity(self):
        controls={'no_cache':48,'no_cache_ext':112,'read_ahead':45}
        with TemporaryDirectory() as name:
            root=Path(name); refs=self.refs(root); dst=root/'artifact'
            m=build_artifact(dst,refs,experts=8,controls=controls)
            self.assertEqual(validate_artifact(dst),m)
            self.assertEqual(m['checkpoint_refs'],refs)
            self.assertEqual((dst/'source-000.bin').read_bytes(),(root/'source.bin').read_bytes())
            self.assertEqual([r['offset'] for r in m['refs'][0]],[0,64,128])
            self.assertTrue(all(r['path']==str(dst/'source-000.bin') for r in m['refs'][0]))
        for stage in ['write','publish']:
            with TemporaryDirectory() as name:
                root=Path(name); refs=self.refs(root)
                def fail(where,index):
                    if where==stage: raise OSError(errno.ENOSPC,'bounded fault')
                with self.assertRaises(OSError):
                    build_artifact(root/'artifact',refs,experts=8,controls=controls,fault=fail)
                self.assertEqual([p.name for p in root.iterdir()],['source.bin'])

    def test_interrupted_disk_full_and_publish_leave_original_usable(self):
        for stage in ['write','publish']:
            for error in [OSError(errno.ENOSPC,'injected disk full'),KeyboardInterrupt()]:
                with TemporaryDirectory() as name:
                    root=Path(name); refs=self.refs(root); original=(root/'source.bin').read_bytes()
                    def fail(where,index):
                        if where==stage: raise error
                    with self.assertRaises(type(error)): build_artifact(root/'artifact',refs,experts=8,fault=fail)
                    self.assertFalse((root/'artifact').exists())
                    self.assertEqual(sorted(x.name for x in root.iterdir()),['source.bin'])
                    self.assertEqual((root/'source.bin').read_bytes(),original)
                    build_artifact(root/'retry',refs,experts=8)
                    validate_artifact(root/'retry')

    def test_reject_identity_length_and_changed_source(self):
        for kind in ['version','layout','truncated','source','digest_table']:
            with TemporaryDirectory() as name:
                root=Path(name); refs=self.refs(root); dst=root/'artifact'; build_artifact(dst,refs,experts=8)
                m=json.loads((dst/'manifest.json').read_text())
                if kind in ['version','layout']:
                    m[kind]='unknown'; (dst/'manifest.json').write_text(json.dumps(m))
                elif kind=='truncated': (dst/'experts.bin').write_bytes(b'bad')
                elif kind=='digest_table': (dst/'record-digests.bin').write_bytes(bytes(8*32))
                else: (root/'source.bin').write_bytes(b'changed')
                with self.assertRaises(ValueError): validate_artifact(dst)

    def test_exact_partial_interrupted_and_failed_io(self):
        calls=[]
        def read(fd,n,offset):
            calls.append(offset)
            if len(calls)==1: raise InterruptedError()
            return b'abcdef'[offset:offset+min(n,2)]
        self.assertEqual(exact_read(0,6,0,read),b'abcdef')
        self.assertEqual(calls,[0,0,2,4])
        with self.assertRaises(EOFError): exact_read(0,1,0,lambda *a:b'')
        with self.assertRaises(ValueError): exact_read(0,1,0,lambda *a:b'XX')
        output=bytearray(); steps=[]
        def write(fd,data):
            steps.append(1)
            if len(steps)==1: raise InterruptedError()
            output.extend(data[:2]); return min(len(data),2)
        exact_write(0,b'abcde',write); self.assertEqual(output,b'abcde')
        for count in [0,-1,7]:
            with self.assertRaises(OSError): exact_write(0,b'abc',lambda *a:count)

    def test_whole_pair_exclusions_and_exact_work_required(self):
        protocol={'rounds':2,'minimum_pairs':1,'minimum_median_reduction':.05,
                  'minimum_positive_fraction':.8,'workloads':['x']*6}
        def cell(mode,round_id=1):
            return {'workload':0,'round':round_id,'mode':mode,'exclusions':[],
                    'result':{'seconds':1 if mode==0 else .8,'records':32,'batches':1,'bytes':100,'tensor_sha256':'exact'}}
        self.assertTrue(summarize([cell(0),cell(1)],protocol)[0]['passed'])
        a=cell(0); a['exclusions']=['swap']; self.assertFalse(summarize([a,cell(1)],protocol)[0]['passed'])
        b=cell(1); b['result']['tensor_sha256']='wrong'; self.assertFalse(summarize([cell(0),b],protocol)[0]['passed'])


if __name__=='__main__': unittest.main()
