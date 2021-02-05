;*************************************************************************************************************************
;Program name: "Heron's Formula Calculator". This program will ask you to input three floating point values for each side of the triangle. 
;After inputting the 3 values, the program will check if the values are valid inputs and will calculate the area of the triangle
;using the Heron's Formula. The program will display the area, and return the area has a hexidecimal.
;
;Author: Richard Phan
;Email: aznfullertongamer@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240 Section 05
;Copyright (C) 2020 Richard Phan
;
;This file is part of "Heron's Formula Calculator".
;This file is written in asm.
;Compile: nasm -g -F dwarf -f elf64 -o area.o area.asm
;"Heron's Formula Calculator" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public 
;License version 3 as published by the Free Software Foundation.
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
;A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
;<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: aznfullertongamer@csu.fullerton.edu 
;****************************************************************************************************************************
extern printf
extern scanf
extern atof
extern display
extern isfloat
global area

section .data
    introPrompt db "The program will compute the area of your triangle.", 0x0A, 0
    inputPrompt db "Enter the floating point lengths of the 3 sides of your triangle.", 0x0A, 0
    invalidMsg db "You have enter an invalid value. Please run the program again.", 0x0A, 0
    valueReceived db "These values were received: ", 0
    sidePrompt db "Side %ld: ", 0         ;sidePrompt format
    areaoftriangle db "The area of this triangle is %lf square meters", 0x0A, 0
    stringFormat db "%s", 0               ;string format 
    floatPFormat db "%lf", 0x0A, 0        ;float format with newline
    floatFormat db " %lf", 0              ;float format 
    newlineFormat db " ", 0x0A, 0         ;newline format 

section .bss
    array: resq 100 
section .text
area:
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

    mov r13, 3          ;r13 has the limit for the loop
    mov r14, 0          ;r14 will be the counter for array size = 0
    mov r15, 0          ;r15 will be the counter for sidePrompt
    mov r12, array      ;r12 will have the pointer to the first index of the array
    mov rax, 0          ;used to check if input is negative
    movq xmm5, rax      ;used to check if input is negative

    ;print out the introPrompt
    mov rdi, stringFormat
    mov rsi, introPrompt
    xor rax, rax
    call printf

    ;print out the inputPrompt
    mov rdi, stringFormat
    mov rsi, inputPrompt
    xor rax, rax
    call printf 

begin_loop:             

    cmp r14, r13        ;checks if the counter has reached the limit of the array
    jge print_array

    inc r15 
    mov rax, 0
    mov rdi, sidePrompt
    mov rsi, r15
    call printf
    
    push qword 1
    push qword 0
    mov rdi, stringFormat
    mov rsi, rsp
    mov rax, 0
    call scanf

    mov rax, 0
    mov rdi, rsp
    call isfloat
    cmp rax, 0
    je invalid_msg

    mov rax, 1
    mov rdi, rsp
    call atof
    movsd xmm15, xmm0

    ;check if the float value is negative
    ucomisd xmm15, xmm5           ;xmm5 currently holds 0 for value checking
    jb invalid_msg

    movsd [r12 + 8*r14], xmm15 
    inc r14

    pop r8
    pop r9

    jmp begin_loop

invalid_msg:
    mov rdi, stringFormat
    mov rsi, invalidMsg 
    mov rax, 0
    call printf
    pop r8
    pop r9
    jmp end_print

    
print_array:

    mov r14, 0
    mov rax, 0
    movq xmm14, rax

    mov rax, 0
    mov rdi, stringFormat
    mov rsi, valueReceived  
    call printf
start_loop:
    cmp r14, 3
    jge end_loop

    mov rax, 1
    mov rdi, floatFormat
    movsd xmm0, [r12 + 8*r14]
    call printf
     
    addsd xmm14, [r12 + 8*r14]
    inc r14
    
    jmp start_loop

end_loop:
    ;get the "s" value in Heron's Formula: sqrt(s(s-a)(s-b)(s-c))   s = (a+b+c)/2
    mov r12, 0x4000000000000000
    movq xmm13, r12
    divsd xmm14, xmm13            ;xmm14 = s 
    movsd xmm12, [array + 8*0]    ;xmm12 = first value
    movsd xmm11, [array + 8*1]    ;xmm11 = second value
    movsd xmm10, [array + 8*2]    ;xmm10 = third value
    movsd xmm9, xmm14             ;xmm9 copied xmm14 for s-a 
    subsd xmm9, xmm12             ;xmm9 - xmm12 => xmm9 holds s-a 
    movsd xmm8, xmm14             ;xmm8 copied xmm14 for s-b 
    subsd xmm8, xmm11             ;xmm8 - xmm11 => xmm8 holds s-b 
    movsd xmm7, xmm14             ;xmm7 copied xmm14 for s-c 
    subsd xmm7, xmm10             ;xmm7 - xmm10 => xmm7 holds s-c 

    ;sqrt(s(s-a)(s-b)(s-c))
    mulsd xmm14, xmm9
    mulsd xmm14, xmm8
    mulsd xmm14, xmm7
    sqrtsd xmm14, xmm14

    mov rax, 0
    mov rdi, stringFormat
    mov rsi, newlineFormat
    call printf

    movsd xmm0, xmm14
    mov rax, 1
    mov rdi, areaoftriangle
    call printf

end_print:
    movsd xmm0, xmm14

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