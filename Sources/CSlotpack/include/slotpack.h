#ifndef SLOTSTREAM_SLOTPACK_H
#define SLOTSTREAM_SLOTPACK_H
#include <stddef.h>
#include <stdint.h>
/* Version 1, lossless, little endian. No allocation based on unchecked input.
 * kind: 0 arbitrary bytes, 1 BF16 words, 2 weights+scales+biases.
 * At most 40 MiB reconstructed per independent object. */
#define SLOTPACK_MAX_RAW 41943040u
#define SLOTPACK_MAX_ENCODED 41943072u
int64_t slotpack_encode(const uint8_t *src, size_t size, unsigned kind,
                        size_t weight_bytes, unsigned group_size, uint8_t *dst,
                        size_t capacity);
int slotpack_decode(const uint8_t *src, size_t size, uint8_t *dst,
                    size_t expected_size);
uint16_t slotpack_predict_bias(uint16_t scale, uint8_t center);
uint8_t slotpack_center(uint16_t scale, uint16_t bias);
#endif
