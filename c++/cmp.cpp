#include <stdint.h>

#define f(x, t) bool cmpeq ## x(t a, t b) { return a == b; }

f(8, uint8_t)
f(8s, int8_t)
f(16, uint16_t)
f(16s, int16_t)
f(32, uint32_t)
f(32s, int32_t)
f(64, uint64_t)
f(64s, int64_t)
f(128, unsigned __int128)
f(128s, __int128)

#define f(x, t) bool cmpne ## x(t a, t b) { return a != b; }

f(8, uint8_t)
f(8s, int8_t)
f(16, uint16_t)
f(16s, int16_t)
f(32, uint32_t)
f(32s, int32_t)
f(64, uint64_t)
f(64s, int64_t)
f(128, unsigned __int128)
f(128s, __int128)

#define f(x, t) bool cmplt ## x(t a, t b) { return a < b; }

f(8, uint8_t)
f(8s, int8_t)
f(16, uint16_t)
f(16s, int16_t)
f(32, uint32_t)
f(32s, int32_t)
f(64, uint64_t)
f(64s, int64_t)
f(128, unsigned __int128)
f(128s, __int128)

#define f(x, t) bool cmpgt ## x(t a, t b) { return a > b; }

f(8, uint8_t)
f(8s, int8_t)
f(16, uint16_t)
f(16s, int16_t)
f(32, uint32_t)
f(32s, int32_t)
f(64, uint64_t)
f(64s, int64_t)
f(128, unsigned __int128)
f(128s, __int128)

#define f(x, t) bool cmple ## x(t a, t b) { return a <= b; }

f(8, uint8_t)
f(8s, int8_t)
f(16, uint16_t)
f(16s, int16_t)
f(32, uint32_t)
f(32s, int32_t)
f(64, uint64_t)
f(64s, int64_t)
f(128, unsigned __int128)
f(128s, __int128)

#define f(x, t) bool cmpge ## x(t a, t b) { return a >= b; }

f(8, uint8_t)
f(8s, int8_t)
f(16, uint16_t)
f(16s, int16_t)
f(32, uint32_t)
f(32s, int32_t)
f(64, uint64_t)
f(64s, int64_t)
f(128, unsigned __int128)
f(128s, __int128)
