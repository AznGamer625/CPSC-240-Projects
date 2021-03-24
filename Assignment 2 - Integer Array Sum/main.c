//*************************************************************************************************************************
//Program name: "Sum of the Array". This program will ask the user for input that they wish to find the sum of.
//The program will receive input until the user presses the enter key, following with Ctrl + D, which will then 
//find the sum of the values that the user inputted. 
//Author: Richard Phan
//Email: aznfullertongamer@csu.fullerton.edu
//Institution: California State University, Fullerton
//Course: CPSC 240 Section 05
//Copyright (C) 2020 Richard Phan
//
//This file is part of "Sum of the Array".
//"Sum of the Array" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
//License version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
//<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: aznfullertongamer@csu.fullerton.edu 
//****************************************************************************************************************************
#include<stdio.h>

long int manager();
long int read_clock();

int main() {
    long int result_code = -999;
    result_code = read_clock();
    printf("%s%ld%s\n", "The time on the CPU clock is now ", result_code, " tics");
    printf("%s\n","Welcome to Array of Integers.");
    printf("%s\n","Brought to you by Richard Phan");
    result_code = manager();
    printf("Main received %ld, and is not sure what to do with it.\n", result_code);
    printf("%s\n", "Main will return 0 to the operating system. Bye.");
    return 0;
}