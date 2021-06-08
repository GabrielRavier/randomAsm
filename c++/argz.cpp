typedef __SIZE_TYPE__ size_t;
#ifdef __GNUG__
#define NULL __null
#else   /* G++ */
#ifndef __cplusplus
#define NULL ((void *)0)
#else   /* C++ */
#define NULL 0
#endif  /* C++ */
#endif  /* G++ */

#if 1
#define strchr __builtin_strchr
#else
const char *strchr (const char *__s, int __c);
#endif

char *__argz_next(const char *argz, size_t argz_len, const char *entry)
{
	if (entry)
	{
		if (entry < argz + argz_len)
			entry = strchr(entry, '\0') + 1;
		return entry >= argz + argz_len ? (char *)NULL : (char *)entry;
	}
	else
		return argz_len > 0 ? (char *)argz : 0;
}

char *argz_next(const char *argz, size_t argz_len, const char *entry)
{
	return __argz_next(argz, argz_len, entry);
}
