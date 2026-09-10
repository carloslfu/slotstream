---
type: run
id: 01m1vq7h77j25xf8w46102tkkh
created: 2026-09-06T16:01:10.887125+00:00
updated: 2026-09-06T16:01:20.154695+00:00
summary: Router-shape correction and preserved nine-failure numerical counterexample
binary: Frozen build 10; source archive retained
captured_at: 2026-09-06
command: Exact commands and identities below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Router-shape correction and preserved numerical counterexample
tool: Native Swift diagnostics
---
# Router-shape correction and remaining full-model counterexample

Build 10 isolates the small-prefill router projection shape. Padding only its
FP32 projection inputs to the existing 256-row dispatch shape removes the
first divergence observed in the four-layer instrumentation. Inputs, router,
routed/shared expert outputs, attention and injections in that probe then
match the 256-row control exactly. The observer forces intermediate evaluation;
this is a mechanistic observation, not full-model proof.

The unchanged C07 full-model gate still fails 9 of 1604 assertions. Prefill
state/logit bands pass, but teacher-forced continuation and speculative
rollback expose remaining divergence. No acceptance tolerance, input, teacher
suffix or expected greedy token was changed. Repeated candidate execution
remains exact. The public implementation limit remains 65536; no capacity
ladder has started and neither the 64 nor 128 path is qualified.

A prospective successor pads only the ephemeral, causally masked attention
key domain to the reference 256-row boundary, prices that actual padded
workspace, and retains the query-by-key bound. This hypothesis is unbuilt
and untested at capture. It does not change logical tokens or retained state.

The short component probes overlapped transport compilation. All timing and
capacity conclusions from these observations are excluded. The full numerical
gate is correctness evidence only, independent of its VM counters. Original
output bytes and portable process observations follow. Earlier counterexamples
remain at [[sources/runs/2026/09/2026-09-06-configurable-context-small-pass-diagnosis]].

## components-10/stdout.txt

SHA-256 `4b2a5e07e1c8cb6ec0692bf981cfeb7f15b0357de118653217e81fd9df0a8481`; 16815 bytes.

````text
{
  "items" : [
    {
      "name" : "256: exact committed count",
      "passed" : true
    },
    {
      "name" : "512: exact committed count",
      "passed" : true
    },
    {
      "name" : "64: exact committed count",
      "passed" : true
    },
    {
      "name" : "0.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.routed.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.routed.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.router.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.router.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.sharedGate.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.sharedGate.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.sharedValue.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.sharedValue.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.x2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.routed.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.routed.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.router.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.router.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.sharedGate.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.sharedGate.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.sharedValue.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.sharedValue.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.x2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.routed.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.routed.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.router.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.router.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.sharedGate.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.sharedGate.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.sharedValue.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.sharedValue.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.x2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.routed.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.routed.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.router.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.router.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.sharedGate.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.sharedGate.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.sharedValue.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.sharedValue.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.x2.arm2: finite",
      "passed" : true
    }
  ],
  "measurements" : {
    "0.attn.arm1.different" : 0,
    "0.attn.arm1.first_row" : -1,
    "0.attn.arm1.relative" : 0,
    "0.attn.arm2.different" : 0,
    "0.attn.arm2.first_row" : -1,
    "0.attn.arm2.relative" : 0,
    "0.hAfterAttn.arm1.different" : 0,
    "0.hAfterAttn.arm1.first_row" : -1,
    "0.hAfterAttn.arm1.relative" : 0,
    "0.hAfterAttn.arm2.different" : 0,
    "0.hAfterAttn.arm2.first_row" : -1,
    "0.hAfterAttn.arm2.relative" : 0,
    "0.inj1.arm1.different" : 0,
    "0.inj1.arm1.first_row" : -1,
    "0.inj1.arm1.relative" : 0,
    "0.inj1.arm2.different" : 0,
    "0.inj1.arm2.first_row" : -1,
    "0.inj1.arm2.relative" : 0,
    "0.inj2.arm1.different" : 0,
    "0.inj2.arm1.first_row" : -1,
    "0.inj2.arm1.relative" : 0,
    "0.inj2.arm2.different" : 0,
    "0.inj2.arm2.first_row" : -1,
    "0.inj2.arm2.relative" : 0,
    "0.moe.arm1.different" : 0,
    "0.moe.arm1.first_row" : -1,
    "0.moe.arm1.relative" : 0,
    "0.moe.arm2.different" : 181,
    "0.moe.arm2.first_row" : 4,
    "0.moe.arm2.relative" : 0.0004006410308647901,
    "0.routed.arm1.different" : 0,
    "0.routed.arm1.first_row" : -1,
    "0.routed.arm1.relative" : 0,
    "0.routed.arm2.different" : 983,
    "0.routed.arm2.first_row" : 0,
    "0.routed.arm2.relative" : 0.0010775862028822303,
    "0.router.arm1.different" : 0,
    "0.router.arm1.first_row" : -1,
    "0.router.arm1.relative" : 0,
    "0.router.arm2.different" : 232940,
    "0.router.arm2.first_row" : 0,
    "0.router.arm2.relative" : 1.3812008319291635e-06,
    "0.sharedGate.arm1.different" : 0,
    "0.sharedGate.arm1.first_row" : -1,
    "0.sharedGate.arm1.relative" : 0,
    "0.sharedGate.arm2.different" : 0,
    "0.sharedGate.arm2.first_row" : -1,
    "0.sharedGate.arm2.relative" : 0,
    "0.sharedValue.arm1.different" : 0,
    "0.sharedValue.arm1.first_row" : -1,
    "0.sharedValue.arm1.relative" : 0,
    "0.sharedValue.arm2.different" : 0,
    "0.sharedValue.arm2.first_row" : -1,
    "0.sharedValue.arm2.relative" : 0,
    "0.x1.arm1.different" : 0,
    "0.x1.arm1.first_row" : -1,
    "0.x1.arm1.relative" : 0,
    "0.x1.arm2.different" : 0,
    "0.x1.arm2.first_row" : -1,
    "0.x1.arm2.relative" : 0,
    "0.x2.arm1.different" : 0,
    "0.x2.arm1.first_row" : -1,
    "0.x2.arm1.relative" : 0,
    "0.x2.arm2.different" : 0,
    "0.x2.arm2.first_row" : -1,
    "0.x2.arm2.relative" : 0,
    "1.attn.arm1.different" : 0,
    "1.attn.arm1.first_row" : -1,
    "1.attn.arm1.relative" : 0,
    "1.attn.arm2.different" : 387559,
    "1.attn.arm2.first_row" : 6,
    "1.attn.arm2.relative" : 0.0035211266949772835,
    "1.hAfterAttn.arm1.different" : 0,
    "1.hAfterAttn.arm1.first_row" : -1,
    "1.hAfterAttn.arm1.relative" : 0,
    "1.hAfterAttn.arm2.different" : 298983,
    "1.hAfterAttn.arm2.first_row" : 5,
    "1.hAfterAttn.arm2.relative" : 0.0015060240402817726,
    "1.inj1.arm1.different" : 0,
    "1.inj1.arm1.first_row" : -1,
    "1.inj1.arm1.relative" : 0,
    "1.inj1.arm2.different" : 0,
    "1.inj1.arm2.first_row" : -1,
    "1.inj1.arm2.relative" : 0,
    "1.inj2.arm1.different" : 0,
    "1.inj2.arm1.first_row" : -1,
    "1.inj2.arm1.relative" : 0,
    "1.inj2.arm2.different" : 114,
    "1.inj2.arm2.first_row" : 9,
    "1.inj2.arm2.relative" : 0.005681818351149559,
    "1.moe.arm1.different" : 0,
    "1.moe.arm1.first_row" : -1,
    "1.moe.arm1.relative" : 0,
    "1.moe.arm2.different" : 851395,
    "1.moe.arm2.first_row" : 1,
    "1.moe.arm2.relative" : 0.05115445703268051,
    "1.routed.arm1.different" : 0,
    "1.routed.arm1.first_row" : -1,
    "1.routed.arm1.relative" : 0,
    "1.routed.arm2.different" : 886138,
    "1.routed.arm2.first_row" : 0,
    "1.routed.arm2.relative" : 0.05161290243268013,
    "1.router.arm1.different" : 0,
    "1.router.arm1.first_row" : -1,
    "1.router.arm1.relative" : 0,
    "1.router.arm2.different" : 263344,
    "1.router.arm2.first_row" : 0,
    "1.router.arm2.relative" : 0.01356677245348692,
    "1.sharedGate.arm1.different" : 0,
    "1.sharedGate.arm1.first_row" : -1,
    "1.sharedGate.arm1.relative" : 0,
    "1.sharedGate.arm2.different" : 29,
    "1.sharedGate.arm2.first_row" : 7,
    "1.sharedGate.arm2.relative" : 0.006849315017461777,
    "1.sharedValue.arm1.different" : 0,
    "1.sharedValue.arm1.first_row" : -1,
    "1.sharedValue.arm1.relative" : 0,
    "1.sharedValue.arm2.different" : 842046,
    "1.sharedValue.arm2.first_row" : 5,
    "1.sharedValue.arm2.relative" : 0.047979798167943954,
    "1.x1.arm1.different" : 0,
    "1.x1.arm1.first_row" : -1,
    "1.x1.arm1.relative" : 0,
    "1.x1.arm2.different" : 2277,
    "1.x1.arm2.first_row" : 6,
    "1.x1.arm2.relative" : 0.0027624310459941626,
    "1.x2.arm1.different" : 0,
    "1.x2.arm1.first_row" : -1,
    "1.x2.arm1.relative" : 0,
    "1.x2.arm2.different" : 274577,
    "1.x2.arm2.first_row" : 5,
    "1.x2.arm2.relative" : 0.07772020995616913,
    "2.attn.arm1.different" : 0,
    "2.attn.arm1.first_row" : -1,
    "2.attn.arm1.relative" : 0,
    "2.attn.arm2.different" : 1031841,
    "2.attn.arm2.first_row" : 1,
    "2.attn.arm2.relative" : 0.013681592419743538,
    "2.hAfterAttn.arm1.different" : 0,
    "2.hAfterAttn.arm1.first_row" : -1,
    "2.hAfterAttn.arm1.relative" : 0,
    "2.hAfterAttn.arm2.different" : 1584869,
    "2.hAfterAttn.arm2.first_row" : 1,
    "2.hAfterAttn.arm2.relative" : 0.011106927879154682,
    "2.inj1.arm1.different" : 0,
    "2.inj1.arm1.first_row" : -1,
    "2.inj1.arm1.relative" : 0,
    "2.inj1.arm2.different" : 87,
    "2.inj1.arm2.first_row" : 6,
    "2.inj1.arm2.relative" : 0.010416666977107525,
    "2.inj2.arm1.different" : 0,
    "2.inj2.arm1.first_row" : -1,
    "2.inj2.arm1.relative" : 0,
    "2.inj2.arm2.different" : 327,
    "2.inj2.arm2.first_row" : 2,
    "2.inj2.arm2.relative" : 0.014150943607091904,
    "2.moe.arm1.different" : 0,
    "2.moe.arm1.first_row" : -1,
    "2.moe.arm1.relative" : 0,
    "2.moe.arm2.different" : 980332,
    "2.moe.arm2.first_row" : 1,
    "2.moe.arm2.relative" : 0.06030701845884323,
    "2.routed.arm1.different" : 0,
    "2.routed.arm1.first_row" : -1,
    "2.routed.arm1.relative" : 0,
    "2.routed.arm2.different" : 1019248,
    "2.routed.arm2.first_row" : 0,
    "2.routed.arm2.relative" : 0.107666015625,
    "2.router.arm1.different" : 0,
    "2.router.arm1.first_row" : -1,
    "2.router.arm1.relative" : 0,
    "2.router.arm2.different" : 263614,
    "2.router.arm2.first_row" : 0,
    "2.router.arm2.relative" : 0.019267095252871513,
    "2.sharedGate.arm1.different" : 0,
    "2.sharedGate.arm1.first_row" : -1,
    "2.sharedGate.arm1.relative" : 0,
    "2.sharedGate.arm2.different" : 83,
    "2.sharedGate.arm2.first_row" : 2,
    "2.sharedGate.arm2.relative" : 0.01550387591123581,
    "2.sharedValue.arm1.different" : 0,
    "2.sharedValue.arm1.first_row" : -1,
    "2.sharedValue.arm1.relative" : 0,
    "2.sharedValue.arm2.different" : 969955,
    "2.sharedValue.arm2.first_row" : 1,
    "2.sharedValue.arm2.relative" : 0.02259887009859085,
    "2.x1.arm1.different" : 0,
    "2.x1.arm1.first_row" : -1,
    "2.x1.arm1.relative" : 0,
    "2.x1.arm2.different" : 601889,
    "2.x1.arm2.first_row" : 1,
    "2.x1.arm2.relative" : 0.07922535389661789,
    "2.x2.arm1.different" : 0,
    "2.x2.arm1.first_row" : -1,
    "2.x2.arm1.relative" : 0,
    "2.x2.arm2.different" : 757786,
    "2.x2.arm2.first_row" : 1,
    "2.x2.arm2.relative" : 0.04516806825995445,
    "3.attn.arm1.different" : 0,
    "3.attn.arm1.first_row" : -1,
    "3.attn.arm1.relative" : 0,
    "3.attn.arm2.different" : 1114510,
    "3.attn.arm2.first_row" : 1,
    "3.attn.arm2.relative" : 0.030241934582591057,
    "3.hAfterAttn.arm1.different" : 0,
    "3.hAfterAttn.arm1.first_row" : -1,
    "3.hAfterAttn.arm1.relative" : 0,
    "3.hAfterAttn.arm2.different" : 2467217,
    "3.hAfterAttn.arm2.first_row" : 1,
    "3.hAfterAttn.arm2.relative" : 0.014423076994717121,
    "3.inj1.arm1.different" : 0,
    "3.inj1.arm1.first_row" : -1,
    "3.inj1.arm1.relative" : 0,
    "3.inj1.arm2.different" : 184,
    "3.inj1.arm2.first_row" : 6,
    "3.inj1.arm2.relative" : 0.015075377188622952,
    "3.inj2.arm1.different" : 0,
    "3.inj2.arm1.first_row" : -1,
    "3.inj2.arm1.relative" : 0,
    "3.inj2.arm2.different" : 629,
    "3.inj2.arm2.first_row" : 2,
    "3.inj2.arm2.relative" : 0.020725388079881668,
    "3.moe.arm1.different" : 0,
    "3.moe.arm1.first_row" : -1,
    "3.moe.arm1.relative" : 0,
    "3.moe.arm2.different" : 1122596,
    "3.moe.arm2.first_row" : 1,
    "3.moe.arm2.relative" : 0.2699652910232544,
    "3.routed.arm1.different" : 0,
    "3.routed.arm1.first_row" : -1,
    "3.routed.arm1.relative" : 0,
    "3.routed.arm2.different" : 1136303,
    "3.routed.arm2.first_row" : 0,
    "3.routed.arm2.relative" : 0.2714160978794098,
    "3.router.arm1.different" : 0,
    "3.router.arm1.first_row" : -1,
    "3.router.arm1.relative" : 0,
    "3.router.arm2.different" : 263611,
    "3.router.arm2.first_row" : 0,
    "3.router.arm2.relative" : 0.022902878001332283,
    "3.sharedGate.arm1.different" : 0,
    "3.sharedGate.arm1.first_row" : -1,
    "3.sharedGate.arm1.relative" : 0,
    "3.sharedGate.arm2.different" : 100,
    "3.sharedGate.arm2.first_row" : 2,
    "3.sharedGate.arm2.relative" : 0.0117647061124444,
    "3.sharedValue.arm1.different" : 0,
    "3.sharedValue.arm1.first_row" : -1,
    "3.sharedValue.arm1.relative" : 0,
    "3.sharedValue.arm2.different" : 1114353,
    "3.sharedValue.arm2.first_row" : 1,
    "3.sharedValue.arm2.relative" : 0.0587797611951828,
    "3.x1.arm1.different" : 0,
    "3.x1.arm1.first_row" : -1,
    "3.x1.arm1.relative" : 0,
    "3.x1.arm2.different" : 881078,
    "3.x1.arm2.first_row" : 1,
    "3.x1.arm2.relative" : 0.03185096010565758,
    "3.x2.arm1.different" : 0,
    "3.x2.arm1.first_row" : -1,
    "3.x2.arm1.relative" : 0,
    "3.x2.arm2.different" : 949821,
    "3.x2.arm2.first_row" : 1,
    "3.x2.arm2.relative" : 0.05033557116985321
  },
  "name" : "context-small-components",
  "passed" : true
}

````

## components-10/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## components-padded-10/stdout.txt

SHA-256 `56965b2af0bcddb8dafd4c1457762eb473d3665c5e1d91b17dcda48753e15f4a`; 16055 bytes.

````text
{
  "items" : [
    {
      "name" : "256: exact committed count",
      "passed" : true
    },
    {
      "name" : "512: exact committed count",
      "passed" : true
    },
    {
      "name" : "64: exact committed count",
      "passed" : true
    },
    {
      "name" : "0.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.routed.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.routed.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.router.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.router.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.sharedGate.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.sharedGate.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.sharedValue.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.sharedValue.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.x2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.routed.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.routed.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.router.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.router.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.sharedGate.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.sharedGate.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.sharedValue.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.sharedValue.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.x2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.routed.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.routed.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.router.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.router.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.sharedGate.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.sharedGate.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.sharedValue.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.sharedValue.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.x2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.routed.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.routed.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.router.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.router.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.sharedGate.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.sharedGate.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.sharedValue.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.sharedValue.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.x2.arm2: finite",
      "passed" : true
    }
  ],
  "measurements" : {
    "0.attn.arm1.different" : 0,
    "0.attn.arm1.first_row" : -1,
    "0.attn.arm1.relative" : 0,
    "0.attn.arm2.different" : 0,
    "0.attn.arm2.first_row" : -1,
    "0.attn.arm2.relative" : 0,
    "0.hAfterAttn.arm1.different" : 0,
    "0.hAfterAttn.arm1.first_row" : -1,
    "0.hAfterAttn.arm1.relative" : 0,
    "0.hAfterAttn.arm2.different" : 0,
    "0.hAfterAttn.arm2.first_row" : -1,
    "0.hAfterAttn.arm2.relative" : 0,
    "0.inj1.arm1.different" : 0,
    "0.inj1.arm1.first_row" : -1,
    "0.inj1.arm1.relative" : 0,
    "0.inj1.arm2.different" : 0,
    "0.inj1.arm2.first_row" : -1,
    "0.inj1.arm2.relative" : 0,
    "0.inj2.arm1.different" : 0,
    "0.inj2.arm1.first_row" : -1,
    "0.inj2.arm1.relative" : 0,
    "0.inj2.arm2.different" : 0,
    "0.inj2.arm2.first_row" : -1,
    "0.inj2.arm2.relative" : 0,
    "0.moe.arm1.different" : 0,
    "0.moe.arm1.first_row" : -1,
    "0.moe.arm1.relative" : 0,
    "0.moe.arm2.different" : 0,
    "0.moe.arm2.first_row" : -1,
    "0.moe.arm2.relative" : 0,
    "0.routed.arm1.different" : 0,
    "0.routed.arm1.first_row" : -1,
    "0.routed.arm1.relative" : 0,
    "0.routed.arm2.different" : 0,
    "0.routed.arm2.first_row" : -1,
    "0.routed.arm2.relative" : 0,
    "0.router.arm1.different" : 0,
    "0.router.arm1.first_row" : -1,
    "0.router.arm1.relative" : 0,
    "0.router.arm2.different" : 0,
    "0.router.arm2.first_row" : -1,
    "0.router.arm2.relative" : 0,
    "0.sharedGate.arm1.different" : 0,
    "0.sharedGate.arm1.first_row" : -1,
    "0.sharedGate.arm1.relative" : 0,
    "0.sharedGate.arm2.different" : 0,
    "0.sharedGate.arm2.first_row" : -1,
    "0.sharedGate.arm2.relative" : 0,
    "0.sharedValue.arm1.different" : 0,
    "0.sharedValue.arm1.first_row" : -1,
    "0.sharedValue.arm1.relative" : 0,
    "0.sharedValue.arm2.different" : 0,
    "0.sharedValue.arm2.first_row" : -1,
    "0.sharedValue.arm2.relative" : 0,
    "0.x1.arm1.different" : 0,
    "0.x1.arm1.first_row" : -1,
    "0.x1.arm1.relative" : 0,
    "0.x1.arm2.different" : 0,
    "0.x1.arm2.first_row" : -1,
    "0.x1.arm2.relative" : 0,
    "0.x2.arm1.different" : 0,
    "0.x2.arm1.first_row" : -1,
    "0.x2.arm1.relative" : 0,
    "0.x2.arm2.different" : 0,
    "0.x2.arm2.first_row" : -1,
    "0.x2.arm2.relative" : 0,
    "1.attn.arm1.different" : 0,
    "1.attn.arm1.first_row" : -1,
    "1.attn.arm1.relative" : 0,
    "1.attn.arm2.different" : 0,
    "1.attn.arm2.first_row" : -1,
    "1.attn.arm2.relative" : 0,
    "1.hAfterAttn.arm1.different" : 0,
    "1.hAfterAttn.arm1.first_row" : -1,
    "1.hAfterAttn.arm1.relative" : 0,
    "1.hAfterAttn.arm2.different" : 0,
    "1.hAfterAttn.arm2.first_row" : -1,
    "1.hAfterAttn.arm2.relative" : 0,
    "1.inj1.arm1.different" : 0,
    "1.inj1.arm1.first_row" : -1,
    "1.inj1.arm1.relative" : 0,
    "1.inj1.arm2.different" : 0,
    "1.inj1.arm2.first_row" : -1,
    "1.inj1.arm2.relative" : 0,
    "1.inj2.arm1.different" : 0,
    "1.inj2.arm1.first_row" : -1,
    "1.inj2.arm1.relative" : 0,
    "1.inj2.arm2.different" : 0,
    "1.inj2.arm2.first_row" : -1,
    "1.inj2.arm2.relative" : 0,
    "1.moe.arm1.different" : 0,
    "1.moe.arm1.first_row" : -1,
    "1.moe.arm1.relative" : 0,
    "1.moe.arm2.different" : 0,
    "1.moe.arm2.first_row" : -1,
    "1.moe.arm2.relative" : 0,
    "1.routed.arm1.different" : 0,
    "1.routed.arm1.first_row" : -1,
    "1.routed.arm1.relative" : 0,
    "1.routed.arm2.different" : 0,
    "1.routed.arm2.first_row" : -1,
    "1.routed.arm2.relative" : 0,
    "1.router.arm1.different" : 0,
    "1.router.arm1.first_row" : -1,
    "1.router.arm1.relative" : 0,
    "1.router.arm2.different" : 0,
    "1.router.arm2.first_row" : -1,
    "1.router.arm2.relative" : 0,
    "1.sharedGate.arm1.different" : 0,
    "1.sharedGate.arm1.first_row" : -1,
    "1.sharedGate.arm1.relative" : 0,
    "1.sharedGate.arm2.different" : 0,
    "1.sharedGate.arm2.first_row" : -1,
    "1.sharedGate.arm2.relative" : 0,
    "1.sharedValue.arm1.different" : 0,
    "1.sharedValue.arm1.first_row" : -1,
    "1.sharedValue.arm1.relative" : 0,
    "1.sharedValue.arm2.different" : 0,
    "1.sharedValue.arm2.first_row" : -1,
    "1.sharedValue.arm2.relative" : 0,
    "1.x1.arm1.different" : 0,
    "1.x1.arm1.first_row" : -1,
    "1.x1.arm1.relative" : 0,
    "1.x1.arm2.different" : 0,
    "1.x1.arm2.first_row" : -1,
    "1.x1.arm2.relative" : 0,
    "1.x2.arm1.different" : 0,
    "1.x2.arm1.first_row" : -1,
    "1.x2.arm1.relative" : 0,
    "1.x2.arm2.different" : 0,
    "1.x2.arm2.first_row" : -1,
    "1.x2.arm2.relative" : 0,
    "2.attn.arm1.different" : 0,
    "2.attn.arm1.first_row" : -1,
    "2.attn.arm1.relative" : 0,
    "2.attn.arm2.different" : 0,
    "2.attn.arm2.first_row" : -1,
    "2.attn.arm2.relative" : 0,
    "2.hAfterAttn.arm1.different" : 0,
    "2.hAfterAttn.arm1.first_row" : -1,
    "2.hAfterAttn.arm1.relative" : 0,
    "2.hAfterAttn.arm2.different" : 0,
    "2.hAfterAttn.arm2.first_row" : -1,
    "2.hAfterAttn.arm2.relative" : 0,
    "2.inj1.arm1.different" : 0,
    "2.inj1.arm1.first_row" : -1,
    "2.inj1.arm1.relative" : 0,
    "2.inj1.arm2.different" : 0,
    "2.inj1.arm2.first_row" : -1,
    "2.inj1.arm2.relative" : 0,
    "2.inj2.arm1.different" : 0,
    "2.inj2.arm1.first_row" : -1,
    "2.inj2.arm1.relative" : 0,
    "2.inj2.arm2.different" : 0,
    "2.inj2.arm2.first_row" : -1,
    "2.inj2.arm2.relative" : 0,
    "2.moe.arm1.different" : 0,
    "2.moe.arm1.first_row" : -1,
    "2.moe.arm1.relative" : 0,
    "2.moe.arm2.different" : 0,
    "2.moe.arm2.first_row" : -1,
    "2.moe.arm2.relative" : 0,
    "2.routed.arm1.different" : 0,
    "2.routed.arm1.first_row" : -1,
    "2.routed.arm1.relative" : 0,
    "2.routed.arm2.different" : 0,
    "2.routed.arm2.first_row" : -1,
    "2.routed.arm2.relative" : 0,
    "2.router.arm1.different" : 0,
    "2.router.arm1.first_row" : -1,
    "2.router.arm1.relative" : 0,
    "2.router.arm2.different" : 0,
    "2.router.arm2.first_row" : -1,
    "2.router.arm2.relative" : 0,
    "2.sharedGate.arm1.different" : 0,
    "2.sharedGate.arm1.first_row" : -1,
    "2.sharedGate.arm1.relative" : 0,
    "2.sharedGate.arm2.different" : 0,
    "2.sharedGate.arm2.first_row" : -1,
    "2.sharedGate.arm2.relative" : 0,
    "2.sharedValue.arm1.different" : 0,
    "2.sharedValue.arm1.first_row" : -1,
    "2.sharedValue.arm1.relative" : 0,
    "2.sharedValue.arm2.different" : 0,
    "2.sharedValue.arm2.first_row" : -1,
    "2.sharedValue.arm2.relative" : 0,
    "2.x1.arm1.different" : 0,
    "2.x1.arm1.first_row" : -1,
    "2.x1.arm1.relative" : 0,
    "2.x1.arm2.different" : 0,
    "2.x1.arm2.first_row" : -1,
    "2.x1.arm2.relative" : 0,
    "2.x2.arm1.different" : 0,
    "2.x2.arm1.first_row" : -1,
    "2.x2.arm1.relative" : 0,
    "2.x2.arm2.different" : 0,
    "2.x2.arm2.first_row" : -1,
    "2.x2.arm2.relative" : 0,
    "3.attn.arm1.different" : 0,
    "3.attn.arm1.first_row" : -1,
    "3.attn.arm1.relative" : 0,
    "3.attn.arm2.different" : 0,
    "3.attn.arm2.first_row" : -1,
    "3.attn.arm2.relative" : 0,
    "3.hAfterAttn.arm1.different" : 0,
    "3.hAfterAttn.arm1.first_row" : -1,
    "3.hAfterAttn.arm1.relative" : 0,
    "3.hAfterAttn.arm2.different" : 0,
    "3.hAfterAttn.arm2.first_row" : -1,
    "3.hAfterAttn.arm2.relative" : 0,
    "3.inj1.arm1.different" : 0,
    "3.inj1.arm1.first_row" : -1,
    "3.inj1.arm1.relative" : 0,
    "3.inj1.arm2.different" : 0,
    "3.inj1.arm2.first_row" : -1,
    "3.inj1.arm2.relative" : 0,
    "3.inj2.arm1.different" : 0,
    "3.inj2.arm1.first_row" : -1,
    "3.inj2.arm1.relative" : 0,
    "3.inj2.arm2.different" : 0,
    "3.inj2.arm2.first_row" : -1,
    "3.inj2.arm2.relative" : 0,
    "3.moe.arm1.different" : 0,
    "3.moe.arm1.first_row" : -1,
    "3.moe.arm1.relative" : 0,
    "3.moe.arm2.different" : 0,
    "3.moe.arm2.first_row" : -1,
    "3.moe.arm2.relative" : 0,
    "3.routed.arm1.different" : 0,
    "3.routed.arm1.first_row" : -1,
    "3.routed.arm1.relative" : 0,
    "3.routed.arm2.different" : 0,
    "3.routed.arm2.first_row" : -1,
    "3.routed.arm2.relative" : 0,
    "3.router.arm1.different" : 0,
    "3.router.arm1.first_row" : -1,
    "3.router.arm1.relative" : 0,
    "3.router.arm2.different" : 0,
    "3.router.arm2.first_row" : -1,
    "3.router.arm2.relative" : 0,
    "3.sharedGate.arm1.different" : 0,
    "3.sharedGate.arm1.first_row" : -1,
    "3.sharedGate.arm1.relative" : 0,
    "3.sharedGate.arm2.different" : 0,
    "3.sharedGate.arm2.first_row" : -1,
    "3.sharedGate.arm2.relative" : 0,
    "3.sharedValue.arm1.different" : 0,
    "3.sharedValue.arm1.first_row" : -1,
    "3.sharedValue.arm1.relative" : 0,
    "3.sharedValue.arm2.different" : 0,
    "3.sharedValue.arm2.first_row" : -1,
    "3.sharedValue.arm2.relative" : 0,
    "3.x1.arm1.different" : 0,
    "3.x1.arm1.first_row" : -1,
    "3.x1.arm1.relative" : 0,
    "3.x1.arm2.different" : 0,
    "3.x1.arm2.first_row" : -1,
    "3.x1.arm2.relative" : 0,
    "3.x2.arm1.different" : 0,
    "3.x2.arm1.first_row" : -1,
    "3.x2.arm1.relative" : 0,
    "3.x2.arm2.different" : 0,
    "3.x2.arm2.first_row" : -1,
    "3.x2.arm2.relative" : 0
  },
  "name" : "context-small-components",
  "passed" : true
}

````

## components-padded-10/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## small64-padded-10/stdout.txt

SHA-256 `6fe222d2d549ab7e22993e63c05b070e1eaf91fd4addeeb9ee03579b32320915`; 236943 bytes.

````text
{
  "items" : [
    {
      "name" : "arm0: requested grouped small-pass dispatch",
      "passed" : true
    },
    {
      "name" : "arm0: correct absolute token count",
      "passed" : true
    },
    {
      "name" : "arm0: no pins survive dispatch",
      "passed" : true
    },
    {
      "name" : "arm1: requested grouped small-pass dispatch",
      "passed" : true
    },
    {
      "name" : "arm1: correct absolute token count",
      "passed" : true
    },
    {
      "name" : "arm1: no pins survive dispatch",
      "passed" : true
    },
    {
      "name" : "arm2: requested grouped small-pass dispatch",
      "passed" : true
    },
    {
      "name" : "arm2: correct absolute token count",
      "passed" : true
    },
    {
      "name" : "arm2: no pins survive dispatch",
      "passed" : true
    },
    {
      "name" : "arm3: requested grouped small-pass dispatch",
      "passed" : true
    },
    {
      "name" : "arm3: correct absolute token count",
      "passed" : true
    },
    {
      "name" : "arm3: no pins survive dispatch",
      "passed" : true
    },
    {
      "name" : "identical small-pass routing on repeat",
      "passed" : true
    },
    {
      "name" : "identical small-pass logits on repeat",
      "passed" : true
    },
    {
      "name" : "prefill.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill: greedy final token",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic field names",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "prefill: control fields",
      "passed" : true
    },
    {
      "name" : "prefill: candidate fields",
      "passed" : true
    },
    {
      "name" : "prefill.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill: exact ngram",
      "passed" : true
    },
    {
      "name" : "prefill.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill: exact tokens",
      "passed" : true
    },
    {
      "name" : "prefill.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "route keep sets inside existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.logits: existing rechunk band",
      "passed" : true
    },
    {
      "detail" : "got 1174, want 26",
      "name" : "continued-907: greedy final token",
      "passed" : false
    },
    {
      "name" : "continued-907: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-907: control fields",
      "passed" : true
    },
    {
      "name" : "continued-907: candidate fields",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907: exact ngram",
      "passed" : true
    },
    {
      "name" : "continued-907.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-907.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: control fields",
      "passed" : true
    },
    {
      "name" : "continued-1337: candidate fields",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337: exact ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.logits: existing rechunk band",
      "passed" : true
    },
    {
      "detail" : "got 643, want 367",
      "name" : "continued-2103: greedy final token",
      "passed" : false
    },
    {
      "name" : "continued-2103: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: control fields",
      "passed" : true
    },
    {
      "name" : "continued-2103: candidate fields",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103: exact ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1: greedy final token",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic field names",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: control fields",
      "passed" : true
    },
    {
      "name" : "rollback-1: candidate fields",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1: exact ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2: greedy final token",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic field names",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: control fields",
      "passed" : true
    },
    {
      "name" : "rollback-2: candidate fields",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2: exact ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.logits: existing rechunk band",
      "passed" : true
    },
    {
      "detail" : "got 269, want 907",
      "name" : "rollback-3: greedy final token",
      "passed" : false
    },
    {
      "name" : "rollback-3: deterministic field names",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: control fields",
      "passed" : true
    },
    {
      "name" : "rollback-3: candidate fields",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3: exact ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.7: existing rechunk band",
      "passed" : true
    }
  ],
  "measurements" : {
    "arm0.allocated_bytes" : 28311552,
    "arm0.chunk" : 256,
    "arm0.read_records" : 17679,
    "arm0.seconds" : 5.094887458,
    "arm0.workspace_piece_writes" : 0,
    "arm1.allocated_bytes" : 28311552,
    "arm1.chunk" : 512,
    "arm1.read_records" : 10438,
    "arm1.seconds" : 3.103900125,
    "arm1.workspace_piece_writes" : 0,
    "arm2.allocated_bytes" : 28311552,
    "arm2.chunk" : 64,
    "arm2.read_records" : 36221,
    "arm2.seconds" : 10.71238525,
    "arm2.workspace_piece_writes" : 0,
    "arm3.allocated_bytes" : 28311552,
    "arm3.chunk" : 64,
    "arm3.read_records" : 36208,
    "arm3.seconds" : 10.727815333,
    "arm3.workspace_piece_writes" : 0,
    "compact_scope_frontier" : 0,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0,
    "continued-1337.conv.1.control" : 0,
    "continued-1337.conv.10.candidate" : 0,
    "continued-1337.conv.10.control" : 0,
    "continued-1337.conv.12.candidate" : 0.005090497899800539,
    "continued-1337.conv.12.control" : 0,
    "continued-1337.conv.13.candidate" : 0.006320224609225988,
    "continued-1337.conv.13.control" : 0,
    "continued-1337.conv.14.candidate" : 0.012187499552965164,
    "continued-1337.conv.14.control" : 0.005625000223517418,
    "continued-1337.conv.16.candidate" : 0.02005080133676529,
    "continued-1337.conv.16.control" : 0.01681804098188877,
    "continued-1337.conv.17.candidate" : 0.02777777798473835,
    "continued-1337.conv.17.control" : 0.011574073694646358,
    "continued-1337.conv.18.candidate" : 0.01970720663666725,
    "continued-1337.conv.18.control" : 0.009009009227156639,
    "continued-1337.conv.2.candidate" : 0,
    "continued-1337.conv.2.control" : 0,
    "continued-1337.conv.20.candidate" : 0.041025642305612564,
    "continued-1337.conv.20.control" : 0.025641025975346565,
    "continued-1337.conv.21.candidate" : 0.02570093423128128,
    "continued-1337.conv.21.control" : 0.014018691144883633,
    "continued-1337.conv.22.candidate" : 0.014285714365541935,
    "continued-1337.conv.22.control" : 0.010714286006987095,
    "continued-1337.conv.24.candidate" : 0.02747252769768238,
    "continued-1337.conv.24.control" : 0.03365384787321091,
    "continued-1337.conv.25.candidate" : 0.028169013559818268,
    "continued-1337.conv.25.control" : 0.028682511299848557,
    "continued-1337.conv.26.candidate" : 0.02631578966975212,
    "continued-1337.conv.26.control" : 0.04904306307435036,
    "continued-1337.conv.28.candidate" : 0.03253265097737312,
    "continued-1337.conv.28.control" : 0.03684701398015022,
    "continued-1337.conv.29.candidate" : 0.06652046740055084,
    "continued-1337.conv.29.control" : 0.05847953259944916,
    "continued-1337.conv.30.candidate" : 0.06887754797935486,
    "continued-1337.conv.30.control" : 0.07780612260103226,
    "continued-1337.conv.32.candidate" : 0.07286995649337769,
    "continued-1337.conv.32.control" : 0.08127802610397339,
    "continued-1337.conv.33.candidate" : 0.064453125,
    "continued-1337.conv.33.control" : 0.0654296875,
    "continued-1337.conv.34.candidate" : 0.05946730077266693,
    "continued-1337.conv.34.control" : 0.07489451766014099,
    "continued-1337.conv.36.candidate" : 0.07758620381355286,
    "continued-1337.conv.36.control" : 0.09852216392755508,
    "continued-1337.conv.37.candidate" : 0.06981982290744781,
    "continued-1337.conv.37.control" : 0.05067567527294159,
    "continued-1337.conv.38.candidate" : 0.03851103037595749,
    "continued-1337.conv.38.control" : 0.04117647185921669,
    "continued-1337.conv.4.candidate" : 0,
    "continued-1337.conv.4.control" : 0,
    "continued-1337.conv.40.candidate" : 0.08571428805589676,
    "continued-1337.conv.40.control" : 0.0714285746216774,
    "continued-1337.conv.41.candidate" : 0.080078125,
    "continued-1337.conv.41.control" : 0.05059814453125,
    "continued-1337.conv.42.candidate" : 0.08503401279449463,
    "continued-1337.conv.42.control" : 0.05782312899827957,
    "continued-1337.conv.44.candidate" : 0.10220994800329208,
    "continued-1337.conv.44.control" : 0.10220994800329208,
    "continued-1337.conv.45.candidate" : 0.05236486345529556,
    "continued-1337.conv.45.control" : 0.051309119910001755,
    "continued-1337.conv.46.candidate" : 0.0833333358168602,
    "continued-1337.conv.46.control" : 0.1116071417927742,
    "continued-1337.conv.5.candidate" : 0,
    "continued-1337.conv.5.control" : 0,
    "continued-1337.conv.6.candidate" : 0,
    "continued-1337.conv.6.control" : 0,
    "continued-1337.conv.8.candidate" : 0,
    "continued-1337.conv.8.control" : 0,
    "continued-1337.conv.9.candidate" : 0,
    "continued-1337.conv.9.control" : 0,
    "continued-1337.index.11.candidate" : 0.0015432098880410194,
    "continued-1337.index.11.control" : 0,
    "continued-1337.index.15.candidate" : 0.02247191034257412,
    "continued-1337.index.15.control" : 0.01755617931485176,
    "continued-1337.index.19.candidate" : 0.0359589047729969,
    "continued-1337.index.19.control" : 0.027397260069847107,
    "continued-1337.index.23.candidate" : 0.01919642835855484,
    "continued-1337.index.23.control" : 0.02276785671710968,
    "continued-1337.index.27.candidate" : 0.027846533805131912,
    "continued-1337.index.27.control" : 0.037128712981939316,
    "continued-1337.index.3.candidate" : 0.000739644980058074,
    "continued-1337.index.3.control" : 0,
    "continued-1337.index.31.candidate" : 0.12551867961883545,
    "continued-1337.index.31.control" : 0.19605809450149536,
    "continued-1337.index.35.candidate" : 0.12168873846530914,
    "continued-1337.index.35.control" : 0.11423841118812561,
    "continued-1337.index.39.candidate" : 0.10126582533121109,
    "continued-1337.index.39.control" : 0.04628164693713188,
    "continued-1337.index.43.candidate" : 0.05156249925494194,
    "continued-1337.index.43.control" : 0.04707031324505806,
    "continued-1337.index.47.candidate" : 0.10333333164453506,
    "continued-1337.index.47.control" : 0.10187499970197678,
    "continued-1337.index.7.candidate" : 0.0009191176504828036,
    "continued-1337.index.7.control" : 0,
    "continued-1337.key.11.candidate" : 0.003846153849735856,
    "continued-1337.key.11.control" : 0,
    "continued-1337.key.15.candidate" : 0.040145985782146454,
    "continued-1337.key.15.control" : 0.031934306025505066,
    "continued-1337.key.19.candidate" : 0.0659722238779068,
    "continued-1337.key.19.control" : 0.05613425746560097,
    "continued-1337.key.23.candidate" : 0.04749999940395355,
    "continued-1337.key.23.control" : 0.06541666388511658,
    "continued-1337.key.27.candidate" : 0.1027960553765297,
    "continued-1337.key.27.control" : 0.10896381735801697,
    "continued-1337.key.3.candidate" : 0,
    "continued-1337.key.3.control" : 0,
    "continued-1337.key.31.candidate" : 0.14135906100273132,
    "continued-1337.key.31.control" : 0.14901426434516907,
    "continued-1337.key.35.candidate" : 0.1754429191350937,
    "continued-1337.key.35.control" : 0.16338582336902618,
    "continued-1337.key.39.candidate" : 0.15703125298023224,
    "continued-1337.key.39.control" : 0.08671875298023224,
    "continued-1337.key.43.candidate" : 0.08588435500860214,
    "continued-1337.key.43.control" : 0.07823128998279572,
    "continued-1337.key.47.candidate" : 0.10384516417980194,
    "continued-1337.key.47.control" : 0.09786522388458252,
    "continued-1337.key.7.candidate" : 0,
    "continued-1337.key.7.control" : 0,
    "continued-1337.logits.candidate" : 0.09490741044282913,
    "continued-1337.logits.control" : 0.10532407462596893,
    "continued-1337.ple.1.candidate" : 0,
    "continued-1337.ple.1.control" : 0,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0,
    "continued-1337.ssm.1.control" : 0,
    "continued-1337.ssm.10.candidate" : 0,
    "continued-1337.ssm.10.control" : 0,
    "continued-1337.ssm.12.candidate" : 0.0009004146559163928,
    "continued-1337.ssm.12.control" : 0,
    "continued-1337.ssm.13.candidate" : 0.007497120648622513,
    "continued-1337.ssm.13.control" : 0.00026312010595574975,
    "continued-1337.ssm.14.candidate" : 0.006547022145241499,
    "continued-1337.ssm.14.control" : 0.0042149461805820465,
    "continued-1337.ssm.16.candidate" : 0.015601836144924164,
    "continued-1337.ssm.16.control" : 0.013277687132358551,
    "continued-1337.ssm.17.candidate" : 0.016734398901462555,
    "continued-1337.ssm.17.control" : 0.012733696959912777,
    "continued-1337.ssm.18.candidate" : 0.01795276068150997,
    "continued-1337.ssm.18.control" : 0.014517116360366344,
    "continued-1337.ssm.2.candidate" : 0,
    "continued-1337.ssm.2.control" : 0,
    "continued-1337.ssm.20.candidate" : 0.015073398128151894,
    "continued-1337.ssm.20.control" : 0.008949542418122292,
    "continued-1337.ssm.21.candidate" : 0.011872701346874237,
    "continued-1337.ssm.21.control" : 0.008825146593153477,
    "continued-1337.ssm.22.candidate" : 0.0073410505428910255,
    "continued-1337.ssm.22.control" : 0.005606972612440586,
    "continued-1337.ssm.24.candidate" : 0.020681317895650864,
    "continued-1337.ssm.24.control" : 0.030068622902035713,
    "continued-1337.ssm.25.candidate" : 0.032092008739709854,
    "continued-1337.ssm.25.control" : 0.03369494900107384,
    "continued-1337.ssm.26.candidate" : 0.05096615105867386,
    "continued-1337.ssm.26.control" : 0.16198740899562836,
    "continued-1337.ssm.28.candidate" : 0.004327218513935804,
    "continued-1337.ssm.28.control" : 0.004970375914126635,
    "continued-1337.ssm.29.candidate" : 0.0468967966735363,
    "continued-1337.ssm.29.control" : 0.04375261068344116,
    "continued-1337.ssm.30.candidate" : 0.0981522798538208,
    "continued-1337.ssm.30.control" : 0.09145420044660568,
    "continued-1337.ssm.32.candidate" : 0.05496872961521149,
    "continued-1337.ssm.32.control" : 0.0503963828086853,
    "continued-1337.ssm.33.candidate" : 0.10677043348550797,
    "continued-1337.ssm.33.control" : 0.1020117849111557,
    "continued-1337.ssm.34.candidate" : 0.069050133228302,
    "continued-1337.ssm.34.control" : 0.06148255616426468,
    "continued-1337.ssm.36.candidate" : 0.05703021585941315,
    "continued-1337.ssm.36.control" : 0.0531274639070034,
    "continued-1337.ssm.37.candidate" : 0.05534399673342705,
    "continued-1337.ssm.37.control" : 0.04999849572777748,
    "continued-1337.ssm.38.candidate" : 0.018706534057855606,
    "continued-1337.ssm.38.control" : 0.014088941738009453,
    "continued-1337.ssm.4.candidate" : 0,
    "continued-1337.ssm.4.control" : 0,
    "continued-1337.ssm.40.candidate" : 0.02027086541056633,
    "continued-1337.ssm.40.control" : 0.015454727225005627,
    "continued-1337.ssm.41.candidate" : 0.023819535970687866,
    "continued-1337.ssm.41.control" : 0.016492173075675964,
    "continued-1337.ssm.42.candidate" : 0.02739867940545082,
    "continued-1337.ssm.42.control" : 0.02904917486011982,
    "continued-1337.ssm.44.candidate" : 0.018984319642186165,
    "continued-1337.ssm.44.control" : 0.022203821688890457,
    "continued-1337.ssm.45.candidate" : 0.13025672733783722,
    "continued-1337.ssm.45.control" : 0.16785705089569092,
    "continued-1337.ssm.46.candidate" : 0.12730835378170013,
    "continued-1337.ssm.46.control" : 0.22480647265911102,
    "continued-1337.ssm.5.candidate" : 0,
    "continued-1337.ssm.5.control" : 0,
    "continued-1337.ssm.6.candidate" : 0,
    "continued-1337.ssm.6.control" : 0,
    "continued-1337.ssm.8.candidate" : 0,
    "continued-1337.ssm.8.control" : 0,
    "continued-1337.ssm.9.candidate" : 0,
    "continued-1337.ssm.9.control" : 0,
    "continued-1337.value.11.candidate" : 0.00044964029802940786,
    "continued-1337.value.11.control" : 0,
    "continued-1337.value.15.candidate" : 0.011952191591262817,
    "continued-1337.value.15.control" : 0.009213147684931755,
    "continued-1337.value.19.candidate" : 0.014477040618658066,
    "continued-1337.value.19.control" : 0.012519929558038712,
    "continued-1337.value.23.candidate" : 0.04476744309067726,
    "continued-1337.value.23.control" : 0.0417151153087616,
    "continued-1337.value.27.candidate" : 0.015625,
    "continued-1337.value.27.control" : 0.014546001330018044,
    "continued-1337.value.3.candidate" : 0,
    "continued-1337.value.3.control" : 0,
    "continued-1337.value.31.candidate" : 0.05815217271447182,
    "continued-1337.value.31.control" : 0.072826087474823,
    "continued-1337.value.35.candidate" : 0.05978260934352875,
    "continued-1337.value.35.control" : 0.06159420311450958,
    "continued-1337.value.39.candidate" : 0.12619048357009888,
    "continued-1337.value.39.control" : 0.0494791679084301,
    "continued-1337.value.43.candidate" : 0.04245283082127571,
    "continued-1337.value.43.control" : 0.04088050499558449,
    "continued-1337.value.47.candidate" : 0.23780487477779388,
    "continued-1337.value.47.control" : 0.20636433362960815,
    "continued-1337.value.7.candidate" : 0,
    "continued-1337.value.7.control" : 0,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0,
    "continued-2103.conv.1.control" : 0,
    "continued-2103.conv.10.candidate" : 0,
    "continued-2103.conv.10.control" : 0,
    "continued-2103.conv.12.candidate" : 0.006666666828095913,
    "continued-2103.conv.12.control" : 0,
    "continued-2103.conv.13.candidate" : 0.01024590153247118,
    "continued-2103.conv.13.control" : 0,
    "continued-2103.conv.14.candidate" : 0.007734375074505806,
    "continued-2103.conv.14.control" : 0.004999999888241291,
    "continued-2103.conv.16.candidate" : 0.014140913262963295,
    "continued-2103.conv.16.control" : 0.01681804098188877,
    "continued-2103.conv.17.candidate" : 0.02509014494717121,
    "continued-2103.conv.17.control" : 0.012019230984151363,
    "continued-2103.conv.18.candidate" : 0.01689189113676548,
    "continued-2103.conv.18.control" : 0.015343468636274338,
    "continued-2103.conv.2.candidate" : 0,
    "continued-2103.conv.2.control" : 0,
    "continued-2103.conv.20.candidate" : 0.04020100459456444,
    "continued-2103.conv.20.control" : 0.015075377188622952,
    "continued-2103.conv.21.candidate" : 0.023364486172795296,
    "continued-2103.conv.21.control" : 0.014018691144883633,
    "continued-2103.conv.22.candidate" : 0.010343309491872787,
    "continued-2103.conv.22.control" : 0.011003521271049976,
    "continued-2103.conv.24.candidate" : 0.021739130839705467,
    "continued-2103.conv.24.control" : 0.03328804299235344,
    "continued-2103.conv.25.candidate" : 0.02926829271018505,
    "continued-2103.conv.25.control" : 0.029801828786730766,
    "continued-2103.conv.26.candidate" : 0.024336284026503563,
    "continued-2103.conv.26.control" : 0.04535398259758949,
    "continued-2103.conv.28.candidate" : 0.03253265097737312,
    "continued-2103.conv.28.control" : 0.03684701398015022,
    "continued-2103.conv.29.candidate" : 0.0520833320915699,
    "continued-2103.conv.29.control" : 0.0520833320915699,
    "continued-2103.conv.30.candidate" : 0.07015305757522583,
    "continued-2103.conv.30.control" : 0.07397959381341934,
    "continued-2103.conv.32.candidate" : 0.05493273586034775,
    "continued-2103.conv.32.control" : 0.056334082037210464,
    "continued-2103.conv.33.candidate" : 0.064453125,
    "continued-2103.conv.33.control" : 0.05731201171875,
    "continued-2103.conv.34.candidate" : 0.061544761061668396,
    "continued-2103.conv.34.control" : 0.07751091569662094,
    "continued-2103.conv.36.candidate" : 0.07758620381355286,
    "continued-2103.conv.36.control" : 0.09852216392755508,
    "continued-2103.conv.37.candidate" : 0.07209302484989166,
    "continued-2103.conv.37.control" : 0.05232558026909828,
    "continued-2103.conv.38.candidate" : 0.03357963263988495,
    "continued-2103.conv.38.control" : 0.04216867312788963,
    "continued-2103.conv.4.candidate" : 0,
    "continued-2103.conv.4.control" : 0,
    "continued-2103.conv.40.candidate" : 0.0839160829782486,
    "continued-2103.conv.40.control" : 0.0699300691485405,
    "continued-2103.conv.41.candidate" : 0.080078125,
    "continued-2103.conv.41.control" : 0.05059814453125,
    "continued-2103.conv.42.candidate" : 0.0833333358168602,
    "continued-2103.conv.42.control" : 0.05666666850447655,
    "continued-2103.conv.44.candidate" : 0.10451977699995041,
    "continued-2103.conv.44.control" : 0.10451977699995041,
    "continued-2103.conv.45.candidate" : 0.05236486345529556,
    "continued-2103.conv.45.control" : 0.051309119910001755,
    "continued-2103.conv.46.candidate" : 0.08045977354049683,
    "continued-2103.conv.46.control" : 0.10775861889123917,
    "continued-2103.conv.5.candidate" : 0,
    "continued-2103.conv.5.control" : 0,
    "continued-2103.conv.6.candidate" : 0,
    "continued-2103.conv.6.control" : 0,
    "continued-2103.conv.8.candidate" : 0,
    "continued-2103.conv.8.control" : 0,
    "continued-2103.conv.9.candidate" : 0,
    "continued-2103.conv.9.control" : 0,
    "continued-2103.index.11.candidate" : 0.0015432098880410194,
    "continued-2103.index.11.control" : 0,
    "continued-2103.index.15.candidate" : 0.02247191034257412,
    "continued-2103.index.15.control" : 0.01755617931485176,
    "continued-2103.index.19.candidate" : 0.0359589047729969,
    "continued-2103.index.19.control" : 0.027397260069847107,
    "continued-2103.index.23.candidate" : 0.01919642835855484,
    "continued-2103.index.23.control" : 0.02276785671710968,
    "continued-2103.index.27.candidate" : 0.027846533805131912,
    "continued-2103.index.27.control" : 0.037128712981939316,
    "continued-2103.index.3.candidate" : 0.000739644980058074,
    "continued-2103.index.3.control" : 0,
    "continued-2103.index.31.candidate" : 0.12551867961883545,
    "continued-2103.index.31.control" : 0.19605809450149536,
    "continued-2103.index.35.candidate" : 0.12168873846530914,
    "continued-2103.index.35.control" : 0.11423841118812561,
    "continued-2103.index.39.candidate" : 0.10126582533121109,
    "continued-2103.index.39.control" : 0.04628164693713188,
    "continued-2103.index.43.candidate" : 0.05156249925494194,
    "continued-2103.index.43.control" : 0.04707031324505806,
    "continued-2103.index.47.candidate" : 0.10333333164453506,
    "continued-2103.index.47.control" : 0.10187499970197678,
    "continued-2103.index.7.candidate" : 0.0009191176504828036,
    "continued-2103.index.7.control" : 0,
    "continued-2103.key.11.candidate" : 0.003846153849735856,
    "continued-2103.key.11.control" : 0,
    "continued-2103.key.15.candidate" : 0.040145985782146454,
    "continued-2103.key.15.control" : 0.031934306025505066,
    "continued-2103.key.19.candidate" : 0.0659722238779068,
    "continued-2103.key.19.control" : 0.05613425746560097,
    "continued-2103.key.23.candidate" : 0.04749999940395355,
    "continued-2103.key.23.control" : 0.06541666388511658,
    "continued-2103.key.27.candidate" : 0.1027960553765297,
    "continued-2103.key.27.control" : 0.10896381735801697,
    "continued-2103.key.3.candidate" : 0,
    "continued-2103.key.3.control" : 0,
    "continued-2103.key.31.candidate" : 0.14135906100273132,
    "continued-2103.key.31.control" : 0.14901426434516907,
    "continued-2103.key.35.candidate" : 0.1754429191350937,
    "continued-2103.key.35.control" : 0.16338582336902618,
    "continued-2103.key.39.candidate" : 0.15703125298023224,
    "continued-2103.key.39.control" : 0.08671875298023224,
    "continued-2103.key.43.candidate" : 0.08588435500860214,
    "continued-2103.key.43.control" : 0.07823128998279572,
    "continued-2103.key.47.candidate" : 0.10384516417980194,
    "continued-2103.key.47.control" : 0.09786522388458252,
    "continued-2103.key.7.candidate" : 0,
    "continued-2103.key.7.control" : 0,
    "continued-2103.logits.candidate" : 0.08113207668066025,
    "continued-2103.logits.control" : 0.09433962404727936,
    "continued-2103.ple.1.candidate" : 0,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0,
    "continued-2103.ssm.1.control" : 0,
    "continued-2103.ssm.10.candidate" : 0,
    "continued-2103.ssm.10.control" : 0,
    "continued-2103.ssm.12.candidate" : 0.001217793906107545,
    "continued-2103.ssm.12.control" : 0,
    "continued-2103.ssm.13.candidate" : 0.007681064307689667,
    "continued-2103.ssm.13.control" : 0.00027723138919100165,
    "continued-2103.ssm.14.candidate" : 0.007884498685598373,
    "continued-2103.ssm.14.control" : 0.002875519683584571,
    "continued-2103.ssm.16.candidate" : 0.014255795627832413,
    "continued-2103.ssm.16.control" : 0.01306831929832697,
    "continued-2103.ssm.17.candidate" : 0.0202399343252182,
    "continued-2103.ssm.17.control" : 0.012333724647760391,
    "continued-2103.ssm.18.candidate" : 0.02464272826910019,
    "continued-2103.ssm.18.control" : 0.026666244491934776,
    "continued-2103.ssm.2.candidate" : 0,
    "continued-2103.ssm.2.control" : 0,
    "continued-2103.ssm.20.candidate" : 0.008474837057292461,
    "continued-2103.ssm.20.control" : 0.010438838973641396,
    "continued-2103.ssm.21.candidate" : 0.011705960147082806,
    "continued-2103.ssm.21.control" : 0.005878801923245192,
    "continued-2103.ssm.22.candidate" : 0.0072357794269919395,
    "continued-2103.ssm.22.control" : 0.005343249067664146,
    "continued-2103.ssm.24.candidate" : 0.012335683219134808,
    "continued-2103.ssm.24.control" : 0.02550414949655533,
    "continued-2103.ssm.25.candidate" : 0.03113188035786152,
    "continued-2103.ssm.25.control" : 0.042839165776968,
    "continued-2103.ssm.26.candidate" : 0.04397837445139885,
    "continued-2103.ssm.26.control" : 0.07313300669193268,
    "continued-2103.ssm.28.candidate" : 0.005790217313915491,
    "continued-2103.ssm.28.control" : 0.005258497782051563,
    "continued-2103.ssm.29.candidate" : 0.06781433522701263,
    "continued-2103.ssm.29.control" : 0.04497474431991577,
    "continued-2103.ssm.30.candidate" : 0.05525423586368561,
    "continued-2103.ssm.30.control" : 0.032806556671857834,
    "continued-2103.ssm.32.candidate" : 0.06263579428195953,
    "continued-2103.ssm.32.control" : 0.09136993438005447,
    "continued-2103.ssm.33.candidate" : 0.058710258454084396,
    "continued-2103.ssm.33.control" : 0.06761748343706131,
    "continued-2103.ssm.34.candidate" : 0.09102536737918854,
    "continued-2103.ssm.34.control" : 0.07938974350690842,
    "continued-2103.ssm.36.candidate" : 0.05715741962194443,
    "continued-2103.ssm.36.control" : 0.04179370030760765,
    "continued-2103.ssm.37.candidate" : 0.08012812584638596,
    "continued-2103.ssm.37.control" : 0.04076423868536949,
    "continued-2103.ssm.38.candidate" : 0.0184080358594656,
    "continued-2103.ssm.38.control" : 0.016576921567320824,
    "continued-2103.ssm.4.candidate" : 0,
    "continued-2103.ssm.4.control" : 0,
    "continued-2103.ssm.40.candidate" : 0.02250831387937069,
    "continued-2103.ssm.40.control" : 0.016824448481202126,
    "continued-2103.ssm.41.candidate" : 0.024523435160517693,
    "continued-2103.ssm.41.control" : 0.018600014969706535,
    "continued-2103.ssm.42.candidate" : 0.03730878233909607,
    "continued-2103.ssm.42.control" : 0.06506846845149994,
    "continued-2103.ssm.44.candidate" : 0.01968243159353733,
    "continued-2103.ssm.44.control" : 0.014560380950570107,
    "continued-2103.ssm.45.candidate" : 0.09901134669780731,
    "continued-2103.ssm.45.control" : 0.0805421993136406,
    "continued-2103.ssm.46.candidate" : 0.12210855633020401,
    "continued-2103.ssm.46.control" : 0.17004629969596863,
    "continued-2103.ssm.5.candidate" : 0,
    "continued-2103.ssm.5.control" : 0,
    "continued-2103.ssm.6.candidate" : 0,
    "continued-2103.ssm.6.control" : 0,
    "continued-2103.ssm.8.candidate" : 0,
    "continued-2103.ssm.8.control" : 0,
    "continued-2103.ssm.9.candidate" : 0,
    "continued-2103.ssm.9.control" : 0,
    "continued-2103.value.11.candidate" : 0.00044964029802940786,
    "continued-2103.value.11.control" : 0,
    "continued-2103.value.15.candidate" : 0.011952191591262817,
    "continued-2103.value.15.control" : 0.009213147684931755,
    "continued-2103.value.19.candidate" : 0.014477040618658066,
    "continued-2103.value.19.control" : 0.012519929558038712,
    "continued-2103.value.23.candidate" : 0.04476744309067726,
    "continued-2103.value.23.control" : 0.0417151153087616,
    "continued-2103.value.27.candidate" : 0.015625,
    "continued-2103.value.27.control" : 0.014546001330018044,
    "continued-2103.value.3.candidate" : 0,
    "continued-2103.value.3.control" : 0,
    "continued-2103.value.31.candidate" : 0.05815217271447182,
    "continued-2103.value.31.control" : 0.072826087474823,
    "continued-2103.value.35.candidate" : 0.05978260934352875,
    "continued-2103.value.35.control" : 0.06159420311450958,
    "continued-2103.value.39.candidate" : 0.12619048357009888,
    "continued-2103.value.39.control" : 0.0494791679084301,
    "continued-2103.value.43.candidate" : 0.04245283082127571,
    "continued-2103.value.43.control" : 0.04088050499558449,
    "continued-2103.value.47.candidate" : 0.23780487477779388,
    "continued-2103.value.47.control" : 0.20636433362960815,
    "continued-2103.value.7.candidate" : 0,
    "continued-2103.value.7.control" : 0,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0,
    "continued-907.conv.1.control" : 0,
    "continued-907.conv.10.candidate" : 0,
    "continued-907.conv.10.control" : 0,
    "continued-907.conv.12.candidate" : 0.004999999888241291,
    "continued-907.conv.12.control" : 0,
    "continued-907.conv.13.candidate" : 0.00561797758564353,
    "continued-907.conv.13.control" : 0,
    "continued-907.conv.14.candidate" : 0.012896825559437275,
    "continued-907.conv.14.control" : 0.006613756529986858,
    "continued-907.conv.16.candidate" : 0.02087339758872986,
    "continued-907.conv.16.control" : 0.015064102597534657,
    "continued-907.conv.17.candidate" : 0.02777777798473835,
    "continued-907.conv.17.control" : 0.016782406717538834,
    "continued-907.conv.18.candidate" : 0.019796380773186684,
    "continued-907.conv.18.control" : 0.009049774147570133,
    "continued-907.conv.2.candidate" : 0,
    "continued-907.conv.2.control" : 0,
    "continued-907.conv.20.candidate" : 0.040816325694322586,
    "continued-907.conv.20.control" : 0.025510204955935478,
    "continued-907.conv.21.candidate" : 0.02570093423128128,
    "continued-907.conv.21.control" : 0.014018691144883633,
    "continued-907.conv.22.candidate" : 0.014285714365541935,
    "continued-907.conv.22.control" : 0.010714286006987095,
    "continued-907.conv.24.candidate" : 0.02747252769768238,
    "continued-907.conv.24.control" : 0.024038461968302727,
    "continued-907.conv.25.candidate" : 0.028169013559818268,
    "continued-907.conv.25.control" : 0.019366197288036346,
    "continued-907.conv.26.candidate" : 0.02606634981930256,
    "continued-907.conv.26.control" : 0.030805686488747597,
    "continued-907.conv.28.candidate" : 0.041330646723508835,
    "continued-907.conv.28.control" : 0.04838709533214569,
    "continued-907.conv.29.candidate" : 0.0711805522441864,
    "continued-907.conv.29.control" : 0.0625,
    "continued-907.conv.30.candidate" : 0.08074951171875,
    "continued-907.conv.30.control" : 0.0794270858168602,
    "continued-907.conv.32.candidate" : 0.07319819927215576,
    "continued-907.conv.32.control" : 0.08164414763450623,
    "continued-907.conv.33.candidate" : 0.064453125,
    "continued-907.conv.33.control" : 0.0654296875,
    "continued-907.conv.34.candidate" : 0.06329113990068436,
    "continued-907.conv.34.control" : 0.10126582533121109,
    "continued-907.conv.36.candidate" : 0.059129901230335236,
    "continued-907.conv.36.control" : 0.09803921729326248,
    "continued-907.conv.37.candidate" : 0.05551449954509735,
    "continued-907.conv.37.control" : 0.04954954981803894,
    "continued-907.conv.38.candidate" : 0.03851103037595749,
    "continued-907.conv.38.control" : 0.04117647185921669,
    "continued-907.conv.4.candidate" : 0,
    "continued-907.conv.4.control" : 0,
    "continued-907.conv.40.candidate" : 0.06977739930152893,
    "continued-907.conv.40.control" : 0.07994434982538223,
    "continued-907.conv.41.candidate" : 0.052165355533361435,
    "continued-907.conv.41.control" : 0.06422244012355804,
    "continued-907.conv.42.candidate" : 0.07801418751478195,
    "continued-907.conv.42.control" : 0.060283686965703964,
    "continued-907.conv.44.candidate" : 0.10220994800329208,
    "continued-907.conv.44.control" : 0.11049723625183105,
    "continued-907.conv.45.candidate" : 0.050147805362939835,
    "continued-907.conv.45.control" : 0.051309119910001755,
    "continued-907.conv.46.candidate" : 0.0833333358168602,
    "continued-907.conv.46.control" : 0.061011902987957,
    "continued-907.conv.5.candidate" : 0,
    "continued-907.conv.5.control" : 0,
    "continued-907.conv.6.candidate" : 0,
    "continued-907.conv.6.control" : 0,
    "continued-907.conv.8.candidate" : 0,
    "continued-907.conv.8.control" : 0,
    "continued-907.conv.9.candidate" : 0,
    "continued-907.conv.9.control" : 0,
    "continued-907.index.11.candidate" : 0.0015432098880410194,
    "continued-907.index.11.control" : 0,
    "continued-907.index.15.candidate" : 0.02247191034257412,
    "continued-907.index.15.control" : 0.01755617931485176,
    "continued-907.index.19.candidate" : 0.0359589047729969,
    "continued-907.index.19.control" : 0.027397260069847107,
    "continued-907.index.23.candidate" : 0.01919642835855484,
    "continued-907.index.23.control" : 0.02276785671710968,
    "continued-907.index.27.candidate" : 0.027846533805131912,
    "continued-907.index.27.control" : 0.037128712981939316,
    "continued-907.index.3.candidate" : 0.000739644980058074,
    "continued-907.index.3.control" : 0,
    "continued-907.index.31.candidate" : 0.12551867961883545,
    "continued-907.index.31.control" : 0.19605809450149536,
    "continued-907.index.35.candidate" : 0.12168873846530914,
    "continued-907.index.35.control" : 0.11423841118812561,
    "continued-907.index.39.candidate" : 0.10126582533121109,
    "continued-907.index.39.control" : 0.04628164693713188,
    "continued-907.index.43.candidate" : 0.05156249925494194,
    "continued-907.index.43.control" : 0.04707031324505806,
    "continued-907.index.47.candidate" : 0.10333333164453506,
    "continued-907.index.47.control" : 0.10187499970197678,
    "continued-907.index.7.candidate" : 0.0009191176504828036,
    "continued-907.index.7.control" : 0,
    "continued-907.key.11.candidate" : 0.003846153849735856,
    "continued-907.key.11.control" : 0,
    "continued-907.key.15.candidate" : 0.040145985782146454,
    "continued-907.key.15.control" : 0.031934306025505066,
    "continued-907.key.19.candidate" : 0.0659722238779068,
    "continued-907.key.19.control" : 0.05613425746560097,
    "continued-907.key.23.candidate" : 0.04749999940395355,
    "continued-907.key.23.control" : 0.06541666388511658,
    "continued-907.key.27.candidate" : 0.1027960553765297,
    "continued-907.key.27.control" : 0.10896381735801697,
    "continued-907.key.3.candidate" : 0,
    "continued-907.key.3.control" : 0,
    "continued-907.key.31.candidate" : 0.14135906100273132,
    "continued-907.key.31.control" : 0.14901426434516907,
    "continued-907.key.35.candidate" : 0.1754429191350937,
    "continued-907.key.35.control" : 0.16338582336902618,
    "continued-907.key.39.candidate" : 0.15703125298023224,
    "continued-907.key.39.control" : 0.08671875298023224,
    "continued-907.key.43.candidate" : 0.08588435500860214,
    "continued-907.key.43.control" : 0.07823128998279572,
    "continued-907.key.47.candidate" : 0.10384516417980194,
    "continued-907.key.47.control" : 0.09786522388458252,
    "continued-907.key.7.candidate" : 0,
    "continued-907.key.7.control" : 0,
    "continued-907.logits.candidate" : 0.10736925154924393,
    "continued-907.logits.control" : 0.11133121699094772,
    "continued-907.ple.1.candidate" : 0,
    "continued-907.ple.1.control" : 0,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0,
    "continued-907.ssm.1.control" : 0,
    "continued-907.ssm.10.candidate" : 0,
    "continued-907.ssm.10.control" : 0,
    "continued-907.ssm.12.candidate" : 0.0015930531080812216,
    "continued-907.ssm.12.control" : 0,
    "continued-907.ssm.13.candidate" : 0.006697061005979776,
    "continued-907.ssm.13.control" : 0.0002817342756316066,
    "continued-907.ssm.14.candidate" : 0.007275328505784273,
    "continued-907.ssm.14.control" : 0.0037336547393351793,
    "continued-907.ssm.16.candidate" : 0.02412940002977848,
    "continued-907.ssm.16.control" : 0.00977743323892355,
    "continued-907.ssm.17.candidate" : 0.012480586767196655,
    "continued-907.ssm.17.control" : 0.01111855823546648,
    "continued-907.ssm.18.candidate" : 0.028743619099259377,
    "continued-907.ssm.18.control" : 0.014318006113171577,
    "continued-907.ssm.2.candidate" : 0,
    "continued-907.ssm.2.control" : 0,
    "continued-907.ssm.20.candidate" : 0.01635279878973961,
    "continued-907.ssm.20.control" : 0.011634263209998608,
    "continued-907.ssm.21.candidate" : 0.017799947410821915,
    "continued-907.ssm.21.control" : 0.012398164719343185,
    "continued-907.ssm.22.candidate" : 0.007389051374047995,
    "continued-907.ssm.22.control" : 0.005773540586233139,
    "continued-907.ssm.24.candidate" : 0.019495641812682152,
    "continued-907.ssm.24.control" : 0.018454771488904953,
    "continued-907.ssm.25.candidate" : 0.037104737013578415,
    "continued-907.ssm.25.control" : 0.033577900379896164,
    "continued-907.ssm.26.candidate" : 0.10002891719341278,
    "continued-907.ssm.26.control" : 0.06735121458768845,
    "continued-907.ssm.28.candidate" : 0.0035640967544168234,
    "continued-907.ssm.28.control" : 0.0040559470653533936,
    "continued-907.ssm.29.candidate" : 0.050601325929164886,
    "continued-907.ssm.29.control" : 0.05295253545045853,
    "continued-907.ssm.30.candidate" : 0.07278919219970703,
    "continued-907.ssm.30.control" : 0.0886233001947403,
    "continued-907.ssm.32.candidate" : 0.07691933214664459,
    "continued-907.ssm.32.control" : 0.10987891256809235,
    "continued-907.ssm.33.candidate" : 0.09500802308320999,
    "continued-907.ssm.33.control" : 0.08728557825088501,
    "continued-907.ssm.34.candidate" : 0.09779398888349533,
    "continued-907.ssm.34.control" : 0.08165968954563141,
    "continued-907.ssm.36.candidate" : 0.10190848261117935,
    "continued-907.ssm.36.control" : 0.0977427288889885,
    "continued-907.ssm.37.candidate" : 0.04908465966582298,
    "continued-907.ssm.37.control" : 0.056762851774692535,
    "continued-907.ssm.38.candidate" : 0.018772287294268608,
    "continued-907.ssm.38.control" : 0.016137052327394485,
    "continued-907.ssm.4.candidate" : 0,
    "continued-907.ssm.4.control" : 0,
    "continued-907.ssm.40.candidate" : 0.021752938628196716,
    "continued-907.ssm.40.control" : 0.014509430155158043,
    "continued-907.ssm.41.candidate" : 0.024515997618436813,
    "continued-907.ssm.41.control" : 0.01707575097680092,
    "continued-907.ssm.42.candidate" : 0.028251340612769127,
    "continued-907.ssm.42.control" : 0.03383483365178108,
    "continued-907.ssm.44.candidate" : 0.019443880766630173,
    "continued-907.ssm.44.control" : 0.013975723646581173,
    "continued-907.ssm.45.candidate" : 0.10030194371938705,
    "continued-907.ssm.45.control" : 0.0766148567199707,
    "continued-907.ssm.46.candidate" : 0.12567733228206635,
    "continued-907.ssm.46.control" : 0.1926262527704239,
    "continued-907.ssm.5.candidate" : 0,
    "continued-907.ssm.5.control" : 0,
    "continued-907.ssm.6.candidate" : 0,
    "continued-907.ssm.6.control" : 0,
    "continued-907.ssm.8.candidate" : 0,
    "continued-907.ssm.8.control" : 0,
    "continued-907.ssm.9.candidate" : 0,
    "continued-907.ssm.9.control" : 0,
    "continued-907.value.11.candidate" : 0.00044964029802940786,
    "continued-907.value.11.control" : 0,
    "continued-907.value.15.candidate" : 0.011952191591262817,
    "continued-907.value.15.control" : 0.009213147684931755,
    "continued-907.value.19.candidate" : 0.014477040618658066,
    "continued-907.value.19.control" : 0.012519929558038712,
    "continued-907.value.23.candidate" : 0.04476744309067726,
    "continued-907.value.23.control" : 0.0417151153087616,
    "continued-907.value.27.candidate" : 0.015625,
    "continued-907.value.27.control" : 0.014546001330018044,
    "continued-907.value.3.candidate" : 0,
    "continued-907.value.3.control" : 0,
    "continued-907.value.31.candidate" : 0.05815217271447182,
    "continued-907.value.31.control" : 0.072826087474823,
    "continued-907.value.35.candidate" : 0.05978260934352875,
    "continued-907.value.35.control" : 0.06159420311450958,
    "continued-907.value.39.candidate" : 0.12619048357009888,
    "continued-907.value.39.control" : 0.0494791679084301,
    "continued-907.value.43.candidate" : 0.04245283082127571,
    "continued-907.value.43.control" : 0.04088050499558449,
    "continued-907.value.47.candidate" : 0.23780487477779388,
    "continued-907.value.47.control" : 0.20636433362960815,
    "continued-907.value.7.candidate" : 0,
    "continued-907.value.7.control" : 0,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0,
    "prefill.conv.1.control" : 0,
    "prefill.conv.10.candidate" : 0,
    "prefill.conv.10.control" : 0,
    "prefill.conv.12.candidate" : 0.004999999888241291,
    "prefill.conv.12.control" : 0,
    "prefill.conv.13.candidate" : 0.005586592014878988,
    "prefill.conv.13.control" : 0,
    "prefill.conv.14.candidate" : 0.012828947044909,
    "prefill.conv.14.control" : 0.007894736714661121,
    "prefill.conv.16.candidate" : 0.022035256028175354,
    "prefill.conv.16.control" : 0.02580128237605095,
    "prefill.conv.17.candidate" : 0.02777777798473835,
    "prefill.conv.17.control" : 0.017433449625968933,
    "prefill.conv.18.candidate" : 0.019796380773186684,
    "prefill.conv.18.control" : 0.020644797012209892,
    "prefill.conv.2.candidate" : 0,
    "prefill.conv.2.control" : 0,
    "prefill.conv.20.candidate" : 0.02806122414767742,
    "prefill.conv.20.control" : 0.025510204955935478,
    "prefill.conv.21.candidate" : 0.026829268783330917,
    "prefill.conv.21.control" : 0.024390242993831635,
    "prefill.conv.22.candidate" : 0.014285714365541935,
    "prefill.conv.22.control" : 0.010714286006987095,
    "prefill.conv.24.candidate" : 0.038433969020843506,
    "prefill.conv.24.control" : 0.037602849304676056,
    "prefill.conv.25.candidate" : 0.02934272214770317,
    "prefill.conv.25.control" : 0.030516432598233223,
    "prefill.conv.26.candidate" : 0.04028436169028282,
    "prefill.conv.26.control" : 0.042061612010002136,
    "prefill.conv.28.candidate" : 0.041330646723508835,
    "prefill.conv.28.control" : 0.04838709533214569,
    "prefill.conv.29.candidate" : 0.0711805522441864,
    "prefill.conv.29.control" : 0.0625,
    "prefill.conv.30.candidate" : 0.08033111691474915,
    "prefill.conv.30.control" : 0.07901554554700851,
    "prefill.conv.32.candidate" : 0.07593458145856857,
    "prefill.conv.32.control" : 0.0849883183836937,
    "prefill.conv.33.candidate" : 0.062254901975393295,
    "prefill.conv.33.control" : 0.08235294371843338,
    "prefill.conv.34.candidate" : 0.06329113990068436,
    "prefill.conv.34.control" : 0.10126582533121109,
    "prefill.conv.36.candidate" : 0.06433823704719543,
    "prefill.conv.36.control" : 0.0784313753247261,
    "prefill.conv.37.candidate" : 0.045045044273138046,
    "prefill.conv.37.control" : 0.04954954981803894,
    "prefill.conv.38.candidate" : 0.03851103037595749,
    "prefill.conv.38.control" : 0.04117647185921669,
    "prefill.conv.4.candidate" : 0,
    "prefill.conv.4.control" : 0,
    "prefill.conv.40.candidate" : 0.06164383515715599,
    "prefill.conv.40.control" : 0.07994434982538223,
    "prefill.conv.41.candidate" : 0.056102361530065536,
    "prefill.conv.41.control" : 0.06422244012355804,
    "prefill.conv.42.candidate" : 0.04488031938672066,
    "prefill.conv.42.control" : 0.05673758685588837,
    "prefill.conv.44.candidate" : 0.09736841917037964,
    "prefill.conv.44.control" : 0.10526315867900848,
    "prefill.conv.45.candidate" : 0.03706660494208336,
    "prefill.conv.45.control" : 0.043795619159936905,
    "prefill.conv.46.candidate" : 0.04938271641731262,
    "prefill.conv.46.control" : 0.06018518656492233,
    "prefill.conv.5.candidate" : 0,
    "prefill.conv.5.control" : 0,
    "prefill.conv.6.candidate" : 0,
    "prefill.conv.6.control" : 0,
    "prefill.conv.8.candidate" : 0,
    "prefill.conv.8.control" : 0,
    "prefill.conv.9.candidate" : 0,
    "prefill.conv.9.control" : 0,
    "prefill.index.11.candidate" : 0.0015432098880410194,
    "prefill.index.11.control" : 0,
    "prefill.index.15.candidate" : 0.02247191034257412,
    "prefill.index.15.control" : 0.01755617931485176,
    "prefill.index.19.candidate" : 0.0359589047729969,
    "prefill.index.19.control" : 0.027397260069847107,
    "prefill.index.23.candidate" : 0.01919642835855484,
    "prefill.index.23.control" : 0.02276785671710968,
    "prefill.index.27.candidate" : 0.027846533805131912,
    "prefill.index.27.control" : 0.037128712981939316,
    "prefill.index.3.candidate" : 0.000739644980058074,
    "prefill.index.3.control" : 0,
    "prefill.index.31.candidate" : 0.12551867961883545,
    "prefill.index.31.control" : 0.19605809450149536,
    "prefill.index.35.candidate" : 0.12168873846530914,
    "prefill.index.35.control" : 0.11423841118812561,
    "prefill.index.39.candidate" : 0.10126582533121109,
    "prefill.index.39.control" : 0.04628164693713188,
    "prefill.index.43.candidate" : 0.05156249925494194,
    "prefill.index.43.control" : 0.04707031324505806,
    "prefill.index.47.candidate" : 0.10333333164453506,
    "prefill.index.47.control" : 0.10187499970197678,
    "prefill.index.7.candidate" : 0.0009191176504828036,
    "prefill.index.7.control" : 0,
    "prefill.key.11.candidate" : 0.003846153849735856,
    "prefill.key.11.control" : 0,
    "prefill.key.15.candidate" : 0.040145985782146454,
    "prefill.key.15.control" : 0.031934306025505066,
    "prefill.key.19.candidate" : 0.0659722238779068,
    "prefill.key.19.control" : 0.05613425746560097,
    "prefill.key.23.candidate" : 0.04749999940395355,
    "prefill.key.23.control" : 0.06541666388511658,
    "prefill.key.27.candidate" : 0.1027960553765297,
    "prefill.key.27.control" : 0.10896381735801697,
    "prefill.key.3.candidate" : 0,
    "prefill.key.3.control" : 0,
    "prefill.key.31.candidate" : 0.14135906100273132,
    "prefill.key.31.control" : 0.14901426434516907,
    "prefill.key.35.candidate" : 0.1754429191350937,
    "prefill.key.35.control" : 0.16338582336902618,
    "prefill.key.39.candidate" : 0.15703125298023224,
    "prefill.key.39.control" : 0.08671875298023224,
    "prefill.key.43.candidate" : 0.08588435500860214,
    "prefill.key.43.control" : 0.07823128998279572,
    "prefill.key.47.candidate" : 0.10384516417980194,
    "prefill.key.47.control" : 0.09786522388458252,
    "prefill.key.7.candidate" : 0,
    "prefill.key.7.control" : 0,
    "prefill.logits.candidate" : 0.06930866092443466,
    "prefill.logits.control" : 0.06354748457670212,
    "prefill.ple.1.candidate" : 0,
    "prefill.ple.1.control" : 0,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0,
    "prefill.ssm.1.control" : 0,
    "prefill.ssm.10.candidate" : 0,
    "prefill.ssm.10.control" : 0,
    "prefill.ssm.12.candidate" : 0.0009230458526872098,
    "prefill.ssm.12.control" : 0,
    "prefill.ssm.13.candidate" : 0.006295479368418455,
    "prefill.ssm.13.control" : 0.0002766742545645684,
    "prefill.ssm.14.candidate" : 0.003467313013970852,
    "prefill.ssm.14.control" : 0.0031120148487389088,
    "prefill.ssm.16.candidate" : 0.01158567052334547,
    "prefill.ssm.16.control" : 0.01928410865366459,
    "prefill.ssm.17.candidate" : 0.031713154166936874,
    "prefill.ssm.17.control" : 0.015351982787251472,
    "prefill.ssm.18.candidate" : 0.05504386126995087,
    "prefill.ssm.18.control" : 0.01835530996322632,
    "prefill.ssm.2.candidate" : 0,
    "prefill.ssm.2.control" : 0,
    "prefill.ssm.20.candidate" : 0.01564515382051468,
    "prefill.ssm.20.control" : 0.010046429932117462,
    "prefill.ssm.21.candidate" : 0.012216562405228615,
    "prefill.ssm.21.control" : 0.010658453218638897,
    "prefill.ssm.22.candidate" : 0.00753862876445055,
    "prefill.ssm.22.control" : 0.005643798969686031,
    "prefill.ssm.24.candidate" : 0.027043618261814117,
    "prefill.ssm.24.control" : 0.02616826258599758,
    "prefill.ssm.25.candidate" : 0.04582677781581879,
    "prefill.ssm.25.control" : 0.05810854583978653,
    "prefill.ssm.26.candidate" : 0.03890435770153999,
    "prefill.ssm.26.control" : 0.034994207322597504,
    "prefill.ssm.28.candidate" : 0.005499474238604307,
    "prefill.ssm.28.control" : 0.004434869159013033,
    "prefill.ssm.29.candidate" : 0.053915202617645264,
    "prefill.ssm.29.control" : 0.057749681174755096,
    "prefill.ssm.30.candidate" : 0.026796316727995872,
    "prefill.ssm.30.control" : 0.03673890605568886,
    "prefill.ssm.32.candidate" : 0.12114889174699783,
    "prefill.ssm.32.control" : 0.15956521034240723,
    "prefill.ssm.33.candidate" : 0.128217414021492,
    "prefill.ssm.33.control" : 0.13404248654842377,
    "prefill.ssm.34.candidate" : 0.08333829790353775,
    "prefill.ssm.34.control" : 0.09960776567459106,
    "prefill.ssm.36.candidate" : 0.06732548773288727,
    "prefill.ssm.36.control" : 0.07311578094959259,
    "prefill.ssm.37.candidate" : 0.09091543406248093,
    "prefill.ssm.37.control" : 0.1196533739566803,
    "prefill.ssm.38.candidate" : 0.0205119326710701,
    "prefill.ssm.38.control" : 0.022961735725402832,
    "prefill.ssm.4.candidate" : 0,
    "prefill.ssm.4.control" : 0,
    "prefill.ssm.40.candidate" : 0.02201922796666622,
    "prefill.ssm.40.control" : 0.014941614121198654,
    "prefill.ssm.41.candidate" : 0.024761555716395378,
    "prefill.ssm.41.control" : 0.01651778258383274,
    "prefill.ssm.42.candidate" : 0.017089903354644775,
    "prefill.ssm.42.control" : 0.041674401611089706,
    "prefill.ssm.44.candidate" : 0.019484853371977806,
    "prefill.ssm.44.control" : 0.014857178553938866,
    "prefill.ssm.45.candidate" : 0.10028064250946045,
    "prefill.ssm.45.control" : 0.09404612332582474,
    "prefill.ssm.46.candidate" : 0.11170949041843414,
    "prefill.ssm.46.control" : 0.17168006300926208,
    "prefill.ssm.5.candidate" : 0,
    "prefill.ssm.5.control" : 0,
    "prefill.ssm.6.candidate" : 0,
    "prefill.ssm.6.control" : 0,
    "prefill.ssm.8.candidate" : 0,
    "prefill.ssm.8.control" : 0,
    "prefill.ssm.9.candidate" : 0,
    "prefill.ssm.9.control" : 0,
    "prefill.value.11.candidate" : 0.00044964029802940786,
    "prefill.value.11.control" : 0,
    "prefill.value.15.candidate" : 0.011952191591262817,
    "prefill.value.15.control" : 0.009213147684931755,
    "prefill.value.19.candidate" : 0.014477040618658066,
    "prefill.value.19.control" : 0.012519929558038712,
    "prefill.value.23.candidate" : 0.04476744309067726,
    "prefill.value.23.control" : 0.0417151153087616,
    "prefill.value.27.candidate" : 0.015625,
    "prefill.value.27.control" : 0.014546001330018044,
    "prefill.value.3.candidate" : 0,
    "prefill.value.3.control" : 0,
    "prefill.value.31.candidate" : 0.05815217271447182,
    "prefill.value.31.control" : 0.072826087474823,
    "prefill.value.35.candidate" : 0.05978260934352875,
    "prefill.value.35.control" : 0.06159420311450958,
    "prefill.value.39.candidate" : 0.12619048357009888,
    "prefill.value.39.control" : 0.0494791679084301,
    "prefill.value.43.candidate" : 0.04245283082127571,
    "prefill.value.43.control" : 0.04088050499558449,
    "prefill.value.47.candidate" : 0.23780487477779388,
    "prefill.value.47.control" : 0.20636433362960815,
    "prefill.value.7.candidate" : 0,
    "prefill.value.7.control" : 0,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0,
    "rollback-1.conv.1.control" : 0,
    "rollback-1.conv.10.candidate" : 0,
    "rollback-1.conv.10.control" : 0,
    "rollback-1.conv.12.candidate" : 0.013333333656191826,
    "rollback-1.conv.12.control" : 0,
    "rollback-1.conv.13.candidate" : 0.014344261959195137,
    "rollback-1.conv.13.control" : 0,
    "rollback-1.conv.14.candidate" : 0.013020833022892475,
    "rollback-1.conv.14.control" : 0.0052083334885537624,
    "rollback-1.conv.16.candidate" : 0.0223214291036129,
    "rollback-1.conv.16.control" : 0.013392857275903225,
    "rollback-1.conv.17.candidate" : 0.026900773867964745,
    "rollback-1.conv.17.control" : 0.01663176529109478,
    "rollback-1.conv.18.candidate" : 0.023617511615157127,
    "rollback-1.conv.18.control" : 0.01569700427353382,
    "rollback-1.conv.2.candidate" : 0,
    "rollback-1.conv.2.control" : 0,
    "rollback-1.conv.20.candidate" : 0.02057160809636116,
    "rollback-1.conv.20.control" : 0.02010050229728222,
    "rollback-1.conv.21.candidate" : 0.01904761977493763,
    "rollback-1.conv.21.control" : 0.013988095335662365,
    "rollback-1.conv.22.candidate" : 0.014084506779909134,
    "rollback-1.conv.22.control" : 0.011003521271049976,
    "rollback-1.conv.24.candidate" : 0.016304347664117813,
    "rollback-1.conv.24.control" : 0.02038043551146984,
    "rollback-1.conv.25.candidate" : 0.034360188990831375,
    "rollback-1.conv.25.control" : 0.02769549749791622,
    "rollback-1.conv.26.candidate" : 0.0398230105638504,
    "rollback-1.conv.26.control" : 0.04203539714217186,
    "rollback-1.conv.28.candidate" : 0.050619833171367645,
    "rollback-1.conv.28.control" : 0.048553720116615295,
    "rollback-1.conv.29.candidate" : 0.0755208358168602,
    "rollback-1.conv.29.control" : 0.0520833320915699,
    "rollback-1.conv.30.candidate" : 0.10309278219938278,
    "rollback-1.conv.30.control" : 0.05541237071156502,
    "rollback-1.conv.32.candidate" : 0.09210526198148727,
    "rollback-1.conv.32.control" : 0.07456140220165253,
    "rollback-1.conv.33.candidate" : 0.07905138283967972,
    "rollback-1.conv.33.control" : 0.05978260934352875,
    "rollback-1.conv.34.candidate" : 0.0833333358168602,
    "rollback-1.conv.34.control" : 0.06195175275206566,
    "rollback-1.conv.36.candidate" : 0.13630951941013336,
    "rollback-1.conv.36.control" : 0.0833333358168602,
    "rollback-1.conv.37.candidate" : 0.10625000298023224,
    "rollback-1.conv.37.control" : 0.05714285746216774,
    "rollback-1.conv.38.candidate" : 0.04969879612326622,
    "rollback-1.conv.38.control" : 0.05120481923222542,
    "rollback-1.conv.4.candidate" : 0,
    "rollback-1.conv.4.control" : 0,
    "rollback-1.conv.40.candidate" : 0.10489510744810104,
    "rollback-1.conv.40.control" : 0.09134615212678909,
    "rollback-1.conv.41.candidate" : 0.08064515888690948,
    "rollback-1.conv.41.control" : 0.0698084682226181,
    "rollback-1.conv.42.candidate" : 0.08666666597127914,
    "rollback-1.conv.42.control" : 0.07140625268220901,
    "rollback-1.conv.44.candidate" : 0.08479531854391098,
    "rollback-1.conv.44.control" : 0.0659722238779068,
    "rollback-1.conv.45.candidate" : 0.08503401279449463,
    "rollback-1.conv.45.control" : 0.07525510340929031,
    "rollback-1.conv.46.candidate" : 0.0883152186870575,
    "rollback-1.conv.46.control" : 0.07676630467176437,
    "rollback-1.conv.5.candidate" : 0,
    "rollback-1.conv.5.control" : 0,
    "rollback-1.conv.6.candidate" : 0,
    "rollback-1.conv.6.control" : 0,
    "rollback-1.conv.8.candidate" : 0,
    "rollback-1.conv.8.control" : 0,
    "rollback-1.conv.9.candidate" : 0,
    "rollback-1.conv.9.control" : 0,
    "rollback-1.index.11.candidate" : 0.0015432098880410194,
    "rollback-1.index.11.control" : 0,
    "rollback-1.index.15.candidate" : 0.02247191034257412,
    "rollback-1.index.15.control" : 0.01755617931485176,
    "rollback-1.index.19.candidate" : 0.0359589047729969,
    "rollback-1.index.19.control" : 0.027397260069847107,
    "rollback-1.index.23.candidate" : 0.01919642835855484,
    "rollback-1.index.23.control" : 0.02276785671710968,
    "rollback-1.index.27.candidate" : 0.027846533805131912,
    "rollback-1.index.27.control" : 0.037128712981939316,
    "rollback-1.index.3.candidate" : 0.000739644980058074,
    "rollback-1.index.3.control" : 0,
    "rollback-1.index.31.candidate" : 0.12551867961883545,
    "rollback-1.index.31.control" : 0.19605809450149536,
    "rollback-1.index.35.candidate" : 0.12168873846530914,
    "rollback-1.index.35.control" : 0.11423841118812561,
    "rollback-1.index.39.candidate" : 0.10126582533121109,
    "rollback-1.index.39.control" : 0.04628164693713188,
    "rollback-1.index.43.candidate" : 0.05156249925494194,
    "rollback-1.index.43.control" : 0.04707031324505806,
    "rollback-1.index.47.candidate" : 0.10333333164453506,
    "rollback-1.index.47.control" : 0.10187499970197678,
    "rollback-1.index.7.candidate" : 0.0009191176504828036,
    "rollback-1.index.7.control" : 0,
    "rollback-1.key.11.candidate" : 0.003846153849735856,
    "rollback-1.key.11.control" : 0,
    "rollback-1.key.15.candidate" : 0.040145985782146454,
    "rollback-1.key.15.control" : 0.031934306025505066,
    "rollback-1.key.19.candidate" : 0.0659722238779068,
    "rollback-1.key.19.control" : 0.05613425746560097,
    "rollback-1.key.23.candidate" : 0.04749999940395355,
    "rollback-1.key.23.control" : 0.06541666388511658,
    "rollback-1.key.27.candidate" : 0.1027960553765297,
    "rollback-1.key.27.control" : 0.10896381735801697,
    "rollback-1.key.3.candidate" : 0,
    "rollback-1.key.3.control" : 0,
    "rollback-1.key.31.candidate" : 0.14135906100273132,
    "rollback-1.key.31.control" : 0.14901426434516907,
    "rollback-1.key.35.candidate" : 0.1754429191350937,
    "rollback-1.key.35.control" : 0.16338582336902618,
    "rollback-1.key.39.candidate" : 0.15703125298023224,
    "rollback-1.key.39.control" : 0.08671875298023224,
    "rollback-1.key.43.candidate" : 0.10204081982374191,
    "rollback-1.key.43.control" : 0.08843537420034409,
    "rollback-1.key.47.candidate" : 0.10384516417980194,
    "rollback-1.key.47.control" : 0.09786522388458252,
    "rollback-1.key.7.candidate" : 0,
    "rollback-1.key.7.control" : 0,
    "rollback-1.logits.candidate" : 0.13696059584617615,
    "rollback-1.logits.control" : 0.12570355832576752,
    "rollback-1.ple.1.candidate" : 0,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0,
    "rollback-1.ssm.1.control" : 0,
    "rollback-1.ssm.10.candidate" : 0,
    "rollback-1.ssm.10.control" : 0,
    "rollback-1.ssm.12.candidate" : 0.002563194837421179,
    "rollback-1.ssm.12.control" : 0,
    "rollback-1.ssm.13.candidate" : 0.009342980571091175,
    "rollback-1.ssm.13.control" : 0.0002743733348324895,
    "rollback-1.ssm.14.candidate" : 0.003578590229153633,
    "rollback-1.ssm.14.control" : 0.002468931255862117,
    "rollback-1.ssm.16.candidate" : 0.029732607305049896,
    "rollback-1.ssm.16.control" : 0.013193454593420029,
    "rollback-1.ssm.17.candidate" : 0.03470811992883682,
    "rollback-1.ssm.17.control" : 0.013512276113033295,
    "rollback-1.ssm.18.candidate" : 0.032347194850444794,
    "rollback-1.ssm.18.control" : 0.019590312615036964,
    "rollback-1.ssm.2.candidate" : 0,
    "rollback-1.ssm.2.control" : 0,
    "rollback-1.ssm.20.candidate" : 0.02079710178077221,
    "rollback-1.ssm.20.control" : 0.009005283936858177,
    "rollback-1.ssm.21.candidate" : 0.01150808110833168,
    "rollback-1.ssm.21.control" : 0.011700308881700039,
    "rollback-1.ssm.22.candidate" : 0.00625360943377018,
    "rollback-1.ssm.22.control" : 0.004206422250717878,
    "rollback-1.ssm.24.candidate" : 0.020061366260051727,
    "rollback-1.ssm.24.control" : 0.017506999894976616,
    "rollback-1.ssm.25.candidate" : 0.08044806867837906,
    "rollback-1.ssm.25.control" : 0.06453016400337219,
    "rollback-1.ssm.26.candidate" : 0.07995571941137314,
    "rollback-1.ssm.26.control" : 0.07511690258979797,
    "rollback-1.ssm.28.candidate" : 0.00614277133718133,
    "rollback-1.ssm.28.control" : 0.003858801908791065,
    "rollback-1.ssm.29.candidate" : 0.07599210739135742,
    "rollback-1.ssm.29.control" : 0.04648992046713829,
    "rollback-1.ssm.30.candidate" : 0.05704507231712341,
    "rollback-1.ssm.30.control" : 0.051631566137075424,
    "rollback-1.ssm.32.candidate" : 0.12008920311927795,
    "rollback-1.ssm.32.control" : 0.08469836413860321,
    "rollback-1.ssm.33.candidate" : 0.17732730507850647,
    "rollback-1.ssm.33.control" : 0.163725346326828,
    "rollback-1.ssm.34.candidate" : 0.1193094477057457,
    "rollback-1.ssm.34.control" : 0.12615029513835907,
    "rollback-1.ssm.36.candidate" : 0.10279611498117447,
    "rollback-1.ssm.36.control" : 0.05243952199816704,
    "rollback-1.ssm.37.candidate" : 0.06812239438295364,
    "rollback-1.ssm.37.control" : 0.03943127393722534,
    "rollback-1.ssm.38.candidate" : 0.026827190071344376,
    "rollback-1.ssm.38.control" : 0.015095353126525879,
    "rollback-1.ssm.4.candidate" : 0,
    "rollback-1.ssm.4.control" : 0,
    "rollback-1.ssm.40.candidate" : 0.023240601643919945,
    "rollback-1.ssm.40.control" : 0.01798965595662594,
    "rollback-1.ssm.41.candidate" : 0.02516208402812481,
    "rollback-1.ssm.41.control" : 0.022502552717924118,
    "rollback-1.ssm.42.candidate" : 0.07085874676704407,
    "rollback-1.ssm.42.control" : 0.0503694973886013,
    "rollback-1.ssm.44.candidate" : 0.01981261372566223,
    "rollback-1.ssm.44.control" : 0.015842685475945473,
    "rollback-1.ssm.45.candidate" : 0.14486195147037506,
    "rollback-1.ssm.45.control" : 0.12245684117078781,
    "rollback-1.ssm.46.candidate" : 0.10139182955026627,
    "rollback-1.ssm.46.control" : 0.128029465675354,
    "rollback-1.ssm.5.candidate" : 0,
    "rollback-1.ssm.5.control" : 0,
    "rollback-1.ssm.6.candidate" : 0,
    "rollback-1.ssm.6.control" : 0,
    "rollback-1.ssm.8.candidate" : 0,
    "rollback-1.ssm.8.control" : 0,
    "rollback-1.ssm.9.candidate" : 0,
    "rollback-1.ssm.9.control" : 0,
    "rollback-1.value.11.candidate" : 0.00044964029802940786,
    "rollback-1.value.11.control" : 0,
    "rollback-1.value.15.candidate" : 0.011952191591262817,
    "rollback-1.value.15.control" : 0.009213147684931755,
    "rollback-1.value.19.candidate" : 0.014477040618658066,
    "rollback-1.value.19.control" : 0.012519929558038712,
    "rollback-1.value.23.candidate" : 0.04476744309067726,
    "rollback-1.value.23.control" : 0.0417151153087616,
    "rollback-1.value.27.candidate" : 0.015625,
    "rollback-1.value.27.control" : 0.014546001330018044,
    "rollback-1.value.3.candidate" : 0,
    "rollback-1.value.3.control" : 0,
    "rollback-1.value.31.candidate" : 0.05815217271447182,
    "rollback-1.value.31.control" : 0.072826087474823,
    "rollback-1.value.35.candidate" : 0.05978260934352875,
    "rollback-1.value.35.control" : 0.06159420311450958,
    "rollback-1.value.39.candidate" : 0.12619048357009888,
    "rollback-1.value.39.control" : 0.0494791679084301,
    "rollback-1.value.43.candidate" : 0.04245283082127571,
    "rollback-1.value.43.control" : 0.04088050499558449,
    "rollback-1.value.47.candidate" : 0.23780487477779388,
    "rollback-1.value.47.control" : 0.20636433362960815,
    "rollback-1.value.7.candidate" : 0,
    "rollback-1.value.7.control" : 0,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0,
    "rollback-2.conv.10.control" : 0,
    "rollback-2.conv.12.candidate" : 0.014204545877873898,
    "rollback-2.conv.12.control" : 0,
    "rollback-2.conv.13.candidate" : 0.015173410065472126,
    "rollback-2.conv.13.control" : 0,
    "rollback-2.conv.14.candidate" : 0.012820512987673283,
    "rollback-2.conv.14.control" : 0.010256410576403141,
    "rollback-2.conv.16.candidate" : 0.018564356490969658,
    "rollback-2.conv.16.control" : 0.012995049357414246,
    "rollback-2.conv.17.candidate" : 0.020618556067347527,
    "rollback-2.conv.17.control" : 0.01663176529109478,
    "rollback-2.conv.18.candidate" : 0.02283105067908764,
    "rollback-2.conv.18.control" : 0.01198630128055811,
    "rollback-2.conv.2.candidate" : 0,
    "rollback-2.conv.2.control" : 0,
    "rollback-2.conv.20.candidate" : 0.02238805964589119,
    "rollback-2.conv.20.control" : 0.019900497049093246,
    "rollback-2.conv.21.candidate" : 0.01904761977493763,
    "rollback-2.conv.21.control" : 0.01904761977493763,
    "rollback-2.conv.22.candidate" : 0.014184396713972092,
    "rollback-2.conv.22.control" : 0.009807180613279343,
    "rollback-2.conv.24.candidate" : 0.01595744676887989,
    "rollback-2.conv.24.control" : 0.019946807995438576,
    "rollback-2.conv.25.candidate" : 0.034360188990831375,
    "rollback-2.conv.25.control" : 0.02769549749791622,
    "rollback-2.conv.26.candidate" : 0.033018868416547775,
    "rollback-2.conv.26.control" : 0.017688678577542305,
    "rollback-2.conv.28.candidate" : 0.04880478233098984,
    "rollback-2.conv.28.control" : 0.03959163278341293,
    "rollback-2.conv.29.candidate" : 0.059840425848960876,
    "rollback-2.conv.29.control" : 0.05319149047136307,
    "rollback-2.conv.30.candidate" : 0.06760203838348389,
    "rollback-2.conv.30.control" : 0.05484693869948387,
    "rollback-2.conv.32.candidate" : 0.09808612614870071,
    "rollback-2.conv.32.control" : 0.08133970946073532,
    "rollback-2.conv.33.candidate" : 0.07905138283967972,
    "rollback-2.conv.33.control" : 0.05978260934352875,
    "rollback-2.conv.34.candidate" : 0.08296943455934525,
    "rollback-2.conv.34.control" : 0.0589519664645195,
    "rollback-2.conv.36.candidate" : 0.1396341472864151,
    "rollback-2.conv.36.control" : 0.1024390235543251,
    "rollback-2.conv.37.candidate" : 0.07264957576990128,
    "rollback-2.conv.37.control" : 0.048277243971824646,
    "rollback-2.conv.38.candidate" : 0.04848484694957733,
    "rollback-2.conv.38.control" : 0.04308712109923363,
    "rollback-2.conv.4.candidate" : 0,
    "rollback-2.conv.4.control" : 0,
    "rollback-2.conv.40.candidate" : 0.09285714477300644,
    "rollback-2.conv.40.control" : 0.0535714291036129,
    "rollback-2.conv.41.candidate" : 0.07500000298023224,
    "rollback-2.conv.41.control" : 0.057692307978868484,
    "rollback-2.conv.42.candidate" : 0.08305369317531586,
    "rollback-2.conv.42.control" : 0.04739932715892792,
    "rollback-2.conv.44.candidate" : 0.1319444477558136,
    "rollback-2.conv.44.control" : 0.1358024626970291,
    "rollback-2.conv.45.candidate" : 0.08503401279449463,
    "rollback-2.conv.45.control" : 0.06568877398967743,
    "rollback-2.conv.46.candidate" : 0.08376963436603546,
    "rollback-2.conv.46.control" : 0.054973822087049484,
    "rollback-2.conv.5.candidate" : 0,
    "rollback-2.conv.5.control" : 0,
    "rollback-2.conv.6.candidate" : 0,
    "rollback-2.conv.6.control" : 0,
    "rollback-2.conv.8.candidate" : 0,
    "rollback-2.conv.8.control" : 0,
    "rollback-2.conv.9.candidate" : 0,
    "rollback-2.conv.9.control" : 0,
    "rollback-2.index.11.candidate" : 0.0015432098880410194,
    "rollback-2.index.11.control" : 0,
    "rollback-2.index.15.candidate" : 0.02247191034257412,
    "rollback-2.index.15.control" : 0.01755617931485176,
    "rollback-2.index.19.candidate" : 0.0359589047729969,
    "rollback-2.index.19.control" : 0.027397260069847107,
    "rollback-2.index.23.candidate" : 0.01919642835855484,
    "rollback-2.index.23.control" : 0.02276785671710968,
    "rollback-2.index.27.candidate" : 0.027846533805131912,
    "rollback-2.index.27.control" : 0.037128712981939316,
    "rollback-2.index.3.candidate" : 0.000739644980058074,
    "rollback-2.index.3.control" : 0,
    "rollback-2.index.31.candidate" : 0.12551867961883545,
    "rollback-2.index.31.control" : 0.19605809450149536,
    "rollback-2.index.35.candidate" : 0.12168873846530914,
    "rollback-2.index.35.control" : 0.11423841118812561,
    "rollback-2.index.39.candidate" : 0.10126582533121109,
    "rollback-2.index.39.control" : 0.04628164693713188,
    "rollback-2.index.43.candidate" : 0.05156249925494194,
    "rollback-2.index.43.control" : 0.04707031324505806,
    "rollback-2.index.47.candidate" : 0.10333333164453506,
    "rollback-2.index.47.control" : 0.10187499970197678,
    "rollback-2.index.7.candidate" : 0.0009191176504828036,
    "rollback-2.index.7.control" : 0,
    "rollback-2.key.11.candidate" : 0.003846153849735856,
    "rollback-2.key.11.control" : 0,
    "rollback-2.key.15.candidate" : 0.040145985782146454,
    "rollback-2.key.15.control" : 0.031934306025505066,
    "rollback-2.key.19.candidate" : 0.0659722238779068,
    "rollback-2.key.19.control" : 0.05613425746560097,
    "rollback-2.key.23.candidate" : 0.04749999940395355,
    "rollback-2.key.23.control" : 0.06541666388511658,
    "rollback-2.key.27.candidate" : 0.1027960553765297,
    "rollback-2.key.27.control" : 0.10896381735801697,
    "rollback-2.key.3.candidate" : 0,
    "rollback-2.key.3.control" : 0,
    "rollback-2.key.31.candidate" : 0.14135906100273132,
    "rollback-2.key.31.control" : 0.14901426434516907,
    "rollback-2.key.35.candidate" : 0.1754429191350937,
    "rollback-2.key.35.control" : 0.16338582336902618,
    "rollback-2.key.39.candidate" : 0.15703125298023224,
    "rollback-2.key.39.control" : 0.08671875298023224,
    "rollback-2.key.43.candidate" : 0.08588435500860214,
    "rollback-2.key.43.control" : 0.07823128998279572,
    "rollback-2.key.47.candidate" : 0.10384516417980194,
    "rollback-2.key.47.control" : 0.09786522388458252,
    "rollback-2.key.7.candidate" : 0,
    "rollback-2.key.7.control" : 0,
    "rollback-2.logits.candidate" : 0.044455066323280334,
    "rollback-2.logits.control" : 0.05688336491584778,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0,
    "rollback-2.ssm.1.control" : 0,
    "rollback-2.ssm.10.candidate" : 0,
    "rollback-2.ssm.10.control" : 0,
    "rollback-2.ssm.12.candidate" : 0.0027195378206670284,
    "rollback-2.ssm.12.control" : 0,
    "rollback-2.ssm.13.candidate" : 0.009264699183404446,
    "rollback-2.ssm.13.control" : 0.0002791119331959635,
    "rollback-2.ssm.14.candidate" : 0.00443757139146328,
    "rollback-2.ssm.14.control" : 0.0048773935995996,
    "rollback-2.ssm.16.candidate" : 0.010922747664153576,
    "rollback-2.ssm.16.control" : 0.010922309011220932,
    "rollback-2.ssm.17.candidate" : 0.013531271368265152,
    "rollback-2.ssm.17.control" : 0.013563264161348343,
    "rollback-2.ssm.18.candidate" : 0.014593859203159809,
    "rollback-2.ssm.18.control" : 0.013371502049267292,
    "rollback-2.ssm.2.candidate" : 0,
    "rollback-2.ssm.2.control" : 0,
    "rollback-2.ssm.20.candidate" : 0.015106410719454288,
    "rollback-2.ssm.20.control" : 0.00973447598516941,
    "rollback-2.ssm.21.candidate" : 0.010333861224353313,
    "rollback-2.ssm.21.control" : 0.012765606865286827,
    "rollback-2.ssm.22.candidate" : 0.006214126478880644,
    "rollback-2.ssm.22.control" : 0.0044365995563566685,
    "rollback-2.ssm.24.candidate" : 0.022523783147335052,
    "rollback-2.ssm.24.control" : 0.014221612364053726,
    "rollback-2.ssm.25.candidate" : 0.054873060435056686,
    "rollback-2.ssm.25.control" : 0.03429656848311424,
    "rollback-2.ssm.26.candidate" : 0.04164537787437439,
    "rollback-2.ssm.26.control" : 0.05921730399131775,
    "rollback-2.ssm.28.candidate" : 0.0036768175195902586,
    "rollback-2.ssm.28.control" : 0.0024056602269411087,
    "rollback-2.ssm.29.candidate" : 0.03626979887485504,
    "rollback-2.ssm.29.control" : 0.04527357220649719,
    "rollback-2.ssm.30.candidate" : 0.047463785856962204,
    "rollback-2.ssm.30.control" : 0.037865109741687775,
    "rollback-2.ssm.32.candidate" : 0.04398900270462036,
    "rollback-2.ssm.32.control" : 0.05244925990700722,
    "rollback-2.ssm.33.candidate" : 0.038653843104839325,
    "rollback-2.ssm.33.control" : 0.09059132635593414,
    "rollback-2.ssm.34.candidate" : 0.06590232253074646,
    "rollback-2.ssm.34.control" : 0.07004349678754807,
    "rollback-2.ssm.36.candidate" : 0.04453817382454872,
    "rollback-2.ssm.36.control" : 0.03718012571334839,
    "rollback-2.ssm.37.candidate" : 0.07601228356361389,
    "rollback-2.ssm.37.control" : 0.0559813566505909,
    "rollback-2.ssm.38.candidate" : 0.018946107476949692,
    "rollback-2.ssm.38.control" : 0.01301589421927929,
    "rollback-2.ssm.4.candidate" : 0,
    "rollback-2.ssm.4.control" : 0,
    "rollback-2.ssm.40.candidate" : 0.022928187623620033,
    "rollback-2.ssm.40.control" : 0.019173989072442055,
    "rollback-2.ssm.41.candidate" : 0.026386994868516922,
    "rollback-2.ssm.41.control" : 0.021716510877013206,
    "rollback-2.ssm.42.candidate" : 0.04474715143442154,
    "rollback-2.ssm.42.control" : 0.029392121359705925,
    "rollback-2.ssm.44.candidate" : 0.02037392556667328,
    "rollback-2.ssm.44.control" : 0.015560891479253769,
    "rollback-2.ssm.45.candidate" : 0.10274596512317657,
    "rollback-2.ssm.45.control" : 0.06941861659288406,
    "rollback-2.ssm.46.candidate" : 0.07083369791507721,
    "rollback-2.ssm.46.control" : 0.13302038609981537,
    "rollback-2.ssm.5.candidate" : 0,
    "rollback-2.ssm.5.control" : 0,
    "rollback-2.ssm.6.candidate" : 0,
    "rollback-2.ssm.6.control" : 0,
    "rollback-2.ssm.8.candidate" : 0,
    "rollback-2.ssm.8.control" : 0,
    "rollback-2.ssm.9.candidate" : 0,
    "rollback-2.ssm.9.control" : 0,
    "rollback-2.value.11.candidate" : 0.00044964029802940786,
    "rollback-2.value.11.control" : 0,
    "rollback-2.value.15.candidate" : 0.011952191591262817,
    "rollback-2.value.15.control" : 0.009213147684931755,
    "rollback-2.value.19.candidate" : 0.014477040618658066,
    "rollback-2.value.19.control" : 0.012519929558038712,
    "rollback-2.value.23.candidate" : 0.04476744309067726,
    "rollback-2.value.23.control" : 0.0417151153087616,
    "rollback-2.value.27.candidate" : 0.015625,
    "rollback-2.value.27.control" : 0.014546001330018044,
    "rollback-2.value.3.candidate" : 0,
    "rollback-2.value.3.control" : 0,
    "rollback-2.value.31.candidate" : 0.05815217271447182,
    "rollback-2.value.31.control" : 0.072826087474823,
    "rollback-2.value.35.candidate" : 0.05978260934352875,
    "rollback-2.value.35.control" : 0.06159420311450958,
    "rollback-2.value.39.candidate" : 0.12619048357009888,
    "rollback-2.value.39.control" : 0.0494791679084301,
    "rollback-2.value.43.candidate" : 0.04245283082127571,
    "rollback-2.value.43.control" : 0.04088050499558449,
    "rollback-2.value.47.candidate" : 0.23780487477779388,
    "rollback-2.value.47.control" : 0.20636433362960815,
    "rollback-2.value.7.candidate" : 0,
    "rollback-2.value.7.control" : 0,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0,
    "rollback-3.conv.10.control" : 0,
    "rollback-3.conv.12.candidate" : 0.014204545877873898,
    "rollback-3.conv.12.control" : 0,
    "rollback-3.conv.13.candidate" : 0.008379888720810413,
    "rollback-3.conv.13.control" : 0,
    "rollback-3.conv.14.candidate" : 0.007692307699471712,
    "rollback-3.conv.14.control" : 0.010256410576403141,
    "rollback-3.conv.16.candidate" : 0.019183168187737465,
    "rollback-3.conv.16.control" : 0.015470297075808048,
    "rollback-3.conv.17.candidate" : 0.01424870453774929,
    "rollback-3.conv.17.control" : 0.01683937758207321,
    "rollback-3.conv.18.candidate" : 0.0125570772215724,
    "rollback-3.conv.18.control" : 0.021029537543654442,
    "rollback-3.conv.2.candidate" : 0,
    "rollback-3.conv.2.control" : 0,
    "rollback-3.conv.20.candidate" : 0.02798507548868656,
    "rollback-3.conv.20.control" : 0.04042288661003113,
    "rollback-3.conv.21.candidate" : 0.019138755276799202,
    "rollback-3.conv.21.control" : 0.025119617581367493,
    "rollback-3.conv.22.candidate" : 0.011524822562932968,
    "rollback-3.conv.22.control" : 0.016400709748268127,
    "rollback-3.conv.24.candidate" : 0.03351955488324165,
    "rollback-3.conv.24.control" : 0.03072625771164894,
    "rollback-3.conv.25.candidate" : 0.0316220223903656,
    "rollback-3.conv.25.control" : 0.03928571566939354,
    "rollback-3.conv.26.candidate" : 0.05070754885673523,
    "rollback-3.conv.26.control" : 0.041347287595272064,
    "rollback-3.conv.28.candidate" : 0.039840638637542725,
    "rollback-3.conv.28.control" : 0.03187251091003418,
    "rollback-3.conv.29.candidate" : 0.06010929122567177,
    "rollback-3.conv.29.control" : 0.048497267067432404,
    "rollback-3.conv.30.candidate" : 0.06632652878761292,
    "rollback-3.conv.30.control" : 0.04950574040412903,
    "rollback-3.conv.32.candidate" : 0.08293838798999786,
    "rollback-3.conv.32.control" : 0.0758293867111206,
    "rollback-3.conv.33.candidate" : 0.06086956337094307,
    "rollback-3.conv.33.control" : 0.07890625298023224,
    "rollback-3.conv.34.candidate" : 0.08193277567625046,
    "rollback-3.conv.34.control" : 0.05567226931452751,
    "rollback-3.conv.36.candidate" : 0.1538461595773697,
    "rollback-3.conv.36.control" : 0.10096153616905212,
    "rollback-3.conv.37.candidate" : 0.058693911880254745,
    "rollback-3.conv.37.control" : 0.09401709586381912,
    "rollback-3.conv.38.candidate" : 0.04848484694957733,
    "rollback-3.conv.38.control" : 0.035606060177087784,
    "rollback-3.conv.4.candidate" : 0,
    "rollback-3.conv.4.control" : 0,
    "rollback-3.conv.40.candidate" : 0.07276785373687744,
    "rollback-3.conv.40.control" : 0.07500000298023224,
    "rollback-3.conv.41.candidate" : 0.07307818531990051,
    "rollback-3.conv.41.control" : 0.05057251825928688,
    "rollback-3.conv.42.candidate" : 0.04640638083219528,
    "rollback-3.conv.42.control" : 0.05180368945002556,
    "rollback-3.conv.44.candidate" : 0.1319444477558136,
    "rollback-3.conv.44.control" : 0.1358024626970291,
    "rollback-3.conv.45.candidate" : 0.05244755372405052,
    "rollback-3.conv.45.control" : 0.03496503457427025,
    "rollback-3.conv.46.candidate" : 0.052356019616127014,
    "rollback-3.conv.46.control" : 0.0445026196539402,
    "rollback-3.conv.5.candidate" : 0,
    "rollback-3.conv.5.control" : 0,
    "rollback-3.conv.6.candidate" : 0,
    "rollback-3.conv.6.control" : 0,
    "rollback-3.conv.8.candidate" : 0,
    "rollback-3.conv.8.control" : 0,
    "rollback-3.conv.9.candidate" : 0,
    "rollback-3.conv.9.control" : 0,
    "rollback-3.index.11.candidate" : 0.0015432098880410194,
    "rollback-3.index.11.control" : 0,
    "rollback-3.index.15.candidate" : 0.02247191034257412,
    "rollback-3.index.15.control" : 0.01755617931485176,
    "rollback-3.index.19.candidate" : 0.0359589047729969,
    "rollback-3.index.19.control" : 0.027397260069847107,
    "rollback-3.index.23.candidate" : 0.01919642835855484,
    "rollback-3.index.23.control" : 0.02276785671710968,
    "rollback-3.index.27.candidate" : 0.027846533805131912,
    "rollback-3.index.27.control" : 0.037128712981939316,
    "rollback-3.index.3.candidate" : 0.000739644980058074,
    "rollback-3.index.3.control" : 0,
    "rollback-3.index.31.candidate" : 0.12551867961883545,
    "rollback-3.index.31.control" : 0.19605809450149536,
    "rollback-3.index.35.candidate" : 0.12168873846530914,
    "rollback-3.index.35.control" : 0.11423841118812561,
    "rollback-3.index.39.candidate" : 0.10126582533121109,
    "rollback-3.index.39.control" : 0.04628164693713188,
    "rollback-3.index.43.candidate" : 0.05156249925494194,
    "rollback-3.index.43.control" : 0.04707031324505806,
    "rollback-3.index.47.candidate" : 0.10333333164453506,
    "rollback-3.index.47.control" : 0.10187499970197678,
    "rollback-3.index.7.candidate" : 0.0009191176504828036,
    "rollback-3.index.7.control" : 0,
    "rollback-3.key.11.candidate" : 0.003846153849735856,
    "rollback-3.key.11.control" : 0,
    "rollback-3.key.15.candidate" : 0.040145985782146454,
    "rollback-3.key.15.control" : 0.031934306025505066,
    "rollback-3.key.19.candidate" : 0.0659722238779068,
    "rollback-3.key.19.control" : 0.05613425746560097,
    "rollback-3.key.23.candidate" : 0.04749999940395355,
    "rollback-3.key.23.control" : 0.06541666388511658,
    "rollback-3.key.27.candidate" : 0.1027960553765297,
    "rollback-3.key.27.control" : 0.10896381735801697,
    "rollback-3.key.3.candidate" : 0,
    "rollback-3.key.3.control" : 0,
    "rollback-3.key.31.candidate" : 0.14135906100273132,
    "rollback-3.key.31.control" : 0.14901426434516907,
    "rollback-3.key.35.candidate" : 0.1754429191350937,
    "rollback-3.key.35.control" : 0.16338582336902618,
    "rollback-3.key.39.candidate" : 0.15703125298023224,
    "rollback-3.key.39.control" : 0.08671875298023224,
    "rollback-3.key.43.candidate" : 0.08588435500860214,
    "rollback-3.key.43.control" : 0.07823128998279572,
    "rollback-3.key.47.candidate" : 0.10384516417980194,
    "rollback-3.key.47.control" : 0.09786522388458252,
    "rollback-3.key.7.candidate" : 0,
    "rollback-3.key.7.control" : 0,
    "rollback-3.logits.candidate" : 0.0714285746216774,
    "rollback-3.logits.control" : 0.06941650062799454,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0,
    "rollback-3.ssm.1.control" : 0,
    "rollback-3.ssm.10.candidate" : 0,
    "rollback-3.ssm.10.control" : 0,
    "rollback-3.ssm.12.candidate" : 0.0017198491841554642,
    "rollback-3.ssm.12.control" : 0,
    "rollback-3.ssm.13.candidate" : 0.008769230917096138,
    "rollback-3.ssm.13.control" : 0.0002753961889538914,
    "rollback-3.ssm.14.candidate" : 0.008856927044689655,
    "rollback-3.ssm.14.control" : 0.007244178093969822,
    "rollback-3.ssm.16.candidate" : 0.014720022678375244,
    "rollback-3.ssm.16.control" : 0.013954143971204758,
    "rollback-3.ssm.17.candidate" : 0.019553974270820618,
    "rollback-3.ssm.17.control" : 0.02861716039478779,
    "rollback-3.ssm.18.candidate" : 0.020936422049999237,
    "rollback-3.ssm.18.control" : 0.04236041009426117,
    "rollback-3.ssm.2.candidate" : 0,
    "rollback-3.ssm.2.control" : 0,
    "rollback-3.ssm.20.candidate" : 0.020622175186872482,
    "rollback-3.ssm.20.control" : 0.021035408601164818,
    "rollback-3.ssm.21.candidate" : 0.014963725581765175,
    "rollback-3.ssm.21.control" : 0.012942383997142315,
    "rollback-3.ssm.22.candidate" : 0.006272493861615658,
    "rollback-3.ssm.22.control" : 0.004294726997613907,
    "rollback-3.ssm.24.candidate" : 0.015884574502706528,
    "rollback-3.ssm.24.control" : 0.014817526564002037,
    "rollback-3.ssm.25.candidate" : 0.07679128646850586,
    "rollback-3.ssm.25.control" : 0.06067748740315437,
    "rollback-3.ssm.26.candidate" : 0.11931531876325607,
    "rollback-3.ssm.26.control" : 0.09641925990581512,
    "rollback-3.ssm.28.candidate" : 0.0067252665758132935,
    "rollback-3.ssm.28.control" : 0.003989783581346273,
    "rollback-3.ssm.29.candidate" : 0.0394960381090641,
    "rollback-3.ssm.29.control" : 0.061760202050209045,
    "rollback-3.ssm.30.candidate" : 0.04836248233914375,
    "rollback-3.ssm.30.control" : 0.04147869721055031,
    "rollback-3.ssm.32.candidate" : 0.06658486276865005,
    "rollback-3.ssm.32.control" : 0.07607626914978027,
    "rollback-3.ssm.33.candidate" : 0.09210222214460373,
    "rollback-3.ssm.33.control" : 0.15820598602294922,
    "rollback-3.ssm.34.candidate" : 0.09675981849431992,
    "rollback-3.ssm.34.control" : 0.13165420293807983,
    "rollback-3.ssm.36.candidate" : 0.11563585698604584,
    "rollback-3.ssm.36.control" : 0.08035723119974136,
    "rollback-3.ssm.37.candidate" : 0.07010958343744278,
    "rollback-3.ssm.37.control" : 0.07587326318025589,
    "rollback-3.ssm.38.candidate" : 0.018309112638235092,
    "rollback-3.ssm.38.control" : 0.0154428631067276,
    "rollback-3.ssm.4.candidate" : 0,
    "rollback-3.ssm.4.control" : 0,
    "rollback-3.ssm.40.candidate" : 0.022363465279340744,
    "rollback-3.ssm.40.control" : 0.025110634043812752,
    "rollback-3.ssm.41.candidate" : 0.026598727330565453,
    "rollback-3.ssm.41.control" : 0.02152792364358902,
    "rollback-3.ssm.42.candidate" : 0.03938359394669533,
    "rollback-3.ssm.42.control" : 0.034233737736940384,
    "rollback-3.ssm.44.candidate" : 0.02019702084362507,
    "rollback-3.ssm.44.control" : 0.015147016383707523,
    "rollback-3.ssm.45.candidate" : 0.11060060560703278,
    "rollback-3.ssm.45.control" : 0.092524953186512,
    "rollback-3.ssm.46.candidate" : 0.07301348447799683,
    "rollback-3.ssm.46.control" : 0.13415981829166412,
    "rollback-3.ssm.5.candidate" : 0,
    "rollback-3.ssm.5.control" : 0,
    "rollback-3.ssm.6.candidate" : 0,
    "rollback-3.ssm.6.control" : 0,
    "rollback-3.ssm.8.candidate" : 0,
    "rollback-3.ssm.8.control" : 0,
    "rollback-3.ssm.9.candidate" : 0,
    "rollback-3.ssm.9.control" : 0,
    "rollback-3.value.11.candidate" : 0.00044964029802940786,
    "rollback-3.value.11.control" : 0,
    "rollback-3.value.15.candidate" : 0.011952191591262817,
    "rollback-3.value.15.control" : 0.009213147684931755,
    "rollback-3.value.19.candidate" : 0.014477040618658066,
    "rollback-3.value.19.control" : 0.012519929558038712,
    "rollback-3.value.23.candidate" : 0.04476744309067726,
    "rollback-3.value.23.control" : 0.0417151153087616,
    "rollback-3.value.27.candidate" : 0.015625,
    "rollback-3.value.27.control" : 0.014546001330018044,
    "rollback-3.value.3.candidate" : 0,
    "rollback-3.value.3.control" : 0,
    "rollback-3.value.31.candidate" : 0.05815217271447182,
    "rollback-3.value.31.control" : 0.072826087474823,
    "rollback-3.value.35.candidate" : 0.05978260934352875,
    "rollback-3.value.35.control" : 0.06159420311450958,
    "rollback-3.value.39.candidate" : 0.12619048357009888,
    "rollback-3.value.39.control" : 0.0494791679084301,
    "rollback-3.value.43.candidate" : 0.04245283082127571,
    "rollback-3.value.43.control" : 0.04088050499558449,
    "rollback-3.value.47.candidate" : 0.23780487477779388,
    "rollback-3.value.47.control" : 0.20636433362960815,
    "rollback-3.value.7.candidate" : 0,
    "rollback-3.value.7.control" : 0,
    "routing.candidate" : 0.0298584142394822,
    "routing.control" : 0.022079288025889966,
    "workspace_token_tile" : 256
  },
  "name" : "context-small-pass-64-swept",
  "passed" : false
}

````

## small64-padded-10/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## Portable observations and identities

```json
{
  "identity": {
    "binary_sha256": "0afafac1954bd1b7d1abd25fa9d6f158a137db005de6caaeb2381d40e45ef0fd",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "source_archive_sha256": "92d5454886b5a4d81302c61558e28a095c75d425bc482faf5d0c5b677ce2562c"
  },
  "runs": {
    "components-10": {
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 29496655872,
        "swapins": 43796886,
        "swapouts": 77363385,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   197664.\nPages active:                                1187292.\nPages inactive:                               922688.\nPages speculative:                            272483.\nPages throttled:                                   0.\nPages wired down:                             226144.\nPages purgeable:                                2231.\n\"Translation faults\":                    14779992546.\nPages copy-on-write:                       683751010.\nPages zero filled:                       19973209379.\nPages reactivated:                        3289609607.\nPages purged:                               69324661.\nFile-backed pages:                           1600438.\nAnonymous pages:                              782025.\nPages stored in compressor:                  1507775.\nPages occupied by compressor:                 277650.\nDecompressions:                           1136318124.\nCompressions:                             1447074271.\nPageins:                                  7035320676.\nPageouts:                                   10955208.\nSwapins:                                    43796886.\nSwapouts:                                   77363385.\nPages tagged:                                 156966.\nPages tagged resident:                        126395.\nPages tagged compressed:                       30571.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7102.\nPages tag-storage free:                         1768.\nPages tag-storage non-tag pageable:            89426.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5326336.\nTagged compressions:                        10751309.\nTagged decompressions:                       9927186.\n"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 29811376128,
        "swapins": 43796886,
        "swapouts": 77363385,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   417347.\nPages active:                                1084922.\nPages inactive:                              1012421.\nPages speculative:                             71587.\nPages throttled:                                   0.\nPages wired down:                             224112.\nPages purgeable:                                  41.\n\"Translation faults\":                    14780489638.\nPages copy-on-write:                       683765653.\nPages zero filled:                       19974051342.\nPages reactivated:                        3289625348.\nPages purged:                               69326932.\nFile-backed pages:                           1402154.\nAnonymous pages:                              766776.\nPages stored in compressor:                  1507705.\nPages occupied by compressor:                 274929.\nDecompressions:                           1136318194.\nCompressions:                             1447074271.\nPageins:                                  7035331140.\nPageouts:                                   10955215.\nSwapins:                                    43796886.\nSwapouts:                                   77363385.\nPages tagged:                                 157079.\nPages tagged resident:                        126508.\nPages tagged compressed:                       30571.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7102.\nPages tag-storage free:                          563.\nPages tag-storage non-tag pageable:            90631.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5326336.\nTagged compressions:                        10751309.\nTagged decompressions:                       9927186.\n"
      },
      "exit_code": 0,
      "passed": true,
      "assertions": 91,
      "command": [
        "optimization-state-check",
        "--variant",
        "context-small-components",
        "--json"
      ]
    },
    "components-padded-10": {
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 29794713600,
        "swapins": 43796886,
        "swapouts": 77363385,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   416228.\nPages active:                                1084704.\nPages inactive:                              1011389.\nPages speculative:                             72394.\nPages throttled:                                   0.\nPages wired down:                             225699.\nPages purgeable:                                  41.\n\"Translation faults\":                    14780495658.\nPages copy-on-write:                       683766036.\nPages zero filled:                       19974054873.\nPages reactivated:                        3289625348.\nPages purged:                               69326932.\nFile-backed pages:                           1402256.\nAnonymous pages:                              766231.\nPages stored in compressor:                  1507705.\nPages occupied by compressor:                 274929.\nDecompressions:                           1136318194.\nCompressions:                             1447074271.\nPageins:                                  7035331190.\nPageouts:                                   10955215.\nSwapins:                                    43796886.\nSwapouts:                                   77363385.\nPages tagged:                                 157118.\nPages tagged resident:                        126547.\nPages tagged compressed:                       30571.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7102.\nPages tag-storage free:                          550.\nPages tag-storage non-tag pageable:            90644.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5326336.\nTagged compressions:                        10751309.\nTagged decompressions:                       9927186.\n"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 29692903424,
        "swapins": 43796886,
        "swapouts": 77363385,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   406816.\nPages active:                                1084713.\nPages inactive:                              1008532.\nPages speculative:                             74963.\nPages throttled:                                   0.\nPages wired down:                             235122.\nPages purgeable:                                  98.\n\"Translation faults\":                    14780811240.\nPages copy-on-write:                       683769475.\nPages zero filled:                       19974827380.\nPages reactivated:                        3289625348.\nPages purged:                               69326932.\nFile-backed pages:                           1405397.\nAnonymous pages:                              762811.\nPages stored in compressor:                  1507674.\nPages occupied by compressor:                 274928.\nDecompressions:                           1136318211.\nCompressions:                             1447074271.\nPageins:                                  7035333148.\nPageouts:                                   10955215.\nSwapins:                                    43796886.\nSwapouts:                                   77363385.\nPages tagged:                                 157621.\nPages tagged resident:                        127057.\nPages tagged compressed:                       30564.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7102.\nPages tag-storage free:                          543.\nPages tag-storage non-tag pageable:            90651.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5326144.\nTagged compressions:                        10751309.\nTagged decompressions:                       9927191.\n"
      },
      "exit_code": 0,
      "passed": true,
      "assertions": 91,
      "command": [
        "optimization-state-check",
        "--variant",
        "context-small-components-padded",
        "--json"
      ]
    },
    "small64-padded-10": {
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 29923475456,
        "swapins": 43796926,
        "swapouts": 77363385,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   330372.\nPages active:                                1122713.\nPages inactive:                              1022773.\nPages speculative:                            110448.\nPages throttled:                                   0.\nPages wired down:                             225041.\nPages purgeable:                                1638.\n\"Translation faults\":                    14787052182.\nPages copy-on-write:                       683943896.\nPages zero filled:                       19978125291.\nPages reactivated:                        3289626042.\nPages purged:                               69328660.\nFile-backed pages:                           1494374.\nAnonymous pages:                              761560.\nPages stored in compressor:                  1504531.\nPages occupied by compressor:                 273527.\nDecompressions:                           1136321336.\nCompressions:                             1447074271.\nPageins:                                  7035429838.\nPageouts:                                   10955215.\nSwapins:                                    43796926.\nSwapouts:                                   77363385.\nPages tagged:                                 157186.\nPages tagged resident:                        126695.\nPages tagged compressed:                       30491.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7102.\nPages tag-storage free:                          726.\nPages tag-storage non-tag pageable:            90468.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5316480.\nTagged compressions:                        10751309.\nTagged decompressions:                       9927258.\n"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 29828956160,
        "swapins": 43796934,
        "swapouts": 77363385,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   398176.\nPages active:                                1091158.\nPages inactive:                              1073065.\nPages speculative:                             16577.\nPages throttled:                                   0.\nPages wired down:                             235222.\nPages purgeable:                                  28.\n\"Translation faults\":                    14787480409.\nPages copy-on-write:                       683961158.\nPages zero filled:                       19983423849.\nPages reactivated:                        3289720120.\nPages purged:                               69330886.\nFile-backed pages:                           1422411.\nAnonymous pages:                              758391.\nPages stored in compressor:                  1497625.\nPages occupied by compressor:                 270388.\nDecompressions:                           1136328190.\nCompressions:                             1447074271.\nPageins:                                  7035497850.\nPageouts:                                   10955272.\nSwapins:                                    43796934.\nSwapouts:                                   77363385.\nPages tagged:                                 158509.\nPages tagged resident:                        128342.\nPages tagged compressed:                       30167.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7102.\nPages tag-storage free:                          889.\nPages tag-storage non-tag pageable:            90305.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5253312.\nTagged compressions:                        10751309.\nTagged decompressions:                       9927576.\n"
      },
      "exit_code": 1,
      "passed": false,
      "assertions": 1604,
      "command": [
        "optimization-state-check",
        "--variant",
        "context-small-swept-padded-64",
        "--json"
      ]
    }
  }
}
```
