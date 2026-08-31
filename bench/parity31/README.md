# MLX 0.31.1 parity goldens

These fixtures make `Tools/verify.sh` self-contained in a fresh clone. They
were generated from the pinned Qwen3.8 model revision with:

```sh
.venv31/bin/python Tools/parity_ref.py \
  --model ~/.slotstream/models/qwen38-flash-next-mlx-4bit \
  --layers 4 --out bench/parity31
```

The Python environment used `mlx==0.31.1`, matching mlx-swift 0.31.x. The raw
`layer_*.bin` files contain float32 hidden states for the token sequence in
`tokens.txt`; `ngram_ids.txt` and `dequant_row.txt` cover the corresponding
n-gram index and CPU dequantization references. `SHA256SUMS` prevents silent
fixture drift.
