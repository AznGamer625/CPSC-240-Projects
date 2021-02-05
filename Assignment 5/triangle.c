//*************************************************************************************************************************
//Program name: "Heron's Formula Calculator". This program will ask you to input three floating point values for each side of the triangle. 
//After inputting the 3 values, the program will check if the values are valid inputs and will calculate the area of the triangle
//using the Heron's Formula. The program will display the area, and return the area has a hexidecimal.
//
//Author: Richard Phan
//Email: aznfullertongamer@csu.fullerton.edu
//Institution: California State University, Fullerton
//Course: CPSC 240 Section 05
//Copyright (C) 2020 Richard Phan
//
//This file is part of "Heron's Formula Calculator".
//This file is written in C.
//Compile: gcc -c -Wall -m64 -no-pie -std=c11 -o triangle.o triangle.c
//"Heron's Formula Calculator" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public 
//License version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
//<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: aznfullertongamer@csu.fullerton.edu 
//****************************************************************************************************************************
#include <stdio.h>

double area();

int main() {
    double result_code = -999;
    printf("%s\n", "Welcome to Area of Triangles by Richard Phan");
    //printf("%s", "The program will compute the area of your triangle.");
    result_code = area();
    printf("\n%s%ld%s\n", "The driver received this number 0x", *(long unsigned int*)&result_code, ", and will keep it.");
    printf("%s\n", "Now 0 will be returned to the operating system. Bye");
    return 0;
}