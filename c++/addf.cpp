#include <stdint.h>

#define f(x, t) t add ## x(t a, t b) { return a + b; }

f(flt, float)
f(dbl, double)
f(ldbl, long double)
f(fp16, __fp16)
f(flt128, __float128)
f(cflt, _Complex float)
f(cdbl, _Complex double)
f(cldbl, _Complex long double)
