---
type: run
id: 01m1qarx03b5zfrraag2ns75r1
created: 2026-09-04T23:06:30.787970+00:00
updated: 2026-09-04T23:07:21.469889+00:00
summary: 'First-principles audit: MLX allocation and numerical diagnostics, timings discarded'
binary: .venv31/bin/python, mlx 0.31.1
captured_at: 2026-09-04
command: ' .venv31/bin/python /tmp/slotstream-audit-20260904/primitive_probes.py'
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'First-principles audit: MLX allocation and numerical diagnostics, timings discarded'
tool: MLX Python
---
# MLX primitive diagnostics

**Discarded as timing evidence.** Another Slotstream model process was present during the attention/router probes. These elapsed times must not be cited as controlled speedups. Allocation behavior and numerical comparisons remain diagnostic observations; their limited use is explicit in the linked audit. Python MLX is 0.31.1; the production Swift checkout is separately identified in the static evidence.

Command: `.venv31/bin/python /tmp/slotstream-audit-20260904/primitive_probes.py > /tmp/slotstream-audit-20260904/primitives.json`. No checkpoint tensors were loaded by this script. The earlier retained-view allocation result is also preserved; the real production-model follow-up has its own source.

## primitive_probes.py

SHA-256: `0679b25e94aee06b05311b85ecb23c5bbda7734c9b16be3bc91db8e93d01f144`

```python
"""Small MLX 0.31.1 probes, without loading model weights.

Timings are diagnostics, not end-to-end claims. Preserve process and VM state
alongside results and discard timing comparisons under competing model work.
"""
import gc, importlib.metadata, json, math, statistics, subprocess, time
import mlx.core as mx

mx.set_cache_limit(128 << 20)
mx.random.seed(80421)

def bench(fn, rounds=7):
    y=fn();mx.eval(y);del y
    times=[];peaks=[]
    for _ in range(rounds):
        mx.synchronize();mx.reset_peak_memory();base=mx.get_active_memory()
        start=time.perf_counter();y=fn();mx.eval(y)
        times.append(time.perf_counter()-start)
        peaks.append(mx.get_peak_memory()-base)
        del y
    return {'seconds':times,'median_seconds':statistics.median(times),
            'peak_extra_bytes':max(peaks)}

def arr(shape):
    a=mx.random.normal(shape).astype(mx.bfloat16);mx.eval(a);return a

def compare(a,b):
    a=a.astype(mx.float32);b=b.astype(mx.float32)
    err=mx.max(mx.abs(a-b)).item();scale=mx.max(mx.abs(a)).item()
    return {'max_abs_error':err,'relative_to_max':err/max(scale,1e-30),
            'exact_equal':mx.array_equal(a,b).item()}

def vision():
    rows=[]
    for n in [256,1024,2048]:
        q,k,v=[arr((1,16,n,72)) for _ in range(3)]
        def baseline():return mx.fast.scaled_dot_product_attention(q,k,v,scale=1/math.sqrt(72))
        def padded():
            qp,kp,vp=[mx.pad(x,[(0,0),(0,0),(0,0),(0,8)]) for x in (q,k,v)]
            return mx.fast.scaled_dot_product_attention(qp,kp,vp,scale=1/math.sqrt(72))[...,:72]
        a,b=baseline(),padded();mx.eval(a,b)
        row={'patches':n,'comparison':compare(a,b)};del a,b
        # Alternate arm order between shapes; each arm synchronizes explicitly.
        for name,fn in ([('baseline',baseline),('pad80',padded)] if n!=1024 else [('pad80',padded),('baseline',baseline)]):row[name]=bench(fn)
        rows.append(row)
    return rows

def verify_attention():
    rows=[]
    for context in [2048,8192]:
        for n in [1,2,3,5]:
            q=arr((1,24,n,256));k,v=[arr((1,2,context,256)) for _ in range(2)]
            # Same per-query sparse mask; chunks use the exact original rows.
            keep=(mx.arange(context)%4==0)[None,None,None,:]
            keep=mx.broadcast_to(keep,(1,1,n,context));mx.eval(keep)
            def baseline():return mx.fast.scaled_dot_product_attention(q,k,v,scale=1/16,mask=keep)
            def split():
                return mx.concatenate([mx.fast.scaled_dot_product_attention(q[:,:,i:i+2,:],k,v,scale=1/16,mask=keep[:,:,i:i+2,:]) for i in range(0,n,2)],axis=2)
            a,b=baseline(),split();mx.eval(a,b)
            row={'context':context,'queries':n,'comparison':compare(a,b)};del a,b
            row['baseline']=bench(baseline);row['split2']=bench(split)
            rows.append(row)
    return rows

def sparse_decode():
    rows=[]
    for context in [4096,16384,32768]:
        q=arr((1,24,1,256));k,v=[arr((1,2,context,256)) for _ in range(2)]
        # Exactly 512 complete blocks, deterministic ascending order.
        blocks=(mx.arange(512)*(context//4//512)).astype(mx.int32)
        idx=(blocks[:,None]*4+mx.arange(4)).reshape(-1)
        mask=mx.zeros((context,),dtype=mx.bool_);mask[idx]=True;mask=mask[None,None,None,:];mx.eval(idx,mask)
        def baseline():return mx.fast.scaled_dot_product_attention(q,k,v,scale=1/16,mask=mask)
        def gathered():return mx.fast.scaled_dot_product_attention(q,mx.take(k,idx,axis=2),mx.take(v,idx,axis=2),scale=1/16)
        a,b=baseline(),gathered();mx.eval(a,b)
        row={'context':context,'kept_keys':2048,'comparison':compare(a,b)};del a,b
        row['masked_full']=bench(baseline);row['gathered']=bench(gathered);rows.append(row)
    return rows

def router():
    x=arr((1,2560)).astype(mx.float32);w=arr((512,2560));wf=w.astype(mx.float32);mx.eval(x,w,wf)
    def baseline():return x@w.T
    def cached():return x@wf.T
    a,b=baseline(),cached();mx.eval(a,b)
    delta=compare(a,b);del a,b
    return {'comparison':delta,'cast_each_step':bench(baseline,30),'cached_f32':bench(cached,30)}

def main():
    out={'mlx':importlib.metadata.version('mlx'),'device':mx.device_info(),
         'competing_model_processes':subprocess.run(['pgrep','-fl','slotstream serve'],capture_output=True,text=True).stdout,
         'vm_before':subprocess.check_output(['vm_stat'],text=True),
         'timing_status':'diagnostic only; competing model process present means discard timings'}
    for name,fn in [('vision',vision),('verify_attention',verify_attention),('sparse_decode',sparse_decode),('router',router)]:
        out[name]=fn();gc.collect();mx.synchronize();mx.clear_cache()
    out['vm_after']=subprocess.check_output(['vm_stat'],text=True)
    print(json.dumps(out,indent=2))

if __name__=='__main__':main()
```

## primitives.json

SHA-256: `5a8131e94bf4e46446c687a935171d83f58134614137d35d63dd92dd49d6e4cf`

```json
{
  "mlx": "0.31.1",
  "device": {
    "resource_limit": 499000,
    "max_buffer_length": 30150672384,
    "architecture": "applegpu_g17s",
    "memory_size": 51539607552,
    "max_recommended_working_set_size": 40200896512,
    "device_name": "Apple M5 Pro"
  },
  "competing_model_processes": "93497 /Users/carlos/.slotstream/bin/slotstream serve --port 11530 --memory-gb 10\n",
  "vm_before": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4220.\nPages active:                                1035543.\nPages inactive:                               931760.\nPages speculative:                            102605.\nPages throttled:                                   0.\nPages wired down:                             495824.\nPages purgeable:                                 159.\n\"Translation faults\":                    13443245655.\nPages copy-on-write:                       611746963.\nPages zero filled:                       12954869673.\nPages reactivated:                        1905167997.\nPages purged:                               58748677.\nFile-backed pages:                           1363590.\nAnonymous pages:                              706318.\nPages stored in compressor:                  1671050.\nPages occupied by compressor:                 515434.\nDecompressions:                            918838211.\nCompressions:                             1208213375.\nPageins:                                  5409282406.\nPageouts:                                   10582812.\nSwapins:                                    41639991.\nSwapouts:                                   69884787.\nPages tagged:                                 162257.\nPages tagged resident:                        114661.\nPages tagged compressed:                       47596.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7063.\nPages tag-storage free:                          244.\nPages tag-storage non-tag pageable:            90596.\nPages tag-storage non-tag wired:                 401.\nBytes of compressed tags:                    7978304.\nTagged compressions:                         8823964.\nTagged decompressions:                       8092120.\n",
  "timing_status": "diagnostic only; competing model process present means discard timings",
  "vision": [
    {
      "patches": 256,
      "comparison": {
        "max_abs_error": 0.015625,
        "relative_to_max": 0.013605442176870748,
        "exact_equal": false
      },
      "baseline": {
        "seconds": [
          0.00031804083846509457,
          0.0003489588852971792,
          0.00029962509870529175,
          0.0002792910672724247,
          0.0002602911554276943,
          0.0002416670322418213,
          0.00021358300000429153
        ],
        "median_seconds": 0.0002792910672724247,
        "peak_extra_bytes": 3276802
      },
      "pad80": {
        "seconds": [
          0.00027983379550278187,
          0.0003061669413000345,
          0.0003258748911321163,
          0.0002851251047104597,
          0.0002493751235306263,
          0.00024249986745417118,
          0.0006432081572711468
        ],
        "median_seconds": 0.0002851251047104597,
        "peak_extra_bytes": 2621458
      }
    },
    {
      "patches": 1024,
      "comparison": {
        "max_abs_error": 0.005859375,
        "relative_to_max": 0.016304347826086956,
        "exact_equal": false
      },
      "pad80": {
        "seconds": [
          0.0021389999892562628,
          0.002024458022788167,
          0.0015413330402225256,
          0.0014366249088197947,
          0.0013847921509295702,
          0.001642125193029642,
          0.0013206249568611383
        ],
        "median_seconds": 0.0015413330402225256,
        "peak_extra_bytes": 10485778
      },
      "baseline": {
        "seconds": [
          0.0012336669024080038,
          0.0013412500265985727,
          0.0013441659975796938,
          0.0016334590036422014,
          0.0011928330641239882,
          0.0014102081768214703,
          0.0012092089746147394
        ],
        "median_seconds": 0.0013412500265985727,
        "peak_extra_bytes": 38273026
      }
    },
    {
      "patches": 2048,
      "comparison": {
        "max_abs_error": 0.0068359375,
        "relative_to_max": 0.022435897435897436,
        "exact_equal": false
      },
      "baseline": {
        "seconds": [
          0.0043334998190402985,
          0.003836125135421753,
          0.00474150013178587,
          0.0038597919046878815,
          0.004016791004687548,
          0.0035269998479634523,
          0.004115666029974818
        ],
        "median_seconds": 0.004016791004687548,
        "peak_extra_bytes": 143654914
      },
      "pad80": {
        "seconds": [
          0.005112458951771259,
          0.0045890831388533115,
          0.005778082879260182,
          0.005237500183284283,
          0.004557209089398384,
          0.005011874949559569,
          0.0053002918139100075
        ],
        "median_seconds": 0.005112458951771259,
        "peak_extra_bytes": 20971538
      }
    }
  ],
  "verify_attention": [
    {
      "context": 2048,
      "queries": 1,
      "comparison": {
        "max_abs_error": 0.0,
        "relative_to_max": 0.0,
        "exact_equal": true
      },
      "baseline": {
        "seconds": [
          0.00015770806930959225,
          0.00014454196207225323,
          0.0001599588431417942,
          0.00017174985259771347,
          0.00020804209634661674,
          0.00023666699416935444,
          0.0001771249808371067
        ],
        "median_seconds": 0.00017174985259771347,
        "peak_extra_bytes": 1609728
      },
      "split2": {
        "seconds": [
          0.0002883749548345804,
          0.00023291702382266521,
          0.0001810421235859394,
          0.00022950000129640102,
          0.00020395778119564056,
          0.00023329094983637333,
          0.000201541930437088
        ],
        "median_seconds": 0.00022950000129640102,
        "peak_extra_bytes": 1609728
      }
    },
    {
      "context": 2048,
      "queries": 2,
      "comparison": {
        "max_abs_error": 0.0,
        "relative_to_max": 0.0,
        "exact_equal": true
      },
      "baseline": {
        "seconds": [
          0.0002469161991029978,
          0.0002443329431116581,
          0.0001966250129044056,
          0.00016558286733925343,
          0.0002497918903827667,
          0.00019991607405245304,
          0.00019083311781287193
        ],
        "median_seconds": 0.00019991607405245304,
        "peak_extra_bytes": 3244032
      },
      "split2": {
        "seconds": [
          0.0002007500734180212,
          0.00019916705787181854,
          0.00019466690719127655,
          0.00020708399824798107,
          0.00020295800641179085,
          0.00019987509585916996,
          0.00023650005459785461
        ],
        "median_seconds": 0.0002007500734180212,
        "peak_extra_bytes": 3244032
      }
    },
    {
      "context": 2048,
      "queries": 3,
      "comparison": {
        "max_abs_error": 0.0029296875,
        "relative_to_max": 0.00847457627118644,
        "exact_equal": false
      },
      "baseline": {
        "seconds": [
          0.0005626250058412552,
          0.0006458749994635582,
          0.00043358304537832737,
          0.0005577080883085728,
          0.0005492500495165586,
          0.0005103328730911016,
          0.0004976249765604734
        ],
        "median_seconds": 0.0005492500495165586,
        "peak_extra_bytes": 393220
      },
      "split2": {
        "seconds": [
          0.00030966708436608315,
          0.0005282917991280556,
          0.0002917919773608446,
          0.0004986252170056105,
          0.0004322079475969076,
          0.0004543750546872616,
          0.0002744158264249563
        ],
        "median_seconds": 0.0004322079475969076,
        "peak_extra_bytes": 4902912
      }
    },
    {
      "context": 2048,
      "queries": 5,
      "comparison": {
        "max_abs_error": 0.00390625,
        "relative_to_max": 0.010362694300518135,
        "exact_equal": false
      },
      "baseline": {
        "seconds": [
          0.00045537506230175495,
          0.00044520897790789604,
          0.0006224578246474266,
          0.0005396250635385513,
          0.0009048751089721918,
          0.0007555000483989716,
          0.0007552921306341887
        ],
        "median_seconds": 0.0006224578246474266,
        "peak_extra_bytes": 638980
      },
      "split2": {
        "seconds": [
          0.0003501658793538809,
          0.00034516677260398865,
          0.0003690419252961874,
          0.00037875003181397915,
          0.0003567079547792673,
          0.0003616670146584511,
          0.0003518329467624426
        ],
        "median_seconds": 0.0003567079547792673,
        "peak_extra_bytes": 8163328
      }
    },
    {
      "context": 8192,
      "queries": 1,
      "comparison": {
        "max_abs_error": 0.0,
        "relative_to_max": 0.0,
        "exact_equal": true
      },
      "baseline": {
        "seconds": [
          0.00024824985302984715,
          0.0002519581466913223,
          0.0002690830733627081,
          0.0002360418438911438,
          0.00025329203344881535,
          0.0002257919404655695,
          0.0003487910144031048
        ],
        "median_seconds": 0.0002519581466913223,
        "peak_extra_bytes": 1609728
      },
      "split2": {
        "seconds": [
          0.0002781250514090061,
          0.0006169998086988926,
          0.00025066686794161797,
          0.00048462487757205963,
          0.0009510840754956007,
          0.00024937489069998264,
          0.00034795887768268585
        ],
        "median_seconds": 0.00034795887768268585,
        "peak_extra_bytes": 1609728
      }
    },
    {
      "context": 8192,
      "queries": 2,
      "comparison": {
        "max_abs_error": 0.0,
        "relative_to_max": 0.0,
        "exact_equal": true
      },
      "baseline": {
        "seconds": [
          0.00043591600842773914,
          0.0003957499284297228,
          0.0003260420635342598,
          0.0003257088828831911,
          0.00030587497167289257,
          0.00030387495644390583,
          0.0002797078341245651
        ],
        "median_seconds": 0.0003257088828831911,
        "peak_extra_bytes": 3244032
      },
      "split2": {
        "seconds": [
          0.00029699993319809437,
          0.0003074998967349529,
          0.00028074998408555984,
          0.0002842079848051071,
          0.0002864999696612358,
          0.0002901668194681406,
          0.000323625048622489
        ],
        "median_seconds": 0.0002901668194681406,
        "peak_extra_bytes": 3244032
      }
    },
    {
      "context": 8192,
      "queries": 3,
      "comparison": {
        "max_abs_error": 0.001220703125,
        "relative_to_max": 0.008620689655172414,
        "exact_equal": false
      },
      "baseline": {
        "seconds": [
          0.0013979161158204079,
          0.002241083886474371,
          0.0014132920186966658,
          0.0013846249785274267,
          0.0015241671353578568,
          0.0014267920050770044,
          0.0015346670988947153
        ],
        "median_seconds": 0.0014267920050770044,
        "peak_extra_bytes": 1277956
      },
      "split2": {
        "seconds": [
          0.0006151250563561916,
          0.0005762078799307346,
          0.00043000001460313797,
          0.0005096672102808952,
          0.0004418750759214163,
          0.0005708339158445597,
          0.0005422080866992474
        ],
        "median_seconds": 0.0005422080866992474,
        "peak_extra_bytes": 4902912
      }
    },
    {
      "context": 8192,
      "queries": 5,
      "comparison": {
        "max_abs_error": 0.0015869140625,
        "relative_to_max": 0.00939306358381503,
        "exact_equal": false
      },
      "baseline": {
        "seconds": [
          0.0013748749624937773,
          0.0015235000755637884,
          0.0015334170311689377,
          0.0014296669978648424,
          0.0013033340219408274,
          0.0013599998783320189,
          0.0019631250761449337
        ],
        "median_seconds": 0.0014296669978648424,
        "peak_extra_bytes": 2129924
      },
      "split2": {
        "seconds": [
          0.0007729169446974993,
          0.000637332908809185,
          0.0006150831468403339,
          0.0007402501069009304,
          0.0007162918336689472,
          0.0006607091054320335,
          0.0008026659488677979
        ],
        "median_seconds": 0.0007162918336689472,
        "peak_extra_bytes": 8179712
      }
    }
  ],
  "sparse_decode": [
    {
      "context": 4096,
      "kept_keys": 2048,
      "comparison": {
        "max_abs_error": 0.0006103515625,
        "relative_to_max": 0.0038109756097560975,
        "exact_equal": false
      },
      "masked_full": {
        "seconds": [
          0.0002707091625779867,
          0.0005659169983118773,
          0.00027262489311397076,
          0.0003966251388192177,
          0.00029512494802474976,
          0.0005311670247465372,
          0.0003255419433116913
        ],
        "median_seconds": 0.0003255419433116913,
        "peak_extra_bytes": 1609728
      },
      "gathered": {
        "seconds": [
          0.00030399998649954796,
          0.00039820908568799496,
          0.0003902080934494734,
          0.00039895903319120407,
          0.0003876248374581337,
          0.0005440828390419483,
          0.00036270800046622753
        ],
        "median_seconds": 0.0003902080934494734,
        "peak_extra_bytes": 5804032
      }
    },
    {
      "context": 16384,
      "kept_keys": 2048,
      "comparison": {
        "max_abs_error": 0.0009765625,
        "relative_to_max": 0.0070921985815602835,
        "exact_equal": false
      },
      "masked_full": {
        "seconds": [
          0.0002988330088555813,
          0.0002581248991191387,
          0.00026562483981251717,
          0.00026429188437759876,
          0.0002804999239742756,
          0.0002561660949140787,
          0.00023979204706847668
        ],
        "median_seconds": 0.00026429188437759876,
        "peak_extra_bytes": 3223552
      },
      "gathered": {
        "seconds": [
          0.0003541249316185713,
          0.00033033289946615696,
          0.00031266710720956326,
          0.00030762492679059505,
          0.0002661249600350857,
          0.00029929098673164845,
          0.00029666698537766933
        ],
        "median_seconds": 0.00030762492679059505,
        "peak_extra_bytes": 5804032
      }
    },
    {
      "context": 32768,
      "kept_keys": 2048,
      "comparison": {
        "max_abs_error": 0.00048828125,
        "relative_to_max": 0.0036231884057971015,
        "exact_equal": false
      },
      "masked_full": {
        "seconds": [
          0.00042154197581112385,
          0.00041699991561472416,
          0.00041404087096452713,
          0.00041091698221862316,
          0.00044179195538163185,
          0.00044745905324816704,
          0.0004664999432861805
        ],
        "median_seconds": 0.00042154197581112385,
        "peak_extra_bytes": 3223552
      },
      "gathered": {
        "seconds": [
          0.00038970797322690487,
          0.0003135830629616976,
          0.0007062500808387995,
          0.00028962502256035805,
          0.0003398749977350235,
          0.0003137500025331974,
          0.0003361250273883343
        ],
        "median_seconds": 0.0003361250273883343,
        "peak_extra_bytes": 5804032
      }
    }
  ],
  "router": {
    "comparison": {
      "max_abs_error": 0.0,
      "relative_to_max": 0.0,
      "exact_equal": true
    },
    "cast_each_step": {
      "seconds": [
        0.00012837490066885948,
        0.00013504200614988804,
        0.00013262499123811722,
        0.00013845902867615223,
        0.00013175001367926598,
        0.00013616704382002354,
        0.00013341684825718403,
        0.00015408406034111977,
        0.00028562499210238457,
        0.00021533318795263767,
        0.0003210408613085747,
        0.00017983303405344486,
        0.0002030420582741499,
        0.0002544168382883072,
        0.00021170801483094692,
        0.00033974996767938137,
        0.0003160419873893261,
        0.0005227918736636639,
        0.0002572077792137861,
        0.00019649998284876347,
        0.00017066695727407932,
        0.00021083303727209568,
        0.00021087494678795338,
        0.000201541930437088,
        0.00016641709953546524,
        0.0001688748598098755,
        0.0001812500413507223,
        0.0001954999752342701,
        0.00018116598948836327,
        0.00015737488865852356
      ],
      "median_seconds": 0.0001883750082924962,
      "peak_extra_bytes": 5244928
    },
    "cached_f32": {
      "seconds": [
        0.00014649983495473862,
        0.0001596671063452959,
        0.00018325005657970905,
        0.0001759999431669712,
        0.00021845893934369087,
        0.00016562500968575478,
        0.00021170801483094692,
        0.00018391688354313374,
        0.00016154209151864052,
        0.0001713328529149294,
        0.00017304113134741783,
        0.0002029158640652895,
        0.00018229195848107338,
        0.0001599169336259365,
        0.00017058290541172028,
        0.00017520785331726074,
        0.0002931668423116207,
        0.00017283298075199127,
        0.0001637078821659088,
        0.00029504112899303436,
        0.00016412511467933655,
        0.00020829099230468273,
        0.00018504098989069462,
        0.00025325012393295765,
        0.0002207078505307436,
        0.0001799999736249447,
        0.00014154193922877312,
        0.00013700011186301708,
        0.00014408398419618607,
        0.0001312911044806242
      ],
      "median_seconds": 0.0001741244923323393,
      "peak_extra_bytes": 2048
    }
  },
  "vm_after": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    14155.\nPages active:                                1023414.\nPages inactive:                               919179.\nPages speculative:                            103108.\nPages throttled:                                   0.\nPages wired down:                             488176.\nPages purgeable:                                8326.\n\"Translation faults\":                    13443258897.\nPages copy-on-write:                       611747492.\nPages zero filled:                       12955003701.\nPages reactivated:                        1905524669.\nPages purged:                               58748761.\nFile-backed pages:                           1370034.\nAnonymous pages:                              675667.\nPages stored in compressor:                  1717744.\nPages occupied by compressor:                 537239.\nDecompressions:                            918842298.\nCompressions:                             1208264167.\nPageins:                                  5409587921.\nPageouts:                                   10582842.\nSwapins:                                    41639991.\nSwapouts:                                   69884787.\nPages tagged:                                 163468.\nPages tagged resident:                        114128.\nPages tagged compressed:                       49340.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7042.\nPages tag-storage free:                          307.\nPages tag-storage non-tag pageable:            90686.\nPages tag-storage non-tag wired:                 269.\nBytes of compressed tags:                    8340736.\nTagged compressions:                         8825720.\nTagged decompressions:                       8092132.\n"
}
```

## retention-initial.json

SHA-256: `1030e5df52e1070ef7f995735a0b7f2ae36b8240ddfe9e184b1fea9bc37343c9`

```json
[
  {
    "mode": "slice",
    "logical_bytes": 2211840,
    "active_delta_bytes": 757334016
  },
  {
    "mode": "eval_slice",
    "logical_bytes": 2211840,
    "active_delta_bytes": 757334016
  },
  {
    "mode": "contiguous",
    "logical_bytes": 2211840,
    "active_delta_bytes": 2359296
  },
  {
    "mode": "take",
    "logical_bytes": 2211840,
    "active_delta_bytes": 2359296
  }
]
```

