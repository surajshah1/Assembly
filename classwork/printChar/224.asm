section	.text
global	_start		;must be declared for linker (ld)

_start:			;tell linker entry point

	mov	edx, 1	;buffer length
	mov	ecx, char	;buffer to write on
	mov	ebx, 0	;file descriptor (stdin)
	mov	eax, 3	;system call number (sys_read)
	int	0x80	;call kernel

	mov	ebx, 1
	mov	eax, 4	

	mov	eax, 1	;system call number (sys_exit)
	int	0x80	;call kernel

section	.data

char	db 0						;char ch = 0;
;msg	db  'Please enter any character: ', 0xa ;string to be printed
;len	equ $ - msg                             ;length of the string
