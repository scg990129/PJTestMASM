COMMENT !
CS 130#16635
CH03 Lab
Student: Jacob Yeung #900494756

Assembly Language Programming Labs

Lab 3-1 (10 points)
Complete a program with the following requirements:

Variable Declarations:
Declare variables n1, n2, n3 with values 10, 20, and 30 respectively
Declare variable n4 with value 10
Important: Use the smallest possible data size for these values
Operations:s
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
; Lab 3-1 Important: Use the smallest possible data size for these values
; Declare variables n1, n2, n3 with values 10, 20, and 30 respectivelys
    n1 BYTE 10
    n2 BYTE 20
    n3 BYTE 30
; Declare variable n4 with value 10
    n4 BYTE 10
; SQWORD signed quadword 8 bytes

.code
main PROC
  ; AL: Lower 8-bits of AX
  mov al, n4
  ; ready to calculation in AL register 
  sub al, n1
  sub al, n2
  sub al, n3
  ; DONE Subtract n1, n2, and n3 from n4

  INVOKE ExitProcess, 0; al 
  ; call DumpRegs   ; Display registers to verify the result in AL (CEh = -50)
main ENDP

END main        ;specify the program's entry point
; https://programminghaven.home.blog/2020/02/16/setup-an-assembly-project-on-visual-studio-2019/
; TBYTE 80-bit (10-byte) integer