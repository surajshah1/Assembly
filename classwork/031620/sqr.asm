global sqr_array_asm
section .text

sqr_array_asm:      ;prologue
  push rbp
  mov rbp, rsp
  push rcx      ;var

  cmp rdi, 0    ; check the source array
  je rexit      ; jump to exit
  cmp rsi, 0    ; check the size of the array
  je rexit      ; check 0 or Null

  mov edx, 0
  mov eax, 0
  mov rcx, rsi   ;mov size in to rcx
  sub rcx, 1    ;rsi has size - start from 0

sumLoop:
  mov edx, dword [rdi]          ; mov element from source to temp ptr
  imul edx, edx			; square edx - integer multiplication
  add eax, edx
  add rdi, 4            ;increment
  sub rcx, 1            ;decrement size
  cmp rcx, 0            ;compare with 0
  jne sumLoop       ;loop until size is 0

rexit:          ;epilogue
 pop rcx
 pop rbp
 ret
     
