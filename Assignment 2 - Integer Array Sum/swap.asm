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

