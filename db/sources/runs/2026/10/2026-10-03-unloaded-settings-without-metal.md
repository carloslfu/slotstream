---
type: run
created: 2026-10-03T19:25:48.673905+00:00
updated: 2026-10-03T19:25:48.673905+00:00
summary: Keep unloaded model settings independent of the Metal allocator
binary: 2cf3e06a03c402d4f060a8ee5510166bf51df53f46b514710cfb353ab6d37435
captured_at: 2026-10-03
command: Exact sequential commands are preserved in the driver and supervision identities below.
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Keep unloaded model settings independent of the Metal allocator
tool: Mac lifecycle CI regression
---

Mac CI for commit 1f2e43ffed4bc7fe42453341515cac7730abc002 exposed an unloaded lifecycle regression: recovering from an unavailable saved pack invoked releaseEngine, which cleared MLX allocator storage even though the engine had never loaded. On a clean runner without the adjacent Metal library this initialized MLX and failed. The engine CI passed; this source preserves the failed Mac suite rather than treating local success as CI success.

The exact old Mac check executable, copied alone into a temporary directory and run there with --performance, reproduces the missing-metallib error. The first receipt looked only in stderr and mistakenly reported reproduced=false; MLX wrote the preserved message to stdout. The final receipt checks both streams and records that correction.

releaseEngine now clears MLX storage only when it actually owned a loaded engine. The existing background verification cancellation and lifecycle gate still run, and a loaded engine keeps its release behavior. The Mac CI script permanently runs the copied-executable case so developer-local Metal files cannot hide this regression.

The bounded single-worker rebuild kept its input hashes unchanged. The new copied executable passes the same performance suite with no metallib present, and the complete scripted Mac runtime suite also passes. No model process, weight change, application install or performance claim is involved.

Local home prefixes are replaced with <HOME>. Original byte lengths and hashes identify the unmodified local files. For large transcripts, the normalized UTF-8 bytes are stored losslessly as zlib-compressed base64 inside this Markdown source. Decode with `zlib.decompress(base64.b64decode(block))` and verify the listed normalized byte length and SHA-256. Every encoded block was round-trip checked before writing. This changes storage only, not the captured evidence. Small transcripts remain plain text. Raw tensor fixtures and source-bound executables remain in the bounded research directory; manifests bind their hashes. No model is installed or activated.

### build-unloaded-settings-v1.py

Original bytes: 2984. SHA-256: `5b6a71b30fec0298d5d065f0c9d6b110638c16cf57ed8c5c1b4a1c60bb39fe19`.

Normalized bytes: 2984. SHA-256: `5b6a71b30fec0298d5d065f0c9d6b110638c16cf57ed8c5c1b4a1c60bb39fe19`.

````text
from pathlib import Path
import ctypes,ctypes.util,json,os,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
out=Path('.build/quantization-research/unloaded-settings-build-v1');out.mkdir(exist_ok=False)
record={'kind':'bounded-single-worker-build','model_processes':0,'process_tree_ceiling_gb':6,'preflight_gb':9,'minimum_headroom_gb':3,'maximum_seconds':1800,'complete':False,'runs':[]}
def save(): (out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
lib=ctypes.CDLL(ctypes.util.find_library('proc'))
child=None
try:
 record['before']=quiet_preflight(9)
 before=subprocess.check_output(['python3','Tools/mac_build_inputs.py',os.path.expanduser('~/.dbmd/bin/dbmd')]);(out/'inputs-before.json').write_bytes(before)
 commands=[['swift','build','--package-path','apps/macos','-c','release','--product','sevra-mac-checks','-j','1']]
 os.environ['SEVRA_UI_OUT']=str(out.absolute()/'screens')
 record['commands']=commands;save();began=time.monotonic()
 for idx,command in enumerate(commands):
  row={'command':command,'peak_tree_bytes':0,'samples':0};record['runs'].append(row);save()
  with (out/f'{idx}.log').open('w') as log:
   child=subprocess.Popen(command,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
   while child.poll() is None:
    processes=subprocess.check_output(['ps','-axo','pid=,ppid='],text=True,timeout=5)
    rows=[tuple(map(int,s.split())) for s in processes.splitlines()]
    pids={child.pid}
    while True:
     expanded=pids | {pid for pid,parent in rows if parent in pids}
     if expanded==pids: break
     pids=expanded
    total=0
    for pid in pids:
     buf=ctypes.create_string_buffer(296)
     if lib.proc_pid_rusage(pid,4,buf)==0: total+=max(int.from_bytes(buf.raw[72:80],'little'),int.from_bytes(buf.raw[240:248],'little'))
    row['peak_tree_bytes']=max(row['peak_tree_bytes'],total);row['samples']+=1
    if total>6e9: raise RuntimeError('compiler tree exceeded its 6 GB envelope')
    if vm_snapshot()['reclaimable_bytes']<3e9: raise RuntimeError('lost 3 GB real headroom')
    if subprocess.check_output(['sysctl','-n','kern.memorystatus_vm_pressure_level'],text=True,timeout=5).strip()!='1': raise RuntimeError('OS memory pressure')
    if time.monotonic()-began>1800: raise RuntimeError('build time bound')
    time.sleep(.25)
   row['exit_code']=child.returncode;save()
   if child.returncode: raise RuntimeError('compiler failed; see build log')
   child=None
 after=subprocess.check_output(['python3','Tools/mac_build_inputs.py',os.path.expanduser('~/.dbmd/bin/dbmd')]);(out/'inputs-after.json').write_bytes(after)
 if before!=after: raise RuntimeError('build inputs changed')
 record['complete']=True
except BaseException as e:
 record['failure']=type(e).__name__+': '+str(e)
 if child is not None and child.poll() is None: terminate_child_tree(child)
 save();raise
finally:
 save()
print(json.dumps(record))
````

### unloaded-settings-build-driver.log

Original bytes: 2553. SHA-256: `d65549e930a9622d12398423b8db1b4afa4524a8bf6110e91c9aa9edaf217d01`.

Normalized bytes: 2553. SHA-256: `d65549e930a9622d12398423b8db1b4afa4524a8bf6110e91c9aa9edaf217d01`.

````text
swift-driver version: 1.148.6 swift-driver version: 1.148.6 {"kind": "bounded-single-worker-build", "model_processes": 0, "process_tree_ceiling_gb": 6, "preflight_gb": 9, "minimum_headroom_gb": 3, "maximum_seconds": 1800, "complete": true, "runs": [{"command": ["swift", "build", "--package-path", "apps/macos", "-c", "release", "--product", "sevra-mac-checks", "-j", "1"], "peak_tree_bytes": 1080953832, "samples": 87, "exit_code": 0}], "before": {"page_bytes": 16384, "reclaimable_bytes": 35197796352, "swapins": 52, "swapouts": 2908, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                  1751025.\nPages active:                                 329262.\nPages inactive:                               299020.\nPages speculative:                            142442.\nPages throttled:                                   0.\nPages wired down:                             185477.\nPages purgeable:                                9310.\n\"Translation faults\":                     2091786135.\nPages copy-on-write:                       109523991.\nPages zero filled:                        3378614712.\nPages reactivated:                         182998943.\nPages purged:                               13053056.\nFile-backed pages:                            387968.\nAnonymous pages:                              382756.\nPages stored in compressor:                   777546.\nPages occupied by compressor:                 376424.\nDecompressions:                            109085204.\nCompressions:                              123820102.\nPageins:                                  2410535381.\nPageouts:                                     497520.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 133193.\nPages tagged resident:                         99283.\nPages tagged compressed:                       33910.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5374.\nPages tag-storage free:                         1895.\nPages tag-storage non-tag pageable:            91027.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5194752.\nTagged compressions:                          806994.\nTagged decompressions:                        677658.\n"}, "commands": [["swift", "build", "--package-path", "apps/macos", "-c", "release", "--product", "sevra-mac-checks", "-j", "1"]]}
````

### product-selection-ci-failure.log

Original bytes: 223257. SHA-256: `f6f02591f1de2602be90fe3ac334912dee7a34eec135da3e7d5c9da860def304`.

Normalized bytes: 223257. SHA-256: `f6f02591f1de2602be90fe3ac334912dee7a34eec135da3e7d5c9da860def304`.

````zlib-base64
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
L9z6r/8HeemrNA==
````

### unloaded-settings-build-v1/0.log

Original bytes: 278. SHA-256: `c54ae152a0752f879fb349bf699f76dfea9c656bce7ba57ea3fa51e88c60cbda`.

Normalized bytes: 278. SHA-256: `c54ae152a0752f879fb349bf699f76dfea9c656bce7ba57ea3fa51e88c60cbda`.

````text
[0/1] Planning build
Building for production...
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[1/3] Write sources
[3/4] Compiling SevraRuntime Changes.swift
[3/5] Write Objects.LinkFileList
[4/5] Linking sevra-mac-checks
Build of product 'sevra-mac-checks' complete! (22.74s)
````

### unloaded-settings-build-v1/inputs-after.json

Original bytes: 38814. SHA-256: `dccc9c3845a5dc18bc95b47b485504cb04ed770c4a1dbe45d8ed851969341490`.

Normalized bytes: 38814. SHA-256: `dccc9c3845a5dc18bc95b47b485504cb04ed770c4a1dbe45d8ed851969341490`.

````text
{
  "dbmd_sha256": "3cc761c52629f220e5de40733d052884a3787885d696e26f07fdd1d1644d642b",
  "files": {
    "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
    "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
    "Sources/Slotstream/AppliedModelConfiguration.swift": "0042eecacbd2f4ddb136681c550237bb2ca1c4972035409a59bd4fddd1113aad",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
    "Sources/Slotstream/Checkpoint.swift": "361b54ab482ab1b08debf846148d16fb811ee3550cb8ca1ae7526dc9b825e04b",
    "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
    "Sources/Slotstream/ContextFeasibility.swift": "5e7d185542e5ef173683afd5e6999c7ec76c36bfa8e6d3356ec40d1b695edcfe",
    "Sources/Slotstream/ContextMemory.swift": "31da5a698303ec9898747052996996eeec2ac46d40b7c011791ea7b00e6bd23b",
    "Sources/Slotstream/ContextWindowPolicy.swift": "73b2321aae6a2c22fc7173467136770dbf45a1eca4a185293491472680a13a24",
    "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
    "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "24ca04e99cf4195e59bc08692b6bf62393872161c52f8b5eb1913c6282c9fb32",
    "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
    "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
    "Sources/Slotstream/ExpertPrefetch.swift": "46fb601813d05b788a3648139cbde2b88c94714a5e15f99456e4b2e7072f4b6a",
    "Sources/Slotstream/ExpertStore.swift": "4dae1ae2ff59f671ad4b6e0dbc6405fb198d2dc523ec9f2d9e00c9b2dfce7bcc",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
    "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
    "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
    "Sources/Slotstream/Generate.swift": "792159f8e9f11d1c98373c08e066b79908192d142d25a9f8bf2a6fbb22b48c82",
    "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
    "Sources/Slotstream/Governor.swift": "89310e4c1b2cef2b104122445a1ccdb118d4ea4c38ee7bd726d78261be74457b",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
    "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
    "Sources/Slotstream/MTPExpertStream.swift": "391b13fed457ba61a7cb4e107472a699ba87adc9a57cfd14580faa2dfbe50fd7",
    "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "1048ad7bcd1c9f93f5316465ed38d7bd93046fe4bfbd0fc138d972e646ee12ab",
    "Sources/Slotstream/ModelPackRegistry.swift": "56c7e6930287d9e8495d90e88e61df4dd062e78afa2767f4047941e1bb67aa5b",
    "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
    "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
    "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
    "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
    "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
    "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
    "Sources/Slotstream/PersistentPrefixFormat.swift": "d03795ee46252fe5df904591289af41a69811f2a211f437764d3f80ddb0d20ad",
    "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
    "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
    "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
    "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "240766430e77e186107a2b3eea844b8876bb509f92e2fbcfcea9d989e1a37b54",
    "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
    "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
    "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
    "Sources/Slotstream/RequestControl.swift": "56c5e664aaf33454f5ef45efedb3849ee539fd91e844d58885bf304f5aab3c1d",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
    "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "8566a2a7734ae19f07aa3b4216b2c219687b52819b3ac86a2f79533d31ad03a5",
    "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
    "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
    "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
    "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
    "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
    "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
    "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
    "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
    "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
    "Sources/Slotstream/VQDraftWeights.swift": "232799bd52934647ea792473111ab1b671f1c6b563c7980c16036f2eeff10e72",
    "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
    "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
    "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
    "Sources/Slotstream/Version.swift": "d68b6b9f343402041c33452b885eebce140773cc26379b4adaae996640427b40",
    "Sources/Slotstream/Vision.swift": "639b5c4bbe05654db411d587f31e7962d3db857aa4be38a2b54f982199d51eb5",
    "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
    "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
    "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
    "Sources/Slotstream/WeightStore.swift": "b7b9c43d6aaee926a6c13701e65cded306e9eb8483477b61ff81dcf212f39999",
    "Sources/Slotstream/Weights.swift": "01fb2c61390e6b7585eb80a34bf53a8c460fb6258908d57a3c1ed1fa77ec3ce8",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
    "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
    "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "25b469da9856405dd6421d6754d7caaeae378fc5e77ae1637a2552a139a810f7",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "b891dd485cafb3fc2bd4961fd4fd372e30cc496fb4c2bac414f4835ef51c0d3a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d1ac7938651c5b9db8e95706ab1f6802dbce55e3abcf9213df0407ddbfbe498c",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b18979a76cb2112a2beb8fd3196c1d26e36c2626c2a8de732b6b4fc134be61c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "31de09d8efc8951692f60fc9f5c4ec4d14dbef5b67656da18bca519ab4bcbcee",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
    "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
    "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
    "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
    "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
    "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
    "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
    "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
    "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
    "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
    "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
    "Sources/SlotstreamTestKit/T0Checks.swift": "25bcf4ef6daeb29a31ebfacd2217bf12afb7788672f72c21d13ae7ac41aded97",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
    "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "d26e43367ba2d61d7afd9f5b175e95b714409b1717b86b9fe71f1306e36b6a81",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "3ba24ae3e24dd10214e3288f007952d9e2b06241c081e29313b42ac7aa7a31bb",
    "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
    "Sources/slotstream-cli/DraftStreamCommands.swift": "4fd131e2303fd4f2c9765fff9b2543011d565dd5c070b8b380910528c9026a33",
    "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "249274657b4f4f4c3e694a2b0db671b3af8b92a2148495647f3be9092f48f6b2",
    "Sources/slotstream-cli/LaunchCommand.swift": "a18212935aa5aa2c956593838ef181ccbf0aae2501b7a0071f4b4b44298ea0f9",
    "Sources/slotstream-cli/MTPCommands.swift": "04d06d66f29339b4d88dfbae7be18ef873c32c09320536ee7916e7d621816e08",
    "Sources/slotstream-cli/ModelPackCommand.swift": "daaa7bf13449090afb10d04c7ecc2a6bf9af5c0f9c182e758417aeb1a51408fa",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
    "Sources/slotstream-cli/PrefixExactCommands.swift": "b70f0a6f2536f0eb1fc00007260cc6dffe2592b1f32271225fe1304261346e28",
    "Sources/slotstream-cli/Pull.swift": "ca9f9e90ef959b194653945e29ebd3b9f1932ef3e46dfceaa7b09562fa2c9d7b",
    "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
    "Tools/build_sevra_mac.sh": "debb9110cd8e316bac4e153e9f7cfe07fe0437dbb8e781bb50bcf93b0488771d",
    "Tools/generate_sevra_icon.sh": "8228ccb8e4d707c2a73336f283ed599f72cbc2213589ca36191d675e737141b6",
    "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
    "Tools/mac_build_inputs.py": "1e406cea50efb4125d0d5fc45be838288ee440d90097dc508ce2b0d3ad68eb1a",
    "Tools/render_sevra_icon.swift": "cbcf593dec275773cc86118bc4d6aff423534d9df7e62ef0fb014733c9aa3095",
    "apps/macos/App/AppModel.swift": "aea5ef70be88b171a1932c3370909c044880177d6651f3b961f219036e29f3f6",
    "apps/macos/App/AppModelWork.swift": "76f3d80447c5b4a829ac4bc1e0f429ee3f1df76a53f06b3110c03b75e9e90d14",
    "apps/macos/App/ContentView.swift": "f64f31bc3cfe9ab8f8d1c207f1e137ebe1102927ec4e1f409c21fab3d0cc5745",
    "apps/macos/App/MacCommands.swift": "e85cc090add3bfd42cc259727fcc16c76f44307a5172e40a96dd7f74747674c6",
    "apps/macos/App/MiniAppHost.swift": "9720c739c4ef11b56e3cb3e30bcca6e17f3c97ba7cf4d3e26ad743d0e7e82bec",
    "apps/macos/App/NativeControls.swift": "a66a3219a431dc4523a1c8ec16e6372331123b7c43888e75c250047e60193729",
    "apps/macos/App/NativeText.swift": "bb471331e742b37bee04fea4db02c80506c91e95597faa12c23962aea8c7d614",
    "apps/macos/App/ObserverMark.swift": "93f172ecc0b360338bb09913071a6ba6644077576abf9b323bfa95ebd4c5b764",
    "apps/macos/App/ResponseDetails.swift": "fe85363dc19a3a767250df73cdb566a4e22117236b9137bfd5853e19ff437087",
    "apps/macos/App/SevraMain.swift": "7ae10c0cf10b4ffda3c54416db51f589eac0a8eb1f59b24a3e5ffa01da7cbd34",
    "apps/macos/App/WindowState.swift": "c3782b38d4ff1342587aef3e54688bc0fb6160f92388f8b4de1742780d09a96e",
    "apps/macos/App/WorkViews.swift": "27be9436faf7b6b56adc0892f13b911652bbc1960493765fb869a7b14edc8af9",
    "apps/macos/CSandbox/include/sevra_sandbox.h": "7885534cb39319e57ebe6dcf196447e2a50b31fdf31ca8c13fe2457f005477d9",
    "apps/macos/CSandbox/sevra_sandbox.c": "6172c4955a01baf46affb019f5f1be32b8d388371203ecd41802f5ba9bd5a3f8",
    "apps/macos/Extract/main.swift": "1892d923b140622e1698c1c0f1eaba5f9684921f4917cdec52003b26f89617f5",
    "apps/macos/Info.plist": "73cc83e91b2729b1ef576226fd95104e0bb763f874fe937d81d92d9785e8bdb6",
    "apps/macos/Package.resolved": "2d751ea715e77a0a7994c55a13e23b0327b9e6b42827ec7603cf740f44d53da4",
    "apps/macos/Package.swift": "2d9e44a7d3a5067d7eecb4f9a929b355943fcad7d91e56eabaa9a160a47bb201",
    "apps/macos/Presentation/ComposerSession.swift": "1e0ec10e4833da338b289e6b766b4d471924e47cd1f5cfb5d301cdbd4b719ef6",
    "apps/macos/Presentation/HistoryPage.swift": "576e721818d61bfd988b6f57b136aab6bbb8c847f8e8a2116ce76708f4f4f84d",
    "apps/macos/Presentation/MarkdownDocument.swift": "39fa604d4b09e8fdd61cd4b5be33c912fd748501c4aaeb7f2f420023b9fe6a45",
    "apps/macos/Presentation/Module.swift": "dda9b75f64b106eb544de201f599122d75abc483c5b156bba6c05c0f956dbc3c",
    "apps/macos/Resources/Fonts/Inter-OFL.txt": "5b9321a4298cfeb6b34354164a1c3afc3db114569984c502b9b35d988fd58c57",
    "apps/macos/Resources/Fonts/Inter.ttf": "29160a80ff49ddcab2c97711247e08b1fab27a484a329ce8b813d820dc559031",
    "apps/macos/Resources/Fonts/Poppins-Medium.ttf": "90373e7d838d32468438fc3e152dca0bdb12edcab99ea639f158790b1ba1fd05",
    "apps/macos/Resources/Fonts/Poppins-OFL.txt": "6be04893d770899a015649c7aa3b582f871b272f8747a92b78b17c3e5c8b2573",
    "apps/macos/Resources/Fonts/manifest.json": "1e79dfd278dbe9bfd8afbf7e5cbaee64dff1574fc1cc3aca8fdd903f4056677e",
    "apps/macos/Resources/Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
    "apps/macos/Resources/Licenses/VQLab-NOTICE.txt": "04d3fc0f5e2ddf3570b5895316cbee7a62d7d75bdd216c39b3aee95c8942941d",
    "apps/macos/Resources/Licenses/swift-cmark-COPYING": "c22e885f33b821bddb24cf007145e5540655b6c0f403e49e6c76a93c28e6d9a9",
    "apps/macos/Resources/Licenses/swift-markdown-LICENSE.txt": "167beb36f181bd163c93c6feb45c68e5f9462fe1af55b278f7bfd1df20e673a3",
    "apps/macos/Resources/Licenses/swift-markdown-NOTICE.txt": "ee7da43afcac4a52196a2141024573ec2ceb84b14e74dfed38522d94586fbc52",
    "apps/macos/Resources/Sevra.icns": "b28f2df8e40cafc2e89fb3ae5a0e361b5470851d833495df9b3dd4ca0395471d",
    "apps/macos/Runtime/Changes.swift": "17735c951b3bef2c2b30f6fe029b5e8f635364513a7669da770d934815411e7d",
    "apps/macos/Runtime/ConversationContext.swift": "89a1a6cfd9b3d879a53c40443e3c02bcef380f1599354fc386469bd4d39d81e7",
    "apps/macos/Runtime/Extensions.swift": "632ed6d2ec6d1704b24c79c5c71a1ce790a37a1fdbbb24ac5c1db32cb0ac9406",
    "apps/macos/Runtime/Extraction.swift": "5bc0b25ad3b29481bb2b92491cff976934d9f5f92ca3bf4dc83988b056be8955",
    "apps/macos/Runtime/HomeArchive.swift": "d43376db4e1d7bb6919bf3e332477fffa28ceefdc92d0b90ff6b206fe18fb169",
    "apps/macos/Runtime/HomeStore.swift": "0a4db7db75f1de1f3042a78af86e6057377b92deab4639326040a620e609a49b",
    "apps/macos/Runtime/HomeTemplate.swift": "e25b0a112abdea7d915c1f553fb3b62078b8ab35ab60dc5c3d80a82468caa7a2",
    "apps/macos/Runtime/HomeWriter.swift": "d61aa8ebc3ee627a5281100eb77cec4eaf633fcd97a792a5a4290136f499c303",
    "apps/macos/Runtime/Inference.swift": "a690583eddce6facd924e18622845f9a7e7ecdc33a255c52292f377f2e76873a",
    "apps/macos/Runtime/InferenceCache.swift": "48aa1f16913c2ac4f227b11e76131c2d5e4860403cbc6280de91946b19aba670",
    "apps/macos/Runtime/LocalIPC.swift": "2f9ca541d07687034f6808958e54397f017f260d394216ab71cd8221bb3d599e",
    "apps/macos/Runtime/ModelSetup.swift": "3080010ef569fbee93c372a61699ef13e4ac4066a1be40815e991ff647b16e62",
    "apps/macos/Runtime/ModelVerification.swift": "29564d5f03207e4286f6ab8ab286a22dac58de92bb459f3f765417a99ce38e53",
    "apps/macos/Runtime/Models.swift": "6ee898c4a2a092f30eb5696829235ab391d3e0290319a88e38b94ec1c63ab3f5",
    "apps/macos/Runtime/Performance.swift": "b377ed9652f1321db355daefc7371d8c048173b56a13a5c2d7ed484949895b78",
    "apps/macos/Runtime/ResponseMetrics.swift": "91db9f1ce48a14f16b5e9b516dfdf20e0354e475a170f6888c88018cff6ca737",
    "apps/macos/Runtime/Runtime.swift": "4ac3bda459c64c41d4bc5c4ce461e0c60889913c913873237c8bc7b3cfca9b48",
    "apps/macos/Runtime/RuntimeExtensions.swift": "8a03804b02763569d839359064fa22e0a50e88907a56dd5eeaf5f88b327ce311",
    "apps/macos/Runtime/SourceNavigation.swift": "c2286df52a8a3ec200a5adad3162c899c08e480b858a15e1fe5e0634202cbb3e",
    "apps/macos/Runtime/Sources.swift": "b458dc283490f833ad50e17079af849d644d27408c45b7f04e01dbb059e59267",
    "apps/macos/Runtime/Thinking.swift": "be477cb342ac1057a5fcd82842b498cbbb7ecfb91548e5ce49e4aef9fcbee420",
    "apps/macos/Runtime/Tools.swift": "6cd7577792d86d6a2d31ba24d0e4bdf55374a5b443954d3584e27404f725d52f",
    "apps/macos/Sevra.xcodeproj/project.pbxproj": "dc22426b24c2c8eafe143ad67c087f800a7708e2d7c6d43ba7f9e4a0abe3040c"
  },
  "scope": "Local development build inputs. Ad-hoc signing is not release qualification.",
  "sdk": "26.5",
  "swift": "Apple Swift version 6.3.3 (swiftlang-6.3.3.1.3 clang-2100.1.1.101)\nTarget: arm64-apple-macosx26.0"
}
````

### unloaded-settings-build-v1/inputs-before.json

Original bytes: 38814. SHA-256: `dccc9c3845a5dc18bc95b47b485504cb04ed770c4a1dbe45d8ed851969341490`.

Normalized bytes: 38814. SHA-256: `dccc9c3845a5dc18bc95b47b485504cb04ed770c4a1dbe45d8ed851969341490`.

````text
{
  "dbmd_sha256": "3cc761c52629f220e5de40733d052884a3787885d696e26f07fdd1d1644d642b",
  "files": {
    "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
    "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
    "Sources/Slotstream/AppliedModelConfiguration.swift": "0042eecacbd2f4ddb136681c550237bb2ca1c4972035409a59bd4fddd1113aad",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
    "Sources/Slotstream/Checkpoint.swift": "361b54ab482ab1b08debf846148d16fb811ee3550cb8ca1ae7526dc9b825e04b",
    "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
    "Sources/Slotstream/ContextFeasibility.swift": "5e7d185542e5ef173683afd5e6999c7ec76c36bfa8e6d3356ec40d1b695edcfe",
    "Sources/Slotstream/ContextMemory.swift": "31da5a698303ec9898747052996996eeec2ac46d40b7c011791ea7b00e6bd23b",
    "Sources/Slotstream/ContextWindowPolicy.swift": "73b2321aae6a2c22fc7173467136770dbf45a1eca4a185293491472680a13a24",
    "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
    "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "24ca04e99cf4195e59bc08692b6bf62393872161c52f8b5eb1913c6282c9fb32",
    "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
    "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
    "Sources/Slotstream/ExpertPrefetch.swift": "46fb601813d05b788a3648139cbde2b88c94714a5e15f99456e4b2e7072f4b6a",
    "Sources/Slotstream/ExpertStore.swift": "4dae1ae2ff59f671ad4b6e0dbc6405fb198d2dc523ec9f2d9e00c9b2dfce7bcc",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
    "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
    "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
    "Sources/Slotstream/Generate.swift": "792159f8e9f11d1c98373c08e066b79908192d142d25a9f8bf2a6fbb22b48c82",
    "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
    "Sources/Slotstream/Governor.swift": "89310e4c1b2cef2b104122445a1ccdb118d4ea4c38ee7bd726d78261be74457b",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
    "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
    "Sources/Slotstream/MTPExpertStream.swift": "391b13fed457ba61a7cb4e107472a699ba87adc9a57cfd14580faa2dfbe50fd7",
    "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "1048ad7bcd1c9f93f5316465ed38d7bd93046fe4bfbd0fc138d972e646ee12ab",
    "Sources/Slotstream/ModelPackRegistry.swift": "56c7e6930287d9e8495d90e88e61df4dd062e78afa2767f4047941e1bb67aa5b",
    "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
    "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
    "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
    "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
    "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
    "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
    "Sources/Slotstream/PersistentPrefixFormat.swift": "d03795ee46252fe5df904591289af41a69811f2a211f437764d3f80ddb0d20ad",
    "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
    "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
    "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
    "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "240766430e77e186107a2b3eea844b8876bb509f92e2fbcfcea9d989e1a37b54",
    "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
    "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
    "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
    "Sources/Slotstream/RequestControl.swift": "56c5e664aaf33454f5ef45efedb3849ee539fd91e844d58885bf304f5aab3c1d",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
    "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "8566a2a7734ae19f07aa3b4216b2c219687b52819b3ac86a2f79533d31ad03a5",
    "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
    "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
    "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
    "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
    "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
    "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
    "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
    "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
    "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
    "Sources/Slotstream/VQDraftWeights.swift": "232799bd52934647ea792473111ab1b671f1c6b563c7980c16036f2eeff10e72",
    "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
    "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
    "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
    "Sources/Slotstream/Version.swift": "d68b6b9f343402041c33452b885eebce140773cc26379b4adaae996640427b40",
    "Sources/Slotstream/Vision.swift": "639b5c4bbe05654db411d587f31e7962d3db857aa4be38a2b54f982199d51eb5",
    "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
    "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
    "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
    "Sources/Slotstream/WeightStore.swift": "b7b9c43d6aaee926a6c13701e65cded306e9eb8483477b61ff81dcf212f39999",
    "Sources/Slotstream/Weights.swift": "01fb2c61390e6b7585eb80a34bf53a8c460fb6258908d57a3c1ed1fa77ec3ce8",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
    "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
    "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "25b469da9856405dd6421d6754d7caaeae378fc5e77ae1637a2552a139a810f7",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "b891dd485cafb3fc2bd4961fd4fd372e30cc496fb4c2bac414f4835ef51c0d3a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d1ac7938651c5b9db8e95706ab1f6802dbce55e3abcf9213df0407ddbfbe498c",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b18979a76cb2112a2beb8fd3196c1d26e36c2626c2a8de732b6b4fc134be61c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "31de09d8efc8951692f60fc9f5c4ec4d14dbef5b67656da18bca519ab4bcbcee",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
    "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
    "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
    "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
    "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
    "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
    "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
    "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
    "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
    "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
    "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
    "Sources/SlotstreamTestKit/T0Checks.swift": "25bcf4ef6daeb29a31ebfacd2217bf12afb7788672f72c21d13ae7ac41aded97",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
    "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "d26e43367ba2d61d7afd9f5b175e95b714409b1717b86b9fe71f1306e36b6a81",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "3ba24ae3e24dd10214e3288f007952d9e2b06241c081e29313b42ac7aa7a31bb",
    "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
    "Sources/slotstream-cli/DraftStreamCommands.swift": "4fd131e2303fd4f2c9765fff9b2543011d565dd5c070b8b380910528c9026a33",
    "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "249274657b4f4f4c3e694a2b0db671b3af8b92a2148495647f3be9092f48f6b2",
    "Sources/slotstream-cli/LaunchCommand.swift": "a18212935aa5aa2c956593838ef181ccbf0aae2501b7a0071f4b4b44298ea0f9",
    "Sources/slotstream-cli/MTPCommands.swift": "04d06d66f29339b4d88dfbae7be18ef873c32c09320536ee7916e7d621816e08",
    "Sources/slotstream-cli/ModelPackCommand.swift": "daaa7bf13449090afb10d04c7ecc2a6bf9af5c0f9c182e758417aeb1a51408fa",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
    "Sources/slotstream-cli/PrefixExactCommands.swift": "b70f0a6f2536f0eb1fc00007260cc6dffe2592b1f32271225fe1304261346e28",
    "Sources/slotstream-cli/Pull.swift": "ca9f9e90ef959b194653945e29ebd3b9f1932ef3e46dfceaa7b09562fa2c9d7b",
    "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
    "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
    "Tools/build_sevra_mac.sh": "debb9110cd8e316bac4e153e9f7cfe07fe0437dbb8e781bb50bcf93b0488771d",
    "Tools/generate_sevra_icon.sh": "8228ccb8e4d707c2a73336f283ed599f72cbc2213589ca36191d675e737141b6",
    "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
    "Tools/mac_build_inputs.py": "1e406cea50efb4125d0d5fc45be838288ee440d90097dc508ce2b0d3ad68eb1a",
    "Tools/render_sevra_icon.swift": "cbcf593dec275773cc86118bc4d6aff423534d9df7e62ef0fb014733c9aa3095",
    "apps/macos/App/AppModel.swift": "aea5ef70be88b171a1932c3370909c044880177d6651f3b961f219036e29f3f6",
    "apps/macos/App/AppModelWork.swift": "76f3d80447c5b4a829ac4bc1e0f429ee3f1df76a53f06b3110c03b75e9e90d14",
    "apps/macos/App/ContentView.swift": "f64f31bc3cfe9ab8f8d1c207f1e137ebe1102927ec4e1f409c21fab3d0cc5745",
    "apps/macos/App/MacCommands.swift": "e85cc090add3bfd42cc259727fcc16c76f44307a5172e40a96dd7f74747674c6",
    "apps/macos/App/MiniAppHost.swift": "9720c739c4ef11b56e3cb3e30bcca6e17f3c97ba7cf4d3e26ad743d0e7e82bec",
    "apps/macos/App/NativeControls.swift": "a66a3219a431dc4523a1c8ec16e6372331123b7c43888e75c250047e60193729",
    "apps/macos/App/NativeText.swift": "bb471331e742b37bee04fea4db02c80506c91e95597faa12c23962aea8c7d614",
    "apps/macos/App/ObserverMark.swift": "93f172ecc0b360338bb09913071a6ba6644077576abf9b323bfa95ebd4c5b764",
    "apps/macos/App/ResponseDetails.swift": "fe85363dc19a3a767250df73cdb566a4e22117236b9137bfd5853e19ff437087",
    "apps/macos/App/SevraMain.swift": "7ae10c0cf10b4ffda3c54416db51f589eac0a8eb1f59b24a3e5ffa01da7cbd34",
    "apps/macos/App/WindowState.swift": "c3782b38d4ff1342587aef3e54688bc0fb6160f92388f8b4de1742780d09a96e",
    "apps/macos/App/WorkViews.swift": "27be9436faf7b6b56adc0892f13b911652bbc1960493765fb869a7b14edc8af9",
    "apps/macos/CSandbox/include/sevra_sandbox.h": "7885534cb39319e57ebe6dcf196447e2a50b31fdf31ca8c13fe2457f005477d9",
    "apps/macos/CSandbox/sevra_sandbox.c": "6172c4955a01baf46affb019f5f1be32b8d388371203ecd41802f5ba9bd5a3f8",
    "apps/macos/Extract/main.swift": "1892d923b140622e1698c1c0f1eaba5f9684921f4917cdec52003b26f89617f5",
    "apps/macos/Info.plist": "73cc83e91b2729b1ef576226fd95104e0bb763f874fe937d81d92d9785e8bdb6",
    "apps/macos/Package.resolved": "2d751ea715e77a0a7994c55a13e23b0327b9e6b42827ec7603cf740f44d53da4",
    "apps/macos/Package.swift": "2d9e44a7d3a5067d7eecb4f9a929b355943fcad7d91e56eabaa9a160a47bb201",
    "apps/macos/Presentation/ComposerSession.swift": "1e0ec10e4833da338b289e6b766b4d471924e47cd1f5cfb5d301cdbd4b719ef6",
    "apps/macos/Presentation/HistoryPage.swift": "576e721818d61bfd988b6f57b136aab6bbb8c847f8e8a2116ce76708f4f4f84d",
    "apps/macos/Presentation/MarkdownDocument.swift": "39fa604d4b09e8fdd61cd4b5be33c912fd748501c4aaeb7f2f420023b9fe6a45",
    "apps/macos/Presentation/Module.swift": "dda9b75f64b106eb544de201f599122d75abc483c5b156bba6c05c0f956dbc3c",
    "apps/macos/Resources/Fonts/Inter-OFL.txt": "5b9321a4298cfeb6b34354164a1c3afc3db114569984c502b9b35d988fd58c57",
    "apps/macos/Resources/Fonts/Inter.ttf": "29160a80ff49ddcab2c97711247e08b1fab27a484a329ce8b813d820dc559031",
    "apps/macos/Resources/Fonts/Poppins-Medium.ttf": "90373e7d838d32468438fc3e152dca0bdb12edcab99ea639f158790b1ba1fd05",
    "apps/macos/Resources/Fonts/Poppins-OFL.txt": "6be04893d770899a015649c7aa3b582f871b272f8747a92b78b17c3e5c8b2573",
    "apps/macos/Resources/Fonts/manifest.json": "1e79dfd278dbe9bfd8afbf7e5cbaee64dff1574fc1cc3aca8fdd903f4056677e",
    "apps/macos/Resources/Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
    "apps/macos/Resources/Licenses/VQLab-NOTICE.txt": "04d3fc0f5e2ddf3570b5895316cbee7a62d7d75bdd216c39b3aee95c8942941d",
    "apps/macos/Resources/Licenses/swift-cmark-COPYING": "c22e885f33b821bddb24cf007145e5540655b6c0f403e49e6c76a93c28e6d9a9",
    "apps/macos/Resources/Licenses/swift-markdown-LICENSE.txt": "167beb36f181bd163c93c6feb45c68e5f9462fe1af55b278f7bfd1df20e673a3",
    "apps/macos/Resources/Licenses/swift-markdown-NOTICE.txt": "ee7da43afcac4a52196a2141024573ec2ceb84b14e74dfed38522d94586fbc52",
    "apps/macos/Resources/Sevra.icns": "b28f2df8e40cafc2e89fb3ae5a0e361b5470851d833495df9b3dd4ca0395471d",
    "apps/macos/Runtime/Changes.swift": "17735c951b3bef2c2b30f6fe029b5e8f635364513a7669da770d934815411e7d",
    "apps/macos/Runtime/ConversationContext.swift": "89a1a6cfd9b3d879a53c40443e3c02bcef380f1599354fc386469bd4d39d81e7",
    "apps/macos/Runtime/Extensions.swift": "632ed6d2ec6d1704b24c79c5c71a1ce790a37a1fdbbb24ac5c1db32cb0ac9406",
    "apps/macos/Runtime/Extraction.swift": "5bc0b25ad3b29481bb2b92491cff976934d9f5f92ca3bf4dc83988b056be8955",
    "apps/macos/Runtime/HomeArchive.swift": "d43376db4e1d7bb6919bf3e332477fffa28ceefdc92d0b90ff6b206fe18fb169",
    "apps/macos/Runtime/HomeStore.swift": "0a4db7db75f1de1f3042a78af86e6057377b92deab4639326040a620e609a49b",
    "apps/macos/Runtime/HomeTemplate.swift": "e25b0a112abdea7d915c1f553fb3b62078b8ab35ab60dc5c3d80a82468caa7a2",
    "apps/macos/Runtime/HomeWriter.swift": "d61aa8ebc3ee627a5281100eb77cec4eaf633fcd97a792a5a4290136f499c303",
    "apps/macos/Runtime/Inference.swift": "a690583eddce6facd924e18622845f9a7e7ecdc33a255c52292f377f2e76873a",
    "apps/macos/Runtime/InferenceCache.swift": "48aa1f16913c2ac4f227b11e76131c2d5e4860403cbc6280de91946b19aba670",
    "apps/macos/Runtime/LocalIPC.swift": "2f9ca541d07687034f6808958e54397f017f260d394216ab71cd8221bb3d599e",
    "apps/macos/Runtime/ModelSetup.swift": "3080010ef569fbee93c372a61699ef13e4ac4066a1be40815e991ff647b16e62",
    "apps/macos/Runtime/ModelVerification.swift": "29564d5f03207e4286f6ab8ab286a22dac58de92bb459f3f765417a99ce38e53",
    "apps/macos/Runtime/Models.swift": "6ee898c4a2a092f30eb5696829235ab391d3e0290319a88e38b94ec1c63ab3f5",
    "apps/macos/Runtime/Performance.swift": "b377ed9652f1321db355daefc7371d8c048173b56a13a5c2d7ed484949895b78",
    "apps/macos/Runtime/ResponseMetrics.swift": "91db9f1ce48a14f16b5e9b516dfdf20e0354e475a170f6888c88018cff6ca737",
    "apps/macos/Runtime/Runtime.swift": "4ac3bda459c64c41d4bc5c4ce461e0c60889913c913873237c8bc7b3cfca9b48",
    "apps/macos/Runtime/RuntimeExtensions.swift": "8a03804b02763569d839359064fa22e0a50e88907a56dd5eeaf5f88b327ce311",
    "apps/macos/Runtime/SourceNavigation.swift": "c2286df52a8a3ec200a5adad3162c899c08e480b858a15e1fe5e0634202cbb3e",
    "apps/macos/Runtime/Sources.swift": "b458dc283490f833ad50e17079af849d644d27408c45b7f04e01dbb059e59267",
    "apps/macos/Runtime/Thinking.swift": "be477cb342ac1057a5fcd82842b498cbbb7ecfb91548e5ce49e4aef9fcbee420",
    "apps/macos/Runtime/Tools.swift": "6cd7577792d86d6a2d31ba24d0e4bdf55374a5b443954d3584e27404f725d52f",
    "apps/macos/Sevra.xcodeproj/project.pbxproj": "dc22426b24c2c8eafe143ad67c087f800a7708e2d7c6d43ba7f9e4a0abe3040c"
  },
  "scope": "Local development build inputs. Ad-hoc signing is not release qualification.",
  "sdk": "26.5",
  "swift": "Apple Swift version 6.3.3 (swiftlang-6.3.3.1.3 clang-2100.1.1.101)\nTarget: arm64-apple-macosx26.0"
}
````

### unloaded-settings-build-v1/receipt.json

Original bytes: 2739. SHA-256: `5933d2f62161590b671db410980bb6f4ecf297b0b40b9f8dc89d811e6356a47e`.

Normalized bytes: 2739. SHA-256: `5933d2f62161590b671db410980bb6f4ecf297b0b40b9f8dc89d811e6356a47e`.

````text
{
  "kind": "bounded-single-worker-build",
  "model_processes": 0,
  "process_tree_ceiling_gb": 6,
  "preflight_gb": 9,
  "minimum_headroom_gb": 3,
  "maximum_seconds": 1800,
  "complete": true,
  "runs": [
    {
      "command": [
        "swift",
        "build",
        "--package-path",
        "apps/macos",
        "-c",
        "release",
        "--product",
        "sevra-mac-checks",
        "-j",
        "1"
      ],
      "peak_tree_bytes": 1080953832,
      "samples": 87,
      "exit_code": 0
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 35197796352,
    "swapins": 52,
    "swapouts": 2908,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                  1751025.\nPages active:                                 329262.\nPages inactive:                               299020.\nPages speculative:                            142442.\nPages throttled:                                   0.\nPages wired down:                             185477.\nPages purgeable:                                9310.\n\"Translation faults\":                     2091786135.\nPages copy-on-write:                       109523991.\nPages zero filled:                        3378614712.\nPages reactivated:                         182998943.\nPages purged:                               13053056.\nFile-backed pages:                            387968.\nAnonymous pages:                              382756.\nPages stored in compressor:                   777546.\nPages occupied by compressor:                 376424.\nDecompressions:                            109085204.\nCompressions:                              123820102.\nPageins:                                  2410535381.\nPageouts:                                     497520.\nSwapins:                                          52.\nSwapouts:                                       2908.\nPages tagged:                                 133193.\nPages tagged resident:                         99283.\nPages tagged compressed:                       33910.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5374.\nPages tag-storage free:                         1895.\nPages tag-storage non-tag pageable:            91027.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5194752.\nTagged compressions:                          806994.\nTagged decompressions:                        677658.\n"
  },
  "commands": [
    [
      "swift",
      "build",
      "--package-path",
      "apps/macos",
      "-c",
      "release",
      "--product",
      "sevra-mac-checks",
      "-j",
      "1"
    ]
  ]
}
````

### unloaded-settings-v1/before.json

Original bytes: 128. SHA-256: `707fdec779ed48f17f3827c7ef9c9a5eacc96f4cd919c4073929591681397e23`.

Normalized bytes: 128. SHA-256: `707fdec779ed48f17f3827c7ef9c9a5eacc96f4cd919c4073929591681397e23`.

````text
{
  "binary_sha256": "46f44a7e7dc077b6648af8b2ad3bbe583748009c407cc6cd59221c330ac2618d",
  "exit": 255,
  "reproduced": false
}
````

### unloaded-settings-v1/before.stdout

Original bytes: 406. SHA-256: `bd31154ac0c03090b0c2a845a40a01393162fd22bee259cde63c588090cfd31a`.

Normalized bytes: 399. SHA-256: `02eb62f0c3b5409cc5177f5862ecda7242f9f517ae6d870b87c21d701b78d32b`.

````text
PASS: session model verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=true
MLX error: Failed to load the default metallib. library not found library not found library not found library not found  at <HOME>/Projects/slotstream/apps/macos/.build/checkouts/mlx-swift/Source/Cmlx/mlx-c/mlx/c/memory.cpp:15
````

### unloaded-settings-v1/before.stderr

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### unloaded-settings-v1/after.json

Original bytes: 448. SHA-256: `e727d973992ff80f6d73f42b597057076ce40ee3ba99ef794ef26c46dbcfb939`.

Normalized bytes: 448. SHA-256: `e727d973992ff80f6d73f42b597057076ce40ee3ba99ef794ef26c46dbcfb939`.

````text
{
  "binary_sha256": "2cf3e06a03c402d4f060a8ee5510166bf51df53f46b514710cfb353ab6d37435",
  "before_failure_reproduced": true,
  "before_receipt_note": "The initial receipt inspected stderr only; MLX writes this error to stdout. The preserved output confirms the failure.",
  "runs": [
    {
      "case": "copied-binary-no-metallib",
      "exit": 0
    },
    {
      "case": "full-scripted-runtime",
      "exit": 0
    }
  ],
  "passed": true
}
````

### unloaded-settings-v1/after.stdout

Original bytes: 649. SHA-256: `db062fdf37786d7e000fb96605c6e362015ba432a8454d316e7eea32c50f4099`.

Normalized bytes: 649. SHA-256: `db062fdf37786d7e000fb96605c6e362015ba432a8454d316e7eea32c50f4099`.

````text
PASS: session model verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=true
PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
PASS: context overflow preserves messages and refuses instead of silently trimming history
````

### unloaded-settings-v1/after.stderr

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### unloaded-settings-v1/full.stdout

Original bytes: 6553. SHA-256: `3aecdc8d184436a4a0b386ad05d76f642b49b085d9a17ff77a7d8046d3350103`.

Normalized bytes: 6553. SHA-256: `3aecdc8d184436a4a0b386ad05d76f642b49b085d9a17ff77a7d8046d3350103`.

````text
PASS: saved document preview, symlink refusal and read budget
PASS: owner exclusion, real dbmd persistence, duplicate submit, bounded tool loop, exact approval, artifact publication, restart, draft, incognito
PASS: terminal gating, undeclared tools, single-file scope, sibling refusal, source symlink substitution
PASS: fresh-URL Home restart, macOS system-alias IPC binding and user-symlink refusal
PASS: historical documents and citations, journal atomic acceptance and restart, duplicate/revision refusal and closed-owner guards
PASS: idempotent memory admission and complete eligible memory text in AI context
PASS: malformed termination, undeclared mixed calls and multiple proposals fail before execution
PASS: one bounded tool-schema correction, no partial execution, preserved review, exhausted-retry and unavailable-tool refusal
PASS: observed artifact=propose spelling correction without alias execution; rejection and stale approval refusal
PASS: invalid artifact and duplicate identities do not poison durable recovery
PASS: source Unicode boundaries and skipped symbolic links
PASS: model verification hash parity and mid-read cancellation without model allocation
PASS: coherent Home backup, complete manifest, exact drafts, pending review, inert restore, explicit activation, monotonic Forget, unknown epochs, corruption/missing/symlink/path/collision/closure refusal and create-only publication
PASS: external draft inspection, exact review race refusal, preserved versions, revision adoption, restart review, no implicit inference, malformed record refusal and normal work after reconciliation
PASS: long Home recent windows, exact retained history, inspectable partial excerpts, matching-memory ranking, bounded full-memory text, suppression lineage and thread-only read/write scope
PASS: Home promotion selection, visible quotations, exact model context, idempotence, drafts, permissions, scope, restart, Forget, active-run refusal and external edits
PASS: session model verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=true
PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
PASS: context overflow preserves messages and refuses instead of silently trimming history
PASS: clicks apply at once, saves merge in the background, a saved draft waits for disk, nothing is lost (2 saves)
PASS: cooperative cancellation, FIFO cross-thread scheduling, durable nonce registry
PASS: real process termination after intent, documents, artifact and root record; idempotent restart
PASS: per-thread external edits pause writes and preserve user bytes
PASS: authenticated Unix IPC, long Home paths, invalid capability refusal, Incognito isolation, idempotent client submission and detached completion
PASS: draft revision races, submit/autosave ordering, shared/thread-only/incognito recall, correction provenance and Forget
PASS: thinking off by default, sticky switch, live thought, receipt, answer now, tool turns think within their budget, restart, no thought on disk
PASS: incognito thought stays in memory and leaves with its thread; local endpoint thinking intents
PASS: response numbers add up across rounds, the reply line and copied details state them, receipts merge, the thought preview flows
PASS: a thinking job records exact per-round numbers, a refused round counts, thoughts keep one step per round, numbers persist without text, older runs still decode, live speed while thinking and writing, notes for the eight most recent runs
PASS: document helper sandbox denies file reads, folder listing, writes, loopback network, process launch, window server and home access; its memory limit counts the whole process group
PASS: multi-source attach, hidden and dependency folders skipped, PDF pages, word search fallback, image and scan recognition, RTF, Word, locked/damaged/oversized refusals, detach
PASS: tool groups follow access; cancelled document reading stops its helper
PASS: documented limits: eight attachments, 8 MB text files, 64 MB documents, 40 recognized pages per request, live folder navigation
PASS: tool-round narration stays out of answers and leads its activity
PASS: the model is told which files are attached, so "what is this?" has a referent
PASS: a refused proposal is corrected once, and a job that keeps being refused still stops
PASS: change tools follow access, read-before-edit, exact diff review, digest-bound approval, exact writes preserving mode and tags, undo with Trash recovery
PASS: external edits win, discard, hard-link refusal, symbolic-link swap refusal, review across restart with re-attached folder, Incognito read-only
PASS: process death while writing is reported after restart, never replayed, and undoable
PASS: knowledge base search and query, record-only tools, protected frontmatter/contract/paths, db.md writes, index and validation, undo with index rebuild, mid-write record edits kept
PASS: /skill proposal, reserved names, exact publication, /name use, no implied tools, tamper refusal, deactivation, restart
PASS: app review, exact publication, grants, host document, create/get/update/archive/restore, revision conflicts, scope and version refusals, malformed and nested data, db.md validation
PASS: app revision with shared data, version switching, tamper refusal, removal keeps data, Incognito, restart, write budget, inert restore, outside-edit pause
PASS: immediate folder grant, directory browsing, live creation/edit/rename/deletion, direct reads, stale-edit refusal
PASS: root confinement, hidden files, symlink boundaries, scoped dependency traversal, file-only grants, multi-source identity and detach
OBSERVATION: 12001-file attachment accepted in 7.137499051168561e-05 seconds (functional observation, not a benchmark)
PASS: large folder acceptance, gap-free listing and search, changed-directory refusal, cancellation and descriptor cleanup
PASS: within-file pagination, UTF-8 offsets, query binding, content mutation and explicit word matching
PASS: global stream ceiling, honest cursor eviction and complete restart
PASS: explicit depth coverage, direct deep navigation, accurate capability context and owner tool-loop integration
````

### unloaded-settings-v1/full.stderr

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### unloaded-settings-v1/build-identity.json

Original bytes: 40581. SHA-256: `d33f3febcda1a3f77825c07d5ad8279a8b3efb921a6097d00810ed64f823a04c`.

Normalized bytes: 40581. SHA-256: `d33f3febcda1a3f77825c07d5ad8279a8b3efb921a6097d00810ed64f823a04c`.

````text
{
  "binary_sha256": "2cf3e06a03c402d4f060a8ee5510166bf51df53f46b514710cfb353ab6d37435",
  "mac_build_inputs": {
    "dbmd_sha256": "3cc761c52629f220e5de40733d052884a3787885d696e26f07fdd1d1644d642b",
    "files": {
      "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
      "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
      "Sources/Slotstream/AppliedModelConfiguration.swift": "0042eecacbd2f4ddb136681c550237bb2ca1c4972035409a59bd4fddd1113aad",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
      "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
      "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
      "Sources/Slotstream/Checkpoint.swift": "361b54ab482ab1b08debf846148d16fb811ee3550cb8ca1ae7526dc9b825e04b",
      "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
      "Sources/Slotstream/ContextFeasibility.swift": "5e7d185542e5ef173683afd5e6999c7ec76c36bfa8e6d3356ec40d1b695edcfe",
      "Sources/Slotstream/ContextMemory.swift": "31da5a698303ec9898747052996996eeec2ac46d40b7c011791ea7b00e6bd23b",
      "Sources/Slotstream/ContextWindowPolicy.swift": "73b2321aae6a2c22fc7173467136770dbf45a1eca4a185293491472680a13a24",
      "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
      "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "24ca04e99cf4195e59bc08692b6bf62393872161c52f8b5eb1913c6282c9fb32",
      "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
      "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
      "Sources/Slotstream/ExpertPrefetch.swift": "46fb601813d05b788a3648139cbde2b88c94714a5e15f99456e4b2e7072f4b6a",
      "Sources/Slotstream/ExpertStore.swift": "4dae1ae2ff59f671ad4b6e0dbc6405fb198d2dc523ec9f2d9e00c9b2dfce7bcc",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
      "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
      "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
      "Sources/Slotstream/Generate.swift": "792159f8e9f11d1c98373c08e066b79908192d142d25a9f8bf2a6fbb22b48c82",
      "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
      "Sources/Slotstream/Governor.swift": "89310e4c1b2cef2b104122445a1ccdb118d4ea4c38ee7bd726d78261be74457b",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "a1e16af9d664959605f2e135f08c6a8c9c8188cbe08044317e0d5ca023d51031",
      "Sources/Slotstream/MTP.swift": "5319a480bd7b12ebad6223b6b0a6a4de32791ed1d1b8a4a3b41c9b4db04ae740",
      "Sources/Slotstream/MTPExpertStream.swift": "391b13fed457ba61a7cb4e107472a699ba87adc9a57cfd14580faa2dfbe50fd7",
      "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "1048ad7bcd1c9f93f5316465ed38d7bd93046fe4bfbd0fc138d972e646ee12ab",
      "Sources/Slotstream/ModelPackRegistry.swift": "56c7e6930287d9e8495d90e88e61df4dd062e78afa2767f4047941e1bb67aa5b",
      "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
      "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
      "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
      "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
      "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
      "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
      "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
      "Sources/Slotstream/PersistentPrefixFormat.swift": "d03795ee46252fe5df904591289af41a69811f2a211f437764d3f80ddb0d20ad",
      "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
      "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
      "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
      "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/Plan.swift": "240766430e77e186107a2b3eea844b8876bb509f92e2fbcfcea9d989e1a37b54",
      "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
      "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
      "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
      "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
      "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
      "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
      "Sources/Slotstream/RequestControl.swift": "56c5e664aaf33454f5ef45efedb3849ee539fd91e844d58885bf304f5aab3c1d",
      "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
      "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "8566a2a7734ae19f07aa3b4216b2c219687b52819b3ac86a2f79533d31ad03a5",
      "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
      "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
      "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
      "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
      "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
      "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
      "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
      "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
      "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
      "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
      "Sources/Slotstream/VQDraftWeights.swift": "232799bd52934647ea792473111ab1b671f1c6b563c7980c16036f2eeff10e72",
      "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
      "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
      "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
      "Sources/Slotstream/VQModelProbe.swift": "4425a383cfce125065b3ba829272e640837596de3c0bc2e7f6940866c9de55e8",
      "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
      "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
      "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
      "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
      "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
      "Sources/Slotstream/VQRecordCache.swift": "c455334e4817587d1070dc13a6bc9172404db6d28eae5e205a2a4493356b44b8",
      "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
      "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
      "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
      "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
      "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
      "Sources/Slotstream/VQTensorFile.swift": "34f45b06649d2c1ca11df11d887f7b48b51ae828cd03a074c9ed69e933fae52f",
      "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "1e0edf00c535c1aa605b996f83bd4f3f39d14a628f0f8a2d21667f069d823175",
      "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
      "Sources/Slotstream/Version.swift": "d68b6b9f343402041c33452b885eebce140773cc26379b4adaae996640427b40",
      "Sources/Slotstream/Vision.swift": "639b5c4bbe05654db411d587f31e7962d3db857aa4be38a2b54f982199d51eb5",
      "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
      "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
      "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
      "Sources/Slotstream/WeightStore.swift": "b7b9c43d6aaee926a6c13701e65cded306e9eb8483477b61ff81dcf212f39999",
      "Sources/Slotstream/Weights.swift": "01fb2c61390e6b7585eb80a34bf53a8c460fb6258908d57a3c1ed1fa77ec3ce8",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
      "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
      "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
      "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
      "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "25b469da9856405dd6421d6754d7caaeae378fc5e77ae1637a2552a139a810f7",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
      "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
      "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "b891dd485cafb3fc2bd4961fd4fd372e30cc496fb4c2bac414f4835ef51c0d3a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d1ac7938651c5b9db8e95706ab1f6802dbce55e3abcf9213df0407ddbfbe498c",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
      "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
      "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
      "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b18979a76cb2112a2beb8fd3196c1d26e36c2626c2a8de732b6b4fc134be61c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
      "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "defd0b98fc8730c9c146000036bf9436c06c5480d356a4f8ce9722091b1e1408",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "0669a24eee258eee4c9dc00fbc88350a62d8654ee5ff89093614a2f96ad79e31",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "f61cfb7d10f341e8ee12c32a58a874b10f27bb7ba5b8a9cde75e1217693867d8",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "31de09d8efc8951692f60fc9f5c4ec4d14dbef5b67656da18bca519ab4bcbcee",
      "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
      "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
      "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
      "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
      "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
      "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
      "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
      "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
      "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
      "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
      "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
      "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
      "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
      "Sources/SlotstreamTestKit/T0Checks.swift": "25bcf4ef6daeb29a31ebfacd2217bf12afb7788672f72c21d13ae7ac41aded97",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
      "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "d26e43367ba2d61d7afd9f5b175e95b714409b1717b86b9fe71f1306e36b6a81",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "3ba24ae3e24dd10214e3288f007952d9e2b06241c081e29313b42ac7aa7a31bb",
      "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
      "Sources/slotstream-cli/DraftStreamCommands.swift": "4fd131e2303fd4f2c9765fff9b2543011d565dd5c070b8b380910528c9026a33",
      "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "249274657b4f4f4c3e694a2b0db671b3af8b92a2148495647f3be9092f48f6b2",
      "Sources/slotstream-cli/LaunchCommand.swift": "a18212935aa5aa2c956593838ef181ccbf0aae2501b7a0071f4b4b44298ea0f9",
      "Sources/slotstream-cli/MTPCommands.swift": "04d06d66f29339b4d88dfbae7be18ef873c32c09320536ee7916e7d621816e08",
      "Sources/slotstream-cli/ModelPackCommand.swift": "daaa7bf13449090afb10d04c7ecc2a6bf9af5c0f9c182e758417aeb1a51408fa",
      "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
      "Sources/slotstream-cli/PrefixExactCommands.swift": "b70f0a6f2536f0eb1fc00007260cc6dffe2592b1f32271225fe1304261346e28",
      "Sources/slotstream-cli/Pull.swift": "ca9f9e90ef959b194653945e29ebd3b9f1932ef3e46dfceaa7b09562fa2c9d7b",
      "Sources/slotstream-cli/QuantizationCommands.swift": "50ea6769debcb32efa23b89ae9230a0d756a521347af177f189adf9592922c2b",
      "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
      "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
      "Sources/slotstream-cli/VisionCommands.swift": "126a5bb05ccc6549337f04048d88256fcc106686dc8fb062d3759dad13af7971",
      "Sources/slotstream-cli/main.swift": "1cb37b9bcaf61a3766317f56c79ea8c3dbc9145a14eed3f974054bc22b7964ce",
      "Tools/build_sevra_mac.sh": "debb9110cd8e316bac4e153e9f7cfe07fe0437dbb8e781bb50bcf93b0488771d",
      "Tools/generate_sevra_icon.sh": "8228ccb8e4d707c2a73336f283ed599f72cbc2213589ca36191d675e737141b6",
      "Tools/lib/mlx-0.32.2.metallib": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
      "Tools/mac_build_inputs.py": "1e406cea50efb4125d0d5fc45be838288ee440d90097dc508ce2b0d3ad68eb1a",
      "Tools/render_sevra_icon.swift": "cbcf593dec275773cc86118bc4d6aff423534d9df7e62ef0fb014733c9aa3095",
      "apps/macos/App/AppModel.swift": "aea5ef70be88b171a1932c3370909c044880177d6651f3b961f219036e29f3f6",
      "apps/macos/App/AppModelWork.swift": "76f3d80447c5b4a829ac4bc1e0f429ee3f1df76a53f06b3110c03b75e9e90d14",
      "apps/macos/App/ContentView.swift": "f64f31bc3cfe9ab8f8d1c207f1e137ebe1102927ec4e1f409c21fab3d0cc5745",
      "apps/macos/App/MacCommands.swift": "e85cc090add3bfd42cc259727fcc16c76f44307a5172e40a96dd7f74747674c6",
      "apps/macos/App/MiniAppHost.swift": "9720c739c4ef11b56e3cb3e30bcca6e17f3c97ba7cf4d3e26ad743d0e7e82bec",
      "apps/macos/App/NativeControls.swift": "a66a3219a431dc4523a1c8ec16e6372331123b7c43888e75c250047e60193729",
      "apps/macos/App/NativeText.swift": "bb471331e742b37bee04fea4db02c80506c91e95597faa12c23962aea8c7d614",
      "apps/macos/App/ObserverMark.swift": "93f172ecc0b360338bb09913071a6ba6644077576abf9b323bfa95ebd4c5b764",
      "apps/macos/App/ResponseDetails.swift": "fe85363dc19a3a767250df73cdb566a4e22117236b9137bfd5853e19ff437087",
      "apps/macos/App/SevraMain.swift": "7ae10c0cf10b4ffda3c54416db51f589eac0a8eb1f59b24a3e5ffa01da7cbd34",
      "apps/macos/App/WindowState.swift": "c3782b38d4ff1342587aef3e54688bc0fb6160f92388f8b4de1742780d09a96e",
      "apps/macos/App/WorkViews.swift": "27be9436faf7b6b56adc0892f13b911652bbc1960493765fb869a7b14edc8af9",
      "apps/macos/CSandbox/include/sevra_sandbox.h": "7885534cb39319e57ebe6dcf196447e2a50b31fdf31ca8c13fe2457f005477d9",
      "apps/macos/CSandbox/sevra_sandbox.c": "6172c4955a01baf46affb019f5f1be32b8d388371203ecd41802f5ba9bd5a3f8",
      "apps/macos/Extract/main.swift": "1892d923b140622e1698c1c0f1eaba5f9684921f4917cdec52003b26f89617f5",
      "apps/macos/Info.plist": "73cc83e91b2729b1ef576226fd95104e0bb763f874fe937d81d92d9785e8bdb6",
      "apps/macos/Package.resolved": "2d751ea715e77a0a7994c55a13e23b0327b9e6b42827ec7603cf740f44d53da4",
      "apps/macos/Package.swift": "2d9e44a7d3a5067d7eecb4f9a929b355943fcad7d91e56eabaa9a160a47bb201",
      "apps/macos/Presentation/ComposerSession.swift": "1e0ec10e4833da338b289e6b766b4d471924e47cd1f5cfb5d301cdbd4b719ef6",
      "apps/macos/Presentation/HistoryPage.swift": "576e721818d61bfd988b6f57b136aab6bbb8c847f8e8a2116ce76708f4f4f84d",
      "apps/macos/Presentation/MarkdownDocument.swift": "39fa604d4b09e8fdd61cd4b5be33c912fd748501c4aaeb7f2f420023b9fe6a45",
      "apps/macos/Presentation/Module.swift": "dda9b75f64b106eb544de201f599122d75abc483c5b156bba6c05c0f956dbc3c",
      "apps/macos/Resources/Fonts/Inter-OFL.txt": "5b9321a4298cfeb6b34354164a1c3afc3db114569984c502b9b35d988fd58c57",
      "apps/macos/Resources/Fonts/Inter.ttf": "29160a80ff49ddcab2c97711247e08b1fab27a484a329ce8b813d820dc559031",
      "apps/macos/Resources/Fonts/Poppins-Medium.ttf": "90373e7d838d32468438fc3e152dca0bdb12edcab99ea639f158790b1ba1fd05",
      "apps/macos/Resources/Fonts/Poppins-OFL.txt": "6be04893d770899a015649c7aa3b582f871b272f8747a92b78b17c3e5c8b2573",
      "apps/macos/Resources/Fonts/manifest.json": "1e79dfd278dbe9bfd8afbf7e5cbaee64dff1574fc1cc3aca8fdd903f4056677e",
      "apps/macos/Resources/Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
      "apps/macos/Resources/Licenses/VQLab-NOTICE.txt": "04d3fc0f5e2ddf3570b5895316cbee7a62d7d75bdd216c39b3aee95c8942941d",
      "apps/macos/Resources/Licenses/swift-cmark-COPYING": "c22e885f33b821bddb24cf007145e5540655b6c0f403e49e6c76a93c28e6d9a9",
      "apps/macos/Resources/Licenses/swift-markdown-LICENSE.txt": "167beb36f181bd163c93c6feb45c68e5f9462fe1af55b278f7bfd1df20e673a3",
      "apps/macos/Resources/Licenses/swift-markdown-NOTICE.txt": "ee7da43afcac4a52196a2141024573ec2ceb84b14e74dfed38522d94586fbc52",
      "apps/macos/Resources/Sevra.icns": "b28f2df8e40cafc2e89fb3ae5a0e361b5470851d833495df9b3dd4ca0395471d",
      "apps/macos/Runtime/Changes.swift": "17735c951b3bef2c2b30f6fe029b5e8f635364513a7669da770d934815411e7d",
      "apps/macos/Runtime/ConversationContext.swift": "89a1a6cfd9b3d879a53c40443e3c02bcef380f1599354fc386469bd4d39d81e7",
      "apps/macos/Runtime/Extensions.swift": "632ed6d2ec6d1704b24c79c5c71a1ce790a37a1fdbbb24ac5c1db32cb0ac9406",
      "apps/macos/Runtime/Extraction.swift": "5bc0b25ad3b29481bb2b92491cff976934d9f5f92ca3bf4dc83988b056be8955",
      "apps/macos/Runtime/HomeArchive.swift": "d43376db4e1d7bb6919bf3e332477fffa28ceefdc92d0b90ff6b206fe18fb169",
      "apps/macos/Runtime/HomeStore.swift": "0a4db7db75f1de1f3042a78af86e6057377b92deab4639326040a620e609a49b",
      "apps/macos/Runtime/HomeTemplate.swift": "e25b0a112abdea7d915c1f553fb3b62078b8ab35ab60dc5c3d80a82468caa7a2",
      "apps/macos/Runtime/HomeWriter.swift": "d61aa8ebc3ee627a5281100eb77cec4eaf633fcd97a792a5a4290136f499c303",
      "apps/macos/Runtime/Inference.swift": "a690583eddce6facd924e18622845f9a7e7ecdc33a255c52292f377f2e76873a",
      "apps/macos/Runtime/InferenceCache.swift": "48aa1f16913c2ac4f227b11e76131c2d5e4860403cbc6280de91946b19aba670",
      "apps/macos/Runtime/LocalIPC.swift": "2f9ca541d07687034f6808958e54397f017f260d394216ab71cd8221bb3d599e",
      "apps/macos/Runtime/ModelSetup.swift": "3080010ef569fbee93c372a61699ef13e4ac4066a1be40815e991ff647b16e62",
      "apps/macos/Runtime/ModelVerification.swift": "29564d5f03207e4286f6ab8ab286a22dac58de92bb459f3f765417a99ce38e53",
      "apps/macos/Runtime/Models.swift": "6ee898c4a2a092f30eb5696829235ab391d3e0290319a88e38b94ec1c63ab3f5",
      "apps/macos/Runtime/Performance.swift": "b377ed9652f1321db355daefc7371d8c048173b56a13a5c2d7ed484949895b78",
      "apps/macos/Runtime/ResponseMetrics.swift": "91db9f1ce48a14f16b5e9b516dfdf20e0354e475a170f6888c88018cff6ca737",
      "apps/macos/Runtime/Runtime.swift": "4ac3bda459c64c41d4bc5c4ce461e0c60889913c913873237c8bc7b3cfca9b48",
      "apps/macos/Runtime/RuntimeExtensions.swift": "8a03804b02763569d839359064fa22e0a50e88907a56dd5eeaf5f88b327ce311",
      "apps/macos/Runtime/SourceNavigation.swift": "c2286df52a8a3ec200a5adad3162c899c08e480b858a15e1fe5e0634202cbb3e",
      "apps/macos/Runtime/Sources.swift": "b458dc283490f833ad50e17079af849d644d27408c45b7f04e01dbb059e59267",
      "apps/macos/Runtime/Thinking.swift": "be477cb342ac1057a5fcd82842b498cbbb7ecfb91548e5ce49e4aef9fcbee420",
      "apps/macos/Runtime/Tools.swift": "6cd7577792d86d6a2d31ba24d0e4bdf55374a5b443954d3584e27404f725d52f",
      "apps/macos/Sevra.xcodeproj/project.pbxproj": "dc22426b24c2c8eafe143ad67c087f800a7708e2d7c6d43ba7f9e4a0abe3040c"
    },
    "scope": "Local development build inputs. Ad-hoc signing is not release qualification.",
    "sdk": "26.5",
    "swift": "Apple Swift version 6.3.3 (swiftlang-6.3.3.1.3 clang-2100.1.1.101)\nTarget: arm64-apple-macosx26.0"
  },
  "changed_files": {
    "apps/macos/Runtime/Inference.swift": "a690583eddce6facd924e18622845f9a7e7ecdc33a255c52292f377f2e76873a",
    "Tools/check_sevra_mac.sh": "23e11d9ac75896b4045af3893717351db5462d5c9d942500d7cd97034259e40a"
  },
  "test_commands": [
    "Copy the exact before/after sevra-mac-checks binary alone into a new temporary directory; run that copy with --performance from that directory.",
    "SEVRA_EXTRACT=apps/macos/.build/release/sevra-extract apps/macos/.build/release/sevra-mac-checks"
  ],
  "result": {
    "binary_sha256": "2cf3e06a03c402d4f060a8ee5510166bf51df53f46b514710cfb353ab6d37435",
    "before_failure_reproduced": true,
    "before_receipt_note": "The initial receipt inspected stderr only; MLX writes this error to stdout. The preserved output confirms the failure.",
    "runs": [
      {
        "case": "copied-binary-no-metallib",
        "exit": 0
      },
      {
        "case": "full-scripted-runtime",
        "exit": 0
      }
    ],
    "passed": true
  }
}
````
