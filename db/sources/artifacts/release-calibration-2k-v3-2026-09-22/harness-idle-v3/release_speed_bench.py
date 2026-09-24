#!/usr/bin/env python3
"""Prospectively frozen installed-release calibration. No model/kernel mutations.
Normal cache planning and planner-selected compute passes; explicit engine-profile
measurements are separate from actual adaptive defaults and from app UI latency.
"""
import argparse,contextlib,datetime,fcntl,hashlib,http.client,json,math,os,signal,socket,statistics,subprocess,sys,threading,time
from pathlib import Path
import serve_bench as s
import host_load
from prefill_bench import vm_snapshot,model_identity,validate_metrics,digest

def save(path,value):
    path=Path(path); path.parent.mkdir(parents=True,exist_ok=True)
    temp=path.with_suffix(path.suffix+'.tmp');temp.write_text(json.dumps(value,indent=2)+'\n');temp.replace(path)
def emit(value): print(json.dumps(value),flush=True)
def probe(path,pid=None):
    return {**json.loads(subprocess.check_output([str(path)]+([str(pid)] if pid else []),text=True,timeout=5)), 'host_load':host_load.snapshot(pid)}
def environment_reasons(before,after,own_before,own_after,samples):
    reasons=[]
    if not host_load.assess_window([x.get('host_load',{}) for x in [own_before,*samples,own_after]])['eligible']:reasons.append('sustained background CPU load or unavailable sample')
    if after['swapouts']!=before['swapouts']:reasons.append('host swap-out activity')
    valid_pages=type(own_before.get('pageins')) is int and type(own_after.get('pageins')) is int
    delta=own_after['pageins']-own_before['pageins'] if valid_pages else -1
    if not valid_pages or not 0<=delta<=4096:reasons.append('process page-ins unavailable or above4096pages')
    if any(x.get('thermalState')!='nominal' or x.get('lowPowerModeEnabled') is not False for x in [own_before,own_after,*samples]):reasons.append('non-nominal thermal or power state')
    return reasons

def settle(probe_path,seconds,need_gb,timeout=900,lock_required=True,model_pid=None):
    start=time.monotonic();stable=None;observations=[];previous=None;last=start-30
    while True:
        now=time.monotonic();state=probe(probe_path,model_pid);vm=vm_snapshot();jobs=s.competing_jobs()
        lockfree=True
        if lock_required:
            with open(f'/tmp/slotstream-model-{os.getuid()}.lock','a') as f:
                try:fcntl.flock(f,fcntl.LOCK_EX|fcntl.LOCK_NB)
                except BlockingIOError:lockfree=False
        ready=state.get('thermalState')=='nominal' and state.get('lowPowerModeEnabled') is False and not jobs and lockfree and vm['reclaimable_bytes']>=need_gb*1e9
        if previous is not None and vm['swapouts']!=previous:ready=False
        previous=vm['swapouts']
        if ready:
            if stable is None:stable=now
        else:stable=None
        observations.append({'elapsed':now-start,'state':state,'reclaimable_gb':vm['reclaimable_bytes']/1e9,'swapouts':vm['swapouts'],'known_jobs':jobs,'model_lock_free':lockfree})
        window=[x['state']['host_load'] for x in observations if x['elapsed']>=now-start-seconds]
        load_screen=host_load.assess_window(window,idle=True)
        if stable is not None and now-stable>=seconds and load_screen['eligible']:return observations
        if now-start>=timeout:
            error=TimeoutError('readiness timeout; no model launched' if lock_required else 'between-request idle readiness timeout')
            error.observations=observations
            raise error
        if now-last>=30:
            emit({'phase':'readiness','wait_s':round(now-start),'stable_s':round(now-stable) if stable else 0,'need_gb':need_gb,'free_gb':round(vm['reclaimable_bytes']/1e9,1),'state':state,'load_screen':load_screen});last=now
        time.sleep(2)

def exchange(port,body,endpoint,timeout,capture_path):
    c=http.client.HTTPConnection('127.0.0.1',port,timeout=timeout);wire=bytearray();frames=[];first=None;visible=None;thinking=None
    capture=Path(capture_path).open("wb")
    start=time.monotonic()
    try:
        c.request('POST',endpoint,json.dumps(body).encode(),{'Content-Type':'application/json'});response=c.getresponse()
        if response.status!=200:raise RuntimeError(f'HTTP{response.status}: {response.read(4096)!r}')
        while True:
            line=response.readline(1<<20)
            if not line:break
            wire+=line;capture.write(line);capture.flush()
            if len(wire)>16<<20:raise RuntimeError('response capture limit')
            if not line.strip():continue
            f=json.loads(line);frames.append(f);t=time.monotonic()-start
            content=f.get('response','') if endpoint=='/api/generate' else f.get('message',{}).get('content','')
            thought=f.get('thinking','') if endpoint=='/api/generate' else f.get('message',{}).get('thinking','')
            if first is None and (content or thought):first=t
            if visible is None and content.strip():visible=t
            if thinking is None and thought:thinking=t
        elapsed=time.monotonic()-start
    finally:c.close();capture.close()
    finals=[f for f in frames if f.get('done')]
    if len(finals)!=1 or frames[-1] is not finals[0]:raise RuntimeError('missing final frame')
    metrics={'schema_version':1,**finals[0]['slotstream_benchmark']};validate_metrics(metrics,allow_complete_prompt=True)
    text=''.join(f.get('response','') if endpoint=='/api/generate' else f.get('message',{}).get('content','') for f in frames)
    return {'client_seconds':elapsed,'first_delta_seconds':first,'first_visible_seconds':visible,'first_thinking_seconds':thinking,'text':text,'metrics':metrics,'done_reason':finals[0].get('done_reason')},bytes(wire)

def runtime_plan(port):
    connection=http.client.HTTPConnection('127.0.0.1',port,timeout=10)
    try:
        connection.request('POST','/api/show',b'{}',{'Content-Type':'application/json'});response=connection.getresponse()
        if response.status!=200:raise RuntimeError('cannot read live runtime plan')
        return json.loads(response.read())['details']['memory_plan']
    finally:connection.close()

class Monitor:
    def __init__(self,child,probe_path,limit):self.child=child;self.path=probe_path;self.limit=limit;self.samples=[];self.stop=threading.Event();self.abort=None
    def run(self):
        while not self.stop.is_set() and self.child.poll() is None:
            try:
                state=probe(self.path,self.child.pid);state['at']=time.monotonic();state['known_jobs']=s.competing_jobs();self.samples.append(state)
                if state.get('physicalFootprintBytes',0)>self.limit or state.get('thermalState')=='critical':
                    self.abort='physical target exceeded or critical thermal state';self.child.terminate();break
            except Exception as e:self.samples.append({'probe_error':str(e)})
            self.stop.wait(2)
    def __enter__(self):self.thread=threading.Thread(target=self.run,daemon=True);self.thread.start();return self
    def __exit__(self,*args):self.stop.set();self.thread.join(timeout=10)

def request(child,port,entry,cap,profile,p,cell,stage,round_number):
    messages=entry.get('messages')
    runtime_before=runtime_plan(port)
    save(cell/(stage+'-runtime-before.json'),runtime_before)
    body={'stream':True,'think':False,'options':{'temperature':0,'seed':42,'num_predict':cap}}
    if messages is not None:body['messages']=messages;endpoint='/api/chat'
    else:body.update(prompt=Path(entry['path']).read_text(),raw=False);endpoint='/api/generate'
    save(cell/(stage+'-request.json'),body)
    before=vm_snapshot();own_before=probe(p['probe'],child.pid);jobs_before=s.competing_jobs()
    with Monitor(child,p['probe'],round(profile['ceiling_gb']*1e9)) as monitor:
        result,wire=exchange(port,body,endpoint,p['request_timeout_seconds'],cell/(stage+'-response.ndjson'))
    runtime_after=runtime_plan(port)
    save(cell/(stage+'-runtime-after.json'),runtime_after)
    own_after=probe(p['probe'],child.pid);after=vm_snapshot();jobs_after=s.competing_jobs()
    stats=result['metrics']['stats'];reasons=environment_reasons(before,after,own_before,own_after,monitor.samples)
    if jobs_before or jobs_after or any(x.get('known_jobs') for x in monitor.samples):reasons.append('known workspace contention')
    if monitor.abort:reasons.append(monitor.abort)
    runtime_keys=['pool_slots','prefill_chunk','max_context_tokens','target_gb','mtp','decode_lookahead']
    if any(runtime_before[k]!=runtime_after[k] for k in runtime_keys):reasons.append('runtime plan changed during request')
    if result['metrics']['effective_pool_slots']!=runtime_after['pool_slots']:reasons.append('effective pool differs from live plan')
    if any('probe_error' in x for x in monitor.samples):reasons.append('resource sampling unavailable')
    if stats.get('runtimeError'):reasons.append('runtime error')
    if stats['peakMemoryGB']>profile['ceiling_gb']:reasons.append('complete lifetime footprint exceeds ceiling')
    if stats.get('memoryPressureCancelled'):reasons.append('memory pressure cancellation')
    if stats.get('prefixCheckpointErrors',0):reasons.append('checkpoint error')
    nominal={'require_nominal_power_state':True,'maximum_sampled_footprint_bytes':round(profile['ceiling_gb']*1e9)}
    reasons+=s.resource_exclusions(stats,nominal)
    result.update(host_load_window=host_load.assess_window([x.get('host_load',{}) for x in [own_before,*monitor.samples,own_after]]),runtime_plan=runtime_after,profile=profile['id'],fixture=entry['id'],kind=entry['kind'],stage=stage,round=round_number,before=before,after=after,own_before=own_before,own_after=own_after,samples=monitor.samples,exclusions=sorted(set(reasons)),environment_eligible=not reasons)
    result['strict_global_swap_eligible']=not reasons and before['swapins']==after['swapins'] and stats['generatorVMBefore']['swapins']==stats['generatorVMAfter']['swapins'] and stats['generatorVMBefore']['swapouts']==stats['generatorVMAfter']['swapouts']
    result['decode_tps']=stats['decodeTokens']/stats['decodeSeconds'] if stats['decodeSeconds']>0 else None
    result['complete_answer']=result['done_reason']=='stop' and stats['decodeTokens']>=p['minimum_decode_tokens']
    (cell/(stage+'-response.ndjson')).write_bytes(wire);save(cell/(stage+'-result.json'),result)
    emit({'profile':profile['id'],'fixture':entry['id'],'round':round_number,'stage':stage,'seconds':round(result['client_seconds'],2),'decode_tps':round(result['decode_tps'],2) if result['decode_tps'] else None,'outputs':stats['decodeTokens'],'stop':result['done_reason'],'reuse':stats['reusedPrefixTokens'],'eligible':not reasons,'strict':result['strict_global_swap_eligible'],'excluded':result['exclusions']})
    return result

def run_session(p,profile,round_number,out,phase):
    session=out/f'{phase}-{profile["id"]}-r{round_number}';session.mkdir(exist_ok=False);child=None
    save(session/'profile.json',profile)
    rows=[]
    try:
        ready=settle(p['probe'],p['settle_seconds'],profile['required_headroom_gb'],p['readiness_timeout_seconds']);save(session/'readiness.json',ready)
        doctor=[p['binary'],'doctor','--model',p['model'],*profile['plan_args'],'--json']
        plan=json.loads(subprocess.check_output(doctor,text=True,timeout=30));save(session/'doctor.json',plan)
        if plan['target_gb']>profile['ceiling_gb']+0.0001:raise RuntimeError('actual plan exceeds declared measurement ceiling')
        real_available=min(plan['device_available_gb'],vm_snapshot()['reclaimable_bytes']/1e9)
        physical_need=(plan['expected_peak_gb'] if profile.get('adaptive') else plan['target_gb'])+p['minimum_spare_gb']
        save(session/'physical-preflight.json',{'real_available_gb':real_available,'required_gb':physical_need,'pass':real_available>=physical_need})
        if real_available<physical_need:raise RuntimeError('actual plan leaves insufficient measured physical headroom')
        with socket.socket() as sock:sock.bind(('127.0.0.1',0));port=sock.getsockname()[1]
        command=[p['binary'],'serve','--model',p['model'],'--port',str(port),*profile['plan_args']]
        if profile.get('persistent'):command+=['--prefix-cache-dir',str(session/'prefix-cache'),'--prefix-cache-disk-gb','1']
        env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))};env['SLOTSTREAM_BENCH_DETAILS']='1'
        save(session/'launch.json',{'command':command,'environment':{'SLOTSTREAM_BENCH_DETAILS':'1'}})
        with (session/'server.stdout').open('wb') as stdout,(session/'server.stderr').open('wb') as stderr:
            start=time.monotonic();child=subprocess.Popen(command,cwd=p['repository'],env=env,stdout=stdout,stderr=stderr,start_new_session=True);s.wait_ready(child,port)
            save(session/'startup.json',{'seconds':time.monotonic()-start,'pid':child.pid})
            actual=runtime_plan(port);save(session/'runtime-startup.json',actual)
            if actual['target_gb']>profile['ceiling_gb']+0.0001:raise RuntimeError('startup plan exceeds measurement ceiling')
            ids=profile['decode_fixtures'] if phase=='decode' else profile['prefill_fixtures']
            ids=ids[(round_number-1)%len(ids):]+ids[:(round_number-1)%len(ids)]
            for index,rid in enumerate(ids):
                entry=p['fixtures'][rid];cell=session/rid;cell.mkdir()
                save(cell/'readiness-before.json',settle(p['probe'],p['between_requests_nominal_seconds'],0,p['readiness_timeout_seconds'],lock_required=False,model_pid=child.pid))
                if phase=='decode':
                    warm=request(child,port,entry,p['warmup_tokens'],profile,p,cell,'warmup',round_number);rows.append(warm)
                    save(cell/'readiness-measured.json',settle(p['probe'],p['between_requests_nominal_seconds'],0,p['readiness_timeout_seconds'],lock_required=False,model_pid=child.pid))
                    measured=request(child,port,entry,p['decode_max_tokens'],profile,p,cell,'measured',round_number);rows.append(measured)
                else:
                    measured=request(child,port,entry,p['prefill_output_tokens'],profile,p,cell,'prefill_miss',round_number);rows.append(measured)
                    save(cell/'readiness-repeat.json',settle(p['probe'],p['between_requests_nominal_seconds'],0,p['readiness_timeout_seconds'],lock_required=False,model_pid=child.pid))
                    hit=request(child,port,entry,p['prefill_output_tokens'],profile,p,cell,'repeat',round_number);rows.append(hit)
                save(session/'progress.json',{'complete_requests':len(rows),'current_fixture':rid})
        save(session/'completion.json',{'requests':len(rows),'finished':True})
    except Exception as e:
        if hasattr(e,'observations'):save(session/'readiness-timeout.json',e.observations)
        save(session/'failure.json',{'error':str(e),'type':type(e).__name__,'completed_requests':len(rows)});raise
    finally:
        if child is not None:s.stop_server(child)
        save(session/'cleanup.json',{'owned_pid':child.pid if child else None,'exit_code':child.poll() if child else None,'reaped':child is None or child.poll() is not None})

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--protocol',type=Path,required=True);parser.add_argument('--out',type=Path,required=True);parser.add_argument('--phase',choices=['decode','prefill'],required=True);parser.add_argument('--profiles',required=True);a=parser.parse_args()
    p=json.loads(a.protocol.read_text());out=a.out;out.mkdir(parents=True,exist_ok=True)
    assert digest(p['binary'])==p['binary_sha256'];assert digest(p['probe'])==p['probe_sha256']
    for path,sha in p['harness_hashes'].items():assert digest(path)==sha,path
    for f in p['fixtures'].values():assert digest(f['path'])==f['sha256']
    save(out/'manifest.json',{'protocol':p,'protocol_sha256':digest(a.protocol),'build':s.verified_build(p['binary']),'model':model_identity(Path(p['model'])),'selected_profiles':a.profiles,'phase':a.phase})
    profiles=[p['profiles'][name] for name in a.profiles.split(',')]
    for r in range(1,p['primary_rounds']+1):
        order=profiles if r%2 else profiles[::-1]
        for profile in order:
            emit({'phase':a.phase,'profile':profile['id'],'round':r,'event':'session_start'})
            run_session(p,profile,r,out,a.phase)
    save(out/'completion.json',{'primary_rounds_complete':True})
if __name__=='__main__':
    def interrupt(*_):raise KeyboardInterrupt('benchmark interrupted')
    signal.signal(signal.SIGTERM,interrupt)
    main()
