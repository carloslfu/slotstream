"""Simulated endpoint integration check; does not load or qualify a model."""
import http.server
import json
from pathlib import Path
import sys
import threading

sys.path.insert(0, str(Path(__file__).parent / 'harness-idle-v3'))
from release_speed_bench import runtime_plan

class Handler(http.server.BaseHTTPRequestHandler):
    def do_POST(self):
        assert self.path == '/api/show'
        assert json.loads(self.rfile.read(int(self.headers['Content-Length']))) == {}
        self.send_response(200)
        self.end_headers()
        self.wfile.write(json.dumps({'details': {'memory_plan': {
            'pool_slots': 961, 'mtp': False}}}).encode())

    def log_message(self, *args):
        pass

server = http.server.HTTPServer(('127.0.0.1', 0), Handler)
thread = threading.Thread(target=server.serve_forever)
thread.start()
try:
    assert runtime_plan(server.server_port) == {'pool_slots': 961, 'mtp': False}
    print('PASS simulated loopback /api/show and nested plan extraction; no model loaded')
finally:
    server.shutdown()
    thread.join()
    server.server_close()
