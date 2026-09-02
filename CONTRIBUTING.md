# Contributing

Bug reports, measurement reports, and small focused pull requests are
welcome. Two things about this repo are unusual enough to say up front.

## Numbers come with their method

Every performance or memory claim in the docs ships with how it was measured,
in [MEASUREMENTS.md](MEASUREMENTS.md), and the failed experiments stay in. If
a change moves a number, re-measure it on a quiet machine (interleaved A/B
rounds, medians, never a best-of) and update the measurement before the
claim. An estimator may not return a value outside the range it has measured.

## Memory safety

Every model process here is many GB, and the machine it runs on is somebody's
daily computer. One model process at a time (the binary enforces a per-user
lock); small explicit sizes for tests (`--memory-gb 8.1` to `10`); check
reclaimable memory before anything heavy; kill test processes the moment the
test ends. [AGENTS.md](AGENTS.md) has the full protocol and the incident that
produced it.

## Building and testing

`make build` needs only the Command Line Tools. `Tools/verify.sh` is the
acceptance battery; the weight-free checks run in CI. Parity goldens are
generated under mlx 0.31.1 with `Tools/parity_ref.py`; do not regenerate them
under a newer mlx. After a docs change, run `Tools/llms_full.sh` and commit
the regenerated `llms-full.txt`, or the docs job fails.

## Scope

v0 is one model, text only, single-flight. Other models, vision, and
batching are out of scope until the memory model for them is measured. If
you want to propose one, open an issue first.
