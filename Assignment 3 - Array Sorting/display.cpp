#include<stdio.h>
extern "C" void display_array(long array[], long size);

void display_array(long array[], long size) {
    for (long i = 0; i < size; i++) {
        printf("%ld%s",array[i], " ");
    }
    printf("%s", "\n");
}