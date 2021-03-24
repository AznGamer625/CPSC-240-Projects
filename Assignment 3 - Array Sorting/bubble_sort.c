//*************************************************************************************************************************
//Program name: "Bubble Sorting An Array". This program will use the bubble sort algorithm to sort the array. 
//Author: Richard Phan
//Email: aznfullertongamer@csu.fullerton.edu
//Institution: California State University, Fullerton
//Course: CPSC 240 Section 05
//Copyright (C) 2020 Richard Phan
//
//This file is part of "Bubble Sorting An Array".
//This file is written in C. 
//Compile: gcc -c -Wall -m64 -std=c11 -no-pie -o bubble_sort.o bubble_sort.c
//"Bubble Sorting An Array" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
//License version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
//<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: aznfullertongamer@csu.fullerton.edu 
//****************************************************************************************************************************
#include<stdio.h>
extern void swap(long *a, long *b);
extern void bubble_sort(long array[], long size);

void bubble_sort(long array[], long size) {
    long i, j;
    for (i = 0; i < size - 1; i++) {
        for (j = 0; j < size - i - 1; j++) {
            if (array[j] > array[j+1]) {
                swap(&array[j], &array[j+1]);
            }
        }
    }
}