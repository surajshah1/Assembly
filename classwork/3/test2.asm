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
  cmp rdx, 0    ; check the size of array
  je rexit      ; jump to exit
    
  mov r8d, 0	; temp
  mov eax, 0	;  
  mov rcx, rdx  ; copy the size over to rcx
  mov r10, rdi  ; save rdi   
  mov r11, rsi	; save rsi 
 
sumLoop:
  add r8d, dword [rdi]  ; add current nummber to r8d
  add rdi, 4            ; increment rdi
  sub rdx, 1            ; decrement size 
  cmp rdx, 0            ; compare with 0
  jne sumLoop           ; loop

;compute average
  mov eax, r8d          ; mov sum to eax 
  cdq                   ; convert 
  mov ebx, 10           ; mov divisor into ebx
  idiv ebx              ; average in eax 
         
  xor r8d, r8d		; clear r8d
  mov rdx, rcx		; reset rcx
  mov rdi, r10		; reset rdi
  mov rsi, r11		; reset rsi
                
indexMinusAverage:
  mov r8d, dword [rdi]  ; current integer in r8d 
  sub r8d, eax          ; subtract average
  imul r8d, r8d         ; square
  mov dword [rsi], r8d  ; move to temp array 
  add rdi, 4            ; increment rdi
  add rsi, 4	   	; increment rsi
  sub rcx, 1            ; decrement size
  cmp rcx, 0            ; 
  jne indexMinusAverage ; loop  

  xor r8d, r8d		; clear r8d
  mov rcx, rdx		; reset rcx
 ; mov rdi, r10		; reset rdi
  mov rsi, r11		; reset rsi

varLoop:
  add r8d, dword [rsi]	; sum squared elements
  add rsi, 4		; increment
  sub rcx, 1		; decrement size
  cmp rcx, 0		; 
  jne varLoop		; loop

;compute average
  mov eax, r8d          ; mov sum to eax 
  cdq                   ; convert 
  mov ebx, 10           ; mov divisor into ebx
  idiv ebx              ; variance in eax 
 
rexit:          ;epilogue
 pop rcx
 pop rbp
 ret
