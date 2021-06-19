#include <stdint.h>

using u16 = uint16_t;
using u32 = uint32_t;
using u64 = uint64_t;

#define b(x) __builtin_ ## x
#define f2(x, t1, t2) t1 x(t2 a) { return b(x)(a); }

f2(bswap16, u16, u16)
f2(bswap32, u32, u32)
f2(bswap64, u64, u64)

#ifdef __SIZEOF_INT128__
f2(bswap128, unsigned __int128, unsigned __int128)
#endif
