#include <stdint.h>

#define static
#define __inline
#define __extension__

/* Swap bytes in 16-bit value.  */
#define __bswap_constant_16(x)                                  \
  ((__uint16_t) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))

uint16_t
__bswap_16 (uint16_t __bsx)
{
  return __bswap_constant_16 (__bsx);
}

/* Swap bytes in 32-bit value.  */
#define __bswap_constant_32(x)                                  \
  ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >> 8)     \
   | (((x) & 0x0000ff00u) << 8) | (((x) & 0x000000ffu) << 24))

static __inline uint32_t
__bswap_32 (uint32_t __bsx)
{
  return __bswap_constant_32 (__bsx);
}

/* Swap bytes in 64-bit value.  */
#define __bswap_constant_64(x)                  \
  ((((x) & 0xff00000000000000ull) >> 56)        \
   | (((x) & 0x00ff000000000000ull) >> 40)      \
   | (((x) & 0x0000ff0000000000ull) >> 24)      \
   | (((x) & 0x000000ff00000000ull) >> 8)       \
   | (((x) & 0x00000000ff000000ull) << 8)       \
   | (((x) & 0x0000000000ff0000ull) << 24)      \
   | (((x) & 0x000000000000ff00ull) << 40)      \
   | (((x) & 0x00000000000000ffull) << 56))

__extension__ static __inline uint64_t
__bswap_64 (uint64_t __bsx)
{
  return __bswap_constant_64 (__bsx);
}
