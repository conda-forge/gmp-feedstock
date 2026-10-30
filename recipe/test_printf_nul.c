/* gmp_sprintf and gmp_snprintf must count embedded NUL characters. */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "gmp.h"

static int check(const char *name, int n, const char *buf)
{
    if (n != 3 || memcmp(buf, "a\0b", 4) != 0) {
        printf("%s returned %d\n", name, n);
        return 1;
    }
    return 0;
}

int main(void)
{
    char buf[8];
    int failures = 0;

    memset(buf, 'X', sizeof buf);
    failures += check("gmp_sprintf", gmp_sprintf(buf, "a%cb", 0), buf);
    memset(buf, 'X', sizeof buf);
    failures += check("gmp_snprintf", gmp_snprintf(buf, sizeof buf, "a%cb", 0), buf);

    return failures ? EXIT_FAILURE : EXIT_SUCCESS;
}
