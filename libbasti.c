#include <stdio.h>
#include "libbasti.h"

int addNumbers( const int* summands, const int len ) {
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
