#include <stdint.h>
#include <stddef.h>

#undef __THROW
#define __THROW

extern void *malloc (size_t __size) __THROW __attribute_malloc__ __wur;
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
	 __THROW __nonnull ((1)) __wur;
#define NULL __null
extern void free (void *__ptr) __THROW;
#define static
#define __inline

static __inline void *
_mm_malloc (size_t __size, size_t __alignment)
{
  void *__ptr;
  if (__alignment == 1)
	return malloc (__size);
  if (__alignment == 2 || (sizeof (void *) == 8 && __alignment == 4))
	__alignment = sizeof (void *);
  if (posix_memalign (&__ptr, __alignment, __size) == 0)
	return __ptr;
  else
	return NULL;
}

static __inline void
_mm_free (void *__ptr)
{
  free (__ptr);
}
