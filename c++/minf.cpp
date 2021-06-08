#include <stdint.h>

#define f(x, t) t min ## x(t a) { return -a; }

f(flt, float)
f(dbl, double)
f(ldbl, long double)
f(flt128, __float128)
f(cflt, _Complex float)
f(cdbl, _Complex double)
f(cldbl, _Complex long double)
