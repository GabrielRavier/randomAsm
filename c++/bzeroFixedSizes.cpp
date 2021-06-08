#include <stddef.h>

#define b(x) __builtin_ ## x

typedef void v;
typedef void *vp;
#define mkBZeroFixedSize(x) v bzero ## x(vp s) { return b(bzero)(s, x ## u); }

mkBZeroFixedSize(1)
mkBZeroFixedSize(2)
mkBZeroFixedSize(4)
mkBZeroFixedSize(8)
mkBZeroFixedSize(16)
mkBZeroFixedSize(28)
mkBZeroFixedSize(32)
mkBZeroFixedSize(64)
mkBZeroFixedSize(128)
mkBZeroFixedSize(256)
mkBZeroFixedSize(512)
mkBZeroFixedSize(524)
mkBZeroFixedSize(932)
mkBZeroFixedSize(1024)
mkBZeroFixedSize(1456)
mkBZeroFixedSize(2048)
mkBZeroFixedSize(2112)
mkBZeroFixedSize(3072)
mkBZeroFixedSize(4096)
mkBZeroFixedSize(4380)
mkBZeroFixedSize(8192)
mkBZeroFixedSize(12288)
mkBZeroFixedSize(16384)
mkBZeroFixedSize(32768)
