#include <stdint.h>

#define extern
#define __inline
#define __gnu_inline__
#define __always_inline__
#define __artificial__

extern __inline uint32_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blcfill_u32 (uint32_t __X)
{
  return __X & (__X + 1);
}

extern __inline uint32_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blci_u32 (uint32_t __X)
{
  return __X | ~(__X + 1);
}

extern __inline uint32_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blcic_u32 (uint32_t __X)
{
  return ~__X & (__X + 1);
}

extern __inline uint32_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blcmsk_u32 (uint32_t __X)
{
  return __X ^ (__X + 1);
}

extern __inline uint32_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blcs_u32 (uint32_t __X)
{
  return __X | (__X + 1);
}

extern __inline uint32_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blsfill_u32 (uint32_t __X)
{
  return __X | (__X - 1);
}

extern __inline uint32_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blsic_u32 (uint32_t __X)
{
  return ~__X | (__X - 1);
}

extern __inline uint32_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__t1mskc_u32 (uint32_t __X)
{
  return ~__X | (__X + 1);
}

extern __inline uint32_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__tzmsk_u32 (uint32_t __X)
{
  return ~__X & (__X - 1);
}

extern __inline uint64_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blcfill_u64 (uint64_t __X)
{
  return __X & (__X + 1);
}

extern __inline uint64_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blci_u64 (uint64_t __X)
{
  return __X | ~(__X + 1);
}

extern __inline uint64_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blcic_u64 (uint64_t __X)
{
  return ~__X & (__X + 1);
}

extern __inline uint64_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blcmsk_u64 (uint64_t __X)
{
  return __X ^ (__X + 1);
}

extern __inline uint64_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blcs_u64 (uint64_t __X)
{
  return __X | (__X + 1);
}

extern __inline uint64_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blsfill_u64 (uint64_t __X)
{
  return __X | (__X - 1);
}

extern __inline uint64_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blsic_u64 (uint64_t __X)
{
  return ~__X | (__X - 1);
}

extern __inline uint64_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__t1mskc_u64 (uint64_t __X)
{
  return ~__X | (__X + 1);
}

extern __inline uint64_t __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__tzmsk_u64 (uint64_t __X)
{
  return ~__X & (__X - 1);
}
