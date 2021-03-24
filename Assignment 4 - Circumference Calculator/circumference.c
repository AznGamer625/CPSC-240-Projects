//*************************************************************************************************************************
//Program name: "Circumference Calculator With Floating Points". This program will ask you to input a floating point, and the 
//program will calculate the circumference of a circle with the floating point number as the radius. The program will return the 
//circumference of the circle as a floating point and a hexadecimal.
//
//Author: Richard Phan
//Email: aznfullertongamer@csu.fullerton.edu
//Institution: California State University, Fullerton
//Course: CPSC 240 Section 05
//Copyright (C) 2020 Richard Phan
//
//This file is part of "Circumference Calculator With Floating Points".
//This file is written in C.
//Compile: gcc -c -Wall -m64 -no-pie -std=c11 -o circumference.o circumference.c
//"Circumference Calculator With Floating Points" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public 
//License version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
//<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: aznfullertongamer@csu.fullerton.edu 
//****************************************************************************************************************************
#include <stdio.h>

double circle();

int main() {
    double result_code = -999;
    printf("%s\n", "Welcome to your friendly circle circumference calculator.");
    printf("%s\n", "The main program will now call the circle function.");
    result_code = circle();
    printf("%s%.19lf%s%lx\n", "Main received this number: ", result_code, " = 0x", *(long unsigned int*)&result_code);
    printf("%s\n", "Have a nice day. Main will now return 0 to the operating system.");
    
    return 0;
}