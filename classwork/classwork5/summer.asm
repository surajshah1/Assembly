global summer

section .text

;need to use XMM registers for floats
summer:				; prologue

	push rbp
	mov rbp, rsp
	
	cmp rdi, 0		; verify input array
	je rexit
	cmp rsi, 0		; verify array size
	je rexit 
	
	sub rsi, 1 		; to execute loop 10 times (starts from 0)

sumLoop:
	movss xmm1, dword[rdi]	; mov from source array 
	addss xmm0, xmm1	; add to return register
	add rdi, 4		; increment array
	sub rsi, 1		; decrement size
	cmp rsi, 0		; compare size
	jne sumLoop

rexit:				; epilogue
	pop rbp
	ret
