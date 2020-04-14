global variance
section .text

variance:      ;prologue
  push rbp
  mov rbp, rsp

  push rcx      ;var

  cmp rdi, 0    ; check the source array
  je rexit      ; jump to exit
  cmp rsi, 0    ; check the second array
  je rexit      ; jump to exit
  cmp rdx, 0	; check the size of array
  re rexit	; jump to exit
  
  mov r15, rdi  ; save rdi here -- breakpoint here and check r15  
  mov r8d, 0
  mov r9d, 0
  mov r10d, 0
  mov eax, 0
  mov rcx, rdx	; copy the size over to rcx
;  sub rcx, 1    ; rcx now has size and to start from 0, subtract 1

;  push rdx
sumLoop:
  mov r8d, dword [rdi]  ; mov the current element from source to r8d
  add r9d, r8d		; add r8d to the sum register r9d
  add rdi, 4            ; increment to next integer in array rdi
  sub rcx, 1            ; decrement size value
  cmp rcx, 0            ; compare with 0
  jne sumLoop       	; loop until size is 0
;  pop rdx

;compute average
  mov eax, r9d		; mov sum to eax 
  cdq			; convert 
  mov ebx, 10 		; mov divisor into ebx
  idiv ebx		; result should be in eax ; ignore remainder 
			; working till here ---  average is in eax
  
  mov rcx, rdx		; reset the length value which I decrement in rcx
  mov rdi, r15		; -- breakpoint here

indexMinusAverage:  
  mov r8d, dword [rdi]	; get the current element in the source array 
  sub r8d, eax		; subtract the current element by average
  imul r8d, r8d		; square this difference
  add r10d, r8d		; add this squared value to the new sum register r10d
  add rdi, 4            ; increment to next integer in source array rdi
  sub rcx, 1            ; decrement size value
  cmp rcx, 0            ; compare with 0
  jne indexMinusAverage ; jump back into this loop  
   
  mov eax, r10d		; prepare for division
  cdq
  mov ebx, 10
  idiv ebx		; variance will be in eax 

rexit:          ;epilogue
 pop rcx
 pop rbp
 ret
