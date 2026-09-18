---
type: run
id: 01m2s5k2vmjzpvtxkd3tfgjt42
created: 2026-09-18T06:20:00.000000+00:00
updated: 2026-09-18T06:20:00.000000+00:00
summary: cmp over all twelve shards of both checkpoint copies, verdict IDENTICAL
captured_at: 2026-09-18
command: /tmp/mirrorcmp.sh
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Both checkpoint copies compared byte for byte
tool: cmp
---
The mirror's whole premise is that both copies hold the same bytes, and
`requireIdenticalMirrors` does not establish it: at startup the engine compares
only each shard's size and its safetensors header, because a full payload
comparison on every run would cost a pass over 105.26 GB. This run does that
pass once, so the premise behind
[[records/measurements/mirror-reads-across-two-disks-2026-09-18]] has direct
evidence rather than only the indirect evidence of the generated text coming out
the same.

The two copies are the external NVMe at `/Volumes/llm/models` and the internal
SSD at `/Users/qian/.slotstream/models`, on
[[records/machines/mac-mini-m4-32gb]].

## Script

```bash
#!/bin/bash
# The mirror's whole premise: both copies hold the same bytes. The engine only
# compares each shard's size and safetensors header at startup, because a full
# payload comparison at every run would cost a pass over the checkpoint. This
# does that pass once, so the premise itself has evidence.
set -u
EXT=/Volumes/llm/models/qwen38-flash-next-mlx-4bit
INT=/Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit
bad=0
for f in "$EXT"/*.safetensors; do
  name=$(basename "$f")
  if cmp -s "$f" "$INT/$name"; then
    printf 'OK   %s (%s bytes)\n' "$name" "$(stat -f %z "$f")"
  else
    printf 'DIFF %s\n' "$name"; bad=1
  fi
done
[ $bad -eq 0 ] && echo 'verdict: IDENTICAL' || echo 'verdict: DIFFERENT'
```

## Output

```
OK   model-00001.safetensors (10039592993 bytes)
OK   model-00002.safetensors (10000066971 bytes)
OK   model-00003.safetensors (10000066984 bytes)
OK   model-00004.safetensors (10170248438 bytes)
OK   model-00005.safetensors (10194989755 bytes)
OK   model-00006.safetensors (10262727991 bytes)
OK   model-00007.safetensors (10190937668 bytes)
OK   model-00008.safetensors (10231122683 bytes)
OK   model-00009.safetensors (10250305804 bytes)
OK   model-00010.safetensors (10237786674 bytes)
OK   model-00011.safetensors (2192353120 bytes)
OK   mtp.safetensors (1470955171 bytes)
verdict: IDENTICAL
```

Twelve shards, 105,240,154,212 bytes each side, no difference anywhere. The
loop covers every `.safetensors` file in the checkpoint; the remaining files in
the directory are the JSON index and the tokenizer, which the router never
reads through a mirror.

The comparison reads both copies at once, so it is also a crude concurrent-read
check: it completed without either disk returning an error.
