//*************************************************************************************************************************
//Program name: "Heron's Formula Calculator". This program will ask you to input three floating point values for each side of the triangle. 
//After inputting the 3 values, the program will check if the values are valid inputs and will calculate the area of the triangle
//using the Heron's Formula. The program will display the area, and return the area has a hexidecimal.
//
//This File is used to check the inputted values by the user, if they are floating point values. The file will return true if the value 
//is a floating point value. 
//
//Author: Richard Phan
//Email: aznfullertongamer@csu.fullerton.edu
//Institution: California State University, Fullerton
//Course: CPSC 240 Section 05
//Copyright (C) 2020 Richard Phan
//
//This file is part of "Heron's Formula Calculator".
//This file is written in C++.
//Compile: g++ -c -Wall -m64 -std=c++14 -no-pie -o isfloat.o isfloat.cpp
//"Heron's Formula Calculator" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public 
//License version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
//<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: aznfullertongamer@csu.fullerton.edu 
//****************************************************************************************************************************
#include <cstdlib>
#include <ctype.h> 

using namespace std;

extern "C" bool isfloat(char []);

bool isfloat(char w[]) 
{
    bool result = true; // Assume floating number until proven otherwise.
    bool found = false; // Checks if only 1 decimal is entered.
    int start = 0;
    if (w[0] == '-' || w[0] == '+') start = 1;
    unsigned long int k = start;
    while( !(w[k]=='\0') && result )
        {
            if ((w[k] == '.') && !found) { found = true; 
            }
            else { result = result && isdigit(w[k]);
            }
            k++;
        }
    return result && found;
}