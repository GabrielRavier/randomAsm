#include <stdint.h>

using i8 = int8_t;
using u8 = uint8_t;
using u16 = uint16_t;
using u32 = uint32_t;
using u64 = uint64_t;

u32 __rold (u32 x, i8 c)
{
	c &= 0x1F;
	return (x << c) | (x >> (-c & 0x1F));
}

u32 __rord(u32 x, i8 c)
{
	c &= 0x1F;
	return (x >> c) | (x << (-c & 0x1F));
}

u64 __rolq(u64 x, i8 c)
{
	c &= 0x3F;
	return (x << c) | (x >> (-c & 0x3F));
}

u64 __rorq(u64 x, i8 c)
{
	c &= 0x3F;
	return (x >> c) | (x << (-c & 0x3F));
}
