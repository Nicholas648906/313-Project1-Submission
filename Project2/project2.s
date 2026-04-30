.global _start

.section .data
inputMessage: 
    .ascii "insert a number: " # 17 characters
outputMessage: 
    .ascii "The double is: " # 15 characters

.section .bss
    userText: .skip 16
    num: .skip 16
    buffer: .skip 16

.text

getUserText:
    movq $0, %rax
    movq $0, %rdi 
    movq $userText, %rsi
    movq $16, %rdx
    syscall
    ret

int_to_str:
    lea buffer+15(%rip), %rsi
    movb $0, (%rsi)

    mov $10, %rbx

    cmp $0, %rax
    jne int_to_str_loop

    dec %rsi
    movb $48, (%rsi)
    ret

int_to_str_loop:
    movq $0, %rdx
    div %rbx

    add $48, %dl
    dec %rsi
    mov %dl, (%rsi)

    cmp $0, %rax
    jne int_to_str_loop

    ret

str_to_int:
    movq $0, %rax
    movq $0, %rcx

str_to_int_loop:
    movzbq userText(%rcx), %rbx
    
    cmp $10, %bl
    je return

    sub $48, %bl

    imul $10, %rax
    add %rbx, %rax

    inc %rcx
    jmp str_to_int_loop

return:
    ret

_exit:
    movq $60, %rax
    movq $0, %rdi
    syscall
    ret

_start:
    movq %rsp, %rbp

    movq $1, %rax
    movq $1, %rdi
    leaq inputMessage, %rsi
    movq $17, %rdx
    syscall
    
    call getUserText
    call str_to_int
    add %rax, %rax
    call int_to_str

    movq $1, %rax
    movq $1, %rdi
    leaq outputMessage, %rsi
    movq $15, %rdx
    syscall

    movq $1, %rax
    movq $1, %rdi
    leaq buffer, %rsi
    movq $17, %rdx
    syscall

    call _exit
    pop %rbp
    
    
