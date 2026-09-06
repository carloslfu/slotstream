/* Slotpack v1. MIT, part of Slotstream.
 * Four byte-renormalized rANS states; standard equations described by
 * https://github.com/rygorous/ryg_rans . No external codec dependency.
 * All integers on the wire are little endian. See docs/DOWNLOAD-FORMAT.md. */
#include "slotpack.h"
#include <limits.h>
#include <stdlib.h>
#include <string.h>
#define LOWER (1u << 23)
#define CONTEXTS (256u * 1024u)
#define MAX_TABLES 2048u
#define HEADER 32u
static const uint8_t magic[8] = {'S', 'L', 'T', 'P', 'K', '0', '0', '1'};
static uint32_t rd32(const uint8_t *p) {
  return (uint32_t)p[0] | (uint32_t)p[1] << 8 | (uint32_t)p[2] << 16 |
         (uint32_t)p[3] << 24;
}
static uint16_t rd16(const uint8_t *p) {
  return (uint16_t)(p[0] | (uint16_t)p[1] << 8);
}
static void wr32(uint8_t *p, uint32_t x) {
  for (int j = 0; j < 4; j++)
    p[j] = (uint8_t)(x >> (8 * j));
}
static void wr16(uint8_t *p, uint16_t x) {
  p[0] = (uint8_t)x;
  p[1] = (uint8_t)(x >> 8);
}
typedef struct {
  uint8_t *p, *end;
  int bad;
} Writer;
typedef struct {
  const uint8_t *p, *end;
  int bad;
} Reader;
static void put32(Writer *w, uint32_t x) {
  if ((size_t)(w->end - w->p) < 4) {
    w->bad = 1;
    return;
  }
  wr32(w->p, x);
  w->p += 4;
}
static uint32_t get32(Reader *r) {
  if ((size_t)(r->end - r->p) < 4) {
    r->bad = 1;
    return 0;
  }
  uint32_t x = rd32(r->p);
  r->p += 4;
  return x;
}
static void putv(Writer *w, uint32_t x) {
  do {
    if (w->p == w->end) {
      w->bad = 1;
      return;
    }
    *w->p++ = (uint8_t)((x & 127) | (x > 127 ? 128 : 0));
    x >>= 7;
  } while (x);
}
static uint32_t getv(Reader *r) {
  uint32_t x = 0;
  for (unsigned s = 0; s < 35; s += 7) {
    if (r->p == r->end) {
      r->bad = 1;
      return 0;
    }
    uint32_t b = *r->p++;
    if (s == 28 && b > 15) {
      r->bad = 1;
      return 0;
    }
    x |= (b & 127) << s;
    if (!(b & 128)) {
      if (s && b == 0)
        r->bad = 1;
      return x;
    }
  }
  r->bad = 1;
  return 0;
}
static uint32_t round_shift(uint32_t x, unsigned s) {
  if (!s)
    return x;
  if (s >= 32)
    return 0;
  uint32_t q = x >> s, rem = x & ((1u << s) - 1), half = 1u << (s - 1);
  return q + (rem > half || (rem == half && (q & 1)));
}
uint16_t slotpack_predict_bias(uint16_t s, uint8_t c) {
  unsigned e = (s >> 7) & 255, sign = (s ^ 32768) & 32768;
  if (e == 255)
    return 0; /* exact residual preserves even NaNs */
  uint32_t p = ((s & 127) + (e ? 128 : 0)) * (uint32_t)c;
  if (!p)
    return (uint16_t)sign;
  int base = e ? (int)e - 134 : -133, top = 31 - __builtin_clz(p),
      unbiased = base + top;
  if (unbiased < -126) { /* subnormal grid is 2^-133 */
    int sh = base + 133;
    uint32_t m = sh >= 0 ? p << (unsigned)sh : round_shift(p, (unsigned)-sh);
    return (uint16_t)(sign | m);
  }
  uint32_t m = top > 7 ? round_shift(p, (unsigned)(top - 7)) : p << (7 - top);
  if (m == 256) {
    m = 128;
    unbiased++;
  }
  if (unbiased > 127)
    return (uint16_t)(sign | 0x7f80);
  return (uint16_t)(sign | ((unsigned)(unbiased + 127) << 7) | (m - 128));
}
uint8_t slotpack_center(uint16_t s, uint16_t b) {
  unsigned se = (s >> 7) & 255, be = (b >> 7) & 255;
  uint32_t sm = (s & 127) + (se ? 128 : 0), bm = (b & 127) + (be ? 128 : 0);
  if (se == 255 || be == 255 || !sm || !bm || !((s ^ b) & 32768))
    return 0;
  int d = (int)(be ? be : 1) - (int)(se ? se : 1);
  if (d >= 16)
    return 255;
  if (d <= -16)
    return 0;
  uint32_t num = bm, den = sm;
  if (d >= 0)
    num <<= (unsigned)d;
  else
    den <<= (unsigned)-d;
  uint32_t q = num / den, r = num % den;
  q += (2 * r > den || (2 * r == den && (q & 1)));
  return (uint8_t)(q > 255 ? 255 : q);
}
static void normalize(const uint32_t *h, uint32_t *f, uint32_t *cum, unsigned n,
                      unsigned bits) {
  uint64_t sum = 0, prefix = 0;
  uint32_t used = 0, prev = 0;
  for (unsigned i = 0; i < n; i++) {
    sum += h[i];
    used += h[i] != 0;
  }
  uint32_t available = (1u << bits) - used;
  cum[0] = 0;
  for (unsigned i = 0; i < n; i++) {
    prefix += h[i];
    uint32_t next = (uint32_t)(prefix * available / sum);
    f[i] = h[i] ? 1 + next - prev : 0;
    prev = next;
    cum[i + 1] = cum[i] + f[i];
  }
}
static int push_symbol(uint32_t *state, uint32_t f, uint32_t cum, unsigned bits,
                       uint8_t **p, uint8_t *begin) {
  uint32_t x = *state, limit = ((LOWER >> bits) << 8) * f;
  if (!f)
    return -1;
  while (x >= limit) {
    if (*p == begin)
      return -1;
    *--*p = (uint8_t)x;
    x >>= 8;
  }
  *state = ((x / f) << bits) + x % f + cum;
  return 0;
}
static int finish_encode(Writer *w, uint8_t *storage, size_t cap, uint8_t *p,
                         uint32_t states[4]) {
  size_t n = (size_t)(storage + cap - p) + 16;
  if (n > UINT32_MAX || (size_t)(w->end - w->p) < n + 4)
    return -1;
  put32(w, (uint32_t)n);
  for (unsigned j = 0; j < 4; j++) {
    wr32(w->p, states[j]);
    w->p += 4;
  }
  memcpy(w->p, p, n - 16);
  w->p += n - 16;
  return 0;
}
static int read_states(Reader *r, Reader *stream, uint32_t states[4]) {
  uint32_t n = get32(r);
  if (r->bad || n < 16 || n > (size_t)(r->end - r->p))
    return -1;
  stream->p = r->p + 16;
  stream->end = r->p + n;
  stream->bad = 0;
  for (unsigned j = 0; j < 4; j++) {
    states[j] = rd32(r->p + j * 4);
    if (states[j] < LOWER || states[j] >= 0x80000000u)
      return -1;
  }
  r->p += n;
  return 0;
}
/* One branchless renormalization covers the common zero/one-byte case.
 * A second byte is needed only for rare symbols. Reads remain bounded even
 * after the last compressed byte: no speculative read past the input. */
static int renormalize(uint32_t *state, uint32_t x, Reader *r) {
  unsigned need = x < LOWER;
  if (need && r->p == r->end)
    return -1;
  uint32_t byte = r->p < r->end ? *r->p : 0;
  x = need ? (x << 8) | byte : x;
  r->p += need;
  if (x < LOWER) {
    if (r->p == r->end)
      return -1;
    x = (x << 8) | *r->p++;
  }
  if (x < LOWER)
    return -1;
  *state = x;
  return 0;
}
static int pop_symbol(uint32_t *state, uint32_t f, uint32_t cum, unsigned bits,
                      Reader *r) {
  uint32_t x = f * (*state >> bits) + (*state & ((1u << bits) - 1)) - cum;
  return renormalize(state, x, r);
}
static int ended(Reader *r, uint32_t st[4]) {
  if (r->p != r->end)
    return -1;
  for (unsigned j = 0; j < 4; j++)
    if (st[j] != LOWER)
      return -1;
  return 0;
}
/* A section has sparse frequencies and a bounded byte stream. */
static int encode_symbols(Writer *w, const uint8_t *src, size_t n,
                          unsigned width) {
  unsigned alphabet = width == 1 ? 256 : 65536, bits = width == 1 ? 12 : 16;
  uint32_t *h = calloc(alphabet, sizeof(uint32_t)),
           *f = calloc(alphabet, sizeof(uint32_t)),
           *cum = calloc(alphabet + 1, sizeof(uint32_t));
  size_t cap = n * width + 1024 * 1024;
  uint8_t *storage = malloc(cap);
  int result = -1;
  if (!h || !f || !cum || !storage || !n)
    goto done;
  for (size_t i = 0; i < n; i++)
    h[width == 1 ? src[i] : rd16(src + 2 * i)]++;
  normalize(h, f, cum, alphabet, bits);
  uint32_t used = 0, previous = 0;
  for (unsigned s = 0; s < alphabet; s++)
    used += f[s] != 0;
  put32(w, used);
  for (unsigned s = 0; s < alphabet; s++)
    if (f[s]) {
      putv(w, s - previous);
      putv(w, f[s]);
      previous = s + 1;
    }
  uint32_t states[4] = {LOWER, LOWER, LOWER, LOWER};
  uint8_t *p = storage + cap;
  for (size_t i = n; i-- > 0;) {
    unsigned s = width == 1 ? src[i] : rd16(src + 2 * i);
    if (push_symbol(&states[i & 3], f[s], cum[s], bits, &p, storage))
      goto done;
  }
  if (w->bad)
    goto done;
  result = finish_encode(w, storage, cap, p, states);
done:
  free(h);
  free(f);
  free(cum);
  free(storage);
  return result;
}
static int decode_symbols(Reader *r, uint8_t *dst, size_t n, unsigned width) {
  unsigned alphabet = width == 1 ? 256 : 65536, bits = width == 1 ? 12 : 16,
           total = 1u << bits;
  uint32_t *f = calloc(alphabet, sizeof(uint32_t)),
           *cum = calloc(alphabet, sizeof(uint32_t));
  uint16_t *lut = malloc(total * sizeof(uint16_t));
  int result = -1;
  if (!f || !cum || !lut)
    goto done;
  uint32_t used = get32(r), previous = 0, sum = 0;
  if (!used || used > alphabet)
    goto done;
  for (uint32_t j = 0; j < used; j++) {
    uint32_t delta = getv(r), freq = getv(r);
    if (r->bad || delta >= alphabet || previous > alphabet - 1 - delta ||
        !freq || freq > total - sum)
      goto done;
    unsigned s = previous + delta;
    f[s] = freq;
    cum[s] = sum;
    for (uint32_t k = 0; k < freq; k++)
      lut[sum + k] = (uint16_t)s;
    sum += freq;
    previous = s + 1;
  }
  if (sum != total)
    goto done;
  Reader stream;
  uint32_t states[4];
  if (read_states(r, &stream, states))
    goto done;
  for (size_t i = 0; i < n; i++) {
    uint32_t x = states[i & 3];
    unsigned s = lut[x & (total - 1)];
    if (width == 1)
      dst[i] = (uint8_t)s;
    else
      wr16(dst + 2 * i, (uint16_t)s);
    if (pop_symbol(&states[i & 3], f[s], cum[s], bits, &stream))
      goto done;
  }
  result = ended(&stream, states);
done:
  free(f);
  free(cum);
  free(lut);
  return result;
}
typedef struct {
  uint32_t h[16], f[16], cum[17], key;
  uint32_t lut[4096];
} QuantTable;
static unsigned context(uint16_t scale, uint8_t center) {
  return (unsigned)center * 1024 + ((scale & 32767) >> 5);
}
static int encode_quant(Writer *w, const uint8_t *src, size_t weights,
                        unsigned gs) {
  size_t groups = weights * 2 / gs;
  const uint8_t *scales = src + weights, *biases = scales + 2 * groups;
  uint8_t *centers = malloc(groups), *residual = malloc(groups * 2),
          *storage = malloc(weights + 1024 * 1024);
  int32_t *map = malloc(CONTEXTS * sizeof(int32_t));
  QuantTable *tables = calloc(MAX_TABLES, sizeof(QuantTable));
  int result = -1;
  unsigned count = 0;
  if (!centers || !residual || !storage || !map || !tables)
    goto done;
  memset(map, 255, CONTEXTS * sizeof(int32_t));
  for (size_t i = 0; i < groups; i++) {
    uint16_t s = rd16(scales + 2 * i), b = rd16(biases + 2 * i);
    uint8_t c = slotpack_center(s, b);
    centers[i] = c;
    uint16_t delta = (uint16_t)(b - slotpack_predict_bias(s, c));
    int d = delta < 32768 ? (int)delta : (int)delta - 65536;
    wr16(residual + 2 * i, (uint16_t)(d < 0 ? -2 * d - 1 : 2 * d));
    unsigned key = context(s, c);
    if (map[key] < 0) {
      if (count == MAX_TABLES)
        goto done;
      map[key] = (int32_t)count;
      tables[count++].key = key;
    }
    QuantTable *t = &tables[map[key]];
    const uint8_t *p = src + i * (gs / 2);
    for (unsigned j = 0; j < gs / 2; j++) {
      t->h[p[j] & 15]++;
      t->h[p[j] >> 4]++;
    }
  }
  if (encode_symbols(w, scales, groups, 2) ||
      encode_symbols(w, centers, groups, 1) ||
      encode_symbols(w, residual, groups, 2))
    goto done;
  put32(w, count);
  for (unsigned i = 0; i < count; i++) {
    QuantTable *t = &tables[i];
    normalize(t->h, t->f, t->cum, 16, 12);
    put32(w, t->key);
    for (unsigned j = 0; j < 16; j++)
      putv(w, t->f[j]);
  }
  uint8_t *p = storage + weights + 1024 * 1024;
  uint32_t states[4] = {LOWER, LOWER, LOWER, LOWER};
  for (size_t g = groups; g-- > 0;) {
    QuantTable *t = &tables[map[context(rd16(scales + 2 * g), centers[g])]];
    for (size_t i = (g + 1) * gs; i-- > g * gs;) {
      unsigned s = (src[i / 2] >> ((i & 1) * 4)) & 15;
      if (push_symbol(&states[i & 3], t->f[s], t->cum[s], 12, &p, storage))
        goto done;
    }
  }
  if (w->bad)
    goto done;
  result = finish_encode(w, storage, weights + 1024 * 1024, p, states);
done:
  free(centers);
  free(residual);
  free(storage);
  free(map);
  free(tables);
  return result;
}
static int decode_quant(Reader *r, uint8_t *dst, size_t weights, unsigned gs) {
  size_t groups = weights * 2 / gs;
  uint8_t *scales = dst + weights, *biases = scales + 2 * groups;
  uint8_t *centers = malloc(groups);
  int32_t *map = malloc(CONTEXTS * sizeof(int32_t));
  QuantTable *tables = NULL;
  int result = -1;
  if (!centers || !map)
    goto done;
  memset(map, 255, CONTEXTS * sizeof(int32_t));
  if (decode_symbols(r, scales, groups, 2) ||
      decode_symbols(r, centers, groups, 1) ||
      decode_symbols(r, biases, groups, 2))
    goto done;
  for (size_t i = 0; i < groups; i++) {
    unsigned z = rd16(biases + 2 * i);
    int d = (z & 1) ? -(int)(z / 2) - 1 : (int)(z / 2);
    wr16(biases + 2 * i,
         (uint16_t)(slotpack_predict_bias(rd16(scales + 2 * i), centers[i]) +
                    d));
  }
  unsigned count = get32(r);
  if (r->bad || !count || count > MAX_TABLES)
    goto done;
  tables = calloc(count, sizeof(QuantTable));
  if (!tables)
    goto done;
  for (unsigned i = 0; i < count; i++) {
    QuantTable *t = &tables[i];
    unsigned key = get32(r);
    if (r->bad || key >= CONTEXTS || map[key] >= 0)
      goto done;
    map[key] = (int32_t)i;
    uint32_t sum = 0;
    for (unsigned j = 0; j < 16; j++) {
      uint32_t f = getv(r);
      if (r->bad || f > 4096 - sum)
        goto done;
      t->f[j] = f;
      t->cum[j] = sum;
      for (uint32_t k = 0; k < f; k++)
        t->lut[sum + k] = (f << 16) | (k << 4) | j;
      sum += f;
    }
    if (sum != 4096)
      goto done;
  }
  Reader stream;
  uint32_t states[4];
  if (read_states(r, &stream, states))
    goto done;
  for (size_t g = 0; g < groups; g++) {
    int32_t index = map[context(rd16(scales + 2 * g), centers[g])];
    if (index < 0)
      goto done;
    QuantTable *t = &tables[index];
    for (size_t i = g * gs; i < (g + 1) * gs; i += 2) {
      uint32_t x = states[i & 3], lo = t->lut[x & 4095];
      if (renormalize(&states[i & 3],
                      (lo >> 16) * (x >> 12) + ((lo >> 4) & 4095), &stream))
        goto done;
      x = states[(i + 1) & 3];
      uint32_t hi = t->lut[x & 4095];
      if (renormalize(&states[(i + 1) & 3],
                      (hi >> 16) * (x >> 12) + ((hi >> 4) & 4095), &stream))
        goto done;
      dst[i / 2] = (uint8_t)((lo & 15) | ((hi & 15) << 4));
    }
  }
  result = ended(&stream, states);
done:
  free(centers);
  free(map);
  free(tables);
  return result;
}
int64_t slotpack_encode(const uint8_t *src, size_t size, unsigned kind,
                        size_t weights, unsigned gs, uint8_t *dst,
                        size_t capacity) {
  if (!src || !dst || !size || size > SLOTPACK_MAX_RAW ||
      capacity < size + HEADER || kind > 2)
    return -1;
  if (kind == 1 && size % 2)
    return -1;
  if (kind == 2 &&
      ((gs != 32 && gs != 64) || !weights || weights > size ||
       weights % (gs / 2) || weights + 4 * (2 * weights / gs) != size))
    return -1;
  memcpy(dst, magic, 8);
  wr32(dst + 8, (uint32_t)size);
  wr32(dst + 12, kind + 1);
  wr32(dst + 16, (uint32_t)weights);
  wr32(dst + 20, gs);
  wr32(dst + 24, 0);
  wr32(dst + 28, 0);
  Writer w = {dst + HEADER, dst + capacity, 0};
  int code = kind == 2 ? encode_quant(&w, src, weights, gs)
                       : encode_symbols(&w, src, size / (kind == 1 ? 2 : 1),
                                        kind == 1 ? 2 : 1);
  if (code || w.bad || (size_t)(w.p - dst) >= size + HEADER) {
    wr32(dst + 12, 0);
    wr32(dst + 16, 0);
    wr32(dst + 20, 0);
    memcpy(dst + HEADER, src, size);
    return (int64_t)(size + HEADER);
  }
  if (kind != 2) {
    wr32(dst + 16, 0);
    wr32(dst + 20, 0);
  }
  return (int64_t)(w.p - dst);
}
int slotpack_decode(const uint8_t *src, size_t size, uint8_t *dst,
                    size_t expected_size) {
  if (!src || !dst || size < HEADER || size > SLOTPACK_MAX_ENCODED ||
      !expected_size || expected_size > SLOTPACK_MAX_RAW ||
      memcmp(src, magic, 8))
    return -1;
  size_t raw = rd32(src + 8), weights = rd32(src + 16);
  unsigned kind = rd32(src + 12), gs = rd32(src + 20);
  if (raw != expected_size || rd32(src + 24) || rd32(src + 28) || kind > 3)
    return -1;
  Reader r = {src + HEADER, src + size, 0};
  int code;
  if (kind != 3 && (weights || gs))
    return -1;
  if (!kind) {
    if (size != raw + HEADER)
      return -1;
    memcpy(dst, r.p, raw);
    return 0;
  }
  if (kind == 3) {
    if ((gs != 32 && gs != 64) || !weights || weights > raw ||
        weights % (gs / 2) || weights + 4 * (2 * weights / gs) != raw)
      return -1;
    code = decode_quant(&r, dst, weights, gs);
  } else {
    if (kind == 2 && raw % 2)
      return -1;
    code =
        decode_symbols(&r, dst, raw / (kind == 2 ? 2 : 1), kind == 2 ? 2 : 1);
  }
  return code || r.bad || r.p != r.end ? -1 : 0;
}
