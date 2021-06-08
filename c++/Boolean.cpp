#include <string.h>
#include <stdlib.h>

constexpr const char *TrueLiteral = "True";
constexpr const char *FalseLiteral = "False";

char *BooleanToString(bool value)
{
    if (false == value)
        return strdup(FalseLiteral);
    return strdup(TrueLiteral);
}

bool BooleanEquals(bool value, bool obj)
{
    return value == obj;
}

int BooleanCompareTo(bool value, bool value2)
{
    if (value == value2)
        return 0;
    else if (value == false)
        return -1;
    return 1;
}
