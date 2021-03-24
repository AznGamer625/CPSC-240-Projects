;*************************************************************************************************************************
;Program name: "Circumference Calculator With Floating Points". This program will ask you to input a floating point, and the 
;program will calculate the circumference of a circle with the floating point number as the radius. The program will return the 
;circumference of the circle as a floating point and a hexadecimal.
;
;Author: Richard Phan
;Email: aznfullertongamer@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240 Section 05
;Copyright (C) 2020 Richard Phan
;
;This file is part of "Circumference Calculator With Floating Points".
;This file is written in asm.
;Compile: nasm -f elf64 -o circle.o circle.asm 
;"Circumference Calculator With Floating Points" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public 
;License version 3 as published by the Free Software Foundation.
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
;A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
;<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: aznfullertongamer@csu.fullerton.edu 
;****************************************************************************************************************************

extern printf
extern scanf
global circle

section .data
    introPrompt db "This circle function is brought to you by Richard Phan.", 0x0A, 0
    inputPrompt db "Please enter the radius of a circle as a floating point number: ", 0
    numberReceived db "The number ", "%lf", " was received.", 0x0A, 0
    circumference db "The circumference of a circle with this radius is ", "%.19lf", " meters.", 0x0A, 0
    circumferenceToMain db "The circumference will be returned to the main program. Please enjoy your circles.", 0x0A, 0
    stringFormat db "%s", 0
    floatPFormat db "%lf", 0                    ;float format
    floatFormat db "%lf", 0x0A, 0               ;float format with a new line
    precisefloatformat db "%.19lf", 0x0A, 0     ;float format with 19 decimal places


section .bss
    ;empty

section .text

circle:
    push rbp            ;The 16 pushes
    mov rbp, rsp 
    push rdi 
    push rsi
    push rdx 
    push rcx
    push r8 
    push r9 
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    push rbx
    pushf
    push qword -1


    ;print out introPrompt
    mov rax, 0
    mov rdi, stringFormat
    mov rsi, introPrompt
    call printf

    ;Ask user to input a floating point number for the radius
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, inputPrompt
    call printf
    
    ;Get the inputted value from the user
    push qword 0
    xor rax, rax
    mov rdi, floatPFormat
    mov rsi, rsp
    call scanf
    movsd xmm15, [rsp]              ;mov the user input into xmm15

    ;print the number received from user
    mov rax, 1
    mov rdi, numberReceived
    movsd xmm0, xmm15               ;mov the user input into xmm0 to print
    call printf

    mov r14, 0x400921FB54442D18     ;Hex representation of Pi in IEEE, and moving it to r14.
    mov r13, 0x4000000000000000     ;Hex representation of 2 in IEEE, and moving it to r13


    push r14                        ;r14 currently holds Pi
    movsd xmm14, [rsp]              ;mov r14 into xmm14
    pop r14

    push r13                        ;r13 currenlty holds 2.0 in IEEE
    movsd xmm13, [rsp]              ;mov r13 into xmm13
    pop r13

    mulsd xmm15, xmm13              ;user input * 2
    mulsd xmm15, xmm14              ;product of user input * 2, then multiply by Pi

    ;print out the circumference after all the calculations
    mov rax, 1
    mov rdi, circumference
    movsd xmm0, xmm15
    call printf
    
    ;print out circumferenceToMain inputPrompt
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, circumferenceToMain
    call printf

    movsd xmm0, xmm15

    pop r14
    pop r15

    popf            ;The 16 pops 
    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    pop rbp 

    ret
