global variance
section .text
 
variance:      ;prologue
  push rbp
  mov rbp, rsp
 
 ;push rcx
 
  cmp rdi, 0    ; check the source array
  je rexit      ; jump to exit
  cmp rsi, 0    ; check the second array
  je rexit      ; jump to exit
  cmp rdx, 0    ; check the size of array
  je rexit      ; jump to exit
    
  mov r8, 0	; temp
  mov r9, 0	; temp
  ;mov rax, 0	; initialize
  ;mov rcx, 0   ; initialize 
  mov rcx, rdx  ; save rdx
  mov r10, rdi  ; save rdi   
  mov r11, rsi	; save rsi 
 
sumLoop:
  add r8d, dword [rdi]  ; add current nummber to r8d
  add rdi, 4            ; increment rdi
  sub rdx, 1            ; decrement size 
  cmp rdx, 0            ; 
  jne sumLoop           ; loop

;compute average
  mov eax, r8d          ; mov sum to eax 
  cdq                   ; convert  
  mov ebx, ecx          ; mov divisor (10) into ebx edx has remainder
  idiv ebx              ; average in eax 
         
  xor r8d, r8d		; clear r8d
  mov rdx, rcx		; reset rdx
  mov rdi, r10		; reset rdi
  mov rsi, r11		; reset rsi
                
indexMinusAverage:
  mov r8d, dword [rdi]  ; current integer in r8d 
  sub r8d, eax          ; subtract average
  imul r8d, r8d         ; square
  add r9d, r8d		; add to collector
  add rdi, 4            ; increment rdi
  sub rdx, 1            ; decrement size
  cmp rdx, 0            ; 
  jne indexMinusAverage ; loop  
  
;compute variance
  mov eax, r9d          ; mov sum to eax 
  cdq                   ; convert 
  mov ebx, ecx          ; mov divisor (10) into ebx
  idiv ebx              ; variance in eax 
 
rexit:          ;epilogue
 ;pop rcx
 pop rbp
 ret
