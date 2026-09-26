#!/usr/bin/env python3
"""Exercise the CLI's real signal/cancellation wrapper without model downloads.

Run after make build. The compiled probe uses the production wrapper and
cancellation type, plus the actual built ArgumentParser ExitCode implementation.
Only the operation is a fixture: an optional stage may catch an error and return.
"""
import json
from pathlib import Path
import select
import signal
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]


def main():
    build = ROOT / '.build/release'
    objects = sorted((build / 'ArgumentParser.build').glob('*.o'))
    objects += sorted((build / 'ArgumentParserToolInfo.build').glob('*.o'))
    if not objects:
        raise SystemExit('Run make build before the pull interruption gate.')
    pull = (ROOT / 'Sources/slotstream-cli/Pull.swift').read_text()
    wrapper = pull[pull.index('func withInterruptiblePull('):]
    http = (ROOT / 'Sources/Slotstream/DownloadHTTP.swift').read_text()
    cancellation = http[http.index('public final class PullCancellation:'):http.index('struct DownloadHTTPError:')]
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
        source.write_text('import ArgumentParser\nimport Foundation\nimport Darwin\n'
                          + cancellation + wrapper + entry)
        binary = Path(folder) / 'probe'
        subprocess.run(['xcrun', 'swiftc', '-swift-version', '5', '-I', str(build / 'Modules'),
                        str(source), *map(str, objects), '-o', str(binary)], check=True)
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
                process.send_signal(sig)
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
