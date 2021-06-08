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

#define f1(x, t1) t1 x() { return b(x)(); }
#define f2(x, t1, t2) t1 x(t2 a) { return b(x)(a); }
#define f3(x, t1, t2, t3) t1 x(t2 a, t3 b) { return b(x)(a, b); }
#define f4(x, t1, t2, t3, t4) t1 x(t2 a, t3 b, t4 c) { return b(x)(a, b, c); }
#define f5(x, t1, t2, t3, t4, t5) t1 x(t2 a, t3 b, t4 c, t5 d) { return b(x)(a, b, c, d); }

#define mkII(x) f2(x, i, i)
#define mkLL(x) f2(x, l, l)
#define mkDD(x) f2(x, d, d)
#define mkDDD(x) f3(x, d, d, d)

#define mkThree2(x) mkII(x) mkLL(x ## l) f2(x ## ll, ll, ll)

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

f1(abort, v)
mkII(abs)
mkDD(acos)
mkDD(asin)
mkDDD(atan2)
mkDD(atan)

#ifndef __clang__

f3(calloc, vp, sz, sz)

#endif

mkDD(ceil)
mkDD(cosh)

#ifndef __AMDGCN__

mkDD(cos)

#endif

#ifndef __clang__

f2(exit, v, i)

#endif

#ifndef __AMDGCN__

mkDD(exp)

#endif

mkDD(fabs)
mkDD(floor)
mkDDD(fmod)

#ifndef __clang__

f3(fputs, i, ccp, FILE *)

#endif

f3(frexp, d, d, ip)

#ifndef __clang__

mkII(isalnum)
mkII(isalpha)
mkII(iscntrl)
mkII(isdigit)
mkII(isgraph)
mkII(islower)
mkII(isprint)
mkII(ispunct)
mkII(isupper)
mkII(isxdigit)
mkII(tolower)

#endif

mkLL(labs)
f3(ldexp, d, d, i)

#ifndef __AMDGCN__

mkDD(log10)
mkDD(log)

#endif

#ifndef __clang__

f2(malloc, vp, sz)

#endif

f4(memchr, vp, cvp, i, sz)
f4(memcmp, i, cvp, cvp, sz)
f4(memcpy, vp, vp, cvp, sz)
f4(memset, vp, vp, i, sz)
f3(modf, d, d, dp)

#ifndef __AMDGCN__

f3(pow, d, d, d)

#endif

#ifndef __clang__

f2(putchar, i, i)
f2(puts, i, ccp)

#endif

#ifndef __AMDGCN__

mkDD(sinh)
mkDD(sin)

#endif

mkDD(sqrt)
f3(strcat, cp, cp, ccp)
f3(strchr, cp, ccp, i)
f3(strcmp, i, ccp, ccp)
f3(strcpy, cp, cp, ccp)
f3(strcspn, sz, ccp, ccp)
f2(strlen, sz, ccp)
f4(strncat, cp, cp, cp, sz)
f4(strncmp, i, ccp, ccp, sz)
f4(strncpy, cp, cp, ccp, sz)
f3(strpbrk, cp, ccp, ccp)
f3(strrchr, cp, ccp, i)
f3(strspn, sz, ccp, ccp)
f3(strstr, cp, ccp, ccp)

#ifndef __AMDGCN__

mkDD(tanh)
mkDD(tan)

#endif

#ifndef __clang__

f4(vfprintf, i, FILE *, ccp, vlst)
f3(vprintf, i, ccp, vlst)

#endif

f4(vsprintf, i, cp, ccp, vlst)
