global compute_grey

section .txt	; prologue ->

compute_grey:

 push rbp
 mov rbp, rsp
 
 cmp rdi, 0 ; input validation
 je rexit
 
 ;mov rcx, 0
 mov r13d, 0xff000000 ; setup vars for 'and' operation 32-bit
 mov r14d, 0x00ff0000
 mov r15d, 0x0000ff00
 mov edx, 0
 mov esi, 0
 mov edi, 0

 mov edx, dword[rdi]
 and edx, r13d
 shr edx, 24
 add eax, edx

 mov esi, dword [rdi]
 and esi, r14d
 shr esi, 16
 add eax, esi ; add to eax

 mov edi, dword [rdi]
 and edi, r15d
 shr edi, 8
 add eax, edi ; ret register eax contains dividend
 
 ;mov ecx, 0 ; for idiv
 mov edi, 3 ; divisor
 idiv edi ; idiv eax/edi

rexit ;epilogue

 pop rbp
 ret
