//*************************************************************************************************************************
//Program name: "Bubble Sorting An Array". This file is used to print out the array that is passed from the manager.asm
//Author: Richard Phan
//Email: aznfullertongamer@csu.fullerton.edu
//Institution: California State University, Fullerton
//Course: CPSC 240 Section 05
//Copyright (C) 2020 Richard Phan
//
//This file is part of "Bubble Sorting An Array".
//This file is written in C++.
//Compile: g++ -c -Wall -m64 -std=c++14 -no-pie -o Display_Array.o Display_Array.cpp
//"Bubble Sorting An Array" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
//License version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
//<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: aznfullertongamer@csu.fullerton.edu 
//****************************************************************************************************************************

#include<stdio.h>
extern "C" void display_array(long array[], long size);

void display_array(long array[], long size) {
    for (long i = 0; i < size; i++) {
        printf("%ld%s",array[i], " ");
    }
    printf("%s", "\n");
}