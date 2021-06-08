#include <stdint.h>

#define __inline

typedef uint32_t u32;
typedef uint64_t u64;

/* The Intel API is flexible enough that we must allow aliasing with other
   vector types, and their scalar components.  */
typedef float __m128 __attribute__ ((__vector_size__ (16), __may_alias__));

/* Unaligned version of the same type.  */
typedef float __m128_u __attribute__ ((__vector_size__ (16), __may_alias__, __aligned__ (1)));

/* Internal data types for implementing the intrinsics.  */
typedef float __v4sf __attribute__ ((__vector_size__ (16)));

/* Create a selector for use with the SHUFPS instruction.  */
#define _MM_SHUFFLE(fp3,fp2,fp1,fp0) \
 (((fp3) << 6) | ((fp2) << 4) | ((fp1) << 2) | (fp0))

/* SSE2 */
typedef double __v2df __attribute__ ((__vector_size__ (16)));
typedef int64_t __v2di __attribute__ ((__vector_size__ (16)));
typedef uint64_t __v2du __attribute__ ((__vector_size__ (16)));
typedef int32_t __v4si __attribute__ ((__vector_size__ (16)));
typedef uint32_t __v4su __attribute__ ((__vector_size__ (16)));
typedef int16_t __v8hi __attribute__ ((__vector_size__ (16)));
typedef uint16_t __v8hu __attribute__ ((__vector_size__ (16)));
typedef int8_t __v16qi __attribute__ ((__vector_size__ (16)));
typedef int8_t __v16qs __attribute__ ((__vector_size__ (16)));
typedef uint8_t __v16qu __attribute__ ((__vector_size__ (16)));

/* The Intel API is flexible enough that we must allow aliasing with other
   vector types, and their scalar components.  */
typedef int64_t __m128i __attribute__ ((__vector_size__ (16), __may_alias__));
typedef double __m128d __attribute__ ((__vector_size__ (16), __may_alias__));

/* Unaligned version of the same types.  */
typedef int64_t __m128i_u __attribute__ ((__vector_size__ (16), __may_alias__, __aligned__ (1)));
typedef double __m128d_u __attribute__ ((__vector_size__ (16), __may_alias__, __aligned__ (1)));

/* Create a selector for use with the SHUFPD instruction.  */
#define _MM_SHUFFLE2(fp1,fp0) \
 (((fp1) << 1) | (fp0))

/* Create a selector for use with the SHUFPD instruction.  */
#define _MM_SHUFFLE2(fp1,fp0) \
 (((fp1) << 1) | (fp0))

/* Define the default attributes for the functions in this file. */
#define __DEFAULT_FN_ATTRS256 __attribute__((__always_inline__, __nodebug__))
#define __DEFAULT_FN_ATTRS128 __attribute__((__always_inline__, __nodebug__))

/* The Intel API is flexible enough that we must allow aliasing with other
   vector types, and their scalar components.  */
typedef int64_t __m128i __attribute__ ((__vector_size__ (16), __may_alias__));
typedef double __m128d __attribute__ ((__vector_size__ (16), __may_alias__));

/* Unaligned version of the same types.  */
typedef int64_t __m128i_u __attribute__ ((__vector_size__ (16), __may_alias__, __aligned__ (1)));
typedef double __m128d_u __attribute__ ((__vector_size__ (16), __may_alias__, __aligned__ (1)));
/* The Intel API is flexible enough that we must allow aliasing with other
   vector types, and their scalar components.  */
typedef int32_t __m64 __attribute__ ((__vector_size__ (8), __may_alias__));

/* Unaligned version of the same type  */

typedef double __v4df __attribute__ ((__vector_size__ (32)));
typedef float __v8sf __attribute__ ((__vector_size__ (32)));
typedef long long __v4di __attribute__ ((__vector_size__ (32)));
typedef unsigned long long __v4du __attribute__ ((__vector_size__ (32)));
typedef int __v8si __attribute__ ((__vector_size__ (32)));
typedef unsigned int __v8su __attribute__ ((__vector_size__ (32)));
typedef short __v16hi __attribute__ ((__vector_size__ (32)));
typedef unsigned short __v16hu __attribute__ ((__vector_size__ (32)));
typedef char __v32qi __attribute__ ((__vector_size__ (32)));
typedef unsigned char __v32qu __attribute__ ((__vector_size__ (32)));

/* The Intel API is flexible enough that we must allow aliasing with other
   vector types, and their scalar components.  */
typedef float __m256 __attribute__ ((__vector_size__ (32),
									 __may_alias__));
typedef long long __m256i __attribute__ ((__vector_size__ (32),
										  __may_alias__));
typedef double __m256d __attribute__ ((__vector_size__ (32),
									   __may_alias__));

/* Unaligned version of the same types.  */
typedef float __m256_u __attribute__ ((__vector_size__ (32),
									   __may_alias__,
									   __aligned__ (1)));
typedef long long __m256i_u __attribute__ ((__vector_size__ (32),
											__may_alias__,
											__aligned__ (1)));
typedef double __m256d_u __attribute__ ((__vector_size__ (32),
										 __may_alias__,
										 __aligned__ (1)));

#define __gnu_inline__
#define __always_inline__
#define __artificial__
#define __inline__
#define static

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v32qu)__A + (__v32qu)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v16hu)__A + (__v16hu)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v8su)__A + (__v8su)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_epi64 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v4du)__A + (__v4du)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_and_si256 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v4du)__A & (__v4du)__B);
}

static __inline__ __m256i __DEFAULT_FN_ATTRS256
_mm256_andnot_si256(__m256i __a, __m256i __b)
{
  return (__m256i)(~(__v4du)__a & (__v4du)__b);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpeq_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v32qi)__A == (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpeq_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v16hi)__A == (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpeq_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v8si)__A == (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpeq_epi64 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v4di)__A == (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpgt_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v32qi)__A > (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpgt_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v16hi)__A > (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpgt_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v8si)__A > (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpgt_epi64 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v4di)__A > (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mullo_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v16hu)__A * (__v16hu)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mullo_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v8su)__A * (__v8su)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_or_si256 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v4du)__A | (__v4du)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sub_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v32qu)__A - (__v32qu)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sub_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v16hu)__A - (__v16hu)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sub_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v8su)__A - (__v8su)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sub_epi64 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v4du)__A - (__v4du)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_xor_si256 (__m256i __A, __m256i __B)
{
  return (__m256i) ((__v4du)__A ^ (__v4du)__B);
}
