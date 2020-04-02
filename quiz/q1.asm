global evens_and_odds
section .text

evens_and_odds:      ;prologue
  push rbp
  mov rbp, rsp
  push rax      ; variable used for iteration

  cmp rdi, 0    ; check source array
  je rexit      ; exit
  cmp rsi, 0    ; check even array
  je rexit      ; exit
  cmp rdx, 0	; check odd array  
  je rexit	; exit
  cmp rcx, 0	; check size
  je rexit	; exit
  
  mov rax, rcx  ; mov size in to rax
  sub rax, 1    ; rax has size - start from 0

checkLoop:
  mov edx, dword [rdi]	; mov element from source to temp ptr edx 
  and edx, 2	; bitwise AND to compute modulo 2
  cmp edx, 0	; check if the result of this mod is 0 (means it is even)
  jne odd	; jmp not equal if it is not 0
  je even	; jmp equal if it is 0

continueLoop:
  add rdi, 4	; increment
  sub rax, 1    ; decrement size
  cmp rax, 0    ; compare with 0
  jne checkLoop ; loop until size is 0
  je  rexit	; exit when have iterated through every element 

even:		
  mov esi, dword [rdi] 
  mov dword [rsi], esi ; copy current element into even array
  add rsi, 4	; increment index of rsi
  mov r8d, 1	; counter with value 1
  add eax, r8d	; eax now has current count of evens
  jmp continueLoop

odd:		
  mov esi, dword [rdi] 
  mov dword [rdx], esi ; copy current element into odd array
  add rdx, 4	; increment index of rdx
  jmp continueLoop

rexit:          ;epilogue
 pop rax
 pop rbp
 ret		; return eax value

