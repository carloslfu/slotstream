#!/usr/bin/env python3
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
import quantization_code_sandbox as q


class LiteralTests(unittest.TestCase):
    def test_literal_types_preserved(self):
        self.assertEqual(q.literal('(1, [2], {3, 4}, {"x": -5}, None, True)'), (1, [2], {3,4}, {'x':-5}, None, True))
        tests=q.decode_tests([{'arguments_python':['(1, 2)','[]'], 'value_python':'{1, 2}'}])
        self.assertEqual(tests,[{'args':[(1,2),[]],'value':{1,2}}])

    def test_nonliteral_and_resource_bounds(self):
        for source in ['open("foo")','x','[i for i in range(9)]','[1]*100000','10**999','1e999','1000001',
                       'b"bytes"','1j','['*40+'1'+']'*40,'['+','.join('1' for _ in range(600))+']','"'+'x'*4097+'"']:
            with self.subTest(source=source[:30]), self.assertRaises((ValueError,SyntaxError)):
                q.literal(source)
        for tests in [[],None,[{}],[{'arguments_python':'x','value_python':'1'}],[{'arguments_python':['1']*17,'value_python':'1'}]]:
            with self.assertRaises(ValueError):q.decode_tests(tests)

    def test_bounded_output_and_wall_time(self):
        with self.assertRaises(ValueError):q._bounded_process([sys.executable,'-I','-c','print("x"*70000)'],b'')
        with self.assertRaises(TimeoutError):q._bounded_process([sys.executable,'-I','-c','import time;time.sleep(2)'],b'',timeout=.1)
        with self.assertRaises(ValueError):q._bounded_process([],b'x'*(q.MAX_PAYLOAD+1))
        result=q._bounded_process([sys.executable,'-I','-c','import sys;print(len(sys.stdin.buffer.read()))'],b'x'*q.MAX_PAYLOAD)
        self.assertEqual(result['stdout'].strip(),str(q.MAX_PAYLOAD).encode())

    def test_explicit_string_input_bound_does_not_widen_the_coding_default(self):
        command=[str(q.runtime_executable()),'-I','-S','-c','import sys;print(len(sys.stdin.buffer.read()))']
        payload=b'x'*131072
        with self.assertRaises(ValueError):q._bounded_process(command,payload)
        result=q._bounded_process(command,payload,maximum_payload=len(payload))
        self.assertEqual(result['stdout'].strip(),str(len(payload)).encode())
        for bound in [True,0,-1,2.0,(2<<20)+1]:
            with self.assertRaises(ValueError):q._bounded_process([],b'',maximum_payload=bound)


@unittest.skipUnless(sys.platform=='darwin','native Mac sandbox is the only supported coding environment')
class NativeTests(unittest.TestCase):
    tests=[{'arguments_python':['[1,2]'],'value_python':'(2,1)'}]

    def test_correct_wrong_mutating_and_nonterminating(self):
        self.assertTrue(q.grade('def f(x):\n    return tuple(reversed(x))','f',self.tests)['passed'])
        self.assertFalse(q.grade('def f(x):\n    return x','f',self.tests)['passed'])
        self.assertFalse(q.grade('def f(x):\n    x.reverse()\n    return tuple(x)','f',self.tests)['passed'])
        row=q.grade('def f(x):\n    while True:\n        pass','f',self.tests)
        self.assertFalse(row['passed']);self.assertEqual(row['exception'],'RuntimeError')
        self.assertFalse(q.grade('import os\ndef f(x):\n    return os.getcwd()','f',self.tests)['passed'])
        self.assertFalse(q.grade('def f(x):\n    return missing(x)','f',self.tests)['passed'])

    def test_bootstrap_failure_is_not_a_model_failure(self):
        for response in [{'exit_code':1,'stdout':b'','stderr':b'bootstrap error'},
                         {'exit_code':0,'stdout':b'{"passed":false}\n','stderr':b''}]:
            with patch.object(q,'_bounded_process',return_value=response),self.assertRaises(RuntimeError):
                q.grade('def f(x):\n    return x','f',self.tests)

    def test_real_os_boundaries(self):
        with tempfile.TemporaryDirectory(prefix='slotstream-boundary-test-') as tmp:
            tmp=Path(tmp).resolve();sentinel=tmp/'not-allowed.txt';sentinel.write_text('test-owned sentinel')
            executable=q.runtime_executable();source=Path(q.__file__).resolve()
            profile=q.sandbox_profile(executable,sys.base_prefix,[source]);p=tmp/'profile.sb';p.write_text(profile)
            code='''import os,json,socket,errno,math
checks={}
for name,call in [
 ("read",lambda:open(%s).read()),
 ("write",lambda:open(%s,"w").write("unexpected")),
 ("network",lambda:socket.socket().connect(("127.0.0.1",9))),
 ("fork",lambda:os.fork())]:
 try:call();checks[name]=False
 except OSError as e:checks[name]=e.errno in (errno.EPERM,errno.EACCES)
checks["stdlib"]=math.isqrt(81)==9
print(json.dumps(checks))
'''%(repr(str(sentinel)),repr(str(tmp/'forbidden-write')))
            response=q._bounded_process(['/usr/bin/sandbox-exec','-f',str(p),str(executable),'-I','-S','-B','-c',code],b'')
            self.assertEqual(response['exit_code'],0,response['stderr']);self.assertEqual(json.loads(response['stdout']),dict(read=True,write=True,network=True,fork=True,stdlib=True))
            self.assertFalse((tmp/'forbidden-write').exists())
            self.assertEqual(sentinel.read_text(),'test-owned sentinel')

    def test_platform_refusal(self):
        with patch.object(q.sys,'platform','linux'),self.assertRaises(RuntimeError):
            q.grade('def f(x):\n    return x','f',self.tests)


if __name__=='__main__':unittest.main()
