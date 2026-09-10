# Contributing

Bug reports, measurement reports, and small focused pull requests are
welcome. Start with the build and test commands below, and include raw output
when reporting a performance or memory issue.

## Numbers come with their method

Performance and memory claims in the docs link to their methods
in [MEASUREMENTS.md](MEASUREMENTS.md), including failed experiments. If
a change moves a number, re-measure it on a quiet machine (interleaved A/B
rounds, medians, never a best-of) and update the measurement before the
claim. An estimator may not return a value outside the range it has measured.

The measurement itself is a record in `db/records/measurements/`, and the
number's appearance on the README or the docs is a claim in `db/records/claims/`
that names the surfaces it is on. `MEASUREMENTS.md` and `PLAN.md` are generated
from those records by `Tools/projections.py`, so edit the record, not the
document; `Tools/brain_gates.sh` runs the checks and `db/DB.md` has the rules.

## Defaults and limits carry engineering judgment

For important tuning values, follow the [measured operating policies](db/records/design/measured-operating-policies.md).
Record the value's purpose, units, evidence and tested scope, the tradeoff it
chooses, whether an override is permitted, and what would justify revision.
Distinguish operating defaults from model facts, safety and qualification
limits, and estimator bounds. Keep supported defaults when new hardware is
unmeasured; spare resources alone do not require a policy change. Update code
comments, CLI explanations, gates, claims and docs together when evidence does
justify one. Maintaining these choices is part of the product's engineering.

## Memory safety

Every model process here is many GB, and the machine it runs on is somebody's
daily computer. One model process at a time (the binary enforces a per-user
lock); small explicit sizes for tests (`--memory-gb 8.1` to `10`); check
reclaimable memory before anything heavy; kill test processes the moment the
test ends. [AGENTS.md](AGENTS.md) has the full protocol and the incident that
produced it.

## Building and testing

See [Building from source](docs/TESTING.md#building-from-source) for setup
commands and [engineering notes](docs/ENGINEERING.md) for the reference index.

`make build` needs only the Command Line Tools. `Tools/verify.sh` is the
acceptance battery; the weight-free checks run in CI. Parity goldens are
generated under mlx 0.31.1 with `Tools/parity_ref.py`; do not regenerate them
under a newer mlx.

Three files are generated and must never be committed stale: `llms-full.txt`
from the docs (`Tools/llms_full.sh`), `MEASUREMENTS.md` and `PLAN.md` from the
brain's records (`Tools/projections.py`). Run `make hooks` once per clone and
the pre-commit hook regenerates them with the commit that moves their sources;
`make docs` does it by hand. CI checks both, and a commit that moves a source
without its projection fails.

## Scope

The engine supports one model, text and images, and one generation at a time.
Changes to model support, batching, or memory allocation need a design and
measurements. Open an issue to discuss them before building a large change.
