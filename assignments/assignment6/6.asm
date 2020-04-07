;compile with yasm -f elf64 foo.asm --> creates foo.o

section .text
global mymemcpy

mymemcpy:

mov rax, [rsi]
mov [rdi], rax

add rsi, 8
add rdi, 8
sub rdx, 8
cmp rdx, 0


jne mymemcpy


ret

