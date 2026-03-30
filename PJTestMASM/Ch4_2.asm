COMMENT !
CS 130#16635
CH04 Lab 02
Student: Jacob Yeung #900494756

Assembly Language Programming Labs
Lab 4-2
!

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
    fibArray DWORD 15 DUP(0)

.code
main PROC
    mov fibArray[0], 1      ; Fib(1) = 1
    mov fibArray[4*1], 2      ; Fib(2) = 2

    mov ecx, 15-2           ; loop 15-2 times
    mov esi, 4*2              ; index 3 = Offset 4*2=8

L1:
    ; Fib(n) = Fib(n-1) + Fib(n-2)
    mov eax, [fibArray + esi - 4*1]
    add eax, [fibArray + esi - 4*2]
    
    mov [fibArray + esi], eax      ; result = current position
    
    add esi, 4                    ; next pt DWORD
    loop L1

    INVOKE ExitProcess, fibArray[4*(15-1)] 
main ENDP

END main
