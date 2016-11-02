#include <stdio.h>
#include "libbasti.h"

void printHelp (char* binaryName);
void parseArgvToIntArray (const int argc, char* argv[], int target[]);

int main(int argc, char* argv[]) {

    // check for arguments
    if (argc <= 1) { printHelp(argv[0]); return 1; }

    // convert command line to input format
    int inputNumbers[argc-1];
    parseArgvToIntArray(argc, argv, inputNumbers);

    // call library function
    int sum = addNumbers(inputNumbers, argc-1);

    printf( "sum = %d\n", sum);
    return 0;
}

void printHelp (char* binaryName) {
    printf ("\nUSAGE: %s [num_0] .. [num_n]\n\n", binaryName);
    printf ("[num]\tNumber to add up (only int allowed)\n");
}

void parseArgvToIntArray (const int argc, char* argv[], int target[]) {
    int i;
    for(i = 1; i < argc; i++) {
        int argument;
        int success = sscanf(argv[i], "%d", &argument);
        if (success)
            target[i-1] = argument;
        else
            target[i-1] = 0;
    }
}
