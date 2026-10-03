"""Read-only disk probe with per-point physical-device read witnesses."""
import json, os, plistlib, statistics, subprocess, sys, time
from pathlib import Path
ROOT=Path('/Volumes/llm/slotstream-pr24-followup')
OUT=Path('/Volumes/llm/slotstream-pr24-20261003-followup')
sys.path.insert(0,str(ROOT/'Tools'))
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import digest,vm_snapshot

def driver_counters():
    raw=subprocess.check_output(['/usr/sbin/ioreg','-r','-c','IOBlockStorageDriver','-l','-a'])
    result={}
    def media(node):
        if node.get('IOObjectClass')=='IOMedia' and node.get('BSD Name') in ('disk0','disk4'):
            return node['BSD Name']
        for child in node.get('IORegistryEntryChildren',[]):
            found=media(child)
            if found:return found
    for root in plistlib.loads(raw):
        name=media(root)
        if name:result[name]={'entry_id':root['IORegistryEntryID'], 'statistics':root['Statistics']}
    if set(result)!={'disk0','disk4'}:raise RuntimeError('missing physical driver witness')
    return result

# Only run after the preceding sequential validation has completed.
while not (OUT/'worktree-status.txt').exists():time.sleep(5)
for suite in ['build','checks','static','sampler','consumer','coverage','coverage-report']:
    if (OUT/f'{suite}.exit').read_text().strip()!='0':raise SystemExit(f'withheld after {suite} failure')
dest=OUT/'physical-disk';dest.mkdir(exist_ok=False)
source=OUT/'disk-read-invalidated.c'
helper=dest/'disk-read'
subprocess.run(['cc','-O2','-Wall','-Wextra','-pthread',str(source),'-o',str(helper)],check=True)
models={'external':('/Volumes/llm/models/qwen38-flash-next-mlx-4bit','disk4'),
        'internal':('/Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit','disk0')}
protocol={'record_bytes':2764800,'reads_per_point':2400,'rounds':3,'queue_depths':[1,2,4,8,16,32],
    'source_sha256':digest(source),'binary_sha256':digest(helper),
    'cache':'checked descriptor F_NOCACHE=1/F_RDAHEAD=0; read-only MAP_SHARED MS_INVALIDATE before timed reads, fstat metadata unchanged',
    'witness':'IOBlockStorageDriver cumulative Bytes (Read) for disk4 and disk0 before and after every point; no interval-monitor truncation',
    'qualified_point':'0.98 <= physical/logical read bytes <= 1.05 and no additional read errors; no global swap; baseline unrelated device reads recorded',
    'limits':'existing shard file-level seeded pread; SSD hardware cache not purged; macOS/system background I/O uncontrolled',
    'sequence':'odd round QD ascending external/internal, even round QD descending internal/external'}
(dest/'protocol.json').write_text(json.dumps(protocol,indent=2)+'\n')
quiet_preflight(13)
rows=[]
with verification_lock():
    before_idle=driver_counters();time.sleep(2);after_idle=driver_counters()
    (dest/'idle.json').write_text(json.dumps({'seconds':2,'before':before_idle,'after':after_idle},indent=2)+'\n')
    for r in range(1,4):
        qds=[1,2,4,8,16,32];labels=['external','internal']
        if r%2==0:qds.reverse();labels.reverse()
        for qd in qds:
            for label in labels:
                model,device=models[label]
                command=[str(helper),str(Path(model)/'model-00001.safetensors'),str(qd),str(r)]
                before=driver_counters();vm_before=vm_snapshot()
                child=subprocess.run(command,text=True,capture_output=True,timeout=60)
                vm_after=vm_snapshot();after=driver_counters()
                row={'round':r,'qd':qd,'label':label,'command':command,'exit':child.returncode,
                    'stdout':child.stdout,'stderr':child.stderr,'driver_before':before,'driver_after':after,
                    'vm_before':vm_before,'vm_after':vm_after}
                if child.returncode==0:
                    data=json.loads(child.stdout)
                    physical=after[device]['statistics']['Bytes (Read)']-before[device]['statistics']['Bytes (Read)']
                    ratio=physical/data['bytes']
                    row.update(metrics=data,physical_read_bytes=physical,physical_logical_ratio=ratio,
                        qualified=0.98<=ratio<=1.05 and
                        after[device]['statistics']['Errors (Read)']==before[device]['statistics']['Errors (Read)'] and
                        all(vm_before[k]==vm_after[k] for k in ('swapins','swapouts')))
                else:row['qualified']=False
                rows.append(row)
                with (dest/'points.jsonl').open('a') as log:log.write(json.dumps(row)+'\n')
                print('PHYSICAL_DISK',label,r,qd,row.get('physical_logical_ratio'),row['qualified'],flush=True)
                if child.returncode:raise SystemExit('probe command failed; inspect retained stderr')
summary={label:{str(qd):{'median_file_GB_s':statistics.median(x['metrics']['GB_per_second'] for x in rows if x['label']==label and x['qd']==qd),
                       'all_three_physical_witnesses_pass':all(x['qualified'] for x in rows if x['label']==label and x['qd']==qd)}
               for qd in [1,2,4,8,16,32]} for label in models}
(dest/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(dest/'probe.exit').write_text('0\n')
print('PHYSICAL_DISK_COMPLETE',all(x['qualified'] for x in rows),flush=True)
