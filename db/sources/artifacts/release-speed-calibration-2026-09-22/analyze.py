#!/usr/bin/env python3
"""Analyze immutable calibration requests without rewriting original verdicts."""
import argparse,collections,hashlib,json,math,statistics
from pathlib import Path

def signature(row,doctor):
 m=row['metrics'];return (m['effective_pool_slots'],m['effective_mtp'],m['effective_prefill_chunk'],doctor['max_context_tokens'],round(doctor['target_gb'],4))
def summarize(rows,minimum=3):
 """Capped generations remain throughput observations, but cannot certify full answers."""
 eligible=[r for r in rows if r.get('environment_eligible') and r['metrics']['stats']['decodeTokens']>=32]
 full=[r for r in eligible if r.get('complete_answer')]
 sig={tuple(r['signature']) for r in eligible}
 outputs={tuple(r['metrics']['output_ids']) for r in eligible}
 q=len(eligible)>=minimum and len(sig)==1 and len(outputs)==1
 def median(field,values=eligible):return statistics.median(r[field] for r in values) if values else None
 return {'observations':len(rows),'eligible':len(eligible),'strict_global_eligible':sum(r.get('strict_global_swap_eligible',False) for r in eligible),'complete_answers':len(full),'capped_or_short':len(rows)-len(full),'qualified_throughput':q,'qualified_full_answers':q and len(full)>=minimum,'stable_plan':len(sig)==1,'same_outputs':len(outputs)==1,'median_decode_tps':median('decode_tps'),'median_client_seconds':median('client_seconds'),'decode_tps_range':[min(r['decode_tps'] for r in eligible),max(r['decode_tps'] for r in eligible)] if eligible else None,'output_tokens':sorted({r['metrics']['stats']['decodeTokens'] for r in rows}),'finish_reasons':dict(collections.Counter(r['done_reason'] for r in rows)),'exclusions':dict(collections.Counter(reason for r in rows for reason in r.get('exclusions',[]))),'signatures':[list(x) for x in sorted(sig)]}
def analyse(root):
 p=json.loads((root/'protocol.json').read_text());groups=collections.defaultdict(list);prefill=collections.defaultdict(list);failed=[];total=0;observational=0
 policies=json.loads((root/'population-policies.json').read_text()) if (root/'population-policies.json').exists() else {}
 for f in sorted(root.glob('**/*-result.json')):
  if 'smoke' in f.parts or 'supplement' in f.name:continue
  r=json.loads(f.read_text())
  if not isinstance(r,dict) or 'metrics' not in r or 'profile' not in r:continue
  total+=1
  policy=policies.get(f.relative_to(root).parts[0],{})
  if policy.get('idle_calibration_eligible') is False:observational+=1;continue
  doctor=r.get('runtime_plan') or json.loads((f.parent.parent/'doctor.json').read_text());r['signature']=signature(r,doctor);r['path']=str(f.relative_to(root))
  if r['stage']=='measured':groups[(r['profile'],r['fixture'])].append(r)
  if r['stage'] in ['prefill_miss','repeat']:prefill[(r['profile'],r['fixture'],r['stage'])].append(r)
 for f in root.glob('**/failure.json'):failed.append({'path':str(f.relative_to(root)),**json.loads(f.read_text())})
 result={'complete_requests':total,'observational_or_pilot_requests':observational,'failed_sessions':failed,'decode':[],'profile_summaries':[],'prefill':[]}
 for (profile,rid),rows in sorted(groups.items()):
  result['decode'].append({'profile':profile,'fixture':rid,'kind':p['fixtures'][rid]['kind'],**summarize(rows)})
 for profile in sorted({x['profile'] for x in result['decode']}):
  cases=[r for r in result['decode'] if r['profile']==profile];expected=p['profiles'][profile]['decode_fixtures'];ok=len(cases)==len(expected) and all(r['qualified_full_answers'] for r in cases)
  qualified=[r for r in cases if r['qualified_throughput']]
  family=collections.defaultdict(list)
  for r in qualified:family[r['kind']].append(r['median_decode_tps'])
  family_rates={k:statistics.median(v) for k,v in family.items()}
  result['profile_summaries'].append({'profile':profile,'expected_fixtures':len(expected),'observed_fixtures':len(cases),'qualified_full_suite':ok,'qualified_throughput_fixtures':len(qualified),'median_fixture_tps':statistics.median(r['median_decode_tps'] for r in qualified) if qualified else None,'equal_kind_geometric_tps':math.exp(statistics.mean(math.log(v) for v in family_rates.values())) if family_rates else None,'kind_median_tps':family_rates})
 for (profile,rid,stage),rows in sorted(prefill.items()):
  elig=[r for r in rows if r.get('environment_eligible') and (stage!='prefill_miss' or r['metrics']['stats']['reusedPrefixTokens']==0)]
  sig={tuple(r['signature']) for r in elig};out={tuple(r['metrics']['output_ids']) for r in elig}
  result['prefill'].append({'profile':profile,'fixture':rid,'stage':stage,'observations':len(rows),'eligible':len(elig),'strict_global_eligible':sum(r.get('strict_global_swap_eligible',False) for r in elig),'qualified':len(elig)>=3 and len(sig)==1 and len(out)==1,'median_prefill_seconds':statistics.median(r['metrics']['stats']['prefillSeconds'] for r in elig) if elig else None,'median_client_seconds':statistics.median(r['client_seconds'] for r in elig) if elig else None,'reused_tokens':sorted({r['metrics']['stats']['reusedPrefixTokens'] for r in elig}),'signatures':[list(s) for s in sig],'read_groups':[r['metrics']['stats']['prefillPasses'] for r in elig],'exclusions':dict(collections.Counter(x for r in rows for x in r.get('exclusions',[])))})
 return result
if __name__=='__main__':
 parser=argparse.ArgumentParser();parser.add_argument('root',type=Path);args=parser.parse_args();r=analyse(args.root)
 (args.root/'analysis.json').write_text(json.dumps(r,indent=2)+'\n')
 print(json.dumps({'complete_requests':r['complete_requests'],'failed_sessions':r['failed_sessions'],'profile_summaries':r['profile_summaries'],'prefill_cells':len(r['prefill'])},indent=2))
