#include "stdlib.h"
#include "stdio.h"

int main() {
    int array[4];
    array[0] = 5;
    array[1] = 11;
    array[2] = 2;
    array[3] = 12;
    int largest = 0;
    size_t sizeArray = sizeof(array) / sizeof(int);
    for (int i = 0; i < sizeArray; i++) {
        if (largest < array[i]) {
            largest = array[i];
        }
    }
    printf("the largest number is : %d", largest);
    return 0;
    
}