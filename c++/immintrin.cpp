#include <stdint.h>

#define __inline__
#define static
#define __always_inline__
#define __nodebug__
#define __target__(x)

/* __bit_scan_reverse */
static __inline__ int __attribute__((__always_inline__, __nodebug__))
_bit_scan_reverse(int32_t __A) {
  return 31 - __builtin_clz(__A);
}

static __inline__ int16_t __attribute__((__always_inline__, __nodebug__, __target__("movbe")))
_loadbe_i16(void const * __P) {
  struct __loadu_i16 {
	int16_t __v;
  } __attribute__((__packed__, __may_alias__));
  return __builtin_bswap16(((struct __loadu_i16*)__P)->__v);
}

static __inline__ void __attribute__((__always_inline__, __nodebug__, __target__("movbe")))
_storebe_i16(void * __P, int16_t __D) {
  struct __storeu_i16 {
	int16_t __v;
  } __attribute__((__packed__, __may_alias__));
  ((struct __storeu_i16*)__P)->__v = __builtin_bswap16(__D);
}

static __inline__ int32_t __attribute__((__always_inline__, __nodebug__, __target__("movbe")))
_loadbe_i32(void const * __P) {
  struct __loadu_i32 {
	int32_t __v;
  } __attribute__((__packed__, __may_alias__));
  return __builtin_bswap32(((struct __loadu_i32*)__P)->__v);
}

static __inline__ void __attribute__((__always_inline__, __nodebug__, __target__("movbe")))
_storebe_i32(void * __P, int32_t __D) {
  struct __storeu_i32 {
	int32_t __v;
  } __attribute__((__packed__, __may_alias__));
  ((struct __storeu_i32*)__P)->__v = __builtin_bswap32(__D);
}

static __inline__ int64_t __attribute__((__always_inline__, __nodebug__, __target__("movbe")))
_loadbe_i64(void const * __P) {
  struct __loadu_i64 {
	int64_t __v;
  } __attribute__((__packed__, __may_alias__));
  return __builtin_bswap64(((struct __loadu_i64*)__P)->__v);
}

static __inline__ void __attribute__((__always_inline__, __nodebug__, __target__("movbe")))
_storebe_i64(void * __P, int64_t __D) {
  struct __storeu_i64 {
	int64_t __v;
  } __attribute__((__packed__, __may_alias__));
  ((struct __storeu_i64*)__P)->__v = __builtin_bswap64(__D);
}
