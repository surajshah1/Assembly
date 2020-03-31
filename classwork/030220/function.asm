;gcc -no-pie func.c function.o -o caller -lc
;yasm -f elf -m amd64 -g dwarf2 function.asm -ofunction.o

extern	printf	; the C function, to be called
global myprint	; the standard gcc entry point

SECTION	.text	; Code Section.
myprint:	; the program label for the entry point

	push	rbp	; set up stack frame

	call	printf	; Call C function

	pop	rbp	; restore stack

	mov	rax,0	; normal, no error, return value
	ret		; return
