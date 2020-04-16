global absolute_value
section .text

absolute_value:			;prologue
	push rbp
	mov rbp, rsp

	cmp rdi, 0	; validate input
	je rexit	; exit if invalid

	xor r8, r8	; temp
	mov r8d, edi	; store edi
	
	cmp r8d, 0	; compare the integer with 0
	jl isNegative	; if less than 0 jump to abs
	jmp isNot	; else mov pos val back and finish

isNegative:
	imul r8d, -1	; multipl by negative one
	mov eax, r8d	; mov to return register
	jmp rexit	; end

isNot:
	mov eax, edi	; mov to return register

rexit:			; epilogue
	pop rbp
	ret
