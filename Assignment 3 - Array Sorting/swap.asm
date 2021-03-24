;*************************************************************************************************************************
;Program name: "Bubble Sorting An Array". This file is used to swap the values in the array, used in the bubble_sort.c file. 
;Author: Richard Phan
;Email: aznfullertongamer@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240 Section 05
;Copyright (C) 2020 Richard Phan
;
;This file is part of "Bubble Sorting An Array".
;This file is written in asm.
;Compile: nasm -f elf64 -o swap.o swap.asm 
;"Bubble Sorting An Array" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
;License version 3 as published by the Free Software Foundation.
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
;A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
;<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: aznfullertongamer@csu.fullerton.edu 
;****************************************************************************************************************************
global swap

section .data

section .bss

section .text
swap:
    push rbp
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

    mov r15, [rdi]        ;r15 holds the first parameter
    mov r14, [rsi]        ;r14 holds the second parameter
    mov [rdi], r14
    mov [rsi], r15

    popf
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

