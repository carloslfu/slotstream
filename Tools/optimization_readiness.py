"""Read the Mac's OS pressure state without changing memory or applications."""
import subprocess


def pressure_snapshot(run=subprocess.run):
    command = ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level']
    result = run(command, text=True, capture_output=True, timeout=2)
    raw = result.stdout.strip()
    if result.returncode != 0 or raw not in ('1', '2', '4'):
        raise RuntimeError(f'OS memory pressure is unreadable: exit={result.returncode}, value={raw!r}')
    level = int(raw)
    return {'command': command, 'level': level,
            'name': {1: 'normal', 2: 'warning', 4: 'critical'}[level],
            'stdout': result.stdout, 'stderr': result.stderr}


def require_normal(snapshot):
    level = snapshot.get('level')
    if type(level) is not int or level != 1:
        raise RuntimeError(f'OS memory pressure is not normal (observed level={level!r}); '
                           'model work is not eligible')


if __name__ == '__main__':
    import json
    observation = pressure_snapshot()
    print(json.dumps(observation))
    require_normal(observation)
