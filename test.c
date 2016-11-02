#include <stdio.h>
#include <assert.h>
#include <string.h>

#include "libbasti.h"

int main(void) {

	int sequence[4] = { 1, 3, 5, 12 };
	assert(addNumbers(sequence, 4) == 21 );
	printf("Tests successful.\n");

    return 0;
}
