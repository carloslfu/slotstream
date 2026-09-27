#!/usr/bin/env python3
"""Exercise the CLI's real signal/cancellation wrapper without model downloads.

The compiled probe uses the production wrapper and cancellation type. A local
ExitCode stands in for ArgumentParser's, so the gate needs no build tree and
runs against any binary. Only the operation is a fixture: an optional stage
may catch an error and return.
"""
import json
from pathlib import Path
import select
import signal
import subprocess
import tempfile
import time


ROOT = Path(__file__).resolve().parents[1]


def slice_between(text, start, end=None, name=''):
    if text.count(start) != 1 or (end is not None and text.count(end) != 1):
        raise SystemExit(f'pull interruption gate: the {name} markers changed; review the harness')
    return text[text.index(start):text.index(end) if end is not None else len(text)]


def main():
    pull = (ROOT / 'Sources/slotstream-cli/Pull.swift').read_text()
    wrapper = slice_between(pull, 'func withInterruptiblePull(', name='wrapper')
    http = (ROOT / 'Sources/Slotstream/DownloadHTTP.swift').read_text()
    cancellation = slice_between(http, 'public final class PullCancellation:', 'struct DownloadHTTPError:',
                                 name='cancellation')
    entry = r'''
let mode = CommandLine.arguments[1]
enum FixtureError: Error { case ordinary }
do {
    try withInterruptiblePull { cancellation in
        switch mode {
        case "success": break
        case "failure": throw FixtureError.ordinary
        case "cancel-throw":
            cancellation.cancel()
            try cancellation.check()
        case "cancel-return":
            cancellation.cancel()
            // Optional downloads catch their failure and return to the caller.
            do { try cancellation.check() } catch {}
        case "signal-return":
            print("WAITING"); fflush(stdout)
            let deadline = Date().addingTimeInterval(5)
            while !cancellation.isCancelled && Date() < deadline {
                Thread.sleep(forTimeInterval: 0.01)
            }
            guard cancellation.isCancelled else { throw FixtureError.ordinary }
        default: throw FixtureError.ordinary
        }
    }
    print("READY_SUCCESS")
} catch let code as ExitCode {
    exit(code.rawValue)
} catch {
    print("ORDINARY_FAILURE")
    exit(1)
}
'''
    results = []
    with tempfile.TemporaryDirectory(prefix='slotstream-pull-interrupt-') as folder:
        source = Path(folder) / 'main.swift'
        stub = 'struct ExitCode: Error { let rawValue: Int32; init(_ rawValue: Int32) { self.rawValue = rawValue } }\n'
        source.write_text('import Foundation\nimport Darwin\n' + stub + cancellation + wrapper + entry)
        binary = Path(folder) / 'probe'
        subprocess.run(['xcrun', 'swiftc', '-swift-version', '5', str(source), '-o', str(binary)], check=True)
        for mode, expected in [('success', 0), ('failure', 1), ('cancel-throw', 130), ('cancel-return', 130)]:
            run = subprocess.run([str(binary), mode], capture_output=True, text=True, timeout=10)
            output = run.stdout + run.stderr
            passed = run.returncode == expected
            passed &= ('READY_SUCCESS' in output) == (expected == 0)
            passed &= ('download interrupted' in output) == (expected == 130)
            results.append(dict(case=mode, passed=passed, exit=run.returncode, output=output))
        for sig in [signal.SIGINT, signal.SIGTERM]:
            process = subprocess.Popen([str(binary), 'signal-return'], stdout=subprocess.PIPE,
                                       stderr=subprocess.STDOUT, text=True)
            try:
                if not select.select([process.stdout], [], [], 10)[0]:
                    raise AssertionError('signal fixture did not become ready')
                ready = process.stdout.readline()
                if ready.strip() != 'WAITING':
                    raise AssertionError(ready)
                # The handler is registered before WAITING, but resend once a
                # second in case the first signal arrived before the dispatch
                # source was live; a spacing this long cannot race the exit.
                deadline = time.monotonic() + 10
                while process.poll() is None and time.monotonic() < deadline:
                    process.send_signal(sig)
                    try:
                        process.wait(timeout=1)
                    except subprocess.TimeoutExpired:
                        pass
                output = ready + process.communicate(timeout=10)[0]
                passed = process.returncode == 130 and 'download interrupted' in output and 'READY_SUCCESS' not in output
                results.append(dict(case=sig.name, passed=passed, exit=process.returncode, output=output))
            finally:
                if process.poll() is None:
                    process.kill()
                process.wait(timeout=5)
    print(json.dumps(results, indent=2))
    raise SystemExit(0 if all(row['passed'] for row in results) else 1)


if __name__ == '__main__':
    main()
