#include <stdint.h>

using b = bool;
using i = int;
using l = long;
using ll = long long;
using ui = unsigned;
using ul = unsigned long;
using ull = unsigned long long;
using ip = i *;
using lp = l *;
using llp = ll *;
using uip = ui *;
using ulp = ul *;
using ullp = ull *;

#define b(x) __builtin_ ## x
#define f4(x, t1, t2, t3, t4) t1 x(t2 a, t3 b, t4 c) { return b(x)(a, b, c); }
#define makeThreeF4PTwoParts(p1, p2) f4(p1 ## p2, b, i, i, ip) f4(p1 ## l ## p2, b, l, l, lp) f4(p1 ## ll ## p2, b, ll, ll, llp)
#define makeThreeF4PTwoPartsU(p1, p2) f4(p1 ## p2, b, ui, ui, uip) f4(p1 ## l ## p2, b, ul, ul, ulp) f4(p1 ## ll ## p2, b, ull, ull, ullp)

makeThreeF4PTwoParts(sadd, _overflow)
makeThreeF4PTwoPartsU(uadd, _overflow)
