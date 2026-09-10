---
type: run
id: 01m1w2c92p9b4sk8jrrwwbtgpj
created: 2026-09-06T19:16:00.726625+00:00
updated: 2026-09-06T19:16:00.892577+00:00
summary: Actual MTP cancellation exposes an exclusive stats access abort
binary: 731d3b7d663bc3634c4372de5c46f29b6b732dad135765380a8d1e59bc979e3b
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Actual MTP cancellation exposes an exclusive stats access abort
tool: Native Swift diagnostics and Python CLI gates
---
# MTP cancellation counterexample

The next fixed case, `prefix-retention-mtp`, aborts with SIGABRT (exit -6)
before emitting a JSON report. The wrapper's JSONDecodeError is secondary;
the preserved stderr reports simultaneous exclusive accesses to Generator's
statistics while speculativeDecode holds an inout borrow. The new continuation
callback writes outer stats when its caller cancels, including the legacy
committed-prefix fixture used by this gate.

The batch stops on this first failure. Build, check and model processes all
exit, and nonblocking acquisition confirms the shared model lock is free.
No later model case, capacity ladder or consumer build starts in this batch.
The ten preceding C07 cases and HTTP835 pass, but they do not cover this
actual MTP cancellation path. All overlapping timing/capacity is excluded.

The prospective minimal correction stores caller cancellation separately and
folds it into statistics only after the speculative inout borrow returns.
Explicit RequestController failures retain precedence; legacy cancellation
can still preserve a valid committed prefix without inventing a runtime error.
The optimization owner has applied the same three-hunk correction to its
shared v3 source. The correction and new typed cancellation/recovery witnesses
require a fresh identified build and native run; this failed result remains.

Command: `slotstream optimization-state-check --variant prefix-retention-mtp --json`.

## Frozen build identity

```json
{
  "binary_sha256": "731d3b7d663bc3634c4372de5c46f29b6b732dad135765380a8d1e59bc979e3b",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "d670292842638688eabe8bf1278fa6b30f1015d087258c996946c611d654fe9d"
}
```

## prefix-retention-mtp-16/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## prefix-retention-mtp-16/stderr.txt

SHA-256 `9d8fbbe9ec1463ebad6a556ebd63b29ca733fa21c949ee4f89756622925d36aa`; 1673 bytes.

````text
Simultaneous accesses to 0x81d0b8010, but modification requires exclusive access.
Previous access (a modification) started at slotstream`Generator.generate(promptIds:params:eosIds:cache:vision:shouldContinue:onToken:request:onAdmitted:) + 29176 (0x10147a308).
Current access (a modification) started at:
0    libswiftCore.dylib                 0x0000000199ae7904 swift::runtime::AccessSet::insert(swift::runtime::Access*, void*, void*, swift::ExclusivityFlags) + 476
1    libswiftCore.dylib                 0x0000000199a82bd0 swift_beginAccess + 84
2    slotstream                         0x0000000101481b70 closure #1 in Generator.generate(promptIds:params:eosIds:cache:vision:shouldContinue:onToken:request:onAdmitted:) + 896
3    slotstream                         0x0000000101483180 specialized Generator.speculativeDecode(head:mtpState:state:logits:params:eosIds:shouldContinue:contextLimit:checkAllocation:onToken:out:generated:reason:consumed:stats:) + 348
4    slotstream                         0x0000000101473110 Generator.generate(promptIds:params:eosIds:cache:vision:shouldContinue:onToken:request:onAdmitted:) + 29388
5    slotstream                         0x00000001016182f0 static Diagnostics.optimizationPrefixRetention(modelDir:mtp:) + 1508
6    slotstream                         0x00000001016e6f6c OptimizationStateCheck.run() + 22152
7    slotstream                         0x00000001016f2d1c protocol witness for ParsableCommand.run() in conformance OptimizationStateCheck + 52
8    slotstream                         0x00000001016995f8 main + 96
9    dyld                               0x0000000185f62994 start + 6992
Fatal access conflict detected.

````
