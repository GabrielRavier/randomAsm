#include <stdint.h>
#include <stddef.h>
#include <wctype.h>

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
typedef wint_t wi;
typedef va_list vlst;

#define b(x) __builtin_ ## x

#define f2(x, t1, t2) t1 x(t2 a) { return b(x)(a); }
#define f3(x, t1, t2, t3) t1 x(t2 a, t3 b) { return b(x)(a, b); }
#define f4(x, t1, t2, t3, t4) t1 x(t2 a, t3 b, t4 c) { return b(x)(a, b, c); }
#define f5(x, t1, t2, t3, t4, t5) t1 x(t2 a, t3 b, t4 c, t5 d) { return b(x)(a, b, c, d); }

#define mkThree2(x) f2(x, i, i) f2(x ## l, l, l) f2(x ## ll, ll, ll)

#define mkLDFlt2(x) f2(x ## f, f, f) f2(x ## l, ld, ld)
#define mkLDFlt3(x) f3(x ## f, f, f, f) f3(x ## l, ld, ld, ld)

#define mkThreeFlt2(x) f2(x ## f, f, f) f2(x ## l, ld, ld) f2(x, d, d)
#define mkThreeFlt3(x) f3(x ## f, f, f, f) f3(x ## l, ld, ld, ld) f3(x, d, d, d)
#define mkThreeFlt4(x) f4(x ## f, f, f, f, f) f4(x ## l, ld, ld, ld, ld) f4(x, d, d, d, d)
#define mkThreeFlt2RetI(x) f2(x ## f, i, f) f2(x ## l, i, ld) f2(x, i, d)
#define mkThreeFlt2RetL(x) f2(x ## f, l, f) f2(x ## l, l, ld) f2(x, l, d)
#define mkThreeFlt2RetLL(x) f2(x ## f, ll, f) f2(x ## l, ll, ld) f2(x, ll, d)

#define mkThreeCFlt2(x) f2(x ## f, f, cf) f2(x ## l, ld, cld) f2(x, d, cd)
#define mkThreeCFltC2(x) f2(x ## f, cf, cf) f2(x ## l, cld, cld) f2(x, cd, cd)
#define mkThreeCFltC3(x) f3(x ## f, cf, cf, cf) f3(x ## l, cld, cld, cld) f3(x, cd, cd, cd)

mkLDFlt2(acos)
mkLDFlt2(asin)
mkLDFlt3(atan2)
mkLDFlt2(atan)
mkLDFlt2(ceil)
mkLDFlt2(cosh)

#ifndef __AMDGCN__

mkLDFlt2(cos)
mkLDFlt2(exp)

#endif

mkLDFlt2(fabs)
mkLDFlt2(floor)
mkLDFlt3(fmod)
f3(frexpf, f, f, ip)
f3(frexpl, ld, ld, ip)
f3(ldexpf, f, f, i)
f3(ldexpl, ld, ld, i)

#ifndef __AMDGCN__

mkLDFlt2(log10)
mkLDFlt2(log)

#endif

f3(modfl, ld, ld, ldp)
f3(modff, f, f, fp)

#ifndef __AMDGCN__

mkLDFlt3(pow)
mkLDFlt2(sin)
mkLDFlt2(sinh)

#endif

mkLDFlt2(sqrt)
mkLDFlt2(tan)
mkLDFlt2(tanh)
