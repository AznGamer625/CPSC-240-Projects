;*************************************************************************************************************************
;Program name: "Sum of the Array". This file is used to calculate the sum of all of the values in the array that was 
;passed from the manager.asm file
;Author: Richard Phan
;Email: aznfullertongamer@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240 Section 05
;Copyright (C) 2020 Richard Phan
;
;This file is part of "Sum of the Array".
;"Sum of the Array" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
;License version 3 as published by the Free Software Foundation.
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
;A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
;<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: aznfullertongamer@csu.fullerton.edu 
;****************************************************************************************************************************
extern printf
global sum

section .data
    numPrint db "%ld", 10, 0
    stringFormat db "%s", 10, 0
    intFormat db "%ld", 10, 0
section .bss
;Empty

section .text

sum:
    pushf
    push rbx
    push r15
    push r14
    push r13
    push r12
    push r11
    push r10
    push r9
    push r8
    push rcx
    push rdx
    push rsi
    push rdi
    push rbp
    

    mov r13, 0                   ;initialized r13 to 0 as total sum
    mov r12, 0                   ;keep track of how many times to loop for adding

start_loop:
    cmp r12, r14                 ;r14 holds the counter from input_array, comparing with the loop counter in sum  
    je end_loop                  ;makes sure that the logic only loops with the number of values in the array
    add r13, [r15 + r12*8]       ;adds the values from the array, into r13, which holds the total sum
    inc r12                      ;increment r12, which allows us to access the values from the array
    jmp start_loop               ;loop until end_loop condition is met

end_loop:
    mov rax, r13                 ;the sum, which is in r13, shall be returned to manager

    pop rbp
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop r8
    pop r9
    pop r10
    pop r11
    pop r12
    pop r13
    pop r14
    pop r15
    pop rbx
    popf

ret