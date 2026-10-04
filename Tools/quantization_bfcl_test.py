#!/usr/bin/env python3
import hashlib
import json
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch
import quantization_bfcl as q


class GrammarTests(unittest.TestCase):
    def test_reference_and_model_literals(self):
        self.assertEqual(q.call_from_source("add(2, b=-3)"), {'name':'add','args':[2],'kwargs':{'b':-3}})
        self.assertEqual(q.model_call({'name':'add','arguments':'{"a":2,"b":3}'}), {'name':'add','args':[],'kwargs':{'a':2,'b':3}})
        self.assertEqual(q.call_from_source("f(items=(1,2), options={'x':True})")['kwargs'], {'items':(1,2),'options':{'x':True}})

    def test_expressions_attributes_and_expansions_never_execute(self):
        for source in ['__import__("os")','x.method()','f(g())','f(x for x in [])','f(*[])','f(**{})',
                       'f(a=1,a=2)','f(a=10**9)','f(a=[1]*1000000)','f(a=1000001)','lambda: 1']:
            with self.subTest(source=source),self.assertRaises((ValueError,SyntaxError)):
                q.call_from_source(source)
        for args in ['{"a":1,"a":2}', '{"a":NaN}', '{"a":Infinity}', '[1]', 'null', 'true']:
            with self.subTest(args=args),self.assertRaises(ValueError):
                q.model_call({'name':'f','arguments':args})

    def test_argument_and_call_bounds(self):
        for value in [float('inf'),1_000_001,'x'*8193,list(range(257)),{1:'x'},object()]:
            with self.assertRaises(ValueError):q.bounded_value(value)
        value=0
        for _ in range(18):value=[value]
        with self.assertRaises(ValueError):q.bounded_value(value)
        for call in [{},{'name':'f','args':{},'kwargs':{}},{'name':'f','args':[],'kwargs':[]},
                     {'name':'_private','args':[],'kwargs':{}},{'name':'f','args':[1]*17,'kwargs':{}}]:
            with self.assertRaises(ValueError):q.validate_call(call)

    def test_executor_only_exposes_documented_methods(self):
        class Fake:
            def __init__(self):self.total=0
            def add(self,a,b):self.total+=a+b;return {'sum':a+b}
            def private_operation(self):raise AssertionError('must never run')
            def square_root(self, number, precision):return {'value':number,'precision':precision}
        with tempfile.TemporaryDirectory() as temp:
            root=Path(temp);docs=root/'bfcl_eval/data/multi_turn_func_doc';docs.mkdir(parents=True)
            for name,module in q.CLASSES.items():
                rows=[{'name':'add'},{'name':'square_root'}] if name=='MathAPI' else []
                (docs/(module+'.json')).write_text(''.join(json.dumps(x)+'\n' for x in rows))
            executor=q.FixtureExecutor(root)
            with patch.object(q.importlib,'import_module',return_value=SimpleNamespace(MathAPI=Fake)):
                good,instances=executor.execute(['add(a=2,b=3)'],{},['MathAPI'],'model','case')
                self.assertEqual(good,['{"sum": 5}']);self.assertEqual(instances['MathAPI'].total,5)
                bad,_=executor.execute(['private_operation()','square_root(number=4,precision=1000000)',
                                        '__import__("os").system("false")'],{},['MathAPI'],'model','case')
                self.assertTrue(all(x.startswith('Error during execution: ') for x in bad))
                self.assertEqual(instances['MathAPI'].total,5)
                other,other_instances=executor.execute(['add(a=1,b=1)'],{},['MathAPI'],'reference','case')
                self.assertEqual(other_instances['MathAPI'].total,2)
                executor.calls=q.MAX_CALLS
                with self.assertRaises(ValueError):executor.execute(['add(a=1,b=1)'],{},['MathAPI'],'model','case')


@unittest.skipUnless(sys.platform=='darwin','Mac-only tool fixture boundary')
class BoundaryTests(unittest.TestCase):
    def bundle(self,root):
        source=root/'source';runtime=root/'runtime';source.mkdir();runtime.mkdir()
        path=source/'fixture.py';path.write_text('VALUE=42\n')
        manifest=root/'manifest.json';manifest.write_text(json.dumps({'schema':1,'kind':'bfcl-offline-base-v1',
            'source_files':{'fixture.py':hashlib.sha256(path.read_bytes()).hexdigest()},'runtime_files':{}}))
        return q.Bundle(source,runtime,manifest,hashlib.sha256(manifest.read_bytes()).hexdigest())

    def test_owned_copy_and_real_sandbox(self):
        with tempfile.TemporaryDirectory() as temp:
            root=Path(temp).resolve();sentinel=root/'sentinel';sentinel.write_text('private fixture')
            with self.bundle(root) as bundle:
                (root/'source/fixture.py').write_text('VALUE=99\n')
                owned=bundle.root/'bfcl_eval/fixture.py'
                self.assertEqual(owned.read_text(),'VALUE=42\n')
                script='''import os,json,socket,errno
checks={}
for name,call in [("read",lambda:open(%r).read()),("write",lambda:open(%r,"w")),
                  ("network",lambda:socket.socket().connect(("127.0.0.1",9))),("fork",lambda:os.fork())]:
 try:call();checks[name]=False
 except OSError as e:checks[name]=e.errno in (errno.EPERM,errno.EACCES)
checks["owned_read"]=open(%r).read()=="VALUE=42\\n"
print(json.dumps(checks))
'''%(str(sentinel),str(root/'forbidden'),str(owned))
                command=bundle.command[:bundle.command.index(str(bundle.root/'quantization_bfcl.py'))]+['-c',script]
                result=q._bounded_process(command,b'')
                self.assertEqual(result['exit_code'],0,result['stderr'])
                self.assertEqual(json.loads(result['stdout']),dict(read=True,write=True,network=True,fork=True,owned_read=True))
                self.assertFalse((root/'forbidden').exists())

    def test_manifest_and_bootstrap_failure(self):
        with tempfile.TemporaryDirectory() as temp:
            root=Path(temp)
            with self.bundle(root) as bundle:
                for result in [{'exit_code':1,'stderr':b'missing runtime','stdout':b''},
                               {'exit_code':0,'stderr':b'','stdout':b'{"valid":false}\n'}]:
                    with patch.object(q,'_bounded_process',return_value=result),self.assertRaises(RuntimeError):
                        bundle.run({'mode':'grade'})
            with self.assertRaises(ValueError):q.Bundle(root/'source',root/'runtime',root/'manifest.json','0'*64)
            digest=hashlib.sha256((root/'manifest.json').read_bytes()).hexdigest()
            (root/'source/fixture.py').write_text('TAMPERED=True\n')
            with self.assertRaises(ValueError):q.Bundle(root/'source',root/'runtime',root/'manifest.json',digest)


if __name__=='__main__':unittest.main()
