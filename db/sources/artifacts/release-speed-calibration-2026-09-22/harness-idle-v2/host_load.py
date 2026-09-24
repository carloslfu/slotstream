"""Anonymous host-load snapshots; no process names or argv are retained.

Limits are prospective benchmark screening policy, not physical boundaries.
CPU percentages use one core as 100%; GPU utilization is device-wide and is
therefore only an idle gate when the model is between requests. During model
work, background CPU is monitored and aggregate GPU remains diagnostic.
"""
import math, os, plistlib, subprocess

MAX_IDLE_GPU_PERCENT=5
MAX_BACKGROUND_CPU_PERCENT=50
MAX_BACKGROUND_PROCESS_CPU_PERCENT=25

def parse_cpu(text,excluded):
    values=[]
    for line in text.splitlines():
        fields=line.split()
        if len(fields)!=2:raise ValueError('unexpected CPU snapshot row')
        pid=int(fields[0]);value=float(fields[1])
        if not math.isfinite(value) or value<0:raise ValueError('invalid CPU sample')
        if pid not in excluded:values.append(value)
    if not values:raise ValueError('empty CPU sample')
    return {'background_cpu_percent':sum(values),'largest_background_process_cpu_percent':max(values)}

def parse_gpu(data):
    devices=plistlib.loads(data)
    values=[d.get('PerformanceStatistics',{}).get('Device Utilization %') for d in devices]
    if not values or any(type(v) not in (int,float) or not math.isfinite(v) or not 0<=v<=100 for v in values):
        raise ValueError('GPU utilization unavailable or malformed')
    return max(values)

def assess(sample):
    cpu_ok=(sample['background_cpu_percent']<=MAX_BACKGROUND_CPU_PERCENT and
            sample['largest_background_process_cpu_percent']<=MAX_BACKGROUND_PROCESS_CPU_PERCENT)
    return {**sample,'background_cpu_eligible':cpu_ok,
            'idle_eligible':cpu_ok and sample['gpu_utilization_percent']<=MAX_IDLE_GPU_PERCENT}

def snapshot(model_pid=None,run=subprocess.run):
    excluded={os.getpid()}
    if model_pid is not None:excluded.add(model_pid)
    cpu=run(['ps','-A','-o','pid=,pcpu='],capture_output=True,check=True,text=True,timeout=5)
    gpu=run(['ioreg','-r','-c','IOAccelerator','-d','1','-a'],capture_output=True,check=True,timeout=5)
    return assess({**parse_cpu(cpu.stdout,excluded),'gpu_utilization_percent':parse_gpu(gpu.stdout)})
