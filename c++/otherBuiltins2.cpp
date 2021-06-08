#include <stdint.h>
#include <stddef.h>

struct _IO_FILE;

/* The opaque type of streams.  This is the definition used elsewhere.  */
typedef struct _IO_FILE FILE;

typedef __builtin_va_list va_list;

#define complex _Complex

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
typedef complex float cf;
typedef complex double cd;
typedef complex long double cld;
typedef intmax_t imax;
typedef va_list vlst;

#define b(x) __builtin_ ## x

#define f2(x, t1, t2) t1 x(t2 a) { return b(x)(a); }
#define f3(x, t1, t2, t3) t1 x(t2 a, t3 b) { return b(x)(a, b); }
#define f4(x, t1, t2, t3, t4) t1 x(t2 a, t3 b, t4 c) { return b(x)(a, b, c); }
#define f5(x, t1, t2, t3, t4, t5) t1 x(t2 a, t3 b, t4 c, t5 d) { return b(x)(a, b, c, d); }

#define mkThree2(x) f2(x, i, i) f2(x ## l, l, l) f2(x ## ll, ll, ll)

#define mkThreeFlt2(x) f2(x ## f, f, f) f2(x ## l, ld, ld) f2(x, d, d)
#define mkThreeFlt3(x) f3(x ## f, f, f, f) f3(x ## l, ld, ld, ld) f3(x, d, d, d)
#define mkThreeFlt4(x) f4(x ## f, f, f, f, f) f4(x ## l, ld, ld, ld, ld) f4(x, d, d, d, d)
#define mkThreeFlt2RetI(x) f2(x ## f, i, f) f2(x ## l, i, ld) f2(x, i, d)
#define mkThreeFlt2RetL(x) f2(x ## f, l, f) f2(x ## l, l, ld) f2(x, l, d)
#define mkThreeFlt2RetLL(x) f2(x ## f, ll, f) f2(x ## l, ll, ld) f2(x, ll, d)

#define mkThreeCFlt2(x) f2(x ## f, f, cf) f2(x ## l, ld, cld) f2(x, d, cd)
#define mkThreeCFltC2(x) f2(x ## f, cf, cf) f2(x ## l, cld, cld) f2(x, cd, cd)
#define mkThreeCFltC3(x) f3(x ## f, cf, cf, cf) f3(x ## l, cld, cld, cld) f3(x, cd, cd, cd)

#ifndef __clang__

f2(_Exit, v, i)

#endif

mkThreeFlt2(acosh)
mkThreeFlt2(asinh)
mkThreeFlt2(atanh)
mkThreeCFlt2(cabs)
mkThreeCFltC2(cacos)
mkThreeCFltC2(cacosh)
mkThreeCFlt2(carg)
mkThreeCFltC2(casin)
mkThreeCFltC2(casinh)
mkThreeCFltC2(catan)
mkThreeCFltC2(catanh)
mkThreeFlt2(cbrt)
mkThreeCFltC2(ccos)
mkThreeCFltC2(cexp)
mkThreeCFlt2(cimag)
mkThreeCFltC2(clog)
mkThreeCFltC2(conj)
mkThreeFlt3(copysign)
mkThreeCFltC3(cpow)
mkThreeCFltC2(cproj)
mkThreeCFlt2(creal)
mkThreeCFltC2(csin)
mkThreeCFltC2(csinh)
mkThreeCFltC2(csqrt)
mkThreeCFltC2(ctan)
mkThreeCFltC2(ctanh)
mkThreeFlt2(erfc)

#ifndef __AMDGCN__

mkThreeFlt2(erf)
mkThreeFlt2(exp2)

#endif

mkThreeFlt2(expm1)
mkThreeFlt3(fdim)
mkThreeFlt4(fma)
mkThreeFlt3(fmax)
mkThreeFlt3(fmin)
mkThreeFlt3(hypot)
mkThreeFlt2RetI(ilogb)

#ifndef __clang__

f2(imaxabs, imax, imax)
f2(isblank, i, i)

#endif

mkThreeFlt2(lgamma)
f2(llabs, ll, ll)

#ifndef __AMDGCN__

mkThreeFlt2RetLL(llrint)
mkThreeFlt2RetLL(llround)

#endif

mkThreeFlt2(log1p)

#ifndef __AMDGCN__

mkThreeFlt2(log2)

#endif

mkThreeFlt2(logb)

#ifndef __AMDGCN__

mkThreeFlt2RetL(lrint)
mkThreeFlt2RetL(lround)

#endif

mkThreeFlt2(nearbyint)
mkThreeFlt3(nextafter)
f3(nexttowardf, f, f, ld)
f3(nexttowardl, ld, ld, ld)
f3(nexttoward, d, d, ld)
mkThreeFlt3(remainder)
f4(remquof, f, f, f, ip)
f4(remquol, ld, ld, ld, ip)
f4(remquo, d, d, d, ip)
mkThreeFlt2(rint)
mkThreeFlt2(round)
f3(scalblnf, f, f, l)
f3(scalblnl, ld, ld, l)
f3(scalbln, d, d, l)
f3(scalbnf, f, f, i)
f3(scalbnl, ld, ld, i)
f3(scalbn, d, d, i)
mkThreeFlt2(tgamma)
mkThreeFlt2(trunc)

#ifndef __clang__

f4(vfscanf, i, FILE *, ccp, vlst)
f3(vscanf, i, ccp, vlst)

#endif

f5(vsnprintf, i, cp, sz, ccp, vlst)

#ifndef __clang__

f4(vsscanf, i, ccp, ccp, vlst)

#endif
