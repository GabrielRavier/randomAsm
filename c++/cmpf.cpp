#include <stdint.h>

#define f(x, t) bool cmpeq ## x(t a, t b) { return a == b; }

f(flt, float)
f(dbl, double)
f(ldbl, long double)
f(flt128, __float128)
f(cflt, _Complex float)
f(cdbl, _Complex double)
f(cldbl, _Complex long double)

#define f(x, t) bool cmpne ## x(t a, t b) { return a != b; }

f(flt, float)
f(dbl, double)
f(ldbl, long double)
f(flt128, __float128)
f(cflt, _Complex float)
f(cdbl, _Complex double)
f(cldbl, _Complex long double)

#define f(x, t) bool cmplt ## x(t a, t b) { return a < b; }

f(flt, float)
f(dbl, double)
f(ldbl, long double)
f(flt128, __float128)

#define f(x, t) bool cmpgt ## x(t a, t b) { return a > b; }

f(flt, float)
f(dbl, double)
f(ldbl, long double)
f(flt128, __float128)

#define f(x, t) bool cmple ## x(t a, t b) { return a <= b; }

f(flt, float)
f(dbl, double)
f(ldbl, long double)
f(flt128, __float128)

#define f(x, t) bool cmpge ## x(t a, t b) { return a >= b; }

f(flt, float)
f(dbl, double)
f(ldbl, long double)
f(flt128, __float128)
