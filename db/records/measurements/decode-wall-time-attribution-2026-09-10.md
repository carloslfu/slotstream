---
type: measurement
id: 01m26qfx8tk5y5dwprygzhegmy
created: 2026-09-10T22:37:24.122552+00:00
updated: 2026-09-10T22:38:19.474256+00:00
summary: Decode wall-time attribution with natural GPU boundaries
date: 2026-09-10
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '790'
runs: '[[sources/runs/2026/09/2026-09-10-decode-wall-time-attribution]], [[sources/runs/2026/09/2026-09-10-decode-attribution-discarded-attempts]]'
title: Decode wall-time attribution with natural GPU boundaries
status: measured
---
**The largest individual elapsed-time category is the expert file-read phase.** In the qualified 512-output observation it occupies 33.6654% of decode, staging preparation adds 1.6095%, GPU encoder execution occupies 31.9764%, and the remaining CPU work/coordination occupies 32.7487%. The completed smaller-cache control spends 42.8458% on reads plus staging, so a generic claim that expert I/O is always 40–45% is unsupported. These percentages describe specific workloads and memory settings, not every use of Slotstream.

**Protocol and scope.** Apple M5 Pro, 48 GiB unified memory, internal 2 TB SSD, macOS 26.6.2. Native Slotstream base `449f3841d65cbca8346ab6ae8092eb0948d92dbd`, mlx-swift `0bb916c67f4b9e5c682cbe02a42c701c93ab5021`. The working HEAD later differs in the version string and a server helper's visibility, not the measured inference implementation. The frozen profiling binary SHA-256 is `3121d93bdd1040cdb0500b4444a043cc0e59fb51c6b3ad12696a2dad0250471c`.

Every arm uses a fresh server, the same 521-token text prompt, one same-length warmup, greedy generation, MTP depth one when enabled, prefill chunk 256, no elastic resizing and no prefix retention. Profiled and disabled arms alternate order by round. The large profile has a 24 GB total target and 5,702 expert slots, 15.765 GB of quantized weights. The small control has a 10 GB target and 1,217 slots, 3.365 GB. This is not the auto-sized demo server's exact cache configuration. Decode excludes model load, prefill, request queuing, and trace serialization. It uses the generator's own decode interval, including callbacks and decode state work. On/off pairs preserve exact output-token IDs, read-byte counts and slot counts.

The 512-output pair takes 43.943496584 seconds disabled and 42.447254083 seconds profiled. Only one of its three requested pairs passes the no-swap gate. Its measured native workload reads 129,674,649,600 bytes in 46,902 expert records, approximately 253.271 MB per emitted token. Cache hit rate is 81.6340%; 190 of 321 drafts are accepted. These are decimal bytes/MB/GB. The 128-output large-cache cohort retains three of four pairs, reads 27,048,038,400 bytes per measured response, and has an 84.3221% cache hit rate.

**Partition of 100% of elapsed decode.** The long column is its sole qualified trace. The short column divides summed exclusive category seconds by summed decode seconds across all three clean traces, including the slow pair. It is not a best-of selection. Small display-rounding differences do not change the exact 100% partition.

| Elapsed-time attribution | 512 outputs, one clean pair | 128 outputs, three clean pairs |
| --- | ---: | ---: |
| SSD file-read workers and waits | 33.6654% | 30.2487% |
| Allocate and wrap RAM staging buffers | 1.6095% | 1.7536% |
| GPU writes from staging RAM into the expert cache | 1.8817% | 1.6831% |
| GPU expert calculations and output mixing | 8.1593% | 8.6271% |
| GPU cache writes and expert calculations together | 4.6890% | 4.0888% |
| GPU recurrent layers, with associated normalization and routing | 9.7901% | 10.2493% |
| GPU attention layers, with associated normalization | 2.4684% | 2.5197% |
| GPU remaining normalization, routing and residual operations | 2.1355% | 2.2359% |
| GPU vocabulary, ngram embedding, MTP head, sampling and other passes | 2.8523% | 2.9522% |
| CPU Metal command preparation and driver calls | 9.9556% | 11.2440% |
| CPU graph evaluation, scheduling and synchronization | 10.4297% | 10.4863% |
| CPU model graphs, cache bookkeeping, MTP state and output | 12.3635% | 13.9113% |
| Total before display rounding | 100% | 100% |

**What loading means.** On a miss, `ExpertStore.readBatchChecked` dispatches and joins worker lanes issuing `pread` calls into aligned temporary RAM buffers. Each complete quantized expert record is 2,764,800 bytes across nine pieces. Staging is wrapped as MLX arrays; later GPU scatter kernels copy the quantized bytes into persistent cache slots. The CPU and GPU share physical RAM, so this is SSD to staging RAM, then a copy within RAM, then GPU reads/calculations. There is no discrete-GPU PCIe upload stage in this Mac path. The file layer requests `F_NOCACHE` and disables read-ahead. The ordinary checkpoint path ignores those calls' return values, so this trace establishes file-read-path latency and requested bytes, not a hardware measurement of NAND service time or guaranteed physical SSD bytes. The read row includes worker scheduling, syscall/OS work and waits, with separately measured staging allocation/wrapping removed.

**Why the GPU/CPU rows are honest but not individual-kernel timers.** CPU host scopes, MLX Metal command-preparation spans, and native GPU encoder timestamps share a checked clock. Analysis sweeps all endpoints and counts each interval once: observed GPU execution first; then host read/staging/ngram-fetch phases; then CPU Metal encoding; then the remaining host scope. Concurrent CPU work is represented under the GPU category during that overlap. This is a declared wall-time attribution, not a unique causal decomposition, the sum of CPU utilization and GPU utilization, or pure arithmetic time. A GPU encoder's envelope includes memory access, scheduling and barriers. CPU evaluation/synchronization means time in that host scope after observed GPU execution and Metal encoding have been removed; it is not all active CPU computation or all sleeping.

Natural GPU passes can include several functional operations. Cache writes and expert calculations share a row when they occur in the same pass or overlap on the GPU; that time cannot be split without changing execution. GDN and attention rows likewise include associated normalization and routing in their natural passes. The remaining tensor row includes normalization, routing and residual operations. Untagged GPU passes occupy only 0.062293% of the long trace and stay explicitly visible in the full partition. MTP native draft/verification timers overlap these categories and must not be added again. GPU-pass union and host/encoder attribution account for every nanosecond of the measured interval, with zero uncovered time, invalid GPU samples or overlapping host labels; CPU/GPU clock scale is one.

**Profiler qualification and limits.** Mode4 keeps natural encoder boundaries; counter-buffer allocation/rollover and trace bookkeeping still have a cost. Mode0 disables the active instrumentation in the same diagnostic build, so it retains the compiled tag/branch scaffolding and is not a separate pristine-binary A/B. The source stays isolated from production. The short large-cache paired timing changes range from -1.938% to +14.964%, with a median -0.558%. The long pair is -3.405%. Negative values are timing variability, not profiler speed gains; these observations do not prove zero overhead or a fixed overhead bound. The separate encoder-splitting profiler increases its short pair's duration by 10.73% and is excluded.

| Protocol | Clean matched pairs | Disabled median, seconds | Profiled median, seconds | Median paired profiling change |
| --- | ---: | ---: | ---: | ---: |
| 10 GB, MTP off, 32 outputs | 1 | 4.228180 | 4.160559 | -1.599% |
| 10 GB, MTP off, 128 outputs | 1 | 16.893156 | 16.837556 | -0.329% |
| 24 GB, MTP on, 128 outputs | 3 | 10.129347 | 9.933006 | -0.558% |
| 24 GB, MTP on, 512 outputs | 1 | 43.943497 | 42.447254 | -3.405% |

Every accepted decode has unchanged global swap-in and swap-out counters, nominal thermal state at the generator observations, and low-power mode disabled. Counter readings and process contention checks are sampled, not continuous proof that the machine was otherwise idle. Earlier long attempts, early endings, headroom refusals, the counter allocation failure and every swap-contaminated pair remain in [[sources/runs/2026/09/2026-09-10-decode-attribution-discarded-attempts]]. No clean sibling of an invalid pair enters the timing comparison. The 128- and 512-output measurements do not establish a workload-independent distribution or long-context behavior.

**First-principles implication.** Each layer's router must produce expert IDs before the host can resolve misses. The host then waits for the required bytes and submits dependent cache/expert work; layer evaluation also provides the lifetime boundary needed to reuse cache slots safely. Sparse activation reduces weights needed per step, but miss traffic remains hundreds of MB per output here, and repeated CPU/GPU handoffs remain costly even on cache hits. SSD reads are the largest single category; CPU graph/Metal coordination is comparable in aggregate. Removing the file-read phase alone would leave about two-thirds of the observed time, before accounting for changed overlap and cache-copy work. A faster SSD or larger cache alone is therefore not evidence of a proportional whole-decode speedup.

**Production and reproducibility.** All instrumentation lives in the ignored detached worktree and isolated MLX dependency copy. No production source, installed executable or installed Metal library was replaced for this measurement. The original installed binary hash matches the restoration proof, and the normal demo server is again listening on port 11434. Raw accepted GPU/CPU traces are losslessly archived and round-trip hash checked. The exact native sources, later driver checks, offline analyzer, fixture, raw results and exclusions are bound by [[sources/runs/2026/09/2026-09-10-decode-wall-time-attribution]]. Analysis can be rerun by decompressing the retained JSON traces and running the archived `analyze.py`; `summarize_final.py` specifies the cohort and grouping arithmetic.

Full exclusive partition of the qualified long trace follows; the CPU loop category includes checkpoints, allocation admission, state/setup and loop work outside the explicitly tagged scopes.

| Exclusive interval category | Percent of 512-output decode |
| --- | ---: |
| Host: expert file read | 33.665360% |
| Host: graph evaluation and synchronization | 10.429658% |
| CPU: Metal command preparation and driver calls | 9.955589% |
| GPU: GDN layer preparation (normalization, recurrence, routing) | 9.790136% |
| GPU: expert calculations and output mixing | 8.159304% |
| GPU: cache writes and expert calculations together | 4.689038% |
| Host: residual/other | 4.653391% |
| GPU: attention layer preparation (normalization, attention) | 2.468408% |
| Host: state reconciliation | 2.421033% |
| GPU: normalization, routing and residual operations | 2.135506% |
| GPU: cache writes | 1.881667% |
| Host: staging allocation and wrapping | 1.609544% |
| GPU: MTP head and state updates | 1.501168% |
| Host: hyperconnections and normalization | 1.086041% |
| GPU: final mixing and vocabulary projection | 1.035660% |
| Host: GDN recurrence | 1.012478% |
| Host: routed experts | 0.584328% |
| Host: cache slot write | 0.504666% |
| Host: GDN projections and convolution | 0.466066% |
| Host: attention | 0.442764% |
| GPU: ngram embedding and preparation | 0.212956% |
| Host: sampling | 0.201171% |
| Host: cache lookup and eviction | 0.190812% |
| Host: output callback | 0.170326% |
| Host: draft head | 0.158004% |
| Host: shared expert | 0.132315% |
| Host: router | 0.130325% |
| Host: attention indexer | 0.091195% |
| Host: GDN output | 0.069897% |
| GPU: other tensor passes (untagged) | 0.062293% |
| GPU: sampling | 0.040244% |
| Host: ngram PLE | 0.037321% |
| Host: embedding | 0.009062% |
| Host: ngram row prefetch | 0.001880% |
| Host: output projection | 0.000394% |
