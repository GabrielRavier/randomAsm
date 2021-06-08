#include <stdint.h>
#define extern
#define __inline
#define __gnu_inline__
#define __always_inline__
#define __artificial__

/* The Intel API is flexible enough that we must allow aliasing with other
   vector types, and their scalar components.  */
typedef int64_t __m128i __attribute__ ((__vector_size__ (16), __may_alias__));

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

/* Packed integer 64-bit comparison, zeroing or filling with ones
   corresponding parts of result.  */
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_epi64 (__m128i __X, __m128i __Y)
{
  return (__m128i) ((__v2di)__X == (__v2di)__Y);
}

/* Packed integer 32-bit multiplication with truncation of upper
   halves of results.  */
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mullo_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) ((__v4su)__X * (__v4su)__Y);
}

/* Packed integer 64-bit comparison, zeroing or filling with ones
   corresponding parts of result.  */
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_epi64 (__m128i __X, __m128i __Y)
{
  return (__m128i) ((__v2di)__X > (__v2di)__Y);
}
