#include <stdint.h>

typedef uint32_t u32;
typedef uint64_t u64;

u32 __andn_u32(u32 x, u32 y)
{
	return ~x & y;
}

u32 __blsi_u32(u32 x)
{
	return x & -x;
}

u32 __blsmsk_u32(u32 x)
{
	return x ^ (x - 1);
}

u32 __blsr_u32(u32 x)
{
	return x & (x - 1);
}

u64 __andn_u64(u64 x, u64 y)
{
	return ~x & y;
}

u64 __blsi_u64(u64 x)
{
	return x & -x;
}

u64 __blsmsk_u64(u64 x)
{
	return x ^ (x - 1);
}

u64 __blsr_u64(u64 x)
{
	return x & (x - 1);
}
