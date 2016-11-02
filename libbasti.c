#include "libbasti.h"

#include <glib.h>
#include <stdio.h>

int addNumbers( const int* summands, const int len ) {

    if (!GLIB_CHECK_VERSION (2, 0, 0))
        printf( "[libbasti] glib version 2.0.0 or above is needed.\n");
    else
        printf( "[libbasti] glib found.\n");

    int sum = 0;
    int i = 0;
    for(i=0; i<len; i++) {
        int prevsum = sum;
        sum = sum + summands[i];
        printf( "[libbasti] prev = %d, summand = %d, now = %d\n",
            prevsum, summands[i], sum);
    }
    printf( "[libbasti] sum = %d\n", sum);
    return sum;
}
