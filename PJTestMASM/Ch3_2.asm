COMMENT !
CS 130#16635
CH03 Lab 02
Student: Jacob Yeung #900494756

Assembly Language Programming Labs

Lab 3-2 (10 points)
Complete a program with the following requirements:

Variable Declarations:
Declare variables n1, n2, n3 with values 10, 20, and 30 respectively
Declare variable n4 with value 10
Important: Use the largest possible data size for these values
Operations:
Subtract n1, n2, and n3 from n4
Submission Requirements:
Program verification screenshot
Memory area image for all four variables
Listing file
Ch3_1.asm file (do not zip)
!

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD


.data
; Lab 3-2 Important: Use the largest possible data size for these values
; Declare variables n1, n2, n3 with values 10, 20, and 30 respectivelys
    n1 TBYTE 10
    n2 TBYTE 20
    n3 TBYTE 30
; Declare variable n4 with value 10
    n4 TBYTE 10
; SQWORD signed quadword 8 bytes
; 80-bit (10-byte) integer. T stands for Ten-byte

.code
main PROC
  mov eax, dword ptr n4

  ; Subtract the first 4 bytes of the other variables
  sub eax, dword ptr n1
  sub eax, dword ptr n2
  sub eax, dword ptr n3
  ; DONE Subtract n1, n2, and n3 from n4

  INVOKE ExitProcess, eax; 
  ; call DumpRegs   ; Display registers to verify the result
main ENDP

END main        ;specify the program's entry point
; https://programminghaven.home.blog/2020/02/16/setup-an-assembly-project-on-visual-studio-2019/
; TBYTE 80-bit (10-byte) integer

; EAX = FFFFFFCE: CE = -50