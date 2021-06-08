#include <stdint.h>
#include <stddef.h>

typedef void v;
typedef int i;
typedef void *vp;
typedef const void *cvp;
typedef size_t sz;
typedef char *cp;
typedef const char *ccp;
typedef float f;
typedef double d;
typedef long double ld;
typedef long l;
typedef long long ll;
typedef int *ip;
typedef double *dp;
typedef long double *ldp;
typedef float *fp;

#define b(x) __builtin_ ## x

#define f2(x, t1, t2) t1 x(t2 a) { return b(x)(a); }
#define f3(x, t1, t2, t3) t1 x(t2 a, t3 b) { return b(x)(a, b); }
#define f4(x, t1, t2, t3, t4) t1 x(t2 a, t3 b, t4 c) { return b(x)(a, b, c); }

#define mkThree2(x) f2(x, i, i) f2(x ## l, l, l) f2(x ## ll, ll, ll)

#define mkThreeFlt2(x) f2(x ## f, f, f) f2(x ## l, ld, ld) f2(x, d, d)
#define mkThreeFlt3(x) f3(x ## f, f, f, f) f3(x ## l, ld, ld, ld) f3(x, d, d, d)

#define mkThreeFlt2RetI(x) f2(x ## f, i, f) f2(x ## l, i, ld) f2(x, i, d)

#ifndef __clang__

f2(_exit, v, i)

#endif

f4(bcmp, i, cvp, cvp, sz)
f3(bzero, v, vp, sz)

#ifndef __clang__

f4(dcgettext, cp, ccp, ccp, i)
f3(dgettext, cp, ccp, ccp)
mkThreeFlt3(drem)
mkThreeFlt2(exp10)

#endif

mkThree2(ffs)

#ifndef __clang__

mkThreeFlt2(gamma)
f3(gammaf_r, f, f, ip)
f3(gammal_r, ld, ld, ip)
f3(gamma_r, d, d, ip)
f2(gettext, cp, ccp)

#endif

f3(index, cp, ccp, i)

#ifndef __clang__

f2(isascii, i, i)
mkThreeFlt2(j0)
mkThreeFlt2(j1)
f3(jnf, f, i, f)
f3(jnl, ld, i, ld)
f3(jn, d, i, d)
f3(lgammaf_r, f, f, ip)
f3(lgammal_r, ld, ld, ip)
f3(lgamma_r, d, d, ip)

#endif

#ifndef __AMDGCN__

f4(mempcpy, vp, vp, cvp, sz)

#endif

#ifndef __clang__

mkThreeFlt2(pow10)

#endif

f3(rindex, cp, ccp, i)

#ifndef __clang__

#if !defined __INTEL_COMPILER && !defined __aarch64__ && !defined __arm__

mkThreeFlt2(roundeven)

#endif

mkThreeFlt3(scalb)

#endif

mkThreeFlt2RetI(signbit)

#ifndef __clang__

mkThreeFlt2(significand)
f4(sincosf, v, f, fp, fp)
f4(sincosl, v, ld, ldp, ldp)
f4(sincos, v, d, dp, dp)

#endif

f3(stpcpy, cp, cp, ccp)
f4(stpncpy, cp, cp, ccp, sz)
f3(strcasecmp, i, ccp, ccp)
f2(strdup, cp, ccp)
f4(strncasecmp, i, ccp, ccp, sz)
f3(strndup, cp, ccp, sz)

#ifndef __clang__

#if !defined __aarch64__ && !defined __arm__

f3(strnlen, sz, ccp, sz)

#endif

f2(toascii, i, i)
mkThreeFlt2(y0)
mkThreeFlt2(y1)
f3(ynf, f, i, f)
f3(ynl, ld, i, ld)
f3(yn, d, i, d)

#endif
