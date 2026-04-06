section .data
    msg_not_found db "не найдено", 10, 0
    fmt_int db "%d", 0
    space db " ", 0
    newline db 10, 0
    prompt_n db "введите N: ", 0
    prompt_nums db "введите N чисел: ", 0

section .bss
    N resd 1
    num resd 1
    ans resd 100

section .text
    extern scanf
    extern printf
    global main

main:
    push rbp
    mov rbp, rsp

    lea rdi, [prompt_n]
    xor eax, eax
    call printf

    lea rdi, [fmt_int]
    lea rsi, [N]
    xor eax, eax
    call scanf

    lea rdi, [prompt_nums]
    xor eax, eax
    call printf

    xor r12, r12
    mov ecx, [N]
    test ecx, ecx
    jz .finish

.read_loop:
    push rcx
    lea rdi, [fmt_int]
    lea rsi, [num]
    xor eax, eax
    call scanf
    pop rcx

    mov eax, [num]
    call proverka
    test eax, eax
    jz .skip

    mov eax, [num]
    mov [ans + r12*4], eax
    inc r12

.skip:
    loop .read_loop

.finish:
    cmp r12, 0
    jne .print_numbers
    lea rdi, [msg_not_found]
    xor eax, eax
    call printf
    jmp .end

.print_numbers:
    xor rbx, rbx
.print_loop:
    cmp rbx, r12
    je .print_newline
    mov edi, fmt_int
    mov esi, [ans + rbx*4]
    xor eax, eax
    call printf
    inc rbx
    cmp rbx, r12
    je .skip_space
    lea rdi, [space]
    xor eax, eax
    call printf
    jmp .print_loop
.skip_space:
    jmp .print_loop
.print_newline:
    lea rdi, [newline]
    xor eax, eax
    call printf

.end:
    pop rbp
    xor eax, eax
    ret

proverka:
    push rbx
    push rcx
    push rdx
    mov ebx, eax
    xor ecx, ecx
    mov edx, 1
    mov eax, ebx
.digit_loop:
    test eax, eax
    jz .end_digit
    mov ebx, 10
    xor edx, edx
    div ebx
    add ecx, edx
    mov ebx, edx
    imul ebx
    mov edx, eax
    mov eax, edx
    jmp .digit_loop
.end_digit:
    cmp edx, ecx
    setg al
    movzx eax, al
    pop rdx
    pop rcx
    pop rbx
    ret
