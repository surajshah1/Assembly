global reverse_array_asm
section .text
 
reverse_array_asm:      ;prologue
  push rbp
  mov rbp, rsp
  push rcx	;var

  cmp rdi, 0	; source array
  je rexit	; jump to exit
  cmp rsi, 0	; dest array
  je rexit 	; check 0 or Null
  cmp rdx, 0	; size of array
  je rexit 
 
  mov rcx, rdx   ;mov size
  sub rdx, 1	;rdx has size - start from 0
  imul rdx, 4	;mul #of elements by 4 bytes
  add rdi, rdx	;adding rdi points to last array element address
 
reverseLoop:
  mov eax, dword [rdi]		; mov element from source to temp ptr
  mov dword [rsi], eax		; mov temp to rsi pointer (swap)
  sub rdi, 4		;source
  add rsi, 4		;destination
  sub rcx, 1		;decrement size
  cmp rcx, 0		;compare with 0
  jne reverseLoop	;loop until size is 0

rexit:          ;epilogue
 pop rcx
 pop rbp
 ret 
