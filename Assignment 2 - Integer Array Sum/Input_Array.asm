;*************************************************************************************************************************
;Program name: "Sum of the Array". This file is used to tell the user to input values that would be inserted into the 
;array, that is held in the manager.asm file. This file would also check the values that the user has inputted, to make
;sure that the values are only integers. 
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
extern scanf
extern isinteger
extern atolong
global input_array

section .data
    invalidMsg db "Your input is invalid. Enter an input", 10, 0
    debug1 db "Here.", 10, 0
    intFormat db "%ld", 10, 0
    stringFormat db "%s", 0


section .bss
;this section is empty

section .text

input_array:
    push rbp
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
    pushf

    mov rbp, rsp
    
    mov r13, rsi            ;r13 has the limit for the loop
    mov r14, 0              ;r14 will be counter for array size = 0
    mov r12, rdi            ;r12 will have the pointer to the first index of the array 

    begin_loop:

    cmp r14, r13            ;checks if the counter has reached the limit of the array
    jge end_loop 

    push qword 99
    mov rdi, stringFormat
    mov rsi, rsp
    mov rax, 0
    call scanf
    
    cdqe
    cmp rax, -1                 ;checking if ctrl D 
    je end_loop   

    mov rax, 0
    mov rdi, rsp
    call isinteger
    cmp rax, 0
    je invalid_msg
    
    mov rax, 0
    mov rdi, rsp
    call atolong
    pop r10
    
     

    mov r8, rax                 ;save the integer that was scanned, into r8(scratch register)
    mov qword [r12 + 8*r14], r8
    inc r14

    ;mov rax, 0
    ;mov rdi, stringFormat      ;used for debugging purposes
    ;mov rsi, debug1
    ;call printf

    jmp begin_loop

    invalid_msg:
    mov rdi, stringFormat
    mov rsi, invalidMsg
    mov rax, 0
    call printf
    pop r9
    jmp begin_loop

    end_loop:
    pop r9                  ;pop for CtrlD
    mov rax, r14            ;save the counter(r14) into rax to return to manager
    
    popf
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
    pop rbp

ret