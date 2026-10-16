"""Transparent HTTP proxy that records each request's token usage.

Forwards everything to the upstream server unchanged and streams the reply
back as it arrives. For each request it appends one JSON line: method, path,
status, seconds to first byte and in total, and the prompt, reused and output
token counts found in the reply (Anthropic, chat completions or Responses).
Usage: python3 Tools/token_usage_proxy.py <listen port> <upstream port> <log file>
Used by Tools/coding_agents_gate.sh. Standard library only.
"""
import http.client
import json
import sys
import threading
import time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

LISTEN, UPSTREAM, LOG = int(sys.argv[1]), int(sys.argv[2]), sys.argv[3]
lock = threading.Lock()
HOP = {"connection", "keep-alive", "transfer-encoding", "content-length", "upgrade", "proxy-connection"}


def usage_of(text):
    """The last usage figures in a JSON reply or an SSE stream."""
    found = {}

    def visit(obj):
        # Only protocol-owned envelopes carry accounting. Tool inputs and
        # echoed schemas can contain arbitrary domain fields named "usage".
        if not isinstance(obj, dict):
            return
        event = obj.get("type")
        if event == "message_start":
            obj = obj.get("message")
        elif isinstance(event, str) and event.startswith("response."):
            obj = obj.get("response")
        if isinstance(obj, dict):
            u = obj.get("usage")
            if isinstance(u, dict):
                for key in ("input_tokens", "prompt_tokens", "cache_read_input_tokens", "output_tokens",
                            "completion_tokens"):
                    if isinstance(u.get(key), int):
                        found[key] = u[key]
                for details in ("prompt_tokens_details", "input_tokens_details"):
                    if isinstance(u.get(details), dict) and isinstance(u[details].get("cached_tokens"), int):
                        found["cached_tokens"] = u[details]["cached_tokens"]

    bodies = [line[5:].strip() for line in text.splitlines() if line.startswith("data:")] or [text]
    for body in bodies:
        try:
            visit(json.loads(body))
        except ValueError:
            pass
    if "prompt_tokens" in found:  # chat completions
        return {"prompt": found["prompt_tokens"], "reused": found.get("cached_tokens", 0),
                "output": found.get("completion_tokens")}
    if "cache_read_input_tokens" in found:  # Anthropic reports the unread part as input
        return {"prompt": found.get("input_tokens", 0) + found["cache_read_input_tokens"],
                "reused": found["cache_read_input_tokens"], "output": found.get("output_tokens")}
    if "input_tokens" in found:  # Responses
        return {"prompt": found["input_tokens"], "reused": found.get("cached_tokens", 0),
                "output": found.get("output_tokens")}
    return {}


class Handler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"

    def log_message(self, *args):
        pass

    def forward(self):
        started = time.time()
        if "chunked" in (self.headers.get("Transfer-Encoding") or "").lower():
            # The server refuses these too; say so loudly rather than decode them.
            with lock, open(LOG, "a") as log:
                log.write(json.dumps({"at": time.strftime("%H:%M:%S"), "method": self.command, "path": self.path,
                                      "status": 411, "chunked_request": True}) + "\n")
            self.send_error(411, "chunked request bodies are not supported")
            return
        length = int(self.headers.get("Content-Length") or 0)
        body = self.rfile.read(length) if length else b""
        headers = {k: v for k, v in self.headers.items() if k.lower() not in HOP | {"host", "accept-encoding"}}
        upstream = http.client.HTTPConnection("127.0.0.1", UPSTREAM, timeout=7200)
        try:
            upstream.request(self.command, self.path, body or None, headers)
            reply = upstream.getresponse()
        except OSError as error:
            self.send_error(502, str(error))
            return
        self.send_response(reply.status)
        for key, value in reply.getheaders():
            if key.lower() not in HOP:
                self.send_header(key, value)
        self.send_header("Transfer-Encoding", "chunked")
        self.send_header("Connection", "close")
        self.end_headers()
        first = None
        captured = bytearray()
        try:
            while True:
                chunk = reply.read1(65536)
                if not chunk:
                    break
                if first is None:
                    first = time.time() - started
                if len(captured) < 8_000_000:
                    captured += chunk
                self.wfile.write(b"%x\r\n%s\r\n" % (len(chunk), chunk))
                self.wfile.flush()
            self.wfile.write(b"0\r\n\r\n")
            self.wfile.flush()
        except OSError:
            pass
        finally:
            upstream.close()
        self.close_connection = True
        record = {"at": time.strftime("%H:%M:%S"), "method": self.command, "path": self.path,
                  "status": reply.status, "request_bytes": len(body), "first_byte_s": round(first or 0, 2),
                  "total_s": round(time.time() - started, 2),
                  "agent": self.headers.get("User-Agent", "")[:60]}
        if self.command == "POST":
            try:
                request = json.loads(body)
                record["model"] = request.get("model")
                record["stream"] = request.get("stream")
            except ValueError:
                pass
            record.update(usage_of(captured.decode("utf-8", "replace")))
        with lock, open(LOG, "a") as log:
            log.write(json.dumps(record) + "\n")

    do_GET = do_POST = do_DELETE = do_PUT = forward


ThreadingHTTPServer.daemon_threads = True
ThreadingHTTPServer(("127.0.0.1", LISTEN), Handler).serve_forever()
