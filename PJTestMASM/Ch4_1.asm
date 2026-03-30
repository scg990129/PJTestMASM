COMMENT !
CS 130#16635
CH03 Lab 04
Student: Jacob Yeung #900494756

Assembly Language Programming Labs

Lab 4-1 (10 points)
Write a complete MASM program that has two variables declared len and wid. They should be of type word. Initialize len to 10d and wid to 20d. (7 points)
Declare/create these variables for the perimeter and the area of the rectangle.
Take an image of the memory area that has the variables, and upload it.
Calculate the area of the  rectangle. Use only add arithmetic instruction.
Take an image of the memory area that has the variables, and upload it.
Upload  source code as Ch4_1.asm
!

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	len   WORD 10d
	wid   WORD 20d
	area  DWORD 0
	perim DWORD 0

.code
main PROC
    mov eax, 0
    movzx ebx, len
    add eax, ebx
    add eax, ebx
    movzx ebx, wid
    add eax, ebx
    add eax, ebx
    mov perim, eax

    movzx ecx, len      ; Loop x10
    ; xor eax, eax        ; Clear EAX (accumulator)
    mov eax, 0          ; Clear EAX to use as accumulator

L1:
    movzx ebx, wid      ; Get width
    add eax, ebx        ; Add to total
    loop L1

    mov area, eax

    ; 3. Exit the program
    INVOKE ExitProcess, area; 
main ENDP

END main
