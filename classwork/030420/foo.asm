;compile with yasm -f elf64 foo.asm --> creates foo.o
;use foo.o when you compile test.c
;you can only return on rax
section .text
global foo

;this function does (a+b+c)*d
foo:
mov rax, rdi
add rax, rsi
add rax, rdx
mul rcx

ret

