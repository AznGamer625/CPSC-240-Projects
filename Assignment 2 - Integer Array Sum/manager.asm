;*************************************************************************************************************************
;Program name: "Sum of the Array". This file is used to reserve space for the array, that the user will be inputting values
;into. This file would also be used to call the other files to input values into the array with integer validation,
;display the array, and calculate the sum of the array. 
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
extern scanf
extern printf
extern input_array
extern display_array
extern sum
extern bubble_sort
global manager

section .data
    welcome db "This array will sum up your array of integers.", 10, 0
    enterSequencePrompt db "Enter a sequence of long integers separated by white space.", 10, 0
    ctrlDmsg db "After the last input press enter followed by Control+D:", 10, 0
    numReceived db "These numbers were received and place into the array:", 10, 0
    sumOfNumsPrompt db "The sum of the ", "%ld", " numbers in this array is ", 0
    sumFormat db "%ld",10, 0
    intFormat db "%ld", 0
    stringFormat db "%s", 0
    
section .bss
    array: resq 100
    
section .text

manager:
    push rbp
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
    
    ;print welcome
    mov rdi, stringFormat
    mov rsi, welcome
    mov rax, 0
    call printf

    ;print enterSequencePrompt
    mov rdi, stringFormat
    mov rsi, enterSequencePrompt
    mov rax, 0
    call printf

    ;print ctrlD
    mov rdi, stringFormat
    mov rsi, ctrlDmsg
    mov rax, 0
    call printf
    
    mov rdi, array                      ;save array address pointer into rdi
    mov rsi, 100                        ;sets a limit of 100 integers in the array
    mov rax, 0                 
    call input_array                    ;call input_array.asm
    mov r14, rax                        ;r14 holds the counter that returned from input_array

    ;print numbers received from input_array
    mov rdi, stringFormat
    mov rsi, numReceived
    mov rax, 0
    call printf

    ;call display_array to print the array 
    mov rax, 0 
    mov rdi, array
    mov rsi, r14
    call display_array                  

    ;sort the array here
    mov rax, 0
    mov rdi, array
    mov rsi, r14
    call bubble_sort

    ;call display_array to print sorted array
    mov rax, 0
    mov rdi, array
    mov rsi, r14
    call display_array

    ;call sum
    mov r15, array                      
    mov rax, 0
    call sum
    mov r13, rax                        ;saves the sum from sum.asm into r13
    
    ;print out the sum of the numbers
    mov rdi, sumOfNumsPrompt
    mov rsi, r14
    mov rax, 0
    call printf
    
    ;print out the sum
    mov rdi, sumFormat
    mov rsi, r13
    mov rax, 0
    call printf

    mov rax, r13                    ;this will return the sum to the main
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